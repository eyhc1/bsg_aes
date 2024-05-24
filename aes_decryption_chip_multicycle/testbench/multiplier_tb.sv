module multiplier_tb();
    initial begin
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
        $dumpfile("multiplier.vcd");
        $dumpvars(0, multiplier_tb);
    end
    reg [7:0] num_1;
    reg [7:0] num_2;
    wire [7:0] result;


    multiplier DUT (
        .num_1(num_1),
        .num_2(num_2),
        .result(result)
    );

    initial begin
        # 10000;
        num_1 = 8'h01;
        num_2 = 8'h02;
        # 10000;
        num_1 = 8'h07;
        num_2 = 8'h08;
        # 10000;
        num_1 = 8'h08;
        num_2 = 8'h07;
        # 10000;
        num_1 = 8'h99;
        num_2 = 8'h02;
        # 10000;
        $finish;
    end


    initial begin
        $monitor("At time %d, number1 = %h, number2 = %h, result = %h", $time, num_1, num_2, result);
    end
endmodule