module keyExpansion_tb;
logic [0:255] key;
logic[1919:0] w;
logic clk_i, reset_i;

keyExpansion dut (.*);
bsg_nonsynth_clock_gen #(10000) clk_gen (clk_i);
initial begin
    reset_i <= 1; key <= 256'h0;                                                                @(posedge clk_i); 
    reset_i <= 0; key <= 256'h6464646464646464646464646464646464646464646464646464646464646464; @(posedge clk_i);
    repeat(15) @(posedge clk_i);
    key <= 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;               @(posedge clk_i);
    repeat(15) @(posedge clk_i);
end

always@* begin
    $display("At time %d, w = %h", $time, w);
end
endmodule