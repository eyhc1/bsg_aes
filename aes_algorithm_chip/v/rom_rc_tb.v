module rom_rc_tb();
    initial begin
        $dumpfile("rom_rc.vcd");
        $dumpvars(0, rom_rc_tb);
    end

    logic [7:0] data_o;
    logic [3:0] addr_i;

    rom_rc #(.width_p(8),.addr_width_p(4))
        DUT
            (
                .addr_i(addr_i),
                .data_o(data_o)
            );

    initial begin
        addr_i = 0;
        #1;
        addr_i = 1;
        #1;
        addr_i = 2;
        #1;
        addr_i = 3;
        #1;
        addr_i = 4;
        #1;
        addr_i = 5;
        #1;
        addr_i = 6;
        #1;
        addr_i = 7;
        #1;
        addr_i = 8;
        #1;
        addr_i = 9;
        #1;
        addr_i = 10;
        #1;
    end

    // print out the time and the corresponding input and output
    initial begin
        $monitor("At time %t, rom_addr = %h, data_o = %h", $time, addr_i, data_o);
    end

endmodule