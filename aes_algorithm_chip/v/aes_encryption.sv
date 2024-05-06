module aes_encryption(
    // input clk_i,
    // input reset_i,
    input [127:0] plaintext,
    input [255:0] initial_key,
    output reg [127:0] ciphertext
);
    logic [1919:0] key_chain ;
    logic [127:0] states [15:0] ;

    logic [127:0] final_afterSubBytes;
    logic [127:0] final_afterShiftRows;
    // logic [127:0] afterAddroundKey;

    // generate the key chain
    key_expansion get_keys(
        .initial_key(initial_key),
        .round_keys(key_chain)
    );

    // initial round
    add_round_key initial_round(
        .state(plaintext),
        .key(key_chain[1919 -: 128]),
        .result(states[0])
    );

    
    genvar i;
    generate
        // 14 rounds
        for (i = 1; i < 14; i++) begin: loop

            encryption_rounds round(
                .current_state(states[i-1]),
                .key(key_chain[(1919-i*128) -: 128]),
                .next_state(states[i])
            );
            // sub_bytes #(16) sub_bytes(
            //     .block(states[i-1]),
            //     .subed_block(afterSubBytes)
            // );

            // shift_rows shift_rows(
            //     .block(afterSubBytes),
            //     .shifted_block(afterShiftRows)
            // );

            // mix_columns mix_columns(
            //     .block(afterShiftRows),
            //     .mixed_block(afterMixColumns)
            // );

            // add_round_key add_round_key(
            //     .state(afterMixColumns),
            //     .key(key_chain[(1919-i*128) -: 128]),
            //     .result(states[i])
            // );
        end
        // final round
        sub_bytes #(16) final_sub_bytes(
            .block(states[13]),
            .subed_block(final_afterSubBytes)
        );
        shift_rows final_shift_rows(
            .block(final_afterSubBytes),
            .shifted_block(final_afterShiftRows)
        );

        add_round_key final_add_round_key(
            .state(final_afterShiftRows),
            .key(key_chain[127:0]),
            .result(ciphertext)
        );
        // assign ciphertext = states[2];

            


    endgenerate
endmodule