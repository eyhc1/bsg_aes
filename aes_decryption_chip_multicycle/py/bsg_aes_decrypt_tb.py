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

from gen_key_expand import key_expansion

# Testbench iterations
ITERATION = 1000

# Flow control random seed
# Use different seeds on input and output sides for more randomness
CTRL_INPUT_SEED  = 1
CTRL_OUTPUT_SEED = 2

# Random chars
CHARS = string.digits + 'abcdef'

# Testbench clock period
CLK_PERIOD = 10000  # 100 MHz

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
                data_i = ''.join(data_random.choice(CHARS) for _ in range(32+64))
                ##################################### Data Generation ##########################################
                # pad the data to 96 characters if it is less than 96 characters
                if len(data_i) < 96:
                    data_i = "0"*(96-len(data)) + data
                    
                expanded_key = key_expansion(data_i[32:])

                # Create a new AES cipher with ECB mode
                cipher = Cipher(algorithms.AES(bytes.fromhex(data_i[32:])), modes.ECB(), backend=default_backend())

                # Encrypt the plaintext
                encryptor = cipher.encryptor()
                ciphertext = encryptor.update(bytes.fromhex(data_i[:32])) + encryptor.finalize()
                #################################### End Data Generation #######################################
                immval = int(ciphertext.hex() + expanded_key, 16)
                # immval = int("8ea2b7ca516745bfeafc49904b496089" + "000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1fa573c29fa176c498a97fce93a572c09c1651a8cd0244beda1a5da4c10640badeae87dff00ff11b68a68ed5fb03fc15676de1f1486fa54f9275f8eb5373b8518dc656827fc9a799176f294cec6cd5598b3de23a75524775e727bf9eb45407cf390bdc905fc27b0948ad5245a4c1871c2f45f5a66017b2d387300d4d33640a820a7ccff71cbeb4fe5413e6bbf0d261a7dff01afafee7a82979d7a5644ab3afe6402541fe719bf500258813bbd55a721c0a4e5a6699a9f24fe07e572baacdf8cdea24fc79ccbf0979e9371ac23c6d68de36", 16)
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
            data = dut.data_o.value.integer.to_bytes((dut.data_o.value.integer.bit_length() + 7) // 8, 'big').hex()
            if len(data) < 32:
                data = "0"*(32-len(data)) + data
            dut._log.info("Received: %s", data)
            
            # check with the software model
            data_i = ''.join(data_random.choice(CHARS) for _ in range(32+64))
            assert data == data_i[:32], f"\nData mismatch!\n Expected: {data_i[:32]}\n Got: {data}"
            
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
