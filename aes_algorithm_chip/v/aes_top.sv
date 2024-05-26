module aes_top(e256,d256,encrypted256,decrypted256);
    output logic e256;
    output logic d256;
    output [127:0] encrypted256;
    output [127:0] decrypted256;

    // The plain text used as input
    logic[127:0] in = 128'h00112233445566778899aabbccddeeff;

    // The different keys used for testing (one of each type)
    logic[255:0] key256 = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
    logic[1919:0] key_chain;

    // The expected outputs from the encryption module
    logic[127:0] expected_e256 = 128'h8ea2b7ca516745bfeafc49904b496089;
    logic[127:0] expected_d256 = 128'h00112233445566778899aabbccddeeff;

    // // The result of the encryption module and decryption module
    // logic[127:0] encrypted256;
    // logic[127:0] decrypted256;

    aes_encryption encrypt (
            .plaintext(in),
            .initial_key(key256),
            .ciphertext(encrypted256),
            .key_chain(key_chain)
        );
    aes_decryption decrypt (
            .ciphertext(encrypted256),
            .key_chain(key_chain),
            .plaintext(decrypted256)
        );

    assign e256 = (encrypted256 == expected_e256) ? 1'b1 : 1'b0;
    assign d256 = (decrypted256 == expected_d256) ? 1'b1 : 1'b0;

endmodule