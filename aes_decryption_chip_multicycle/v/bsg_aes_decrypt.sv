// AES256 Encryption Wrapper with BSG handshakes
// for the input data, the top 128 bits are plaintext and the bottom 256 bits are the initial key
module bsg_aes_decrypt (
    input clk_i,
    input reset_i,

    input [2047:0] data_i,
    output [127:0] data_o,
    
    // added for BSG handshakes
    input v_i,
    output v_o,
    input yumi_i,
    output ready_o
);

// Delay for the encryption to finish
logic [127:0] plaintext;
logic [255:0] initial_key;

logic [127:0] ciphertext;
logic [127 * 15 - 1:0] key_chain;

logic v_o_d1, ready_o_d1;

// Handshakes on the fifo to internals
logic fifo_v_o, fifo_ready_o;
// same but after the mux before dff chain
logic fifo_v_o_mux_dff, fifo_ready_o_mux_dff;

logic encrypted;
logic [4:0] counter_n, counter_r;
logic [2047:0] data_n, data_r;

typedef enum logic [1:0] {WAIT, BUSY, DONE} state_e;
state_e  state_n, state_r;

assign  ready_o = state_r == WAIT;
assign      v_o = state_r == DONE;

assign counter_n = (ready_o & v_i) ? 5'd16 : 
                (state_r == BUSY) ? counter_r - 1'b1 : counter_r;

assign data_n = (state_r == WAIT) ? data_i : data_r;

// State transition logic
always_comb
begin
   state_n = state_r;
   if (ready_o & v_i) begin
     state_n = BUSY;
   end else if (state_r == BUSY & (counter_n == 0)) begin
     state_n = DONE;
   end else if (v_o & yumi_i) begin
     state_n = WAIT;
   end
end

// AES encryption module
aes_decryption decrypt_chip(
        .clk_i(clk_i),
        .reset_i(reset_i),
        .ciphertext(data_r[2047:128 * 15]),
        .key_chain(data_r[128 * 15 - 1:0]),
        .plaintext(data_o)
    );

// State register
always_ff @(posedge clk_i)
begin
    if (reset_i)
        state_r <= WAIT;
    else
        state_r <= state_n;
end

// data register
always_ff @(posedge clk_i)
begin
    data_r <= data_n;
    counter_r <= counter_n;
end
endmodule