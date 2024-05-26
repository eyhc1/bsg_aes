module sub_bytes #(parameter size = 4)(
    input [0:size*8-1] block,
    output reg [0:size*8-1] subed_block
);
    genvar i;

    generate
        for (i = 0; i < size; i = i + 1) begin : roms
            rom_sbox sbox (.rom_addr(block[i*8 +: 8]), .data_o(subed_block[i*8 +: 8]));
        end
    endgenerate
endmodule