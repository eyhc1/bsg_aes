module aes_encryption(
    input clk_i,
    input reset_i,
    input [127:0] plaintext,
    input [255:0] initial_key,
    output reg [127:0] ciphertext,
    output reg [1919:0] key_chain
);

    logic [127:0] states [15:0];
    
    logic [127:0] plaintext_r, plaintext_n;
    logic [255:0] initial_key_r, initial_key_n;
    logic [127:0] ciphertext_r, ciphertext_n;
    logic [1919:0] key_chain_r, key_chain_n;
    
    
    logic [127:0] final_afterSubBytes;
    logic [127:0] final_afterShiftRows;

    assign plaintext_n = plaintext;
    assign initial_key_n = initial_key;
    assign ciphertext = ciphertext_r;
    assign key_chain = key_chain_r;

    always @(posedge clk_i or posedge reset_i) begin
        if (reset_i) begin
            plaintext_r <= 128'h0;
            initial_key_r <= 256'h0;
            ciphertext_r <= 128'h0;
            key_chain_r <= 1920'h0;
        end else begin
            plaintext_r <= plaintext_n;
            initial_key_r <= initial_key_n;
            ciphertext_r <= ciphertext_n;
            key_chain_r <= key_chain_n;
        end
    end

    // generate the key chain
    key_expansion get_keys(
        .initial_key(initial_key_r),
        .round_keys(key_chain_n)
    );

    // initial round
    add_round_key initial_round(
        .state(plaintext_r),
        .key(key_chain_r[1919 -: 128]),
        .result(states[0])
    );

    genvar i;
    generate
        // 14 rounds
        for (i = 1; i < 14; i++) begin: loop

            encryption_rounds round(
                .current_state(states[i-1]),
                .key(key_chain_r[(1919-i*128) -: 128]),
                .next_state(states[i])
            );
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
            .key(key_chain_r[127:0]),
            .result(ciphertext_n)
        );
    endgenerate
endmodule