module decryption_rounds(
    input logic [127:0] current_state,
    input logic[127:0] key,
    output logic [127:0] next_state
);
    logic [127:0] afterInvSubBytes;
    logic [127:0] afterInvShiftRows;
    logic [127:0] afterAddRoundKey;

    inv_sub_bytes #(16) inv_sub_bytes(
        .block(current_state),
        .subed_block(afterInvSubBytes)
    );

    inv_shift_rows inv_shift_rows(
        .block(afterInvSubBytes),
        .shifted_block(afterInvShiftRows)
    );
    
    add_round_key add_round_key(
        .state(afterInvShiftRows),
        .key(key),
        .result(afterAddRoundKey)
    );

    inv_mix_columns inv_mix_columns(
        .block(afterAddRoundKey),
        .mixed_block(next_state)
    );

endmodule