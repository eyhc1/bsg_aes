module key_expansion(
    input  [255:0] initial_key, //temporary initial key, need to be changed to random key later
    input [255:0] round_number,
    output [127:0]round_key
);
    wire [14:0] round_keys_set [0:127];
    // should be a module here to generate random key



    // should be a module here to generate random key

    


endmodule


module round_key(
    input [255:0] k,
    input [4:0] r,
    output reg [15:0] result
);
    reg [128:0] temp_k;
    reg [31:0] kg;
    reg [32:0] rc_0;
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

            
            result = temp_k;
        end
    end
endmodule