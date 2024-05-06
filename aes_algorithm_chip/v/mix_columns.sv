module mix_columns (
    input [127:0] block,
    output logic [127:0] mixed_block
);


    logic [7:0] two_0[0:3];
    logic [7:0] two_1[0:3];
    logic [7:0] two_2[0:3];
    logic [7:0] two_3[0:3];

    genvar i;
    generate
        for(i=0;i< 4;i=i+1) begin : loop

            assign two_3[i] = (block[7+i*32] == 1'b1) ? (block[7+i*32-:8]<<1)^ 8'h1b : block[7+i*32-:8]<<1;
            assign two_2[i] = (block[15+i*32] == 1'b1) ? (block[15+i*32-:8]<<1)^ 8'h1b : block[15+i*32-:8]<<1;
            assign two_1[i] = (block[23+i*32] == 1'b1) ? (block[23+i*32-:8]<<1)^ 8'h1b : block[23+i*32-:8]<<1;
            assign two_0[i]= (block[31+i*32] == 1'b1) ? (block[31+i*32-:8]<<1)^ 8'h1b : block[31+i*32-:8]<<1;

           assign mixed_block[(i*32+24) +:8] = two_0[i] ^ (block[(i*32+16) +:8] ^ two_1[i] )^ block[(i*32+8) +:8] ^ block[i*32+:8];
           assign mixed_block[(i*32+16) +:8] = block[(i*32+24) +:8] ^ two_1[i] ^ (block[(i*32+8) +:8] ^ two_2[i]) ^ block[i*32+:8];
            assign mixed_block[(i*32+8) +:8] = block[(i*32+24) +:8] ^ block[(i*32+16) +:8] ^ two_2[i] ^ (block[i*32+:8] ^ two_3[i]);
           assign mixed_block[i*32 +:8] = (block[(i*32+24) +:8] ^ two_0[i]) ^ block[(i*32+16) +:8] ^ block[(i*32+8) +:8] ^ two_3[i];

        end
    endgenerate


endmodule





























