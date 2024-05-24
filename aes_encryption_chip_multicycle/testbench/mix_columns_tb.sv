module mix_columns_tb();
    initial begin
        $dumpfile("mix_columns.vcd");
        $dumpvars(0, mix_columns_tb);
    end
    logic [127:0] block;
    logic [127:0] mixed_block;


    mix_columns DUT (
        .block(block),
        .mixed_block(mixed_block)
    );

    initial begin
        #100000;
        block = 128'h6353e08c0960e104cd70b751bacad0e7;
        #100000;

        #100000;
        block = 128'h84e1fd6b1a5c946fdf4938977cfbac23;
        #100000;

        #100000;
        block = 128'had9c7e017e55ef25bc150fe01ccb6395;
        #100000;

        $finish;


    end

    initial begin
        $monitor("At time %d, mixed_block = %h", $time, mixed_block);
    end
endmodule