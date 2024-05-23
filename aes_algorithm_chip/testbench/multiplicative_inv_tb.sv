module multiplicative_inv_tb();

    initial begin
        // $fsdbDumpfile("waveform.fsdb");
        // $fsdbDumpvars();
        $dumpfile("aes_encryption.vcd");
        $dumpvars(0, aes_encryption_tb);
    end
    reg [7:0] b;
    wire [7:0] inv_b;
    wire [7:0] test_result;

    multiplicative_inv DUT (
        .b(b),
        .inv_b(inv_b),
        .test_result(test_result)
    );

    initial begin
        #10000;
        b = 8'h01;
        #10000;

        $finish;

    end

    // 添加一个监视器来观察 inv_b 和 test_result 的变化
    initial begin
        $monitor("At time %d, b = %h, inv_b = %h, test_result = %h", $time, b, inv_b, test_result);
    end
endmodule