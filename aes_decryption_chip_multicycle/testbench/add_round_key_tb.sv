module add_round_key_tb();
    initial begin
        $dumpfile("add_round_key.vcd");
        $dumpvars(0, add_round_key_tb);
    end
    reg [127:0] state;
    reg [127:0] key;
    wire [127:0] result;


    add_round_key DUT (
        .state(state),
        .key(key),
        .result(result)
    );

    initial begin
        #100000;
        state = 128'h00112233445566778899aabbccddeeff;
        key = 128'h000102030405060708090a0b0c0d0e0f;
        #100000;

        $finish;


    end

    initial begin
        $monitor("At time %d, state = %h, key = %h, result = %h", $time, state, key, result);
    end
endmodule