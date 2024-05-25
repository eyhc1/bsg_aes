// AES256 Encryption Wrapper with BSG handshakes
// for the input data, the top 128 bits are plaintext and the bottom 256 bits are the initial key
module bsg_aes_encrypt (
    input clk_i,
    input reset_i,
    // input [127:0] plaintext,
    // input [255:0] initial_key,
    // output logic [127:0] ciphertext,
    // output logic [128 * 15 - 1:0] key_chain,

    input [128 + 256 - 1:0] data_i,
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

logic v_o_d1, ready_o_d1;

// Handshakes on the fifo to internals
logic fifo_v_o, fifo_ready_o;
// same but after the mux before dff chain
logic fifo_v_o_mux_dff, fifo_ready_o_mux_dff;

logic encrypted;


// logic [3:0] counter;

// // Fifo 
// bsg_fifo_1r1w_small_hardened #(
//     .width_p(128 + 256)
//     ,.els_p(16)
//     ,.ready_THEN_valid_p(1)
//     ) fifo (
//         .clk_i(clk_i),
//         .reset_i(reset_i),
//         .data_i(data_i),
//         .data_o({plaintext, initial_key}),
//         .v_i(v_i),
//         .v_o(fifo_v_o),
//         .yumi_i(yumi_i),
//         .ready_o(fifo_ready_o)
//     );
// AES encryption module
aes_encryption encrypt_chip(
        .clk_i(clk_i),
        .reset_i(reset_i),
        // .plaintext(data_i[128 + 256 - 1:256]),
        // .initial_key(data_i[255:0]),
        .plaintext(plaintext),
        .initial_key(initial_key),
        .ciphertext(ciphertext),
        .key_chain(/* Unconnected for now */)
    );
// TODO: the data may not be ready yet until at least 16 cycles later
assign data_o = ciphertext;
assign v_o = fifo_v_o;
assign ready_o = fifo_ready_o & ready_o_d1;



// Dump Waveforms. delete for synthesis
initial begin
    $fsdbDumpvars;
end

endmodule