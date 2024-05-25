module round_key (
    input clk_i,
    input reset_i,

    input [0:255] k,
    input [0:3] r,
    input               v_i,
    output              ready_o,

    output logic [0:255] result,
    output logic        v_o,
    input               yumi_i
);

    // the block for operation
    logic [0:31] sub_block_init;
    logic [0:31] sub_block_4;

    // by-partitioned result
    logic [0:127] result_1, result_2;

    // pipeline results
    logic [0:127] result_1_d1;
    logic [0:127] k_secondhalf_d1;

    // pipeline 1 controls 
    logic v_i_d1, ready_o_d1, v_o_d1, yumi_i_d1;
    // pipeline 2 controls 
    logic v_i_d2, ready_o_d2, v_o_d2, yumi_i_d2;

    // feed appropriate block to the sub_bytes module
    sub_bytes #(4) 
        sub_1 
            (.block({k[232:255], k[224:231]})
            ,.subed_block(sub_block_init));

    sub_bytes #(4) 
        sub_4
            (.block(result_1_d1[96:127])
            ,.subed_block(sub_block_4));

    // Piplines
    bsg_dff_reset #(
        .width_p(257)
    )
    pipeline_1 (
        .clk_i(clk_i),
        .reset_i(reset_i),
        .data_i({result_1, k[128:255], v_i}),
        .data_o({result_1_d1, k_secondhalf_d1, v_o_d1})
    );

    bsg_dff_reset #(
        .width_p(257)
    )
    result_pipeline (
        .clk_i(clk_i),
        .reset_i(reset_i),
        .data_i({result_1_d1, result_2, v_o_d1}),
        .data_o({result, v_o})
    );


    genvar i;
    generate
        assign result_1[0:31] = sub_block_init ^ k[0:31] ^ ((32'h01000000) << (r-1));
        assign result_2[0:31] = sub_block_4 ^ k_secondhalf_d1[0:31];

        for (i = 1; i < 4; i++) begin : gen_block_1
            assign result_1[i*32 +: 32] = result_1[(i-1)*32 +: 32] ^ k[i*32 +: 32];
        end
        for (i = 5; i < 8; i++) begin : gen_block_2
            assign result_2[(i-4)*32 +: 32] = result_2[(i-5)*32 +: 32] ^ k_secondhalf_d1[(i-4)*32 +: 32];
        end
    endgenerate
endmodule
