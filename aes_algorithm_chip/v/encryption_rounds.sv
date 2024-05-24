module encryption_rounds(
    input logic [127:0] current_state,
    input logic[127:0] key,
    output logic [127:0] next_state
);
    logic [127:0] afterSubBytes;
    logic [127:0] afterShiftRows;
    logic [127:0] afterMixColumns;

    sub_bytes #(16) sub_bytes(
    .block(current_state),
    .subed_block(afterSubBytes)
    );
    

    shift_rows shift_rows(
    .block(afterSubBytes),
    .shifted_block(afterShiftRows)
    );

    mix_columns mix_columns(
    .block(afterShiftRows),
    .mixed_block(afterMixColumns)
    );

    add_round_key add_round_key(
    .state(afterMixColumns),
    .key(key),
    .result(next_state)
    );
endmodule