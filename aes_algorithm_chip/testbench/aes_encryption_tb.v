module aes_encryption_tb();
    initial begin
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
        $dumpfile("aes_encryption.vcd");
        $dumpvars(0, aes_encryption_tb);
    end

    reg [127:0] plaintext;
    reg [255:0] initial_key;
    wire [127:0] ciphertext;

    // 实例化 aes_encryption 模块
    aes_encryption DUT (
        .plaintext(plaintext),
        .initial_key(initial_key),
        .ciphertext(ciphertext)
    );

    initial begin
        #10000;
        plaintext = 128'h00112233445566778899aabbccddeeff;
        initial_key = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
        #10000;

        $finish;

    end

    initial begin
        $monitor("At time %d, ciphertext = %h", $time, ciphertext);
    end
endmodule