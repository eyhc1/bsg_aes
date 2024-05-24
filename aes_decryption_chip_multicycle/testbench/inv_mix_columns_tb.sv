module inv_mix_columns_tb();
    initial begin
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars();
        $dumpfile("inv_mix_columns.vcd");
        $dumpvars(0, inv_mix_columns_tb);
    end
    logic [127:0] block;
    logic [127:0] mixed_block;


    inv_mix_columns DUT (
        .block(block),
        .mixed_block(mixed_block)
    );

    initial begin
        #100000;
        block = 128'h627bceb9999d5aaac945ecf423f56da5;
        #100000;

        #100000;
        block = 128'h516604954353950314fb86e401922521;
        #100000;

        #100000;
        block = 128'h5f9c6abfbac634aa50409fa766677653;
        #100000;

        $finish;


    end

    initial begin
        $monitor("At time %d, mixed_block = %h", $time, mixed_block);
    end
endmodule