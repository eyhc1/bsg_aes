module aes_encryption_tb();
    initial begin
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
        $dumpfile("aes_encryption.vcd");
        $dumpvars(0, aes_encryption_tb);
    end

    logic clk_i, reset_i;
    logic [127:0] plaintext;
    logic [255:0] initial_key;
    logic [127:0] ciphertext;
    logic [1919:0] key_chain;

    aes_encryption DUT (
        .*
    );

    bsg_nonsynth_clock_gen #(10000) clk_gen (clk_i);

    initial begin
        reset_i <= 1; @(posedge clk_i); // Always reset FSMs at start
        reset_i <= 0; 
        plaintext   <= 128'h00112233445566778899aabbccddeeff;
        // plaintext   <= 128'haa;
        initial_key <= 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
        repeat(16) @(posedge clk_i);
        $display("[%d] Send Plaintext: %h with Key: %h", $time, plaintext, initial_key);
        $display("[%d] Recieve Encrypted Text: %h, Expanded key: %h", $time, ciphertext, key_chain);

        $finish;

    end
endmodule