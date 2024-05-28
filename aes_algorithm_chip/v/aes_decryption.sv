module aes_decryption(
    input clk_i,
    input reset_i,
    input [127:0] ciphertext,
    input [1919:0] key_chain,
    output reg [127:0] plaintext
);

    logic [127:0] states [15:0] ;

    logic [127:0] plaintext_r, plaintext_n;
    logic [127:0] ciphertext_r, ciphertext_n;
    logic [1919:0] key_chain_r, key_chain_n;

    logic [127:0] final_afterSubBytes;
    logic [127:0] final_afterShiftRows;
    logic [127:0] afterAddroundKey;

    assign ciphertext_n = ciphertext;
    assign key_chain_n = key_chain;
    assign plaintext = plaintext_r;


    always @(posedge clk_i or posedge reset_i) begin
        if (reset_i) begin
            ciphertext_r <= 128'h0;
            key_chain_r <= 1920'h0;
            plaintext_r <= 128'h0;
        end else begin
            ciphertext_r <= ciphertext_n;
            key_chain_r <= key_chain_n;
            plaintext_r <= plaintext_n;
        end
    end

    // initial round
    add_round_key initial_round(
        .state(ciphertext_r),
        .key(key_chain_r[127:0]),
        .result(states[0])
    );

    genvar i;
    generate
        // 14 rounds
        for (i = 1; i < 14; i++) begin: loop

            decryption_rounds round(
                .current_state(states[i-1]),
                .key(key_chain_r[i*128 +: 128]),
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
            .key(key_chain_r[1919 -: 128]),
            .result(afterAddroundKey)
        );
    endgenerate
    assign plaintext_n = afterAddroundKey;

endmodule