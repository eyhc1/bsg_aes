module decryption_rounds(
    input logic clk_i,
    input logic reset_i,
    input logic [127:0] current_state,
    input logic[127:0] key,
    output logic [127:0] next_state
);
    logic [127:0] afterInvSubBytes;
    logic [127:0] afterInvShiftRows;
    logic [127:0] afterAddRoundKey;

    // pipeline wires
    logic [127:0] current_state_d1;
    logic [127:0] key_d1;

    // pipeline
    bsg_dff_reset #(
        .width_p(256)
    )
    pipeline (
        .clk_i(clk_i),
        .reset_i(reset_i),
        .data_i({current_state, key}),
        .data_o({current_state_d1, key_d1})
    );


    inv_sub_bytes #(16) inv_sub_bytes(
        .block(current_state_d1),
        .subed_block(afterInvSubBytes)
    );

    inv_shift_rows inv_shift_rows(
        .block(afterInvSubBytes),
        .shifted_block(afterInvShiftRows)
    );
    
    add_round_key add_round_key(
        .state(afterInvShiftRows),
        .key(key_d1),
        .result(afterAddRoundKey)
    );

    inv_mix_columns inv_mix_columns(
        .block(afterAddRoundKey),
        .mixed_block(next_state)
    );

endmodule