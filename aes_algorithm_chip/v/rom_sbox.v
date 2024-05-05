// hi mother fucker
module rom_sbox (
    input [7:0] rom_addr,
    output logic [7:0] data_o
);
    wire [7:0] rom_data [0:255];

    assign rom_data[8'h00]= 8'h63;
    assign rom_data[8'h01]= 8'h7c;
    assign rom_data[8'h02]= 8'h77;
    assign rom_data[8'h03]= 8'h7b;
    assign rom_data[8'h04]= 8'hf2;
    assign rom_data[8'h05]= 8'h6b;
    assign rom_data[8'h06]= 8'h6f;
    assign rom_data[8'h07]= 8'hc5;
    assign rom_data[8'h08]= 8'h30;
    assign rom_data[8'h09]= 8'h01;
    assign rom_data[8'h0a]= 8'h67;
    assign rom_data[8'h0b]= 8'h2b;
    assign rom_data[8'h0c]= 8'hfe;
    assign rom_data[8'h0d]= 8'hd7;
    assign rom_data[8'h0e]= 8'hab;
    assign rom_data[8'h0f]= 8'h76;
    assign rom_data[8'h10]= 8'hca;
    assign rom_data[8'h11]= 8'h82;
    assign rom_data[8'h12]= 8'hc9;
    assign rom_data[8'h13]= 8'h7d;
    assign rom_data[8'h14]= 8'hfa;
    assign rom_data[8'h15]= 8'h59;
    assign rom_data[8'h16]= 8'h47;
    assign rom_data[8'h17]= 8'hf0;
    assign rom_data[8'h18]= 8'had;
    assign rom_data[8'h19]= 8'hd4;
    assign rom_data[8'h1a]= 8'ha2;
    assign rom_data[8'h1b]= 8'haf;
    assign rom_data[8'h1c]= 8'h9c;
    assign rom_data[8'h1d]= 8'ha4;
    assign rom_data[8'h1e]= 8'h72;
    assign rom_data[8'h1f]= 8'hc0;
    assign rom_data[8'h20]= 8'hb7;
    assign rom_data[8'h21]= 8'hfd;
    assign rom_data[8'h22]= 8'h93;
    assign rom_data[8'h23]= 8'h26;
    assign rom_data[8'h24]= 8'h36;
    assign rom_data[8'h25]= 8'h3f;
    assign rom_data[8'h26]= 8'hf7;
    assign rom_data[8'h27]= 8'hcc;
    assign rom_data[8'h28]= 8'h34;
    assign rom_data[8'h29]= 8'ha5;
    assign rom_data[8'h2a]= 8'he5;
    assign rom_data[8'h2b]= 8'hf1;
    assign rom_data[8'h2c]= 8'h71;
    assign rom_data[8'h2d]= 8'hd8;
    assign rom_data[8'h2e]= 8'h31;
    assign rom_data[8'h2f]= 8'h15;
    assign rom_data[8'h30]= 8'h04;
    assign rom_data[8'h31]= 8'hc7;
    assign rom_data[8'h32]= 8'h23;
    assign rom_data[8'h33]= 8'hc3;
    assign rom_data[8'h34]= 8'h18;
    assign rom_data[8'h35]= 8'h96;
    assign rom_data[8'h36]= 8'h05;
    assign rom_data[8'h37]= 8'h9a;
    assign rom_data[8'h38]= 8'h07;
    assign rom_data[8'h39]= 8'h12;
    assign rom_data[8'h3a]= 8'h80;
    assign rom_data[8'h3b]= 8'he2;
    assign rom_data[8'h3c]= 8'heb;
    assign rom_data[8'h3d]= 8'h27;
    assign rom_data[8'h3e]= 8'hb2;
    assign rom_data[8'h3f]= 8'h75;
    assign rom_data[8'h40]= 8'h09;
    assign rom_data[8'h41]= 8'h83;
    assign rom_data[8'h42]= 8'h2c;
    assign rom_data[8'h43]= 8'h1a;
    assign rom_data[8'h44]= 8'h1b;
    assign rom_data[8'h45]= 8'h6e;
    assign rom_data[8'h46]= 8'h5a;
    assign rom_data[8'h47]= 8'ha0;
    assign rom_data[8'h48]= 8'h52;
    assign rom_data[8'h49]= 8'h3b;
    assign rom_data[8'h4a]= 8'hd6;
    assign rom_data[8'h4b]= 8'hb3;
    assign rom_data[8'h4c]= 8'h29;
    assign rom_data[8'h4d]= 8'he3;
    assign rom_data[8'h4e]= 8'h2f;
    assign rom_data[8'h4f]= 8'h84;
    assign rom_data[8'h50]= 8'h53;
    assign rom_data[8'h51]= 8'hd1;
    assign rom_data[8'h52]= 8'h00;
    assign rom_data[8'h53]= 8'hed;
    assign rom_data[8'h54]= 8'h20;
    assign rom_data[8'h55]= 8'hfc;
    assign rom_data[8'h56]= 8'hb1;
    assign rom_data[8'h57]= 8'h5b;
    assign rom_data[8'h58]= 8'h6a;
    assign rom_data[8'h59]= 8'hcb;
    assign rom_data[8'h5a]= 8'hbe;
    assign rom_data[8'h5b]= 8'h39;
    assign rom_data[8'h5c]= 8'h4a;
    assign rom_data[8'h5d]= 8'h4c;
    assign rom_data[8'h5e]= 8'h58;
    assign rom_data[8'h5f]= 8'hcf;
    assign rom_data[8'h60]= 8'hd0;
    assign rom_data[8'h61]= 8'hef;
    assign rom_data[8'h62]= 8'haa;
    assign rom_data[8'h63]= 8'hfb;
    assign rom_data[8'h64]= 8'h43;
    assign rom_data[8'h65]= 8'h4d;
    assign rom_data[8'h66]= 8'h33;
    assign rom_data[8'h67]= 8'h85;
    assign rom_data[8'h68]= 8'h45;
    assign rom_data[8'h69]= 8'hf9;
    assign rom_data[8'h6a]= 8'h02;
    assign rom_data[8'h6b]= 8'h7f;
    assign rom_data[8'h6c]= 8'h50;
    assign rom_data[8'h6d]= 8'h3c;
    assign rom_data[8'h6e]= 8'h9f;
    assign rom_data[8'h6f]= 8'ha8;
    assign rom_data[8'h70]= 8'h51;
    assign rom_data[8'h71]= 8'ha3;
    assign rom_data[8'h72]= 8'h40;
    assign rom_data[8'h73]= 8'h8f;
    assign rom_data[8'h74]= 8'h92;
    assign rom_data[8'h75]= 8'h9d;
    assign rom_data[8'h76]= 8'h38;
    assign rom_data[8'h77]= 8'hf5;
    assign rom_data[8'h78]= 8'hbc;
    assign rom_data[8'h79]= 8'hb6;
    assign rom_data[8'h7a]= 8'hda;
    assign rom_data[8'h7b]= 8'h21;
    assign rom_data[8'h7c]= 8'h10;
    assign rom_data[8'h7d]= 8'hff;
    assign rom_data[8'h7e]= 8'hf3;
    assign rom_data[8'h7f]= 8'hd2;
    assign rom_data[8'h80]= 8'hcd;
    assign rom_data[8'h81]= 8'h0c;
    assign rom_data[8'h82]= 8'h13;
    assign rom_data[8'h83]= 8'hec;
    assign rom_data[8'h84]= 8'h5f;
    assign rom_data[8'h85]= 8'h97;
    assign rom_data[8'h86]= 8'h44;
    assign rom_data[8'h87]= 8'h17;
    assign rom_data[8'h88]= 8'hc4;
    assign rom_data[8'h89]= 8'ha7;
    assign rom_data[8'h8a]= 8'h7e;
    assign rom_data[8'h8b]= 8'h3d;
    assign rom_data[8'h8c]= 8'h64;
    assign rom_data[8'h8d]= 8'h5d;
    assign rom_data[8'h8e]= 8'h19;
    assign rom_data[8'h8f]= 8'h73;
    assign rom_data[8'h90]= 8'h60;
    assign rom_data[8'h91]= 8'h81;
    assign rom_data[8'h92]= 8'h4f;
    assign rom_data[8'h93]= 8'hdc;
    assign rom_data[8'h94]= 8'h22;
    assign rom_data[8'h95]= 8'h2a;
    assign rom_data[8'h96]= 8'h90;
    assign rom_data[8'h97]= 8'h88;
    assign rom_data[8'h98]= 8'h46;
    assign rom_data[8'h99]= 8'hee;
    assign rom_data[8'h9a]= 8'hb8;
    assign rom_data[8'h9b]= 8'h14;
    assign rom_data[8'h9c]= 8'hde;
    assign rom_data[8'h9d]= 8'h5e;
    assign rom_data[8'h9e]= 8'h0b;
    assign rom_data[8'h9f]= 8'hdb;
    assign rom_data[8'ha0]= 8'he0;
    assign rom_data[8'ha1]= 8'h32;
    assign rom_data[8'ha2]= 8'h3a;
    assign rom_data[8'ha3]= 8'h0a;
    assign rom_data[8'ha4]= 8'h49;
    assign rom_data[8'ha5]= 8'h06;
    assign rom_data[8'ha6]= 8'h24;
    assign rom_data[8'ha7]= 8'h5c;
    assign rom_data[8'ha8]= 8'hc2;
    assign rom_data[8'ha9]= 8'hd3;
    assign rom_data[8'haa]= 8'hac;
    assign rom_data[8'hab]= 8'h62;
    assign rom_data[8'hac]= 8'h91;
    assign rom_data[8'had]= 8'h95;
    assign rom_data[8'hae]= 8'he4;
    assign rom_data[8'haf]= 8'h79;
    assign rom_data[8'hb0]= 8'he7;
    assign rom_data[8'hb1]= 8'hc8;
    assign rom_data[8'hb2]= 8'h37;
    assign rom_data[8'hb3]= 8'h6d;
    assign rom_data[8'hb4]= 8'h8d;
    assign rom_data[8'hb5]= 8'hd5;
    assign rom_data[8'hb6]= 8'h4e;
    assign rom_data[8'hb7]= 8'ha9;
    assign rom_data[8'hb8]= 8'h6c;
    assign rom_data[8'hb9]= 8'h56;
    assign rom_data[8'hba]= 8'hf4;
    assign rom_data[8'hbb]= 8'hea;
    assign rom_data[8'hbc]= 8'h65;
    assign rom_data[8'hbd]= 8'h7a;
    assign rom_data[8'hbe]= 8'hae;
    assign rom_data[8'hbf]= 8'h08;
    assign rom_data[8'hc0]= 8'hba;
    assign rom_data[8'hc1]= 8'h78;
    assign rom_data[8'hc2]= 8'h25;
    assign rom_data[8'hc3]= 8'h2e;
    assign rom_data[8'hc4]= 8'h1c;
    assign rom_data[8'hc5]= 8'ha6;
    assign rom_data[8'hc6]= 8'hb4;
    assign rom_data[8'hc7]= 8'hc6;
    assign rom_data[8'hc8]= 8'he8;
    assign rom_data[8'hc9]= 8'hdd;
    assign rom_data[8'hca]= 8'h74;
    assign rom_data[8'hcb]= 8'h1f;
    assign rom_data[8'hcc]= 8'h4b;
    assign rom_data[8'hcd]= 8'hbd;
    assign rom_data[8'hce]= 8'h8b;
    assign rom_data[8'hcf]= 8'h8a;
    assign rom_data[8'hd0]= 8'h70;
    assign rom_data[8'hd1]= 8'h3e;
    assign rom_data[8'hd2]= 8'hb5;
    assign rom_data[8'hd3]= 8'h66;
    assign rom_data[8'hd4]= 8'h48;
    assign rom_data[8'hd5]= 8'h03;
    assign rom_data[8'hd6]= 8'hf6;
    assign rom_data[8'hd7]= 8'h0e;
    assign rom_data[8'hd8]= 8'h61;
    assign rom_data[8'hd9]= 8'h35;
    assign rom_data[8'hda]= 8'h57;
    assign rom_data[8'hdb]= 8'hb9;
    assign rom_data[8'hdc]= 8'h86;
    assign rom_data[8'hdd]= 8'hc1;
    assign rom_data[8'hde]= 8'h1d;
    assign rom_data[8'hdf]= 8'h9e;
    assign rom_data[8'he0]= 8'he1;
    assign rom_data[8'he1]= 8'hf8;
    assign rom_data[8'he2]= 8'h98;
    assign rom_data[8'he3]= 8'h11;
    assign rom_data[8'he4]= 8'h69;
    assign rom_data[8'he5]= 8'hd9;
    assign rom_data[8'he6]= 8'h8e;
    assign rom_data[8'he7]= 8'h94;
    assign rom_data[8'he8]= 8'h9b;
    assign rom_data[8'he9]= 8'h1e;
    assign rom_data[8'hea]= 8'h87;
    assign rom_data[8'heb]= 8'he9;
    assign rom_data[8'hec]= 8'hce;
    assign rom_data[8'hed]= 8'h55;
    assign rom_data[8'hee]= 8'h28;
    assign rom_data[8'hef]= 8'hdf;
    assign rom_data[8'hf0]= 8'h8c;
    assign rom_data[8'hf1]= 8'ha1;
    assign rom_data[8'hf2]= 8'h89;
    assign rom_data[8'hf3]= 8'h0d;
    assign rom_data[8'hf4]= 8'hbf;
    assign rom_data[8'hf5]= 8'he6;
    assign rom_data[8'hf6]= 8'h42;
    assign rom_data[8'hf7]= 8'h68;
    assign rom_data[8'hf8]= 8'h41;
    assign rom_data[8'hf9]= 8'h99;
    assign rom_data[8'hfa]= 8'h2d;
    assign rom_data[8'hfb]= 8'h0f;
    assign rom_data[8'hfc]= 8'hb0;
    assign rom_data[8'hfd]= 8'h54;
    assign rom_data[8'hfe]= 8'hbb;
    assign rom_data[8'hff]= 8'h16;

    assign data_o = rom_data[rom_addr];

endmodule


// `timescale 1ns / 1ps

// module rom_sbox_testbench();

//     initial begin
//         $dumpfile("rom_sbox.vcd");
//         $dumpvars(0, rom_sbox_testbench);
//     end

//     reg  [7:0] rom_addr;
//     wire [7:0] data_o;


//     rom_sbox test_rom_sbox (
//         .rom_addr(rom_addr),
//         .data_o(data_o)
//     );

//     initial begin
//         //initialize inputs
//         rom_addr = 8'h00;
//         // change inputs
//         #10 rom_addr = 8'h01;
//         #10 rom_addr = 8'h02;
//         #10 rom_addr = 8'h03;
//         #10 rom_addr = 8'h04;
//         #10 rom_addr = 8'h05;
//         #10 rom_addr = 8'h06;
//         #10 rom_addr = 8'h07;
//         #10 rom_addr = 8'h08;
//         #10 rom_addr = 8'h09;
//         #10 rom_addr = 8'h0a;
//         #10 rom_addr = 8'h0b;
//         #10 rom_addr = 8'h0c;
//         #10 rom_addr = 8'h0d;
//         #10 rom_addr = 8'h0e;
//         #10 rom_addr = 8'h0f;
//         #10 rom_addr = 8'h10;
//         #10 rom_addr = 8'h11;
//         #10 rom_addr = 8'h12;
//         #10 rom_addr = 8'h13;
//         #10 rom_addr = 8'h14;
//         #10 rom_addr = 8'h15;
//         #10 rom_addr = 8'h16;
//         #10 rom_addr = 8'h17;
//         #10 rom_addr = 8'h18;
//         #10 rom_addr = 8'h19;
//         #10 rom_addr = 8'h1a;
//         #10 rom_addr = 8'h1b;
//         #10 rom_addr = 8'h1c;
//         #10 rom_addr = 8'h1d;
//         #10 rom_addr = 8'h1e;
//         #10 rom_addr = 8'h1f;
//         #10 rom_addr = 8'h20;
//         #10 rom_addr = 8'h21;
//         #10 rom_addr = 8'h22;
//         #10 rom_addr = 8'h23;
//         #10 rom_addr = 8'h24;
//         #10 rom_addr = 8'h25;
//         #10 rom_addr = 8'h26;
//         #10 rom_addr = 8'h27;
//         #10 rom_addr = 8'h28;
//         #10 rom_addr = 8'h29;
//         #10 rom_addr = 8'h2a;
//         #10 rom_addr = 8'h2b;
//         #10 rom_addr = 8'h2c;
//         #10 rom_addr = 8'h2d;
//         #10 rom_addr = 8'h2e;
//         #10 rom_addr = 8'h2f;
//         #10 rom_addr = 8'h30;
//         #10 rom_addr = 8'h31;
//         #10 rom_addr = 8'h32;
//         #10 rom_addr = 8'h33;
//         #10 rom_addr = 8'h34;
//         #10 rom_addr = 8'h35;
//         #10 rom_addr = 8'h36;
//         #10 rom_addr = 8'h37;
//         #10 rom_addr = 8'h38;
//         #10 rom_addr = 8'h39;
//         #10 rom_addr = 8'h3a;
//         #10 rom_addr = 8'h3b;
//         #10 rom_addr = 8'h3c;
//         #10 rom_addr = 8'h3d;
//         #10 rom_addr = 8'h3e;
//         #10 rom_addr = 8'h3f;
//         #10 rom_addr = 8'h40;
//         #10 rom_addr = 8'h41;
//         #10 rom_addr = 8'h42;
//         #10 rom_addr = 8'h43;
//         #10 rom_addr = 8'h44;
//         #10 rom_addr = 8'h45;
//         #10 rom_addr = 8'h46;
//         #10 rom_addr = 8'h47;
//         #10 rom_addr = 8'h48;
//         #10 rom_addr = 8'h49;
//         #10 rom_addr = 8'h4a;
//         #10 rom_addr = 8'h4b;
//         #10 rom_addr = 8'h4c;
//         #10 rom_addr = 8'h4d;
//         #10 rom_addr = 8'h4e;
//         #10 rom_addr = 8'h4f;
//         #10 rom_addr = 8'h50;
//         #10 rom_addr = 8'h51;
//         #10 rom_addr = 8'h52;
//         #10 rom_addr = 8'h53;
//         #10 rom_addr = 8'h54;
//         #10 rom_addr = 8'h55;
//         #10 rom_addr = 8'h56;
//         #10 rom_addr = 8'h57;
//         #10 rom_addr = 8'h58;
//         #10 rom_addr = 8'h59;
//         #10 rom_addr = 8'h5a;
//         #10 rom_addr = 8'h5b;
//         #10 rom_addr = 8'h5c;
//         #10 rom_addr = 8'h5d;
//         #10 rom_addr = 8'h5e;
//         #10 rom_addr = 8'h5f;
//         #10 rom_addr = 8'h60;
//         #10 rom_addr = 8'h61;
//         #10 rom_addr = 8'h62;
//         #10 rom_addr = 8'h63;
//         #10 rom_addr = 8'h64;
//         #10 rom_addr = 8'h65;
//         #10 rom_addr = 8'h66;
//         #10 rom_addr = 8'h67;
//         #10 rom_addr = 8'h68;
//         #10 rom_addr = 8'h69;
//         #10 rom_addr = 8'h6a;
//         #10 rom_addr = 8'h6b;
//         #10 rom_addr = 8'h6c;
//         #10 rom_addr = 8'h6d;
//         #10 rom_addr = 8'h6e;
//         #10 rom_addr = 8'h6f;
//         #10 rom_addr = 8'h70;
//         #10 rom_addr = 8'h71;
//         #10 rom_addr = 8'h72;
//         #10 rom_addr = 8'h73;
//         #10 rom_addr = 8'h74;
//         #10 rom_addr = 8'h75;
//         #10 rom_addr = 8'h76;
//         #10 rom_addr = 8'h77;
//         #10 rom_addr = 8'h78;
//         #10 rom_addr = 8'h79;
//         #10 rom_addr = 8'h7a;
//         #10 rom_addr = 8'h7b;
//         #10 rom_addr = 8'h7c;
//         #10 rom_addr = 8'h7d;
//         #10 rom_addr = 8'h7e;
//         #10 rom_addr = 8'h7f;
//         #10 rom_addr = 8'h80;
//         #10 rom_addr = 8'h81;
//         #10 rom_addr = 8'h82;
//         #10 rom_addr = 8'h83;
//         #10 rom_addr = 8'h84;
//         #10 rom_addr = 8'h85;
//         #10 rom_addr = 8'h86;
//         #10 rom_addr = 8'h87;
//         #10 rom_addr = 8'h88;
//         #10 rom_addr = 8'h89;
//         #10 rom_addr = 8'h8a;
//         #10 rom_addr = 8'h8b;
//         #10 rom_addr = 8'h8c;
//         #10 rom_addr = 8'h8d;
//         #10 rom_addr = 8'h8e;
//         #10 rom_addr = 8'h8f;
//         #10 rom_addr = 8'h90;
//         #10 rom_addr = 8'h91;
//         #10 rom_addr = 8'h92;
//         #10 rom_addr = 8'h93;
//         #10 rom_addr = 8'h94;
//         #10 rom_addr = 8'h95;
//         #10 rom_addr = 8'h96;
//         #10 rom_addr = 8'h97;
//         #10 rom_addr = 8'h98;
//         #10 rom_addr = 8'h99;
//         #10 rom_addr = 8'h9a;
//         #10 rom_addr = 8'h9b;
//         #10 rom_addr = 8'h9c;
//         #10 rom_addr = 8'h9d;
//         #10 rom_addr = 8'h9e;
//         #10 rom_addr = 8'h9f;
//         #10 rom_addr = 8'ha0;
//         #10 rom_addr = 8'ha1;
//         #10 rom_addr = 8'ha2;
//         #10 rom_addr = 8'ha3;
//         #10 rom_addr = 8'ha4;
//         #10 rom_addr = 8'ha5;
//         #10 rom_addr = 8'ha6;
//         #10 rom_addr = 8'ha7;
//         #10 rom_addr = 8'ha8;
//         #10 rom_addr = 8'ha9;
//         #10 rom_addr = 8'haa;
//         #10 rom_addr = 8'hab;
//         #10 rom_addr = 8'hac;
//         #10 rom_addr = 8'had;
//         #10 rom_addr = 8'hae;
//         #10 rom_addr = 8'haf;
//         #10 rom_addr = 8'hb0;
//         #10 rom_addr = 8'hb1;
//         #10 rom_addr = 8'hb2;
//         #10 rom_addr = 8'hb3;
//         #10 rom_addr = 8'hb4;
//         #10 rom_addr = 8'hb5;
//         #10 rom_addr = 8'hb6;
//         #10 rom_addr = 8'hb7;
//         #10 rom_addr = 8'hb8;
//         #10 rom_addr = 8'hb9;
//         #10 rom_addr = 8'hba;
//         #10 rom_addr = 8'hbb;
//         #10 rom_addr = 8'hbc;
//         #10 rom_addr = 8'hbd;
//         #10 rom_addr = 8'hbe;
//         #10 rom_addr = 8'hbf;
//         #10 rom_addr = 8'hc0;
//         #10 rom_addr = 8'hc1;
//         #10 rom_addr = 8'hc2;
//         #10 rom_addr = 8'hc3;
//         #10 rom_addr = 8'hc4;
//         #10 rom_addr = 8'hc5;
//         #10 rom_addr = 8'hc6;
//         #10 rom_addr = 8'hc7;
//         #10 rom_addr = 8'hc8;
//         #10 rom_addr = 8'hc9;
//         #10 rom_addr = 8'hca;
//         #10 rom_addr = 8'hcb;
//         #10 rom_addr = 8'hcc;
//         #10 rom_addr = 8'hcd;
//         #10 rom_addr = 8'hce;
//         #10 rom_addr = 8'hcf;
//         #10 rom_addr = 8'hd0;
//         #10 rom_addr = 8'hd1;
//         #10 rom_addr = 8'hd2;
//         #10 rom_addr = 8'hd3;
//         #10 rom_addr = 8'hd4;
//         #10 rom_addr = 8'hd5;
//         #10 rom_addr = 8'hd6;
//         #10 rom_addr = 8'hd7;
//         #10 rom_addr = 8'hd8;
//         #10 rom_addr = 8'hd9;
//         #10 rom_addr = 8'hda;
//         #10 rom_addr = 8'hdb;
//         #10 rom_addr = 8'hdc;
//         #10 rom_addr = 8'hdd;
//         #10 rom_addr = 8'hde;
//         #10 rom_addr = 8'hdf;
//         #10 rom_addr = 8'he0;
//         #10 rom_addr = 8'he1;
//         #10 rom_addr = 8'he2;
//         #10 rom_addr = 8'he3;
//         #10 rom_addr = 8'he4;
//         #10 rom_addr = 8'he5;
//         #10 rom_addr = 8'he6;
//         #10 rom_addr = 8'he7;
//         #10 rom_addr = 8'he8;
//         #10 rom_addr = 8'he9;
//         #10 rom_addr = 8'hea;
//         #10 rom_addr = 8'heb;
//         #10 rom_addr = 8'hec;
//         #10 rom_addr = 8'hed;
//         #10 rom_addr = 8'hee;
//         #10 rom_addr = 8'hef;
//         #10 rom_addr = 8'hf0;
//         #10 rom_addr = 8'hf1;
//         #10 rom_addr = 8'hf2;
//         #10 rom_addr = 8'hf3;
//         #10 rom_addr = 8'hf4;
//         #10 rom_addr = 8'hf5;
//         #10 rom_addr = 8'hf6;
//         #10 rom_addr = 8'hf7;
//         #10 rom_addr = 8'hf8;
//         #10 rom_addr = 8'hf9;
//         #10 rom_addr = 8'hfa;
//         #10 rom_addr = 8'hfb;
//         #10 rom_addr = 8'hfc;
//         #10 rom_addr = 8'hfd;
//         #10 rom_addr = 8'hfe;
//         #10 rom_addr = 8'hff;

//         #10 $finish;
//     end

//     // print out the time and the corresponding input and output
//     initial begin
//         $monitor("At time %t, rom_addr = %h, data_o = %h", $time, rom_addr, data_o);
//     end

// endmodule
