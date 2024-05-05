`include "v/rom_sbox.v"


module round_key(
    input [255:0] k,
    input [3:0] r,
    output reg [255:0] result
);
    reg [255:0] temp_k;
    reg [255:0] temp_k_test;
    reg [31:0] kg;
    reg [31:0] kg_init;
    reg [31:0] rc_0;
    reg [8:0] sub;
    // integer i;
    assign kg_init = {k[255:232],k[231:224]}; 
    assign temp_k = k;
    assign result = r == 0 ? k : temp_k;


    // apply sbox
    rom_sbox kg_0 (.rom_addr(kg[7:0]), .data_o(kg[7:0]));
    rom_sbox kg_1 (.rom_addr(kg[15:8]), .data_o(kg[15:8]));
    rom_sbox kg_2 (.rom_addr(kg[23:16]), .data_o(kg[23:16]));
    rom_sbox kg_3 (.rom_addr(kg[31:24]), .data_o(kg[31:24]));


    // // apply rcon
    // rom_rc  #(.width_p(8),.addr_width_p(4)) get_rc_0
    //         (.addr_i(r-1)
    //         ,.data_o(rc_0[7:0])
    //         );
    // assign rc_0 = (r-1) < 8 ? 1 << (r-1) : 1 << (r-1) ^ (16'h011B << ((r-1) - 8));
    assign rc_0 = 1 << (r-1);
    always_comb begin
        kg = kg_init ^ rc_0;
    end
    
    integer i;
    always_comb begin 
        for (i = 0; i < 32*8; i = i + 8) begin
            if  (i < 4*8) begin
                
                temp_k_test[i+7-:7]= temp_k[i+7-:7] ^ kg[i+7-:7];
                
            end
            // else if ((i >> 2) == 4'b100) begin
            //     rom_sbox kg_0 (.rom_addr(temp_k[(i-4*8)+:8]), .data_o(sub));
            //     temp_k[i+7-:7] = temp_k[i+7-:7] ^ sub;
            // end
            else begin
                temp_k_test[i+7-:7] = temp_k[i+7-:7] ^ temp_k[(i-4*8)+:8];
            end         
        end
    end
endmodule




module round_key_tb;
    reg [255:0] k;
    reg [4:0] r;
    wire [255:0] result;

    
    // Instantiate the unit under test (UUT)
    round_key DUT (
        .k(k), 
        .r(r), 
        .result(result)
    );

    initial begin
        #1;
        k = 256'h6464646464646464646464646464646464646464646464646464646464646464;
        r = 5'd0;
        #1;
        // Finish the simulation
        $finish;
    end

    initial begin
        $monitor("At time %t, k = %b, r = %b, result = %b", $time, k, r, result);
    end
endmodule