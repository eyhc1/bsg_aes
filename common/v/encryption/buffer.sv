// take the long input over many clk cycles and truncate to only one cycle high
module buffer (clk, rst, in, out);
	input logic clk, rst, in;
	output logic out;
	enum {s0, s1} ps, ns, ms;
	
	always_comb begin
		case(ps)
			s0:
				if (in)		ns = s1;
				else			ns = ps;
			s1:
				if (~in)	ns = s0;
				else			ns = ps;
		endcase
	end

	assign out = (ps == s0 & ns == s1);
	
	 // DFFs  
	always_ff @(posedge clk) begin  
		if (rst)  
			ps <= s0;  
		else  
			ps <= ns;  
		end  
	

     
endmodule  

module buffer_testbench();
 logic  clk, rst, in; 
 logic out;  
  
 buffer dut (clk, rst, in, out);   
   
 // Set up a simulated clock.   
 parameter CLOCK_PERIOD=100;  
 initial begin  
  clk <= 0;  
  forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock 
 end  
   
 // Set up the inputs to the design.  Each line is a clock cycle.  
 initial begin  
                             @(posedge clk);   
  rst <= 1;                  @(posedge clk);
  rst <= 0; in <= 0;        @(posedge clk);   
                             @(posedge clk);   
   
            in <= 1;        @(posedge clk);
									  @(posedge clk);

			   in <= 0;        @(posedge clk);
									  @(posedge clk);
									  @(posedge clk);
									  @(posedge clk);
			   in <= 1; 		  @(posedge clk);
									  @(posedge clk);
								     @(posedge clk);
									  @(posedge clk);
									  @(posedge clk);
									  @(posedge clk);
				in <= 0;		  @(posedge clk);

  $stop; // End the simulation.  
 end  
endmodule   