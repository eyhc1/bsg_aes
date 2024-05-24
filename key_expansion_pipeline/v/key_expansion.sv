module key_expansion(
    input clk_i,
    input reset_i,
    input  [0:255] initial_key, // temporary initial key, need to be changed to random key later
    output logic [0:128 * 15 - 1]round_keys
);

    // should be a module here to generate random key

    // internal wires
    logic [0:255] k [0:7];                      // 8 round keys
    logic [0:255] initial_key_d_chained [0:7];  // pipline registers chains for the initial keys
    logic [0:255] initial_key_d7;               // pipline registers for the initial keys
    
    genvar i, j;
    generate
        
        for (i = 0; i < 7; i++) begin : gen_round_key
            if (i == 0) // first block
                begin: initial_block
                    round_key get_key
                    (
                        .clk_i(clk_i),
                        .reset_i(reset_i),
                        .k(initial_key),
                        .r(4'(i+1)),  // TODO: make this a parameter width
                        .result(k[i + 1])
                    );
                end 
            else 
                begin: other_blocks
                    round_key get_key
                    (
                        .clk_i(clk_i),
                        .reset_i(reset_i),
                        .k(k[i]),
                        .r(4'(i+1)),  // TODO: make this a parameter width
                        .result(k[i + 1])
                    );
                end
        
        end
    endgenerate
    assign round_keys = {initial_key, k[1], k[2], k[3], k[4], k[5], k[6], k[7][0:127]};
    


endmodule


