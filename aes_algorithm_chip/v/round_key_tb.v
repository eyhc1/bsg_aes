module round_key_tb();
    initial begin
        $dumpfile("round_key.vcd");
        $dumpvars(0, round_key_tb);
    end
    reg [255:0] k;
    reg [4:0] r;
    reg [255:0] result;

    
    // Instantiate the unit under test (UUT)
    round_key DUT (
        .k(k), 
        .r(r), 
        .result(result)
    );

    initial begin
        
        #1;
        k = 256'h6464646464646464646464646464646464646464646464646464646464646464;
        r = 4'd1;
        #1;

        #1;
        k = 256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4;
        r = 4'd1;
        #1;
        // Finish the simulation
        $finish;
    end

    initial begin
        $monitor("At time %t, k = %h, r = %h, result = %h", $time, k, r, result);
    end
endmodule