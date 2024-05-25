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

    logic v_i, ready_o, v_o, yumi_i;
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
        reset_i <= 1; v_i <= 0; @(posedge clk_i); // Always reset FSMs at start
		// check if enable works properly by writing data when turn on enable
		reset_i <= 0; 
        k <= 256'h6464646464646464646464646464646464646464646464646464646464646464;
        r <= 4'd1;
        v_i <= 1;
        @(posedge clk_i);
        v_i <= 0;
        yumi_i <= 0;
        @(posedge v_o);
        yumi_i <= 1;

        for (i = 2; i <= 8; i++) begin
            k <= result;
            r <= i;
            v_i <= 1;
            @(posedge clk_i);
            v_i <= 0;
            @(posedge v_o);
            yumi_i <= 1;
        end
        $finish;
    end

    always @(posedge clk_i) begin
        if (v_o)
        $display("%h", result);
    end
endmodule