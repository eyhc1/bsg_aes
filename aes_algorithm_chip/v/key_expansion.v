module key_expansion(
    input  [255:0] initial_key, //temporary initial key, need to be changed to random key later
    output reg [128 * 15 - 1:0]round_key
);

    // should be a module here to generate random key



    // should be a module here to generate random key

    


endmodule


module round_key(
    input [255:0] k,
    input [3:0] r,
    output reg [15:0] result
);
    reg [128:0] temp_k;
    reg [31:0] kg;
    reg [32:0] rc_0;
    reg [8:0] sub;
    integer i;

    always_comb begin
        temp_k = k;
        if (r == 0) begin
            result = k;
        end else begin
            // apply rotword
            kg = {k[255:232],k[231:224]}; 

            // apply sbox
            rom_sbox kg_0 (.rom_addr(kg[7:0]), .data_o(kg[7:0]));
            rom_sbox kg_1 (.rom_addr(kg[15:8]), .data_o(kg[15:8]));
            rom_sbox kg_2 (.rom_addr(kg[23:16]), .data_o(kg[23:16]));
            rom_sbox kg_3 (.rom_addr(kg[31:24]), .data_o(kg[31:24]));


            // apply rcon
            rom_rc get_rc_0 #(.width_p(8),.addr_width_p(4))
                    (.addr_i(r-1)
                    ,.data_o(rc_0)
                    );
            kg[7:0] ^= rc_0;
            initial begin
            for (i = 0; i < 32*8; i = i + 8) begin
                    if  (i < 4*8) begin
                        temp_k[i+7:i] ^= kg[i+7:i];
                    end
                    else if (kl == 32 && (i >>2 ) == 4'b100) begin
                        rom_sbox kg_0 (.rom_addr(temp_k[(i-4*8)+:8]), .data_o(sub));
                        temp_k[i] ^= sub;
                    end
                    else begin
                        temp_k[i+7:i] ^= temp_k[(i-4*8)+:8];
                    end
                end
            end
            result = temp_k;
        end
    end
endmodule

module all_key(
    input [255:0] k,
    output reg [239:0] result
);
    reg [255:0] k_all [0:10];
    reg [255:0] knew;
    integer i;

    initial begin
        k_all[0] = k;
        for (i = 1; i <= 7; i = i + 1) begin
            knew = round_key(k_all[i-1], i);
            k_all[i] = knew;
        end

        for (i = 0; i < 240; i = i + 1) begin
            result[i] = k_all[i/$size(k)][i%$size(k)];
        end
    end
endmodule


