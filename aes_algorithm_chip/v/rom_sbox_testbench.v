`timescale 1ns / 1ps

module rom_sbox_testbench();

    initial begin
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
        $dumpfile("waveform.vcd");
        $dumpvars();
    end

    reg  [7:0] rom_addr;
    wire [7:0] data_o;
    integer i;


    rom_sbox test_rom_sbox (
        .rom_addr(rom_addr),
        .data_o(data_o)
    );

    initial begin
        for (i = 0; i < 256; i++) begin
             rom_addr = i; #5000;
            $display("At time %t, rom_addr = %h, data_o = %h", $time, rom_addr, data_o);
        end
    end

    // // print out the time and the corresponding input and output
    // initial begin
    //     $monitor("At time %t, rom_addr = %h, data_o = %h", $time, rom_addr, data_o);
    // end

endmodule