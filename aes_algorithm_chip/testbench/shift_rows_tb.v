module shift_rows_tb();
    initial begin
        $dumpfile("shift_rows.vcd");
        $dumpvars(0, shift_rows_tb);
    end
    reg [127:0] block;
    reg [127:0] shifted_block;

    shift_rows DUT (
        .block(block),
        .shifted_block(shifted_block)
    );

    initial begin

        #1000;
        block = 128'h63cab7040953d051cd60e0e7ba70e18c;
        #1000;
        $finish;
    end

    initial begin
        $monitor("At time %d, shifted_block = %h", $time, shifted_block);
    end
endmodule