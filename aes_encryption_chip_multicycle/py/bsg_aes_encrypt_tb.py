# Import python libraries
import math
import time
import random
import string

# Import cocotb libraries
import cocotb
from cocotb.clock import Clock, Timer
from cocotb.triggers import RisingEdge, FallingEdge, Timer

from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend


# Data width, matching width_p parameter in DUT
WIDTH_P = 128 + 256

# Testbench iterations
ITERATION = 1000

# Flow control random seed
# Use different seeds on input and output sides for more randomness
CTRL_INPUT_SEED  = 1
CTRL_OUTPUT_SEED = 2

# Random chars
CHARS = string.digits + 'abcdef'

# Testbench clock period
CLK_PERIOD = 10

async def input_side_testbench(dut, seed):
    """Handle input traffic"""

    # Create local random generator for data generation
    data_random = random.Random()
    data_random.seed(seed)

    # Create control random generator for flow control
    control_random = random.Random()
    control_random.seed(CTRL_INPUT_SEED)

    # Initialize DUT interface values
    dut.v_i.value = 0
    dut.data_i.value = 0

    # Wait for reset deassertion
    while 1:
        await RisingEdge(dut.clk_i); await Timer(1, units="ps")
        if dut.reset_i == 0: break

    # Main iterations
    i = 0
    while 1:
        await RisingEdge(dut.clk_i); await Timer(1, units="ps")
        # Half chance to send data flit
        if control_random.random() >= 0.5:
            # Assert DUT valid signal
            dut.v_i.setimmediatevalue(1)
            # Check DUT ready signal
            if dut.ready_o == 1:
                # Generate send data
                immval = int(''.join(data_random.choice(CHARS) for _ in range(32+64)), 16)
                # immval = int("00112233445566778899aabbccddeeff" + "000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f", 16)
                # immval = int("65e321ea0a79884cd8c5c376d4d5d306714e976ed4395179418135eff805565c1cee84b1b7ae257802b9bb0bf5959bb1", 16)
                dut.data_i.setimmediatevalue(immval)
                dut._log.info("Sent: %02x", immval)
                # iteration increment
                i += 1
                # Check iteration
                if i == ITERATION:
                    # Test finished
                    break
        else:
            # Deassert DUT valid signal
            dut.v_i.setimmediatevalue(0)

    await RisingEdge(dut.clk_i); await Timer(1, units="ps")
    # Deassert DUT valid signal
    dut.v_i.value = 0


async def output_side_testbench(dut, seed):
    """Handle input traffic"""

    # Create local random generator for data generation
    data_random = random.Random()
    data_random.seed(seed)

    # Create control random generator for flow control
    control_random = random.Random()
    control_random.seed(CTRL_OUTPUT_SEED)

    # Initialize DUT interface values
    dut.yumi_i.value = 0

    # Wait for reset deassertion
    while 1:
        await RisingEdge(dut.clk_i); await Timer(1, units="ps")
        if dut.reset_i == 0: break

    # Main iterations
    i = 0
    while 1:
        await RisingEdge(dut.clk_i); await Timer(1, units="ps")
        if dut.v_o.value == 1 and control_random.random() >= 0.5:
            # Assert DUT yumi signal
            dut.yumi_i.setimmediatevalue(1)
            
            # # Generate check data and compare with receive data
            # assert dut.data_o.value == math.floor(data_random.random()*pow(2, WIDTH_P)), "data mismatch!"
            data = dut.data_o.value.integer.to_bytes((dut.data_o.value.integer.bit_length() + 7) // 8, 'big').hex()
            # pad to 512 bytes if less than that
            if len(data) < 512:
                data = "0"*(512-len(data)) + data

            ################################ Software Equivalent Model #####################################
            data_i = ''.join(data_random.choice(CHARS) for _ in range(32+64))
            # pad the data to 96 characters if it is less than 96 characters
            if len(data_i) < 96:
                data_i = "0"*(96-len(data)) + data

            # Create a new AES cipher with ECB mode
            cipher = Cipher(algorithms.AES(bytes.fromhex(data_i[32:])), modes.ECB(), backend=default_backend())

            # Encrypt the plaintext
            encryptor = cipher.encryptor()
            ciphertext = encryptor.update(bytes.fromhex(data_i[:32])) + encryptor.finalize()
            #################################### End Software Model #######################################

            dut._log.info("Received: %s", data[:32])
            # assert data[:32] == ciphertext.hex(), f"Data mismatch when input is: {data_i}\n Expected: {ciphertext.hex()}, Got: {data[:32]}"
            
            # iteration increment
            i += 1
            # Check iteration
            if i == ITERATION:
                # Test finished
                break
        else:
            # Deassert DUT yumi signal
            dut.yumi_i.setimmediatevalue(0)

    await RisingEdge(dut.clk_i); await Timer(1, units="ps")
    # Deassert DUT yumi signal
    dut.yumi_i.value = 0


@cocotb.test()
async def testbench(dut):
    """Try accessing the design."""

    # Random seed assignment
    seed = time.time()

    # Create a 10ps period clock on DUT port clk_i
    clock = Clock(dut.clk_i, CLK_PERIOD, units="ps")

    # Start the clock. Start it low to avoid issues on the first RisingEdge
    clock_thread = cocotb.start_soon(clock.start(start_high=False))

    # Launch input and output testbench threads
    input_thread = cocotb.start_soon(input_side_testbench(dut, seed))
    output_thread = cocotb.start_soon(output_side_testbench(dut, seed))

    # Reset initialization
    dut.reset_i.value = 1

    # Wait for 5 clock cycles
    await Timer(CLK_PERIOD*5, units="ps")
    await RisingEdge(dut.clk_i); await Timer(1, units="ps")

    # Deassert reset
    dut.reset_i.value = 0

    # Wait for threads to finish
    await input_thread
    await output_thread

    # Wait for 5 clock cycles
    await Timer(CLK_PERIOD*5, units="ps")
    await RisingEdge(dut.clk_i); await Timer(1, units="ps")

    # Assert reset
    dut.reset_i.value = 1

    # Wait for 5 clock cycles
    await Timer(CLK_PERIOD*5, units="ps")

    # Test finished!
    dut._log.info("Test finished! Current reset_i value = %s", dut.reset_i.value)
