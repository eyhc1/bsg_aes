module inv_sub_bytes_tb #(size = 16);
    initial begin
        $dumpfile("inv_sub_bytes.vcd");
        $dumpvars(0, inv_sub_bytes_tb);
    end
    reg [size*8-1:0] block;
    wire [size*8-1:0] subed_block;

    // 实例化 sub_bytes 模块
    inv_sub_bytes #(16)  dut (
        .block(block),
        .subed_block(subed_block)
    );

    initial begin
        # 10000;
        block = 128'haa218b56ee5ebeacdd6ecebf26e63c06;
        # 10000;

        $finish;


    end

    initial begin
        $monitor("At time %d, subed_block = %h", $time, subed_block);
    end
endmodule