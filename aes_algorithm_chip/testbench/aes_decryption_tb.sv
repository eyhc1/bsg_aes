module aes_decryption_tb();
    initial begin
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
        $dumpfile("aes_decryption.vcd");
        $dumpvars(0, aes_decryption_tb);
    end

    reg clk_i;
    reg reset_i;
    reg [127:0] ciphertext;
    reg [1919:0] key_chain;
    wire [127:0] plaintext;
    

    aes_decryption DUT (
        .clk_i(clk_i),
        .reset_i(reset_i),
        .ciphertext(ciphertext),
        .key_chain(key_chain),
        .plaintext(plaintext)
    );

    bsg_nonsynth_clock_gen #(100000) clk_gen (clk_i);
    initial begin
        reset_i <= 1; @(posedge clk_i); // Always reset FSMs at start
        reset_i <= 0; 
        ciphertext = 128'h46800034caad9e4b74805a532ef5a7e3;
        key_chain = 1920'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1fa573c29fa176c498a97fce93a572c09c1651a8cd0244beda1a5da4c10640badeae87dff00ff11b68a68ed5fb03fc15676de1f1486fa54f9275f8eb5373b8518dc656827fc9a799176f294cec6cd5598b3de23a75524775e727bf9eb45407cf390bdc905fc27b0948ad5245a4c1871c2f45f5a66017b2d387300d4d33640a820a7ccff71cbeb4fe5413e6bbf0d261a7dff01afafee7a82979d7a5644ab3afe6402541fe719bf500258813bbd55a721c0a4e5a6699a9f24fe07e572baacdf8cdea24fc79ccbf0979e9371ac23c6d68de36;
        repeat(50) @(posedge clk_i);
        $display("[%d] Send Cipher text: %h", $time, ciphertext);
        $display("[%d] Recieve Decrypted Text: %h", $time, plaintext[127-:32]);


        $finish;

    end
endmodule