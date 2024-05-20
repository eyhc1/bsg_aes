module aes_decryption(
    // input clk_i,
    // input reset_i,
    input [127:0] ciphertext,
    input [1919:0] key_chain,
    output reg [127:0] plaintext
);

    logic [127:0] states [15:0] ;

    logic [127:0] final_afterSubBytes;
    logic [127:0] final_afterShiftRows;
    logic [127:0] afterAddroundKey;



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
                .current_state(states[i-1]),
                .key(key_chain[i*128 +: 128]),
                .next_state(states[i])
            );
        end

        // final round
        inv_shift_rows final_inv_shift_rows(
            .block(states[13]),
            .shifted_block(final_afterShiftRows)
        );

        inv_sub_bytes #(16) final_sub_bytes(
            .block(final_afterShiftRows),
            .subed_block(final_afterSubBytes)
        );

        add_round_key final_add_round_key(
            .state(final_afterSubBytes),
            .key(key_chain[1919 -: 128]),
            .result(afterAddroundKey)
        );
    endgenerate
    assign plaintext = afterAddroundKey;

endmodule