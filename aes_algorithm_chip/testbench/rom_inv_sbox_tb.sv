module rom_inv_sbox_tb();

    initial begin
        $dumpfile("rom_inv_sbox.vcd");
        $dumpvars(0, rom_inv_sbox_tb);
    end

    reg  [7:0] rom_addr;
    wire [7:0] data_o;


    rom_inv_sbox DUT (
        .rom_addr(rom_addr),
        .data_o(data_o)
    );

    initial begin
        //initialize inputs
        rom_addr = 8'h00;
        // change inputs
        #10 rom_addr = 8'h01;
        #10 rom_addr = 8'h02;
        #10 rom_addr = 8'h03;
        #10 rom_addr = 8'h04;
        #10 rom_addr = 8'h05;
        #10 rom_addr = 8'h06;
        #10 rom_addr = 8'h07;
        #10 rom_addr = 8'h08;
        #10 rom_addr = 8'h09;
        #10 rom_addr = 8'h0a;
        #10 rom_addr = 8'h0b;
        #10 rom_addr = 8'h0c;
        #10 rom_addr = 8'h0d;
        #10 rom_addr = 8'h0e;
        #10 rom_addr = 8'h0f;
        #10 rom_addr = 8'h10;
        #10 rom_addr = 8'h11;
        #10 rom_addr = 8'h12;
        #10 rom_addr = 8'h13;
        #10 rom_addr = 8'h14;
        #10 rom_addr = 8'h15;
        #10 rom_addr = 8'h16;
        #10 rom_addr = 8'h17;
        #10 rom_addr = 8'h18;
        #10 rom_addr = 8'h19;
        #10 rom_addr = 8'h1a;
        #10 rom_addr = 8'h1b;
        #10 rom_addr = 8'h1c;
        #10 rom_addr = 8'h1d;
        #10 rom_addr = 8'h1e;
        #10 rom_addr = 8'h1f;
        #10 rom_addr = 8'h20;
        #10 rom_addr = 8'h21;
        #10 rom_addr = 8'h22;
        #10 rom_addr = 8'h23;
        #10 rom_addr = 8'h24;
        #10 rom_addr = 8'h25;
        #10 rom_addr = 8'h26;
        #10 rom_addr = 8'h27;
        #10 rom_addr = 8'h28;
        #10 rom_addr = 8'h29;
        #10 rom_addr = 8'h2a;
        #10 rom_addr = 8'h2b;
        #10 rom_addr = 8'h2c;
        #10 rom_addr = 8'h2d;
        #10 rom_addr = 8'h2e;
        #10 rom_addr = 8'h2f;
        #10 rom_addr = 8'h30;
        #10 rom_addr = 8'h31;
        #10 rom_addr = 8'h32;
        #10 rom_addr = 8'h33;
        #10 rom_addr = 8'h34;
        #10 rom_addr = 8'h35;
        #10 rom_addr = 8'h36;
        #10 rom_addr = 8'h37;
        #10 rom_addr = 8'h38;
        #10 rom_addr = 8'h39;
        #10 rom_addr = 8'h3a;
        #10 rom_addr = 8'h3b;
        #10 rom_addr = 8'h3c;
        #10 rom_addr = 8'h3d;
        #10 rom_addr = 8'h3e;
        #10 rom_addr = 8'h3f;
        #10 rom_addr = 8'h40;
        #10 rom_addr = 8'h41;
        #10 rom_addr = 8'h42;
        #10 rom_addr = 8'h43;
        #10 rom_addr = 8'h44;
        #10 rom_addr = 8'h45;
        #10 rom_addr = 8'h46;
        #10 rom_addr = 8'h47;
        #10 rom_addr = 8'h48;
        #10 rom_addr = 8'h49;
        #10 rom_addr = 8'h4a;
        #10 rom_addr = 8'h4b;
        #10 rom_addr = 8'h4c;
        #10 rom_addr = 8'h4d;
        #10 rom_addr = 8'h4e;
        #10 rom_addr = 8'h4f;
        #10 rom_addr = 8'h50;
        #10 rom_addr = 8'h51;
        #10 rom_addr = 8'h52;
        #10 rom_addr = 8'h53;
        #10 rom_addr = 8'h54;
        #10 rom_addr = 8'h55;
        #10 rom_addr = 8'h56;
        #10 rom_addr = 8'h57;
        #10 rom_addr = 8'h58;
        #10 rom_addr = 8'h59;
        #10 rom_addr = 8'h5a;
        #10 rom_addr = 8'h5b;
        #10 rom_addr = 8'h5c;
        #10 rom_addr = 8'h5d;
        #10 rom_addr = 8'h5e;
        #10 rom_addr = 8'h5f;
        #10 rom_addr = 8'h60;
        #10 rom_addr = 8'h61;
        #10 rom_addr = 8'h62;
        #10 rom_addr = 8'h63;
        #10 rom_addr = 8'h64;
        #10 rom_addr = 8'h65;
        #10 rom_addr = 8'h66;
        #10 rom_addr = 8'h67;
        #10 rom_addr = 8'h68;
        #10 rom_addr = 8'h69;
        #10 rom_addr = 8'h6a;
        #10 rom_addr = 8'h6b;
        #10 rom_addr = 8'h6c;
        #10 rom_addr = 8'h6d;
        #10 rom_addr = 8'h6e;
        #10 rom_addr = 8'h6f;
        #10 rom_addr = 8'h70;
        #10 rom_addr = 8'h71;
        #10 rom_addr = 8'h72;
        #10 rom_addr = 8'h73;
        #10 rom_addr = 8'h74;
        #10 rom_addr = 8'h75;
        #10 rom_addr = 8'h76;
        #10 rom_addr = 8'h77;
        #10 rom_addr = 8'h78;
        #10 rom_addr = 8'h79;
        #10 rom_addr = 8'h7a;
        #10 rom_addr = 8'h7b;
        #10 rom_addr = 8'h7c;
        #10 rom_addr = 8'h7d;
        #10 rom_addr = 8'h7e;
        #10 rom_addr = 8'h7f;
        #10 rom_addr = 8'h80;
        #10 rom_addr = 8'h81;
        #10 rom_addr = 8'h82;
        #10 rom_addr = 8'h83;
        #10 rom_addr = 8'h84;
        #10 rom_addr = 8'h85;
        #10 rom_addr = 8'h86;
        #10 rom_addr = 8'h87;
        #10 rom_addr = 8'h88;
        #10 rom_addr = 8'h89;
        #10 rom_addr = 8'h8a;
        #10 rom_addr = 8'h8b;
        #10 rom_addr = 8'h8c;
        #10 rom_addr = 8'h8d;
        #10 rom_addr = 8'h8e;
        #10 rom_addr = 8'h8f;
        #10 rom_addr = 8'h90;
        #10 rom_addr = 8'h91;
        #10 rom_addr = 8'h92;
        #10 rom_addr = 8'h93;
        #10 rom_addr = 8'h94;
        #10 rom_addr = 8'h95;
        #10 rom_addr = 8'h96;
        #10 rom_addr = 8'h97;
        #10 rom_addr = 8'h98;
        #10 rom_addr = 8'h99;
        #10 rom_addr = 8'h9a;
        #10 rom_addr = 8'h9b;
        #10 rom_addr = 8'h9c;
        #10 rom_addr = 8'h9d;
        #10 rom_addr = 8'h9e;
        #10 rom_addr = 8'h9f;
        #10 rom_addr = 8'ha0;
        #10 rom_addr = 8'ha1;
        #10 rom_addr = 8'ha2;
        #10 rom_addr = 8'ha3;
        #10 rom_addr = 8'ha4;
        #10 rom_addr = 8'ha5;
        #10 rom_addr = 8'ha6;
        #10 rom_addr = 8'ha7;
        #10 rom_addr = 8'ha8;
        #10 rom_addr = 8'ha9;
        #10 rom_addr = 8'haa;
        #10 rom_addr = 8'hab;
        #10 rom_addr = 8'hac;
        #10 rom_addr = 8'had;
        #10 rom_addr = 8'hae;
        #10 rom_addr = 8'haf;
        #10 rom_addr = 8'hb0;
        #10 rom_addr = 8'hb1;
        #10 rom_addr = 8'hb2;
        #10 rom_addr = 8'hb3;
        #10 rom_addr = 8'hb4;
        #10 rom_addr = 8'hb5;
        #10 rom_addr = 8'hb6;
        #10 rom_addr = 8'hb7;
        #10 rom_addr = 8'hb8;
        #10 rom_addr = 8'hb9;
        #10 rom_addr = 8'hba;
        #10 rom_addr = 8'hbb;
        #10 rom_addr = 8'hbc;
        #10 rom_addr = 8'hbd;
        #10 rom_addr = 8'hbe;
        #10 rom_addr = 8'hbf;
        #10 rom_addr = 8'hc0;
        #10 rom_addr = 8'hc1;
        #10 rom_addr = 8'hc2;
        #10 rom_addr = 8'hc3;
        #10 rom_addr = 8'hc4;
        #10 rom_addr = 8'hc5;
        #10 rom_addr = 8'hc6;
        #10 rom_addr = 8'hc7;
        #10 rom_addr = 8'hc8;
        #10 rom_addr = 8'hc9;
        #10 rom_addr = 8'hca;
        #10 rom_addr = 8'hcb;
        #10 rom_addr = 8'hcc;
        #10 rom_addr = 8'hcd;
        #10 rom_addr = 8'hce;
        #10 rom_addr = 8'hcf;
        #10 rom_addr = 8'hd0;
        #10 rom_addr = 8'hd1;
        #10 rom_addr = 8'hd2;
        #10 rom_addr = 8'hd3;
        #10 rom_addr = 8'hd4;
        #10 rom_addr = 8'hd5;
        #10 rom_addr = 8'hd6;
        #10 rom_addr = 8'hd7;
        #10 rom_addr = 8'hd8;
        #10 rom_addr = 8'hd9;
        #10 rom_addr = 8'hda;
        #10 rom_addr = 8'hdb;
        #10 rom_addr = 8'hdc;
        #10 rom_addr = 8'hdd;
        #10 rom_addr = 8'hde;
        #10 rom_addr = 8'hdf;
        #10 rom_addr = 8'he0;
        #10 rom_addr = 8'he1;
        #10 rom_addr = 8'he2;
        #10 rom_addr = 8'he3;
        #10 rom_addr = 8'he4;
        #10 rom_addr = 8'he5;
        #10 rom_addr = 8'he6;
        #10 rom_addr = 8'he7;
        #10 rom_addr = 8'he8;
        #10 rom_addr = 8'he9;
        #10 rom_addr = 8'hea;
        #10 rom_addr = 8'heb;
        #10 rom_addr = 8'hec;
        #10 rom_addr = 8'hed;
        #10 rom_addr = 8'hee;
        #10 rom_addr = 8'hef;
        #10 rom_addr = 8'hf0;
        #10 rom_addr = 8'hf1;
        #10 rom_addr = 8'hf2;
        #10 rom_addr = 8'hf3;
        #10 rom_addr = 8'hf4;
        #10 rom_addr = 8'hf5;
        #10 rom_addr = 8'hf6;
        #10 rom_addr = 8'hf7;
        #10 rom_addr = 8'hf8;
        #10 rom_addr = 8'hf9;
        #10 rom_addr = 8'hfa;
        #10 rom_addr = 8'hfb;
        #10 rom_addr = 8'hfc;
        #10 rom_addr = 8'hfd;
        #10 rom_addr = 8'hfe;
        #10 rom_addr = 8'hff;

        #10 $finish;
    end

    // print out the time and the corresponding input and output
    initial begin
        $monitor("At time %t, rom_addr = %h, data_o = %h", $time, rom_addr, data_o);
    end

endmodule
