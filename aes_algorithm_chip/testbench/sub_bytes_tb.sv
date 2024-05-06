module sub_bytes_tb #(size = 16);
    initial begin
        $dumpfile("sub_bytes.vcd");
        $dumpvars(0, sub_bytes_tb);
    end
    reg [size*8-1:0] block;
    wire [size*8-1:0] subed_block;

    // 实例化 sub_bytes 模块
    sub_bytes #(16)  dut (
        .block(block),
        .subed_block(subed_block)
    );

    initial begin
        // 初始化 block
        block = 128'h00102030405060708090a0b0c0d0e0f0;

        // 在模拟过程中，你可能需要改变 block 的值来测试不同的情况
        // 例如：
        // #10 block = 32'h00000000;
    end

    // 添加一个监视器来观察 subed_block 的变化
    initial begin
        $monitor("At time %d, subed_block = %h", $time, subed_block);
    end
endmodule