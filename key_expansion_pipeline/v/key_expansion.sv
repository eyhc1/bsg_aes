module key_expansion(
    input clk_i,
    input reset_i,

    input  [0:255] initial_key, // temporary initial key, need to be changed to random key later
    input               v_i,
    output              ready_o,

    output logic [0:128 * 15 - 1] round_keys,
    output logic        v_o,
    input               yumi_i
);

    // should be a module here to generate random key

    // internal wires
    logic [0:255] k [0:7];                      // 8 round keys


    logic [0:7] v_i_i, yumi_i_i, v_o_i, yumi_i_i;
    logic [0:7] valid;
    
    genvar i, j;
    generate
        assign k[0] = initial_key;

        assign valid[0] = v_i;
        assign v_o = valid[7];
        for (i = 1; i <= 7; i++) begin : gen_round_key
            round_key get_key
                (
                    .clk_i(clk_i),
                    .reset_i(reset_i),
                    .k(k[i - 1]),
                    .result(k[i]),

                    .r(4'(i)),  // TODO: make this a parameter width
                    .v_i(valid[i - 1]),
                    .ready_o(),
                    
                    .v_o(valid[i]),
                    .yumi_i()
                );
        end
    endgenerate
    // flatten the round keys
    assign round_keys = {k[0], k[1], k[2], k[3], k[4], k[5], k[6], k[7][0:127]};
endmodule