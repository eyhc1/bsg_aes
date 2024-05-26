module aes_decryption_tb();
    initial begin
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
        $dumpfile("aes_decryption.vcd");
        $dumpvars();
    end

    logic clk_i, reset_i;
    logic [255:0] key;
    logic [127:0] ciphertext;
    logic [127:0] plaintext;
    

    aes_decryption DUT (
        .*
    );
    parameter CLOCK_PERIOD=10000;
	initial begin
		clk_i <= 0;
		forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i; // Forever toggle the clock
	end

    initial begin
        reset_i    <= 1; @(posedge clk_i); // Always reset FSMs at start
        reset_i    <= 0; 
        ciphertext <= 128'h8ea2b7ca516745bfeafc49904b496089;
        key  <= 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
        repeat(29) @(posedge clk_i);
        $display("[%d] Recieve decrypted Text: %h", $time, plaintext);

        $finish;

    end
endmodule