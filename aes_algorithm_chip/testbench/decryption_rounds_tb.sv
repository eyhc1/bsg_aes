module decryption_rounds_tb();
    initial begin
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
        $dumpfile("decryption_rounds.vcd");
        $dumpvars(0, decryption_rounds_tb);
    end

    reg [127:0] current_state;
    reg [127:0] key;
    wire [127:0] next_state;

    decryption_rounds DUT (
        .current_state(current_state),
        .key(key),
        .next_state(next_state)
    );

    initial begin
        #10000;
        current_state = 128'haa5ece06ee6e3c56dde68bac2621bebf;
        key = 128'h4e5a6699a9f24fe07e572baacdf8cdea;
        #10000;

        $finish;

    end


    initial begin
        $monitor("At time %d, next_state = %h", $time, next_state);
    end
endmodule