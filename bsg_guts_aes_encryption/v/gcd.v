module gcd
  ( input               clk_i
  , input               reset_i

  , input        [31:0] a_i
  , input        [31:0] b_i
  , input               v_i
  , output              ready_o

  , output logic [31:0] data_o
  , output logic        v_o
  , input               yumi_i
  );

  typedef enum logic [1:0] {WAIT, BUSY, DONE} state_e;

  state_e  state_n, state_r;

  // next state datapath logic
  logic [31:0] a_n, a_r;
  logic [31:0] b_n, b_r;

  assign ready_o = state_r == WAIT;
  assign     v_o = state_r == DONE;

  always_comb
    begin
      state_n = state_r;
      if (ready_o & v_i) begin                                // In the WAIT state, if recived a valid input, v_i, then it is ready to accept a new input.
        state_n = BUSY;
      end else if ((state_r == BUSY) & (b_n == 32'b0)) begin  // In the BUSY state, if b == 0, then it is done.
        state_n = DONE;
      end else if (v_o & yumi_i) begin                        // In the DONE state, if it is outputting valid data and it is been successfully processd, 
                                                              //then it is ready to accept a new input.
        state_n = WAIT;
      end
    end

  always_ff @(posedge clk_i)
    begin
      if (reset_i)
          state_r <= WAIT;
      else
          state_r <= state_n;
    end

  // takes in the input if it is ready and the input is valid, otherwise, do the calculation in BUSY state.
  assign a_n = (ready_o & v_i) ? a_i : 
                ((state_r == BUSY) & (a_r < b_r)) ? b_r : 
                ((state_r == BUSY) & (b_r != 32'b0)) ? a_r - b_r : 
                a_r;

  // swap and input assignment for b
  assign b_n = (ready_o & v_i) ? b_i :
                (state_r == BUSY & a_r < b_r) ? a_r : 
                b_r;


  always_ff @(posedge clk_i)
    begin
      a_r  <= a_n;
      b_r  <= b_n;
    end

  assign data_o = a_r;

endmodule

