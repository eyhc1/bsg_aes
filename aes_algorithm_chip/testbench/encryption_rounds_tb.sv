module encryption_rounds_tb();
    initial begin
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
        $dumpfile("encryption_rounds.vcd");
        $dumpvars(0, encryption_rounds_tb);
    end

    reg [127:0] current_state;
    reg [127:0] key;
    wire [127:0] next_state;

    encryption_rounds DUT (
        .current_state(current_state),
        .key(key),
        .next_state(next_state)
    );

    initial begin
        #10000;
        current_state = 128'h00102030405060708090a0b0c0d0e0f0;
        key = 128'h101112131415161718191a1b1c1d1e1f;
        #10000;

        $finish;

    end

    // 添加一个监视器来观察 next_state 的变化
    initial begin
        $monitor("At time %d, next_state = %h", $time, next_state);
    end
endmodule