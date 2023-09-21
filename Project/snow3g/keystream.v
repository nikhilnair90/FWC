
//Generation of Keystream.



module Keystream (
    input [127:0] k,
    input [127:0] IV,
    input clk,
    input reset,
    output reg [511:0] LFSR_out,
    output reg [95:0]FSM_out,
    output reg [95:0] z       
);
   
  reg [31:0] MULalpha [0:255];
  reg [31:0] DIValpha [0:255];
  reg [31:0] LFSR_S [0:15];
  reg [31:0] FSM_R [0:2];
  reg [31:0] counter, genkey;
  
  
  
  reg [31:0] F, temp;
  reg [31:0] v_1, v_2, r;
  wire [31:0] f_out,  s_1_out, s_2_out;
  


  S1 S_1(.w(FSM_R[0]),.clk(clk),.s1_out(s_1_out));
  S2 S_2(.w(FSM_R[1]),.clk(clk),.s2_out(s_2_out));
  


  always @(posedge clk or posedge reset) begin

    //Initializing constants    

    //Initializing MULalpha
    MULalpha[0] = 32'h00000000;
    MULalpha[1] = 32'hE19FCF13;
    MULalpha[2] = 32'h6B973726;
    MULalpha[3] = 32'h8A08F835;
    MULalpha[4] = 32'hD6876E4C;
    MULalpha[5] = 32'h3718A15F;
    MULalpha[6] = 32'hBD10596A;
    MULalpha[7] = 32'h5C8F9679;
    MULalpha[8] = 32'h05A7DC98;
    MULalpha[9] = 32'hE438138B;
    MULalpha[10] = 32'h6E30EBBE;
    MULalpha[11] = 32'h8FAF24AD;
    MULalpha[12] = 32'hD320B2D4;
    MULalpha[13] = 32'h32BF7DC7;
    MULalpha[14] = 32'hB8B785F2;
    MULalpha[15] = 32'h59284AE1;
    MULalpha[16] = 32'h0AE71199;
    MULalpha[17] = 32'hEB78DE8A;
    MULalpha[18] = 32'h617026BF;
    MULalpha[19] = 32'h80EFE9AC;
    MULalpha[20] = 32'hDC607FD5;
    MULalpha[21] = 32'h3DFFB0C6;
    MULalpha[22] = 32'hB7F748F3;
    MULalpha[23] = 32'h566887E0;
    MULalpha[24] = 32'h0F40CD01;
    MULalpha[25] = 32'hEEDF0212;
    MULalpha[26] = 32'h64D7FA27;
    MULalpha[27] = 32'h85483534;
    MULalpha[28] = 32'hD9C7A34D;
    MULalpha[29] = 32'h38586C5E;
    MULalpha[30] = 32'hB250946B;
    MULalpha[31] = 32'h53CF5B78;
    MULalpha[32] = 32'h1467229B;
    MULalpha[33] = 32'hF5F8ED88;
    MULalpha[34] = 32'h7FF015BD;
    MULalpha[35] = 32'h9E6FDAAE;
    MULalpha[36] = 32'hC2E04CD7;
    MULalpha[37] = 32'h237F83C4;
    MULalpha[38] = 32'hA9777BF1;
    MULalpha[39] = 32'h48E8B4E2;
    MULalpha[40] = 32'h11C0FE03;
    MULalpha[41] = 32'hF05F3110;
    MULalpha[42] = 32'h7A57C925;
    MULalpha[43] = 32'h9BC80636;
    MULalpha[44] = 32'hC747904F;
    MULalpha[45] = 32'h26D85F5C;
    MULalpha[46] = 32'hACD0A769;
    MULalpha[47] = 32'h4D4F687A;
    MULalpha[48] = 32'h1E803302;
    MULalpha[49] = 32'hFF1FFC11;
    MULalpha[50] = 32'h75170424;
    MULalpha[51] = 32'h9488CB37;
    MULalpha[52] = 32'hC8075D4E;
    MULalpha[53] = 32'h2998925D;
    MULalpha[54] = 32'hA3906A68;
    MULalpha[55] = 32'h420FA57B;
    MULalpha[56] = 32'h1B27EF9A;
    MULalpha[57] = 32'hFAB82089;
    MULalpha[58] = 32'h70B0D8BC;
    MULalpha[59] = 32'h912F17AF;
    MULalpha[60] = 32'hCDA081D6;
    MULalpha[61] = 32'h2C3F4EC5;
    MULalpha[62] = 32'hA637B6F0;
    MULalpha[63] = 32'h47A879E3;
    MULalpha[64] = 32'h28CE449F;
    MULalpha[65] = 32'hC9518B8C;
    MULalpha[66] = 32'h435973B9;
    MULalpha[67] = 32'hA2C6BCAA;
    MULalpha[68] = 32'hFE492AD3;
    MULalpha[69] = 32'h1FD6E5C0;
    MULalpha[70] = 32'h95DE1DF5;
    MULalpha[71] = 32'h7441D2E6;
    MULalpha[72] = 32'h2D699807;
    MULalpha[73] = 32'hCCF65714;
    MULalpha[74] = 32'h46FEAF21;
    MULalpha[75] = 32'hA7616032;
    MULalpha[76] = 32'hFBEEF64B;
    MULalpha[77] = 32'h1A713958;
    MULalpha[78] = 32'h9079C16D;
    MULalpha[79] = 32'h71E60E7E;
    MULalpha[80] = 32'h22295506;
    MULalpha[81] = 32'hC3B69A15;
    MULalpha[82] = 32'h49BE6220;
    MULalpha[83] = 32'hA821AD33;
    MULalpha[84] = 32'hF4AE3B4A;
    MULalpha[85] = 32'h1531F459;
    MULalpha[86] = 32'h9F390C6C;
    MULalpha[87] = 32'h7EA6C37F;
    MULalpha[88] = 32'h278E899E;
    MULalpha[89] = 32'hC611468D;
    MULalpha[90] = 32'h4C19BEB8;
    MULalpha[91] = 32'hAD8671AB;
    MULalpha[92] = 32'hF109E7D2;
    MULalpha[93] = 32'h109628C1;
    MULalpha[94] = 32'h9A9ED0F4;
    MULalpha[95] = 32'h7B011FE7;
    MULalpha[96] = 32'h3CA96604;
    MULalpha[97] = 32'hDD36A917;
    MULalpha[98] = 32'h573E5122;
    MULalpha[99] = 32'hB6A19E31;
    MULalpha[100] = 32'hEA2E0848;
    MULalpha[101] = 32'h0BB1C75B;
    MULalpha[102] = 32'h81B93F6E;
    MULalpha[103] = 32'h6026F07D;
    MULalpha[104] = 32'h390EBA9C;
    MULalpha[105] = 32'hD891758F;
    MULalpha[106] = 32'h52998DBA;
    MULalpha[107] = 32'hB30642A9;
    MULalpha[108] = 32'hEF89D4D0;
    MULalpha[109] = 32'h0E161BC3;
    MULalpha[110] = 32'h841EE3F6;
    MULalpha[111] = 32'h65812CE5;
    MULalpha[112] = 32'h364E779D;
    MULalpha[113] = 32'hD7D1B88E;
    MULalpha[114] = 32'h5DD940BB;
    MULalpha[115] = 32'hBC468FA8;
    MULalpha[116] = 32'hE0C919D1;
    MULalpha[117] = 32'h0156D6C2;
    MULalpha[118] = 32'h8B5E2EF7;
    MULalpha[119] = 32'h6AC1E1E4;
    MULalpha[120] = 32'h33E9AB05;
    MULalpha[121] = 32'hD2766416;
    MULalpha[122] = 32'h587E9C23;
    MULalpha[123] = 32'hB9E15330;
    MULalpha[124] = 32'hE56EC549;
    MULalpha[125] = 32'h04F10A5A;
    MULalpha[126] = 32'h8EF9F26F;
    MULalpha[127] = 32'h6F663D7C;
    MULalpha[128] = 32'h50358897;
    MULalpha[129] = 32'hB1AA4784;
    MULalpha[130] = 32'h3BA2BFB1;
    MULalpha[131] = 32'hDA3D70A2;
    MULalpha[132] = 32'h86B2E6DB;
    MULalpha[133] = 32'h672D29C8;
    MULalpha[134] = 32'hED25D1FD;
    MULalpha[135] = 32'h0CBA1EEE;
    MULalpha[136] = 32'h5592540F;
    MULalpha[137] = 32'hB40D9B1C;
    MULalpha[138] = 32'h3E056329;
    MULalpha[139] = 32'hDF9AAC3A;
    MULalpha[140] = 32'h83153A43;
    MULalpha[141] = 32'h628AF550;
    MULalpha[142] = 32'hE8820D65;
    MULalpha[143] = 32'h091DC276;
    MULalpha[144] = 32'h5AD2990E;
    MULalpha[145] = 32'hBB4D561D;
    MULalpha[146] = 32'h3145AE28;
    MULalpha[147] = 32'hD0DA613B;
    MULalpha[148] = 32'h8C55F742;
    MULalpha[149] = 32'h6DCA3851;
    MULalpha[150] = 32'hE7C2C064;
    MULalpha[151] = 32'h065D0F77;
    MULalpha[152] = 32'h5F754596;
    MULalpha[153] = 32'hBEEA8A85;
    MULalpha[154] = 32'h34E272B0;
    MULalpha[155] = 32'hD57DBDA3;
    MULalpha[156] = 32'h89F22BDA;
    MULalpha[157] = 32'h686DE4C9;
    MULalpha[158] = 32'hE2651CFC;
    MULalpha[159] = 32'h03FAD3EF;
    MULalpha[160] = 32'h4452AA0C;
    MULalpha[161] = 32'hA5CD651F;
    MULalpha[162] = 32'h2FC59D2A;
    MULalpha[163] = 32'hCE5A5239;
    MULalpha[164] = 32'h92D5C440;
    MULalpha[165] = 32'h734A0B53;
    MULalpha[166] = 32'hF942F366;
    MULalpha[167] = 32'h18DD3C75;
    MULalpha[168] = 32'h41F57694;
    MULalpha[169] = 32'hA06AB987;
    MULalpha[170] = 32'h2A6241B2;
    MULalpha[171] = 32'hCBFD8EA1;
    MULalpha[172] = 32'h977218D8;
    MULalpha[173] = 32'h76EDD7CB;
    MULalpha[174] = 32'hFCE52FFE;
    MULalpha[175] = 32'h1D7AE0ED;
    MULalpha[176] = 32'h4EB5BB95;
    MULalpha[177] = 32'hAF2A7486;
    MULalpha[178] = 32'h25228CB3;
    MULalpha[179] = 32'hC4BD43A0;
    MULalpha[180] = 32'h9832D5D9;
    MULalpha[181] = 32'h79AD1ACA;
    MULalpha[182] = 32'hF3A5E2FF;
    MULalpha[183] = 32'h123A2DEC;
    MULalpha[184] = 32'h4B12670D;
    MULalpha[185] = 32'hAA8DA81E;
    MULalpha[186] = 32'h2085502B;
    MULalpha[187] = 32'hC11A9F38;
    MULalpha[188] = 32'h9D950941;
    MULalpha[189] = 32'h7C0AC652;
    MULalpha[190] = 32'hF6023E67;
    MULalpha[191] = 32'h179DF174;
    MULalpha[192] = 32'h78FBCC08;
    MULalpha[193] = 32'h9964031B;
    MULalpha[194] = 32'h136CFB2E;
    MULalpha[195] = 32'hF2F3343D;
    MULalpha[196] = 32'hAE7CA244;
    MULalpha[197] = 32'h4FE36D57;
    MULalpha[198] = 32'hC5EB9562;
    MULalpha[199] = 32'h24745A71;
    MULalpha[200] = 32'h7D5C1090;
    MULalpha[201] = 32'h9CC3DF83;
    MULalpha[202] = 32'h16CB27B6;
    MULalpha[203] = 32'hF754E8A5;
    MULalpha[204] = 32'hABDB7EDC;
    MULalpha[205] = 32'h4A44B1CF;
    MULalpha[206] = 32'hC04C49FA;
    MULalpha[207] = 32'h21D386E9;
    MULalpha[208] = 32'h721CDD91;
    MULalpha[209] = 32'h93831282;
    MULalpha[210] = 32'h198BEAB7;
    MULalpha[211] = 32'hF81425A4;
    MULalpha[212] = 32'hA49BB3DD;
    MULalpha[213] = 32'h45047CCE;
    MULalpha[214] = 32'hCF0C84FB;
    MULalpha[215] = 32'h2E934BE8;
    MULalpha[216] = 32'h77BB0109;
    MULalpha[217] = 32'h9624CE1A;
    MULalpha[218] = 32'h1C2C362F;
    MULalpha[219] = 32'hFDB3F93C;
    MULalpha[220] = 32'hA13C6F45;
    MULalpha[221] = 32'h40A3A056;
    MULalpha[222] = 32'hCAAB5863;
    MULalpha[223] = 32'h2B349770;
    MULalpha[224] = 32'h6C9CEE93;
    MULalpha[225] = 32'h8D032180;
    MULalpha[226] = 32'h070BD9B5;
    MULalpha[227] = 32'hE69416A6;
    MULalpha[228] = 32'hBA1B80DF;
    MULalpha[229] = 32'h5B844FCC;
    MULalpha[230] = 32'hD18CB7F9;
    MULalpha[231] = 32'h301378EA;
    MULalpha[232] = 32'h693B320B;
    MULalpha[233] = 32'h88A4FD18;
    MULalpha[234] = 32'h02AC052D;
    MULalpha[235] = 32'hE333CA3E;
    MULalpha[236] = 32'hBFBC5C47;
    MULalpha[237] = 32'h5E239354;
    MULalpha[238] = 32'hD42B6B61;
    MULalpha[239] = 32'h35B4A472;
    MULalpha[240] = 32'h667BFF0A;
    MULalpha[241] = 32'h87E43019;
    MULalpha[242] = 32'h0DECC82C;
    MULalpha[243] = 32'hEC73073F;
    MULalpha[244] = 32'hB0FC9146;
    MULalpha[245] = 32'h51635E55;
    MULalpha[246] = 32'hDB6BA660;
    MULalpha[247] = 32'h3AF46973;
    MULalpha[248] = 32'h63DC2392;
    MULalpha[249] = 32'h8243EC81;
    MULalpha[250] = 32'h084B14B4;
    MULalpha[251] = 32'hE9D4DBA7;
    MULalpha[252] = 32'hB55B4DDE;
    MULalpha[253] = 32'h54C482CD;
    MULalpha[254] = 32'hDECC7AF8;
    MULalpha[255] = 32'h3F53B5EB;

    //Initializing DIValpha
    DIValpha[0] = 32'h00000000;
    DIValpha[1] = 32'h180F40CD;
    DIValpha[2] = 32'h301E8033;
    DIValpha[3] = 32'h2811C0FE;
    DIValpha[4] = 32'h603CA966;
    DIValpha[5] = 32'h7833E9AB;
    DIValpha[6] = 32'h50222955;
    DIValpha[7] = 32'h482D6998;
    DIValpha[8] = 32'hC078FBCC;
    DIValpha[9] = 32'hD877BB01;
    DIValpha[10] = 32'hF0667BFF;
    DIValpha[11] = 32'hE8693B32;
    DIValpha[12] = 32'hA04452AA;
    DIValpha[13] = 32'hB84B1267;
    DIValpha[14] = 32'h905AD299;
    DIValpha[15] = 32'h88559254;
    DIValpha[16] = 32'h29F05F31;
    DIValpha[17] = 32'h31FF1FFC;
    DIValpha[18] = 32'h19EEDF02;
    DIValpha[19] = 32'h01E19FCF;
    DIValpha[20] = 32'h49CCF657;
    DIValpha[21] = 32'h51C3B69A;
    DIValpha[22] = 32'h79D27664;
    DIValpha[23] = 32'h61DD36A9;
    DIValpha[24] = 32'hE988A4FD;
    DIValpha[25] = 32'hF187E430;
    DIValpha[26] = 32'hD99624CE;
    DIValpha[27] = 32'hC1996403;
    DIValpha[28] = 32'h89B40D9B;
    DIValpha[29] = 32'h91BB4D56;
    DIValpha[30] = 32'hB9AA8DA8;
    DIValpha[31] = 32'hA1A5CD65;
    DIValpha[32] = 32'h5249BE62;
    DIValpha[33] = 32'h4A46FEAF;
    DIValpha[34] = 32'h62573E51;
    DIValpha[35] = 32'h7A587E9C;
    DIValpha[36] = 32'h32751704;
    DIValpha[37] = 32'h2A7A57C9;
    DIValpha[38] = 32'h026B9737;
    DIValpha[39] = 32'h1A64D7FA;
    DIValpha[40] = 32'h923145AE;
    DIValpha[41] = 32'h8A3E0563;
    DIValpha[42] = 32'hA22FC59D;
    DIValpha[43] = 32'hBA208550;
    DIValpha[44] = 32'hF20DECC8;
    DIValpha[45] = 32'hEA02AC05;
    DIValpha[46] = 32'hC2136CFB;
    DIValpha[47] = 32'hDA1C2C36;
    DIValpha[48] = 32'h7BB9E153;
    DIValpha[49] = 32'h63B6A19E;
    DIValpha[50] = 32'h4BA76160;
    DIValpha[51] = 32'h53A821AD;
    DIValpha[52] = 32'h1B854835;
    DIValpha[53] = 32'h038A08F8;
    DIValpha[54] = 32'h2B9BC806;
    DIValpha[55] = 32'h339488CB;
    DIValpha[56] = 32'hBBC11A9F;
    DIValpha[57] = 32'hA3CE5A52;
    DIValpha[58] = 32'h8BDF9AAC;
    DIValpha[59] = 32'h93D0DA61;
    DIValpha[60] = 32'hDBFDB3F9;
    DIValpha[61] = 32'hC3F2F334;
    DIValpha[62] = 32'hEBE333CA;
    DIValpha[63] = 32'hF3EC7307;
    DIValpha[64] = 32'hA492D5C4;
    DIValpha[65] = 32'hBC9D9509;
    DIValpha[66] = 32'h948C55F7;
    DIValpha[67] = 32'h8C83153A;
    DIValpha[68] = 32'hC4AE7CA2;
    DIValpha[69] = 32'hDCA13C6F;
    DIValpha[70] = 32'hF4B0FC91;
    DIValpha[71] = 32'hECBFBC5C;
    DIValpha[72] = 32'h64EA2E08;
    DIValpha[73] = 32'h7CE56EC5;
    DIValpha[74] = 32'h54F4AE3B;
    DIValpha[75] = 32'h4CFBEEF6;
    DIValpha[76] = 32'h04D6876E;
    DIValpha[77] = 32'h1CD9C7A3;
    DIValpha[78] = 32'h34C8075D;
    DIValpha[79] = 32'h2CC74790;
    DIValpha[80] = 32'h8D628AF5;
    DIValpha[81] = 32'h956DCA38;
    DIValpha[82] = 32'hBD7C0AC6;
    DIValpha[83] = 32'hA5734A0B;
    DIValpha[84] = 32'hED5E2393;
    DIValpha[85] = 32'hF551635E;
    DIValpha[86] = 32'hDD40A3A0;
    DIValpha[87] = 32'hC54FE36D;
    DIValpha[88] = 32'h4D1A7139;
    DIValpha[89] = 32'h551531F4;
    DIValpha[90] = 32'h7D04F10A;
    DIValpha[91] = 32'h650BB1C7;
    DIValpha[92] = 32'h2D26D85F;
    DIValpha[93] = 32'h35299892;
    DIValpha[94] = 32'h1D38586C;
    DIValpha[95] = 32'h053718A1;
    DIValpha[96] = 32'hF6DB6BA6;
    DIValpha[97] = 32'hEED42B6B;
    DIValpha[98] = 32'hC6C5EB95;
    DIValpha[99] = 32'hDECAAB58;
    DIValpha[100] = 32'h96E7C2C0;
    DIValpha[101] = 32'h8EE8820D;
    DIValpha[102] = 32'hA6F942F3;
    DIValpha[103] = 32'hBEF6023E;
    DIValpha[104] = 32'h36A3906A;
    DIValpha[105] = 32'h2EACD0A7;
    DIValpha[106] = 32'h06BD1059;
    DIValpha[107] = 32'h1EB25094;
    DIValpha[108] = 32'h569F390C;
    DIValpha[109] = 32'h4E9079C1;
    DIValpha[110] = 32'h6681B93F;
    DIValpha[111] = 32'h7E8EF9F2;
    DIValpha[112] = 32'hDF2B3497;
    DIValpha[113] = 32'hC724745A;
    DIValpha[114] = 32'hEF35B4A4;
    DIValpha[115] = 32'hF73AF469;
    DIValpha[116] = 32'hBF179DF1;
    DIValpha[117] = 32'hA718DD3C;
    DIValpha[118] = 32'h8F091DC2;
    DIValpha[119] = 32'h97065D0F;
    DIValpha[120] = 32'h1F53CF5B;
    DIValpha[121] = 32'h075C8F96;
    DIValpha[122] = 32'h2F4D4F68;
    DIValpha[123] = 32'h37420FA5;
    DIValpha[124] = 32'h7F6F663D;
    DIValpha[125] = 32'h676026F0;
    DIValpha[126] = 32'h4F71E60E;
    DIValpha[127] = 32'h577EA6C3;
    DIValpha[128] = 32'hE18D0321;
    DIValpha[129] = 32'hF98243EC;
    DIValpha[130] = 32'hD1938312;
    DIValpha[131] = 32'hC99CC3DF;
    DIValpha[132] = 32'h81B1AA47;
    DIValpha[133] = 32'h99BEEA8A;
    DIValpha[134] = 32'hB1AF2A74;
    DIValpha[135] = 32'hA9A06AB9;
    DIValpha[136] = 32'h21F5F8ED;
    DIValpha[137] = 32'h39FAB820;
    DIValpha[138] = 32'h11EB78DE;
    DIValpha[139] = 32'h09E43813;
    DIValpha[140] = 32'h41C9518B;
    DIValpha[141] = 32'h59C61146;
    DIValpha[142] = 32'h71D7D1B8;
    DIValpha[143] = 32'h69D89175;
    DIValpha[144] = 32'hC87D5C10;
    DIValpha[145] = 32'hD0721CDD;
    DIValpha[146] = 32'hF863DC23;
    DIValpha[147] = 32'hE06C9CEE;
    DIValpha[148] = 32'hA841F576;
    DIValpha[149] = 32'hB04EB5BB;
    DIValpha[150] = 32'h985F7545;
    DIValpha[151] = 32'h80503588;
    DIValpha[152] = 32'h0805A7DC;
    DIValpha[153] = 32'h100AE711;
    DIValpha[154] = 32'h381B27EF;
    DIValpha[155] = 32'h20146722;
    DIValpha[156] = 32'h68390EBA;
    DIValpha[157] = 32'h70364E77;
    DIValpha[158] = 32'h58278E89;
    DIValpha[159] = 32'h4028CE44;
    DIValpha[160] = 32'hB3C4BD43;
    DIValpha[161] = 32'hABCBFD8E;
    DIValpha[162] = 32'h83DA3D70;
    DIValpha[163] = 32'h9BD57DBD;
    DIValpha[164] = 32'hD3F81425;
    DIValpha[165] = 32'hCBF754E8;
    DIValpha[166] = 32'hE3E69416;
    DIValpha[167] = 32'hFBE9D4DB;
    DIValpha[168] = 32'h73BC468F;
    DIValpha[169] = 32'h6BB30642;
    DIValpha[170] = 32'h43A2C6BC;
    DIValpha[171] = 32'h5BAD8671;
    DIValpha[172] = 32'h1380EFE9;
    DIValpha[173] = 32'h0B8FAF24;
    DIValpha[174] = 32'h239E6FDA;
    DIValpha[175] = 32'h3B912F17;
    DIValpha[176] = 32'h9A34E272;
    DIValpha[177] = 32'h823BA2BF;
    DIValpha[178] = 32'hAA2A6241;
    DIValpha[179] = 32'hB225228C;
    DIValpha[180] = 32'hFA084B14;
    DIValpha[181] = 32'hE2070BD9;
    DIValpha[182] = 32'hCA16CB27;
    DIValpha[183] = 32'hD2198BEA;
    DIValpha[184] = 32'h5A4C19BE;
    DIValpha[185] = 32'h42435973;
    DIValpha[186] = 32'h6A52998D;
    DIValpha[187] = 32'h725DD940;
    DIValpha[188] = 32'h3A70B0D8;
    DIValpha[189] = 32'h227FF015;
    DIValpha[190] = 32'h0A6E30EB;
    DIValpha[191] = 32'h12617026;
    DIValpha[192] = 32'h451FD6E5;
    DIValpha[193] = 32'h5D109628;
    DIValpha[194] = 32'h750156D6;
    DIValpha[195] = 32'h6D0E161B;
    DIValpha[196] = 32'h25237F83;
    DIValpha[197] = 32'h3D2C3F4E;
    DIValpha[198] = 32'h153DFFB0;
    DIValpha[199] = 32'h0D32BF7D;
    DIValpha[200] = 32'h85672D29;
    DIValpha[201] = 32'h9D686DE4;
    DIValpha[202] = 32'hB579AD1A;
    DIValpha[203] = 32'hAD76EDD7;
    DIValpha[204] = 32'hE55B844F;
    DIValpha[205] = 32'hFD54C482;
    DIValpha[206] = 32'hD545047C;
    DIValpha[207] = 32'hCD4A44B1;
    DIValpha[208] = 32'h6CEF89D4;
    DIValpha[209] = 32'h74E0C919;
    DIValpha[210] = 32'h5CF109E7;
    DIValpha[211] = 32'h44FE492A;
    DIValpha[212] = 32'h0CD320B2;
    DIValpha[213] = 32'h14DC607F;
    DIValpha[214] = 32'h3CCDA081;
    DIValpha[215] = 32'h24C2E04C;
    DIValpha[216] = 32'hAC977218;
    DIValpha[217] = 32'hB49832D5;
    DIValpha[218] = 32'h9C89F22B;
    DIValpha[219] = 32'h8486B2E6;
    DIValpha[220] = 32'hCCABDB7E;
    DIValpha[221] = 32'hD4A49BB3;
    DIValpha[222] = 32'hFCB55B4D;
    DIValpha[223] = 32'hE4BA1B80;
    DIValpha[224] = 32'h17566887;
    DIValpha[225] = 32'h0F59284A;
    DIValpha[226] = 32'h2748E8B4;
    DIValpha[227] = 32'h3F47A879;
    DIValpha[228] = 32'h776AC1E1;
    DIValpha[229] = 32'h6F65812C;
    DIValpha[230] = 32'h477441D2;
    DIValpha[231] = 32'h5F7B011F;
    DIValpha[232] = 32'hD72E934B;
    DIValpha[233] = 32'hCF21D386;
    DIValpha[234] = 32'hE7301378;
    DIValpha[235] = 32'hFF3F53B5;
    DIValpha[236] = 32'hB7123A2D;
    DIValpha[237] = 32'hAF1D7AE0;
    DIValpha[238] = 32'h870CBA1E;
    DIValpha[239] = 32'h9F03FAD3;
    DIValpha[240] = 32'h3EA637B6;
    DIValpha[241] = 32'h26A9777B;
    DIValpha[242] = 32'h0EB8B785;
    DIValpha[243] = 32'h16B7F748;
    DIValpha[244] = 32'h5E9A9ED0;
    DIValpha[245] = 32'h4695DE1D;
    DIValpha[246] = 32'h6E841EE3;
    DIValpha[247] = 32'h768B5E2E;
    DIValpha[248] = 32'hFEDECC7A;
    DIValpha[249] = 32'hE6D18CB7;
    DIValpha[250] = 32'hCEC04C49;
    DIValpha[251] = 32'hD6CF0C84;
    DIValpha[252] = 32'h9EE2651C;
    DIValpha[253] = 32'h86ED25D1;
    DIValpha[254] = 32'hAEFCE52F;
    DIValpha[255] = 32'hB6F3A5E2;


    if (reset) begin
        counter = 0;
        genkey = 0;

        // Initializing LFSR and FSM registers
        LFSR_out = {k[127:96] ^ IV[31:0],
                  k[95:64],
                  k[63:32],
                  k[31:0] ^ IV[63:32],
                  k[127:96] ^ 32'hffffffff,
                  k[95:64] ^ 32'hffffffff ^ IV[95:64],
                  k[63:32] ^ 32'hffffffff ^ IV[127:96],
                  k[31:0] ^ 32'hffffffff,
                  k[127:96],
                  k[95:64],
                  k[63:32],
                  k[31:0],
                  k[127:96] ^ 32'hffffffff,
                  k[95:64] ^ 32'hffffffff,
                  k[63:32] ^ 32'hffffffff,
                  k[31:0] ^ 32'hffffffff};


        FSM_R[0] = 32'h00000000;
        FSM_R[1] = 32'h00000000;
        FSM_R[2] = 32'h00000000;    


        FSM_out = {FSM_R[2],FSM_R[1],FSM_R[0]};      
                  
    end 
        
    else begin
           
        if (counter < 33) begin
           //ClockFSM 
           //Produce a 32-bit word F
           F = ( ( LFSR_out[511:480] + FSM_R[0] ) & 32'hffffffff ) ^ FSM_R[1] ;
                      //LFSR S15
           //Update FSM registers R1, R2, R3
           r = ( FSM_R[1] + ( FSM_R[2] ^ LFSR_out[191:160] ) ) & 32'hffffffff ;
           FSM_R[2] = s_2_out;             //LFSR S5
           FSM_R[1] = s_1_out;
           FSM_R[0] = r; 
      
      
      //ClockLFSRInitializationMode 
     /* Clocking LFSR in initialization mode.
      * LFSR Registers S0 to S15 are updated as the LFSR receives a single clock.
      * Input F: a 32-bit word comes from output of FSM.
     */ 
            
            v_1 = (((LFSR_out[31:0] << 8) & 32'hffffff00) ^ MULalpha[(LFSR_out[31:0] >> 24) & 8'hff] ^ LFSR_out[95:64] ^ ((LFSR_out[(32*12)-1:32*11] >> 8) & 32'h00ffffff) ^ DIValpha[LFSR_out[(32*12)-1:32*11] & 8'hff] ^ F);
            //        LFSR_S[0]                                       LFSR_S[0]                           LFSR_S[2]                LFSR_S[11]                                               LFSR_S[11]
            //LFSR is right shifted & S15 updated with v
            LFSR_out = { v_1, LFSR_out[(32*16)-1:32*15], LFSR_out[(32*15)-1:32*14], LFSR_out[(32*14)-1:32*13],
                        LFSR_out[(32*13)-1:32*12], LFSR_out[(32*12)-1:32*11], LFSR_out[(32*11)-1:32*10], LFSR_out[(32*10)-1:32*9],
                        LFSR_out[(32*9)-1:32*8], LFSR_out[(32*8)-1:32*7], LFSR_out[(32*7)-1:32*6],LFSR_out[(32*6)-1:32*5],
                        LFSR_out[(32*5)-1:32*4],LFSR_out[(32*4)-1:32*3], LFSR_out[(32*3)-1:32*2], LFSR_out[(32*2)-1:32*1] };
            
            //Update FSM output register
            FSM_out = {FSM_R[2],FSM_R[1],FSM_R[0]};
            
        end 


        else if ( counter == 33 ) begin
            // Clock FSM once. Discard the output.

            //Produce a 32-bit word F
            F = ( ( LFSR_out[511:480] + FSM_R[0] ) & 32'hffffffff ) ^ FSM_R[1] ;
                      //LFSR S15
            //Update FSM registers R1, R2, R3
            r = ( FSM_R[1] + ( FSM_R[2] ^ LFSR_out[191:160] ) ) & 32'hffffffff ;
            FSM_R[2] = s_2_out;             //LFSR S5
            FSM_R[1] = s_1_out;
            FSM_R[0] = r; 
        
    
       
       
       //ClockLFSRKeyStreamMode                               
       /* Clocking LFSR in keystream mode.
        * LFSR Registers S0 to S15 are updated as the LFSR receives a single clock.
        */
            
            v_2 = ((LFSR_out[31:0] << 8) & 32'hffffff00) ^ MULalpha[(LFSR_out[31:0] >> 24) & 8'hff] ^ LFSR_out[95:64] ^ ((LFSR_out[(32*12)-1:32*11] >> 8) & 32'h00ffffff) ^ DIValpha[LFSR_out[(32*12)-1:32*11] & 8'hff] ;
            
             
            //LFSR is right shifted & S15 updated with v
            LFSR_out = { v_2, LFSR_out[(32*16)-1:32*15], LFSR_out[(32*15)-1:32*14], LFSR_out[(32*14)-1:32*13],
                        LFSR_out[(32*13)-1:32*12], LFSR_out[(32*12)-1:32*11], LFSR_out[(32*11)-1:32*10], LFSR_out[(32*10)-1:32*9],
                        LFSR_out[(32*9)-1:32*8], LFSR_out[(32*8)-1:32*7], LFSR_out[(32*7)-1:32*6],LFSR_out[(32*6)-1:32*5],
                        LFSR_out[(32*5)-1:32*4],LFSR_out[(32*4)-1:32*3], LFSR_out[(32*3)-1:32*2], LFSR_out[(32*2)-1:32*1] };
        
            
            FSM_out = {FSM_R[2],FSM_R[1],FSM_R[0]};


        end
            
        else if (counter > 33 && genkey < 3) begin
            //Produce a 32-bit word F
            F = ( ( LFSR_out[511:480] + FSM_R[0] ) & 32'hffffffff ) ^ FSM_R[1] ;
                     //LFSR S15
            //Update FSM registers R1, R2, R3
            r = ( FSM_R[1] + ( FSM_R[2] ^ LFSR_out[191:160] ) ) & 32'hffffffff ;
            FSM_R[2] = s_2_out;             //LFSR S5
            FSM_R[1] = s_1_out;
            FSM_R[0] = r; 
            
            //temporary variable to store z value
            temp = F ^ LFSR_out[31:0]; 
            
            //z is updated at each clock by temp value
            z = {temp, z[95:64], z[63:32]}; 
      
            v_2 = ((LFSR_out[31:0] << 8) & 32'hffffff00) ^ MULalpha[(LFSR_out[31:0] >> 24) & 8'hff] ^ LFSR_out[95:64] ^ ((LFSR_out[(32*12)-1:32*11] >> 8) & 32'h00ffffff) ^ DIValpha[LFSR_out[(32*12)-1:32*11] & 8'hff] ;
            
            //LFSR is right shifted & S15 updated with v
            LFSR_out = { v_2, LFSR_out[(32*16)-1:32*15], LFSR_out[(32*15)-1:32*14], LFSR_out[(32*14)-1:32*13],
                        LFSR_out[(32*13)-1:32*12], LFSR_out[(32*12)-1:32*11], LFSR_out[(32*11)-1:32*10], LFSR_out[(32*10)-1:32*9],
                        LFSR_out[(32*9)-1:32*8], LFSR_out[(32*8)-1:32*7], LFSR_out[(32*7)-1:32*6],LFSR_out[(32*6)-1:32*5],
                        LFSR_out[(32*5)-1:32*4],LFSR_out[(32*4)-1:32*3], LFSR_out[(32*3)-1:32*2], LFSR_out[(32*2)-1:32*1] };
        
           
            FSM_out = {FSM_R[2],FSM_R[1],FSM_R[0]};
            
            // Increment genkey
            genkey = genkey + 1;

        end   
        
    end

    // Increment the counter
    counter = counter + 1;

  end
  
  

endmodule
