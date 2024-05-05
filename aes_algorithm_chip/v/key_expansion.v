`include "v/round_key.v"
module key_expansion(
    input  [255:0] initial_key, //temporary initial key, need to be changed to random key later
    output reg [128 * 15 - 1:0]round_key
);

    // should be a module here to generate random key



    // should be a module here to generate random key
    reg [255:0] k_1;
    reg [255:0] k_2;
    reg [255:0] k_3;
    reg [255:0] k_4;
    reg [255:0] k_5;
    reg [255:0] k_6;
    reg [255:0] k_7;


    
    round_key get_key_1(
        .k(initial_key),
        .r(4'd1),
        .result(k_1)
    );
    round_key get_key_2(
        .k(k_1),
        .r(4'd2),
        .result(k_2)
    );
    round_key get_key_3(
        .k(k_2),
        .r(4'd3),
        .result(k_3)
    );
    round_key get_key_4(
        .k(k_3),
        .r(4'd4),
        .result(k_4)
    );
    round_key get_key_5(
        .k(k_4),
        .r(4'd5),
        .result(k_5)
    );
    round_key get_key_6(
        .k(k_5),
        .r(4'd6),
        .result(k_6)
    );
    round_key get_key_7(
        .k(k_6),
        .r(4'd7),
        .result(k_7)
    );
    assign round_key = {k_7, k_6, k_5, k_4, k_3, k_2, k_1, initial_key};

    // logic [255:0] round_key [0:7];

    // genvar i;

    // generate

    //     for (i = 1; i < 8; i = i + 1) begin
    //         round_key get_key_(
    //             .k(round_key[i-1]),
    //             .r(i),
    //             .result(round_key[i])
    //         );
    //     end
    // endgenerate
    


endmodule


