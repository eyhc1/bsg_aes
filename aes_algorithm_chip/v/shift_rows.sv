module shift_rows(
    input [0:127]block,
    output logic [0:127]shifted_block
);
    

    assign shifted_block[0:31] = {block[0 +: 8], block[40 +: 8], block[80 +: 8], block[120 +: 8]};
    assign shifted_block[32:63] = {block[32 +: 8], block[72 +: 8], block[112 +: 8], block[24 +: 8]};
    assign shifted_block[64:95] = {block[64 +: 8], block[104 +: 8], block[16 +: 8], block[56 +: 8]};
    assign shifted_block[96:127] = {block[96 +: 8], block[8 +: 8], block[48 +: 8], block[88 +: 8]};


endmodule