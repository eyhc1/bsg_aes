module key_expansion(
    input clk_i,
    input reset_i,
    input  [0:255] initial_key, // temporary initial key, need to be changed to random key later
    output logic [0:128 * 15 - 1] round_keys
);

    // should be a module here to generate random key

    // internal wires
    logic [0:255] k [0:7];                      // 8 round keys
    
    genvar i, j;
    generate
        assign k[0] = initial_key;
        for (i = 1; i <= 7; i++) begin : gen_round_key
            round_key get_key
                (
                    .clk_i(clk_i),
                    .reset_i(reset_i),
                    .k(k[i - 1]),
                    .r(4'(i)),  // TODO: make this a parameter width
                    .result(k[i])
                );
        end
    endgenerate
    // flatten the round keys
    assign round_keys = {k[0], k[1], k[2], k[3], k[4], k[5], k[6], k[7][0:127]};
    


endmodule