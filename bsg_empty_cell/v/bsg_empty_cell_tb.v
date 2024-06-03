//
// This file contains the toplevel testbench for testing
// this design. 
//

module bsg_empty_cell_tb;

  /* Dump Test Waveform To VPD File */
  initial begin
    $fsdbDumpfile("waveform.fsdb");
    $fsdbDumpvars();
    $dumpfile("waveform.vcd");
    $dumpvars();
  end

  /* Non-synth clock generator */
  logic clk;
  bsg_nonsynth_clock_gen #(10000) clk_gen_1 (clk);

  /* Non-synth reset generator */
  logic reset;
  bsg_nonsynth_reset_gen #(.num_clocks_p(1),.reset_cycles_lo_p(5),. reset_cycles_hi_p(5))
    reset_gen
      (.clk_i        ( clk )
      ,.async_reset_o( reset )
      );


  logic tr_v_lo;
  logic [9:0] tr_data_lo;
  logic tr_ready_lo;

  logic [31:0] rom_addr_li;
  logic [13:0] rom_data_lo;

  logic [9:0] dut_data_lo;
  logic dut_v_lo;
  logic dut_ready_lo;

  bsg_fsb_node_trace_replay #(.ring_width_p(10)
                             ,.rom_addr_width_p(32) )
    trace_replay
      ( .clk_i ( ~clk )
      , .reset_i( reset )
      , .en_i( 1'b1 )

      , .v_i    ( dut_v_lo )
      , .data_i ( dut_data_lo )
      , .ready_o( tr_ready_lo )

      , .v_o   ( tr_v_lo )
      , .data_o( tr_data_lo )
      , .yumi_i( tr_v_lo & dut_ready_lo )

      , .rom_addr_o( rom_addr_li )
      , .rom_data_i( rom_data_lo )

      , .done_o()
      , .error_o()
      );

  trace_rom #(.width_p(14),.addr_width_p(32))
    ROM
      (.addr_i( rom_addr_li )
      ,.data_o( rom_data_lo )
      );

  bsg_empty_cell DUT
    (.clk_i        (           clk )
    ,.reset_i      (         reset )
    ,.data_i       (    tr_data_lo )
    ,.v_i          (       tr_v_lo )
    ,.ready_o      (  dut_ready_lo )
    ,.data_o       (   dut_data_lo )
    ,.v_o          (      dut_v_lo )
    ,.yumi_i       ( dut_v_lo & tr_ready_lo )
    );

endmodule
