module bsg_aes_encrypt_tb ();
    initial begin
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
        $dumpfile("bsg_aes_encrypt.vcd");
        $dumpvars(0, bsg_aes_encrypt_tb);
    end

    logic clk_i, reset_i;
    logic [127:0] plaintext;
    logic [255:0] initial_key;
    logic [127:0] ciphertext;
    logic [1919:0] key_chain;

    logic [128 + 256 - 1 : 0] data_i;
    logic [127:0] data_o;

    // Handshakes
    logic v_i, v_o, yumi_i, ready_o;
    parameter CLOCK_PERIOD = 10000;

    bsg_aes_encrypt DUT (
        .*
    );

    bsg_nonsynth_clock_gen #(CLOCK_PERIOD) clk_gen (clk_i);

    initial begin
        reset_i <= 1; @(posedge clk_i); // Always reset FSMs at start
        reset_i <= 0; 
        // plaintext   <= 128'h00112233445566778899aabbccddeeff;
        // initial_key <= 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
        data_i <= {128'h00112233445566778899aabbccddeeff, 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f};
        @(posedge clk_i);

        repeat(50) @(posedge clk_i);  // give enought time for the encryption to finish
        $finish;

    end

    always @(posedge clk_i) begin
        $display("[%d] Send: %h", $time/CLOCK_PERIOD, data_i);
        $display("[%d] Recieve: %h", $time/CLOCK_PERIOD, data_o);
    end
endmodule