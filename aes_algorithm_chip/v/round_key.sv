module round_key(
    input [0:255] k,
    input [0:3] r,
    output logic [0:255] result
);
    // the rc matrix
    logic [0:31] rc;

    // get the rc value
    assign rc = (32'h01000000) << (r-1);
    
    // start the block generation, each block represents one column of the key
    generate_block  block_1
    (
        .k(k[0 +: 32]),
        .op_block(k[224 +: 32]),
        .rc(rc),
        .first_block(1), // first block is always required special operation
        .special_block(0),
        .result(result[0 +: 32])
    );

    generate_block  block_2
    (
        .k(k[32 +: 32]),
        .op_block(result[0 +: 32]),
        .rc(rc),
        .first_block(0),
        .special_block(0),
        .result(result[32 +: 32])
    );

    generate_block  block_3
    (
        .k(k[64 +: 32]),
        .op_block(result[32 +: 32]),
        .rc(rc),
        .first_block(0),
        .special_block(0),
        .result(result[64 +: 32])
    );

    generate_block  block_4
    (
        .k(k[96 +: 32]),
        .op_block(result[64 +: 32]),
        .rc(rc),
        .first_block(0),
        .special_block(0),
        .result(result[96 +: 32])
    );

    generate_block  block_5
    (
        .k(k[128 +: 32]),
        .op_block(result[96 +: 32]),
        .rc(rc),
        .first_block(0),
        .special_block(1), // this is the 5th block, which requires special operation to generate some thing new
        .result(result[128 +: 32])
    );

    generate_block  block_6
    (
        .k(k[160 +: 32]),
        .op_block(result[128 +: 32]),
        .rc(rc),
        .first_block(0),
        .special_block(0),
        .result(result[160 +: 32])
    );

    generate_block  block_7
    (
        .k(k[192 +: 32]),
        .op_block(result[160 +: 32]),
        .rc(rc),
        .first_block(0),
        .special_block(0),
        .result(result[192 +: 32])
    );

    generate_block  block_8
    (
        .k(k[224 +: 32]),
        .op_block(result[192 +: 32]),
        .rc(rc),
        .first_block(0),
        .special_block(0),
        .result(result[224 +: 32])
    );

endmodule


module generate_block(
    input [0:31] k, // the key to be used
    input [0:31] op_block, // the block to be operated on. Based on this,the new column to be generated
    input [0:31] rc, // the round constant
    input first_block, special_block, // flags to indicate the special operation
    output reg [0:31] result
);
    
    logic [0:31] rot_block; // the block after rotation
    logic [0:31] sub_block; // the block after substitution
    logic [0:31] op_sub_block; // the block after special_substitution
    logic [0:31] temp_block; // the block to be used for the final xor operation

    // used in the first block
    assign rot_block = {op_block[8:31],op_block[0:7]}; // rotate the block
    sub_bytes #(4) sub_1  (.block(rot_block), .subed_block(sub_block)); //

    // used in the 5th block
    sub_bytes #(4) sub_temp (.block(op_block), .subed_block(op_sub_block));

    // get the temp block value based on different conditions
    assign temp_block = first_block ? (sub_block ^ rc) : special_block ? op_sub_block : op_block;

    assign result =  temp_block ^ k;

endmodule


