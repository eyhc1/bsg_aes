
module bsg_empty_cell (
    input clk_i
    ,input reset_i
    ,input v_i          
    ,input [9:0] data_i
    ,output ready_o
    ,output v_o
    ,output [9:0] data_o
    ,input yumi_i
  );
  
  // tieoff
  assign ready_o = 1'b1;
  assign v_o = 1'b0;
  assign data_o = '0;

endmodule
