module inv_shift_rows_tb();
    initial begin
        $dumpfile("inv_shift_rows_tb.vcd");
        $dumpvars(0, inv_shift_rows_tb);
    end
    reg [127:0] block;
    wire [127:0] shifted_block;


    inv_shift_rows DUT (
        .block(block),
        .shifted_block(shifted_block)
    );

    initial begin
        #10000;
        block = 128'haa5ece06ee6e3c56dde68bac2621bebf;
        #10000;

        $finish;
    end

    // 添加一个监视器来观察 shifted_block 的变化
    initial begin
        $monitor("At time %d, shifted_block = %h", $time, shifted_block);
    end
endmodule