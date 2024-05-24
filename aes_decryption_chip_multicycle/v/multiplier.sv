module multiplier (
    input [7:0] num_1,
    input [7:0] num_2,
    output logic [15:0] result
);

    logic [7:0] temp_1;
    logic [7:0] temp_2;
    integer i;

    always_comb begin
        temp_1 = num_1;
        temp_2 = num_2;
        result = 8'b0;

        for (i = 0; i < 8; i = i + 1) begin
            if (temp_2[0] == 1'b1) begin
                result = result ^ temp_1;
            end
            if (temp_1 & 8'h80) begin
                temp_1 = (temp_1 << 1) ^ 8'h1B; // 0x11B in hexadecimal
            end else begin
                temp_1 = temp_1 << 1;
            end
            temp_2 = temp_2 >> 1;
        end
    end

endmodule
