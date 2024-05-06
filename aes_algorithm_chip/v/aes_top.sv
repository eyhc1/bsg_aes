module aes_top(enable, e256);

input enable;
output logic e256;

// The plain text used as input
logic[127:0] in = 128'h00112233445566778899aabbccddeeff;

// The different keys used for testing (one of each type)
logic[255:0] key256 = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;

// The expected outputs from the encryption module
logic[127:0] expected256 = 128'h8ea2b7ca516745bfeafc49904b496089;

// The result of the encryption module for every type
logic[127:0] encrypted128;
logic[127:0] encrypted192;
logic[127:0] encrypted256;

assign e256 = (encrypted256 == expected256 && enable) ? 1'b1 : 1'b0;
aes_encryption encruot (
        .plaintext(in),
        .initial_key(key256),
        .ciphertext(encrypted256)
    );

endmodule