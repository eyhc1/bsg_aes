module inv_mix_columns (
    input [127:0] block,
    output logic [127:0] mixed_block
);

    logic [7:0] e_0[0:3];
    logic [7:0] e_1[0:3];
    logic [7:0] e_2[0:3];
    logic [7:0] e_3[0:3];
    
    logic [7:0] b_0[0:3];
    logic [7:0] b_1[0:3];
    logic [7:0] b_2[0:3];
    logic [7:0] b_3[0:3];

    logic [7:0] d_0[0:3];
    logic [7:0] d_1[0:3];
    logic [7:0] d_2[0:3];
    logic [7:0] d_3[0:3];
    
    logic [7:0] nine_0[0:3];
    logic [7:0] nine_1[0:3];
    logic [7:0] nine_2[0:3];
    logic [7:0] nine_3[0:3];
    
    genvar i;
    generate
        for(i=0;i< 4;i=i+1) begin : loop
            multiplier e3 (block[7+i*32-:8], 8'h0e, e_3[i]);
            multiplier e2 (block[15+i*32-:8], 8'h0e, e_2[i]);
            multiplier e1 (block[23+i*32-:8], 8'h0e, e_1[i]);
            multiplier e0 (block[31+i*32-:8], 8'h0e, e_0[i]);

            multiplier b3 (block[7+i*32-:8], 8'h0b, b_3[i]);
            multiplier b2 (block[15+i*32-:8], 8'h0b, b_2[i]);
            multiplier b1 (block[23+i*32-:8], 8'h0b, b_1[i]);
            multiplier b0 (block[31+i*32-:8], 8'h0b, b_0[i]);

            multiplier d3 (block[7+i*32-:8], 8'h0d, d_3[i]);
            multiplier d2 (block[15+i*32-:8], 8'h0d, d_2[i]);
            multiplier d1 (block[23+i*32-:8], 8'h0d, d_1[i]);
            multiplier d0 (block[31+i*32-:8], 8'h0d, d_0[i]);

            multiplier nine3 (block[7+i*32-:8], 8'h09, nine_3[i]);
            multiplier nine2 (block[15+i*32-:8], 8'h09, nine_2[i]);
            multiplier nine1 (block[23+i*32-:8], 8'h09, nine_1[i]);
            multiplier nine0 (block[31+i*32-:8], 8'h09, nine_0[i]);




            assign mixed_block[(i*32+24) +:8] = e_0[i] ^ b_1[i] ^ d_2[i] ^ nine_3[i];
            assign mixed_block[(i*32+16) +:8] = nine_0[i] ^ e_1[i] ^ b_2[i] ^ d_3[i];
            assign mixed_block[(i*32+8) +:8] =  d_0[i] ^ nine_1[i] ^ e_2[i] ^ b_3[i];
            assign mixed_block[i*32 +:8] = b_0[i] ^ d_1[i] ^ nine_2[i] ^ e_3[i];

        end
    endgenerate


endmodule