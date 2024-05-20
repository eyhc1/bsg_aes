module round_key(
    input clk_i,
    input reset_i,
    input [0:255] k,
    input [0:3] r,
    output logic [0:255] result
);

    // logic [0:31]rot_block;
    // logic [0:31]sub_block;
    logic [0:31] rc;
    // wires conneting the RC values to the blocks
    logic [0:31] rc1;
    logic [0:31] rc2;
    logic [0:31] rc3;
    logic [0:31] rc4;
    logic [0:31] rc5;
    logic [0:31] rc6;
    logic [0:31] rc7;
    logic [0:31] rc8;

    // the block for operation
    logic [0:31] op_block;
    // logic [0:31]op_sub_block;

    // the block prepared for xor
    // logic [0:31] temp_block;

    // wires conneting the blocks
    logic [0:31] b1_b2;
    logic [0:31] b2_b3;
    logic [0:31] b3_b4;
    logic [0:31] b4_b5;
    logic [0:31] b5_b6;
    logic [0:31] b6_b7;
    logic [0:31] b7_b8;
    logic [0:31] b_final;

    // piplined registers conneting the blocks
    logic [0:31] b1_b2_d1;
    logic [0:31] b2_b3_d1;
    logic [0:31] b3_b4_d1;
    logic [0:31] b4_b5_d1;
    logic [0:31] b5_b6_d1;
    logic [0:31] b6_b7_d1;
    logic [0:31] b7_b8_d1;
    logic [0:31] b_final_d1;

    // wires (maybe registers for piplined version?) for keys for different blocks
    logic [0:31] k1;
    logic [0:31] k2;
    logic [0:31] k3;
    logic [0:31] k4;
    logic [0:31] k5;
    logic [0:31] k6;
    logic [0:31] k7;
    logic [0:31] k8;

    // registers for input keys (right now is a two-stage pipline)
    logic [0:127] k_128;

    // assign k_128 = k[128 : 255];
    

    // assign the keys to appropriate blocks
    assign k1 = k[0 +: 32];
    assign k2 = k[32 +: 32];
    assign k3 = k[64 +: 32];
    assign k4 = k[96 +: 32];
    // assign k5 = k[128 +: 32];
    // assign k6 = k[160 +: 32];
    // assign k7 = k[192 +: 32];
    // assign k8 = k[224 +: 32];
    assign k5 = k_128[0 +: 32];
    assign k6 = k_128[32 +: 32];
    assign k7 = k_128[64 +: 32];
    assign k8 = k_128[96 +: 32];
   

    // get the rc value
    assign rc = (32'h01000000) << (r-1);

    assign op_block = k[224 +: 32];

    generate_block  block_1
    (
        .k(k1),
        .op_block(op_block),
        .rc(rc),
        .first_block(1'b1),
        .special_block(1'b0),
        .result(b1_b2)
    );

    generate_block  block_2
    (
        .k(k2),
        .op_block(b1_b2),
        .rc(rc),
        .first_block(1'b0),
        .special_block(1'b0),
        .result(b2_b3)
    );

    generate_block  block_3
    (
        .k(k3),
        .op_block(b2_b3),
        .rc(rc),
        .first_block(1'b0),
        .special_block(1'b0),
        .result(b3_b4)
    );



    logic [0:31] b4_dff;
    logic [0:31] k5_d1;
    logic [0:31] rc_d1;

    // wires conneting the DFFs to the outputs
    logic [0:31] b3_r;
    logic [0:31] b2_r;
    logic [0:31] b1_r;
    generate_block  block_4
    (
        .k(k4),
        .op_block(b3_b4),
        .rc(rc),
        .first_block(1'b0),
        .special_block(1'b0),
        .result(b4_dff)
    );
    // initial DFF bipartition?
    bsg_dff_reset #(128) dff_k_128 (.clk_i(clk_i), .reset_i(reset_i), .data_i(k[128:255]), .data_o(k_128));
    // bsg_dff_reset #(32) dff_k5 (.clk_i(clk_i), .reset_i(reset_i), .data_i(k5), .data_o(k5_d1));
    bsg_dff_reset #(32) dff_b4_b5 (.clk_i(clk_i), .reset_i(reset_i), .data_i(b4_dff), .data_o(b4_b5));
    bsg_dff_reset #(32) dff_rc4 (.clk_i(clk_i), .reset_i(reset_i), .data_i(rc), .data_o(rc_d1));
    bsg_dff_reset #(32) dff_b3_r (.clk_i(clk_i), .reset_i(reset_i), .data_i(b3_b4), .data_o(b3_r));
    bsg_dff_reset #(32) dff_b2_r (.clk_i(clk_i), .reset_i(reset_i), .data_i(b2_b3), .data_o(b2_r));
    bsg_dff_reset #(32) dff_b1_r (.clk_i(clk_i), .reset_i(reset_i), .data_i(b1_b2), .data_o(b1_r));


    generate_block  block_5
    (
        .k(k5),
        .op_block(b4_b5),
        .rc(rc_d1),
        .first_block(1'b0),
        .special_block(1'b1),
        .result(b5_b6)
    );


    generate_block  block_6
    (
        .k(k6),
        .op_block(b5_b6),
        .rc(rc_d1),
        .first_block(1'b0),
        .special_block(1'b0),
        .result(b6_b7)
    );

    generate_block  block_7
    (
        .k(k7),
        .op_block(b6_b7),
        .rc(rc_d1),
        .first_block(1'b0),
        .special_block(1'b0),
        .result(b7_b8)
    );

    generate_block  block_8
    (
        .k(k8),
        .op_block(b7_b8),
        .rc(rc_d1),
        .first_block(1'b0),
        .special_block(1'b0),
        .result(b_final)
    );

    assign result = {b1_r,b2_r,b3_r,b4_b5,b5_b6,b6_b7,b7_b8,b_final};

endmodule


module generate_block(
    input [0:31] k,
    input [0:31] op_block,
    input [0:31] rc,
    input first_block, special_block,
    output logic [0:31] result
);
    logic [0:31] temp_block;

    logic [0:31]rot_block;
    logic [0:31]sub_block;
    logic [0:31]op_sub_block; 




    assign rot_block = {op_block[8:31],op_block[0:7]};
    sub_bytes #(4) sub_1  (.block(rot_block), .subed_block(sub_block));

    sub_bytes #(4) sub_temp (.block(op_block), .subed_block(op_sub_block));


    assign temp_block = first_block ? (sub_block ^ rc) : special_block ? op_sub_block : op_block;

    assign result =  temp_block ^ k;
    //assign result = sub_block;

endmodule


