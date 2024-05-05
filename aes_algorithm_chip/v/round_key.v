`include "v/rom_sbox.v"
module round_key(
    input [255:0] k,
    input [4:0] r,
    output reg [255:0] result
);

    // logic [31:0]rot_block;
    // logic [31:0]sub_block;
    logic [31:0] rc;

    // the block for operation
    logic [31:0]op_block;
    // logic [31:0]op_sub_block;

    // the block prepared for xor
    // logic [31:0] temp_block;
   

    // get the rc value
    assign rc = 1 << (r-1);



    assign op_block = k[127-:32];

    generate_block  block_1
    (
        .k(k[31 -: 32]),
        .op_block(op_block),
        .rc(rc),
        .first_block(1),
        .special_block(0),
        .result(result[31:0])
    );

    generate_block  block_2
    (
        .k(k[63 -: 32]),
        .op_block(result[31:0]),
        .rc(rc),
        .first_block(0),
        .special_block(0),
        .result(result[63 : 32])
    );

    generate_block  block_3
    (
        .k(k[95 -: 32]),
        .op_block(result[63 : 32]),
        .rc(rc),
        .first_block(0),
        .special_block(0),
        .result(result[95 : 64])
    );

    generate_block  block_4
    (
        .k(k[127 -: 32]),
        .op_block(result[95 : 64]),
        .rc(rc),
        .first_block(0),
        .special_block(0),
        .result(result[127 : 96])
    );

    generate_block  block_5
    (
        .k(k[159 -: 32]),
        .op_block(result[127 : 96]),
        .rc(rc),
        .first_block(0),
        .special_block(1),
        .result(result[159 : 128])
    );

    generate_block  block_6
    (
        .k(k[191 -: 32]),
        .op_block(result[159 : 128]),
        .rc(rc),
        .first_block(0),
        .special_block(0),
        .result(result[191 : 160])
    );

    generate_block  block_7
    (
        .k(k[223 -: 32]),
        .op_block(result[191 : 160]),
        .rc(rc),
        .first_block(0),
        .special_block(0),
        .result(result[223 : 192])
    );

    generate_block  block_8
    (
        .k(k[255 -: 32]),
        .op_block(result[223 : 192]),
        .rc(rc),
        .first_block(0),
        .special_block(0),
        .result(result[255 : 224])
    );







    // genvar i;
    // generate
    //     for (i = 0; i < 4 * 8 * 8; i = i + 32) begin

    //         assign op_block = (i == 0) ? k[(i+127)-:32] : result[(i-1)-:32];


    //         if (i % 256 == 0) begin
    //             assign rot_block = {op_block[7:0],op_block[31:8]};
    //             subx sub_1 (.block(rot_block), .subed_block(sub_block));
    //             assign temp_block = sub_block ^ rc;
    //         end
    //         else if (i % 128) begin
    //            assign op_sub_block = op_block;
    //             subx sub_temp (.block(op_sub_block), .subed_block(temp_block));
    //         end
    //         else begin
    //             assign temp_block = op_block;
    //         end

    //         assign result[(i+31)-:32] = k[i+31-:32] ^ temp_block;

    //     end
    // endgenerate

endmodule


module generate_block(
    input [31:0] k,
    input [31:0] op_block,
    input [31:0] rc,
    input first_block, special_block,
    output reg [31:0] result
);
    logic [31:0] temp_block;

    logic [31:0]rot_block;
    logic [31:0]sub_block;

    logic [31:0] rot_sub;
    logic [31:0]op_sub_block; 


    assign rot_block = {op_block[7:0],op_block[31:8]};
    subx sub_1 (.block(rot_block), .subed_block(sub_block));
    assign rot_sub = {op_block[7:0], op_block[15:8], op_block[23:16], op_block[31:24]};
    subx sub_temp (.block(rot_sub), .subed_block(op_sub_block));


    assign temp_block = first_block ? (sub_block ^ rc) : special_block ? op_sub_block : op_block;

    assign result = k ^ temp_block;
endmodule


module subx(
    input [31:0] block,
    output reg [31:0] subed_block
);
    logic [7:0] sub_1;
    logic [7:0] sub_2;
    logic [7:0] sub_3;
    logic [7:0] sub_4;

    rom_sbox sbox_1 (.rom_addr(block[7:0]), .data_o(sub_1));
    rom_sbox sbox_2 (.rom_addr(block[15:8]), .data_o(sub_2));
    rom_sbox sbox_3 (.rom_addr(block[23:16]), .data_o(sub_3));
    rom_sbox sbox_4 (.rom_addr(block[31:24]), .data_o(sub_4));

    assign subed_block = {sub_1, sub_2, sub_3, sub_4};

endmodule





// `timescale 1ns / 1ps
// module round_key_tb;
//     reg [255:0] k;
//     reg [4:0] r;
//     reg [255:0] result;

    
//     // Instantiate the unit under test (UUT)
//     round_key DUT (
//         .k(k), 
//         .r(r), 
//         .result(result)
//     );

//     initial begin
        
//         #1;
//         k = 256'h6464646464646464646464646464646464646464646464646464646464646464;
//         r = 4'd1;
//         #1;

//         #1;
//         k = 256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4;
//         r = 4'd1;
//         #1;
//         // Finish the simulation
//         $finish;
//     end

//     initial begin
//         $monitor("At time %t, k = %h, r = %h, result = %h", $time, k, r, result);
//     end
// endmodule