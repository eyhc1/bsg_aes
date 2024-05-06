`include "v/sub_bytes.v"
module round_key(
    input [0:255] k,
    input [0:3] r,
    output logic [0:255] result
);

    // logic [0:31]rot_block;
    // logic [0:31]sub_block;
    logic [0:31] rc;

    // the block for operation
    logic [0:31]op_block;
    // logic [0:31]op_sub_block;

    // the block prepared for xor
    // logic [0:31] temp_block;
   

    // get the rc value
    assign rc = (32'h01000000) << (r-1);



    assign op_block = k[224 +: 32];

    generate_block  block_1
    (
        .k(k[0 +: 32]),
        .op_block(op_block),
        .rc(rc),
        .first_block(1),
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
        .special_block(1),
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
    input [0:31] k,
    input [0:31] op_block,
    input [0:31] rc,
    input first_block, special_block,
    output reg [0:31] result
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


