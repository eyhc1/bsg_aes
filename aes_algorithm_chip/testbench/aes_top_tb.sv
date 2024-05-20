module aes_top_tb();
    initial begin
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
        $dumpfile("aes_top.vcd");
        $dumpvars(0, aes_top_tb);
    end

    aes_top DUT (
        .e256(e256),
        .d256(d256),
        .encrypted256(encrypted256),
        .decrypted256(decrypted256)

    );


    initial begin

        #1000;


        if (e256) begin
            $display("Encryption Test passed");
        end
        else 
            $display("Encryption Test failed");
        if (d256) begin
            $display("Decrytion Test passed");
        end
        else 
            $display("Decrytion Test failed. The expected output is: %h, The real output is: %h", 128'h00112233445566778899aabbccddeeff, decrypted256);
        #1000;
        
        $finish;
    end
endmodule