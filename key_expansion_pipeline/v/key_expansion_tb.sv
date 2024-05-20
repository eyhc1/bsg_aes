module key_expansion_tb();
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars();
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
    end
    logic clk_i, reset_i;
    logic [0:255] initial_key;
    logic [0:128*15-1] round_keys;


    key_expansion DUT (
        .*
    );

    parameter CLOCK_PERIOD=20000;
	initial begin
		clk_i <= 0;
		forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i; // Forever toggle the clock
	end

    initial begin

        reset_i <= 1; @(posedge clk_i); // Always reset FSMs at start
		// check if enable works properly by writing data when turn on enable
		reset_i <= 0; 
        initial_key <= 256'h6464646464646464646464646464646464646464646464646464646464646464;
        repeat(50) @(posedge clk_i);
        $display("At time %d, round_key = %h", $time, round_keys);



        // #1000;
        // initial_key =256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4;
        // #1000;

        // Finish the simulation
        $finish;
    end
endmodule