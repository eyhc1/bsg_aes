module encryption_rounds(
    input logic clk_i,
    input logic reset_i,
    input logic [127:0] current_state,
    input logic[127:0] key,
    output logic [127:0] next_state
);

    logic [127:0] current_state_d1;
    logic [127:0] key_d1;
    logic [127:0] afterSubBytes;
    logic [127:0] afterShiftRows;
    logic [127:0] afterMixColumns;

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


    sub_bytes #(16) sub_bytes(
    .block(current_state_d1),
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
    .key(key_d1),
    .result(next_state)
    );
endmodule