module round_key_tb();
    initial begin
        $dumpfile("round_key.vcd");
        $dumpvars(0, round_key_tb);
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
    end
    logic [0:255] k;
    logic [0:3] r;
    logic [0:255] result;
    logic clk_i, reset_i;
    integer i;
    
    // Instantiate the unit under test (UUT)
    round_key DUT (
        .*
    );

    parameter CLOCK_PERIOD=10000;
	initial begin
		clk_i <= 0;
		forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i; // Forever toggle the clock
	end

    initial begin
        reset_i <= 1; @(posedge clk_i); // Always reset FSMs at start
		// check if enable works properly by writing data when turn on enable
		reset_i <= 0; 
        k <= 256'h6464646464646464646464646464646464646464646464646464646464646464;
        r <= 4'd1;
        repeat(10) @(posedge clk_i);
        // $display("At time %t, k = %h, r = %h, result = %h", $time, k, r, result);
        $display("%h", result);

        for (i = 2; i < 8; i++) begin
            k <= result;
            r <= i;
            repeat(10) @(posedge clk_i);
            // $display("At time %t, k = %h, r = %h, result = %h", $time, k, r, result);
            $display("%h", result);
        end

        // k = 256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4;
        // r = 4'd1;
        // @(posedge clk_i);
        // repeat(12) @(posedge clk_i);
        // $display("At time %t, k = %h, r = %h, result = %h", $time, k, r, result);

        // Finish the simulation
        $finish;
    end
endmodule