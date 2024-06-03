module aes_decryption(
    input clk_i,
    input reset_i,
    input [127:0] ciphertext,
    input [128 * 15 - 1:0] key_chain,
    output reg [127:0] plaintext
);

    logic [127:0] states [15:0] ;

    logic [127:0] final_afterSubBytes;
    logic [127:0] final_afterShiftRows;
    logic [127:0] afterAddroundKey;

    // pipeline wires
    logic [127:0] states_13_d1;
    logic [127:0] final_key_d1;


    // initial round
    add_round_key initial_round(
        .state(ciphertext),
        .key(key_chain[127:0]),
        .result(states[0])
    );

    genvar i;
    generate
        // 14 rounds
        for (i = 1; i < 14; i++) begin: loop
            decryption_rounds round(
                .clk_i(clk_i),
                .reset_i(reset_i),
                .current_state(states[i-1]),
                .key(key_chain[i*128 +: 128]),
                .next_state(states[i])
            );
        end
    endgenerate

    // pipelines for the final round
    bsg_dff_reset #(
        .width_p(256)
    )
    pipeline (
        .clk_i(clk_i),
        .reset_i(reset_i),
        .data_i({states[13], key_chain[1919 -: 128]}),
        .data_o({states_13_d1, final_key_d1})
    );

    // final round
    inv_shift_rows final_inv_shift_rows(
        .block(states_13_d1),
        .shifted_block(final_afterShiftRows)
    );

    inv_sub_bytes #(16) final_sub_bytes(
        .block(final_afterShiftRows),
        .subed_block(final_afterSubBytes)
    );

    add_round_key final_add_round_key(
        .state(final_afterSubBytes),
        .key(final_key_d1),
        .result(afterAddroundKey)
    );
    assign plaintext = afterAddroundKey;

endmodule