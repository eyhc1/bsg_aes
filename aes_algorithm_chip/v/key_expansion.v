`include "v/round_key.v"
module key_expansion(
    input  [0:255] initial_key, //temporary initial key, need to be changed to random key later
    output logic [0:128 * 15 - 1]round_keys
);

    // should be a module here to generate random key



    // should be a module here to generate random key
    logic [0:255] k_1;
    logic [0:255] k_2;
    logic [0:255] k_3;
    logic [0:255] k_4;
    logic [0:255] k_5;
    logic [0:255] k_6;
    logic [0:255] k_7;


    
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

    assign round_keys = {initial_key, k_1, k_2, k_3, k_4, k_5, k_6, k_7[0:127]};

    // logic [0:255] round_key [0:7];

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


