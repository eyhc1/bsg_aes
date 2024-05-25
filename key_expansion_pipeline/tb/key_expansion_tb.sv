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
    logic v_i, ready_o, v_o, yumi_i;

    parameter CLOCK_PERIOD=10000;
    bsg_nonsynth_clock_gen #(10000) clk_gen (clk_i);
    key_expansion DUT (
        .*
    );

    initial begin

        reset_i <= 1; yumi_i <= 0; @(posedge clk_i); // Always reset FSMs at start
		// check if enable works properly by writing data when turn on enable
		reset_i <= 0; 
        initial_key <= 256'h6464646464646464646464646464646464646464646464646464646464646464;
        v_i <= 1;
        yumi_i <= 1;
                    //  @(posedge clk_i);
        @(posedge v_o);
        v_i <= 0;
        yumi_i <= 0;
        @(posedge clk_i);
        // repeat(14)   @(posedge clk_i);
        initial_key <= 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
        v_i <= 1;
        yumi_i <= 1;
                     @(posedge v_o);
        v_i <= 0;
        yumi_i <= 0;
        // repeat(14)   @(posedge clk_i);
        @(posedge clk_i);
        $finish;
    end
    always@(posedge clk_i) begin
        $display("Clock Cycle:%d, w = %h", $time/CLOCK_PERIOD, round_keys);
    end
endmodule