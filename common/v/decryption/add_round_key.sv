module add_round_key (
    input [127:0] state,
    input [127:0]key,
    output logic [127:0]result
);
    assign result = state ^ key;
endmodule