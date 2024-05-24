module key_expansion_tb();
    initial begin
        $dumpfile("key_expansion.vcd");
        $dumpvars(0, key_expansion_tb);
    end
    reg [0:255] initial_key;
    wire [0:128*15-1] round_keys;


    key_expansion DUT (
        .initial_key(initial_key),
        .round_keys(round_keys)
    );

    initial begin

        #1000;
        initial_key = 256'h6464646464646464646464646464646464646464646464646464646464646464;
        #1000;



        #1000;
        initial_key =256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4;
        #1000;

        // Finish the simulation
        $finish;
    end

    initial begin
        $monitor("At time %d, round_key = %h", $time, round_keys);
    end
endmodule