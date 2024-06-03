/**
 * BSG Test Node Client
 */
module  bsg_test_node_client #(parameter ring_width_p="inv"
                              ,parameter master_p="inv"
                              ,parameter master_id_p="inv"
                              ,parameter client_id_p="inv")
  (input  clk_i
  ,input  reset_i
  ,input  en_i

  ,input                     v_i
  ,input  [ring_width_p-1:0] data_i
  ,output                    ready_o
  
  ,output                    v_o
  ,output [ring_width_p-1:0] data_o
  ,input                     yumi_i
  );


  logic [74:0] data_lo, data_li;

  assign data_li = data_i[74:0];
  assign data_o  = { 4'(client_id_p), data_lo };

  /** INSTANTIATE NODE 0 **/
  if ( client_id_p == 0 ) begin

    bsg_empty_cell node_cell
    (.clk_i(clk_i)
    ,.reset_i(reset_i)
    ,.v_i(v_i)
    ,.data_i(data_li[9:0])
    ,.ready_o(ready_o)
    ,.v_o(v_o)
    ,.data_o(data_lo[9:0])
    ,.yumi_i(yumi_i)
    );
    
    assign data_lo[74:10] = '0;

  end

endmodule

