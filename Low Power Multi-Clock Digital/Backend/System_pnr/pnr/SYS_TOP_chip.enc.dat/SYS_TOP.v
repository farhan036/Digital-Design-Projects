/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Oct  1 21:05:38 2025
/////////////////////////////////////////////////////////////
module mux2X1_1 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   MX2X6M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

module mux2X1_4 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   MX2X2M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

module mux2X1_3 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   MX2X2M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

module mux2X1_2 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   MX2X2M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

module mux2X1_0 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire FE_PHN7_scan_rst;
   wire FE_PHN6_scan_rst;
   wire FE_PHN3_scan_rst;
   wire FE_PHN1_RST_N;
   wire FE_PHN0_RST_N;
   wire N0;

   assign N0 = SEL ;

   DLY4X1M FE_PHC7_scan_rst (.Y(FE_PHN7_scan_rst), 
	.A(FE_PHN6_scan_rst));
   DLY4X1M FE_PHC6_scan_rst (.Y(FE_PHN6_scan_rst), 
	.A(FE_PHN3_scan_rst));
   DLY4X1M FE_PHC3_scan_rst (.Y(FE_PHN3_scan_rst), 
	.A(IN_1));
   DLY4X1M FE_PHC1_RST_N (.Y(FE_PHN1_RST_N), 
	.A(FE_PHN0_RST_N));
   DLY4X1M FE_PHC0_RST_N (.Y(FE_PHN0_RST_N), 
	.A(IN_0));
   MX2X2M U1 (.Y(OUT), 
	.S0(N0), 
	.B(FE_PHN7_scan_rst), 
	.A(FE_PHN1_RST_N));
endmodule

module mux2X1_6 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire FE_PHN8_scan_rst;
   wire FE_PHN4_scan_rst;
   wire N0;

   assign N0 = SEL ;

   DLY4X1M FE_PHC8_scan_rst (.Y(FE_PHN8_scan_rst), 
	.A(FE_PHN4_scan_rst));
   DLY4X1M FE_PHC4_scan_rst (.Y(FE_PHN4_scan_rst), 
	.A(IN_1));
   MX2X8M U1 (.Y(OUT), 
	.S0(N0), 
	.B(FE_PHN8_scan_rst), 
	.A(IN_0));
endmodule

module mux2X1_5 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire FE_PHN5_scan_rst;
   wire FE_PHN2_scan_rst;
   wire N0;

   assign N0 = SEL ;

   DLY4X1M FE_PHC5_scan_rst (.Y(FE_PHN5_scan_rst), 
	.A(FE_PHN2_scan_rst));
   DLY4X1M FE_PHC2_scan_rst (.Y(FE_PHN2_scan_rst), 
	.A(IN_1));
   MX2X2M U1 (.Y(OUT), 
	.S0(N0), 
	.B(FE_PHN5_scan_rst), 
	.A(IN_0));
endmodule

module FSM_test_1 (
	CLK, 
	RST, 
	RX_IN, 
	PAR_EN, 
	bit_cnt, 
	edge_cnt, 
	Prescale, 
	par_err, 
	strt_glitch, 
	stp_err, 
	par_chk_en, 
	strt_chk_en, 
	stp_chk_en, 
	enable, 
	dat_samp_en, 
	deser_en, 
	data_valid, 
	test_si, 
	test_so, 
	test_se);
   input CLK;
   input RST;
   input RX_IN;
   input PAR_EN;
   input [3:0] bit_cnt;
   input [4:0] edge_cnt;
   input [5:0] Prescale;
   input par_err;
   input strt_glitch;
   input stp_err;
   output par_chk_en;
   output strt_chk_en;
   output stp_chk_en;
   output enable;
   output dat_samp_en;
   output deser_en;
   output data_valid;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire N38;
   wire N39;
   wire N40;
   wire N41;
   wire N42;
   wire N43;
   wire N44;
   wire N45;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n2;
   wire n3;
   wire n4;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n18;
   wire n33;
   wire n34;
   wire n35;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire [2:0] current_state;
   wire [2:0] next_state;

   assign test_so = current_state[2] ;

   SDFFRQX2M \current_state_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(current_state[0]), 
	.D(next_state[0]), 
	.CK(CLK));
   SDFFRQX2M \current_state_reg[1]  (.SI(n37), 
	.SE(test_se), 
	.RN(RST), 
	.Q(current_state[1]), 
	.D(next_state[1]), 
	.CK(CLK));
   SDFFRQX4M \current_state_reg[2]  (.SI(current_state[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(current_state[2]), 
	.D(next_state[2]), 
	.CK(CLK));
   INVX2M U4 (.Y(deser_en), 
	.A(n25));
   INVX2M U5 (.Y(stp_chk_en), 
	.A(n20));
   NOR3X2M U8 (.Y(data_valid), 
	.C(n38), 
	.B(n37), 
	.A(n39));
   NOR2BX2M U9 (.Y(n19), 
	.B(stp_err), 
	.AN(n28));
   AOI2B1X1M U10 (.Y(n32), 
	.B0(n25), 
	.A1N(n24), 
	.A0(n35));
   INVX2M U11 (.Y(n34), 
	.A(n22));
   OAI211X2M U12 (.Y(next_state[1]), 
	.C0(n27), 
	.B0(n26), 
	.A1(n20), 
	.A0(n19));
   OAI21X2M U13 (.Y(n26), 
	.B0(par_chk_en), 
	.A1(n33), 
	.A0(n34));
   AOI31X2M U14 (.Y(n27), 
	.B0(deser_en), 
	.A2(N45), 
	.A1(n18), 
	.A0(strt_chk_en));
   INVX2M U15 (.Y(n18), 
	.A(strt_glitch));
   OAI211X2M U16 (.Y(next_state[0]), 
	.C0(n31), 
	.B0(n30), 
	.A1(n29), 
	.A0(RX_IN));
   AOI31X2M U17 (.Y(n29), 
	.B0(data_valid), 
	.A2(n37), 
	.A1(n38), 
	.A0(n39));
   AOI31X2M U18 (.Y(n31), 
	.B0(n32), 
	.A2(stp_chk_en), 
	.A1(stp_err), 
	.A0(n28));
   OAI2BB1X2M U19 (.Y(n30), 
	.B0(strt_chk_en), 
	.A1N(strt_glitch), 
	.A0N(N45));
   OR2X2M U20 (.Y(n2), 
	.B(Prescale[0]), 
	.A(Prescale[1]));
   NOR3X2M U21 (.Y(par_chk_en), 
	.C(n39), 
	.B(current_state[2]), 
	.A(current_state[0]));
   NOR3X2M U22 (.Y(strt_chk_en), 
	.C(n37), 
	.B(current_state[2]), 
	.A(current_state[1]));
   NAND3X2M U23 (.Y(n25), 
	.C(current_state[1]), 
	.B(n38), 
	.A(current_state[0]));
   NAND3X2M U24 (.Y(n20), 
	.C(current_state[2]), 
	.B(n37), 
	.A(current_state[1]));
   INVX2M U25 (.Y(n37), 
	.A(current_state[0]));
   INVX2M U26 (.Y(n39), 
	.A(current_state[1]));
   INVX2M U27 (.Y(n38), 
	.A(current_state[2]));
   OAI32X1M U28 (.Y(n28), 
	.B1(n34), 
	.B0(PAR_EN), 
	.A2(n35), 
	.A1(n24), 
	.A0(n40));
   INVX2M U29 (.Y(n40), 
	.A(PAR_EN));
   NOR4BX1M U30 (.Y(n22), 
	.D(bit_cnt[2]), 
	.C(bit_cnt[0]), 
	.B(n35), 
	.AN(bit_cnt[3]));
   NAND3BX2M U31 (.Y(n24), 
	.C(bit_cnt[3]), 
	.B(bit_cnt[0]), 
	.AN(bit_cnt[2]));
   OAI21X2M U32 (.Y(next_state[2]), 
	.B0(n21), 
	.A1(n20), 
	.A0(n19));
   AOI31X2M U33 (.Y(n21), 
	.B0(n23), 
	.A2(par_chk_en), 
	.A1(n33), 
	.A0(n22));
   NOR4X1M U34 (.Y(n23), 
	.D(n25), 
	.C(n24), 
	.B(PAR_EN), 
	.A(bit_cnt[1]));
   INVX2M U36 (.Y(n33), 
	.A(par_err));
   INVX2M U37 (.Y(n35), 
	.A(bit_cnt[1]));
   OR4X1M U39 (.Y(enable), 
	.D(strt_chk_en), 
	.C(stp_chk_en), 
	.B(par_chk_en), 
	.A(deser_en));
   CLKINVX1M U40 (.Y(N38), 
	.A(Prescale[0]));
   OAI2BB1X1M U41 (.Y(N39), 
	.B0(n2), 
	.A1N(Prescale[1]), 
	.A0N(Prescale[0]));
   OR2X1M U42 (.Y(n3), 
	.B(Prescale[2]), 
	.A(n2));
   OAI2BB1X1M U43 (.Y(N40), 
	.B0(n3), 
	.A1N(Prescale[2]), 
	.A0N(n2));
   OR2X1M U44 (.Y(n4), 
	.B(Prescale[3]), 
	.A(n3));
   OAI2BB1X1M U45 (.Y(N41), 
	.B0(n4), 
	.A1N(Prescale[3]), 
	.A0N(n3));
   OR2X1M U46 (.Y(n8), 
	.B(Prescale[4]), 
	.A(n4));
   OAI2BB1X1M U47 (.Y(N42), 
	.B0(n8), 
	.A1N(Prescale[4]), 
	.A0N(n4));
   NOR2X1M U48 (.Y(N44), 
	.B(Prescale[5]), 
	.A(n8));
   AO21XLM U49 (.Y(N43), 
	.B0(N44), 
	.A1(Prescale[5]), 
	.A0(n8));
   NOR2BX1M U50 (.Y(n9), 
	.B(N38), 
	.AN(edge_cnt[0]));
   OAI2B2X1M U51 (.Y(n12), 
	.B1(n9), 
	.B0(edge_cnt[1]), 
	.A1N(N39), 
	.A0(n9));
   NOR2BX1M U52 (.Y(n10), 
	.B(edge_cnt[0]), 
	.AN(N38));
   OAI2B2X1M U53 (.Y(n11), 
	.B1(n10), 
	.B0(N39), 
	.A1N(edge_cnt[1]), 
	.A0(n10));
   NAND4BBX1M U54 (.Y(n16), 
	.D(n11), 
	.C(n12), 
	.BN(N43), 
	.AN(N44));
   CLKXOR2X2M U55 (.Y(n15), 
	.B(edge_cnt[4]), 
	.A(N42));
   CLKXOR2X2M U56 (.Y(n14), 
	.B(edge_cnt[2]), 
	.A(N40));
   CLKXOR2X2M U57 (.Y(n13), 
	.B(edge_cnt[3]), 
	.A(N41));
   NOR4X1M U58 (.Y(N45), 
	.D(n13), 
	.C(n14), 
	.B(n15), 
	.A(n16));
endmodule

module edge_bit_counter_test_1 (
	CLK, 
	RST, 
	enable, 
	Prescale, 
	bit_cnt, 
	edge_cnt, 
	test_si, 
	test_se);
   input CLK;
   input RST;
   input enable;
   input [5:0] Prescale;
   output [3:0] bit_cnt;
   output [4:0] edge_cnt;
   input test_si;
   input test_se;

   // Internal wires
   wire N7;
   wire N8;
   wire N9;
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire N21;
   wire N22;
   wire N23;
   wire N35;
   wire N36;
   wire N37;
   wire N38;
   wire N39;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire \add_30/carry[4] ;
   wire \add_30/carry[3] ;
   wire \add_30/carry[2] ;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;

   SDFFRQX2M \bit_cnt_reg[3]  (.SI(bit_cnt[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(bit_cnt[3]), 
	.D(n27), 
	.CK(CLK));
   SDFFRQX2M \bit_cnt_reg[2]  (.SI(n35), 
	.SE(test_se), 
	.RN(RST), 
	.Q(bit_cnt[2]), 
	.D(n24), 
	.CK(CLK));
   SDFFRQX2M \bit_cnt_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(bit_cnt[0]), 
	.D(n26), 
	.CK(CLK));
   SDFFRQX2M \bit_cnt_reg[1]  (.SI(n34), 
	.SE(test_se), 
	.RN(RST), 
	.Q(bit_cnt[1]), 
	.D(n25), 
	.CK(CLK));
   SDFFRQX2M \edge_cnt_reg[4]  (.SI(edge_cnt[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(edge_cnt[4]), 
	.D(N39), 
	.CK(CLK));
   SDFFRQX2M \edge_cnt_reg[0]  (.SI(bit_cnt[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(edge_cnt[0]), 
	.D(N35), 
	.CK(CLK));
   SDFFRQX2M \edge_cnt_reg[1]  (.SI(edge_cnt[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(edge_cnt[1]), 
	.D(N36), 
	.CK(CLK));
   SDFFRQX2M \edge_cnt_reg[3]  (.SI(edge_cnt[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(edge_cnt[3]), 
	.D(N38), 
	.CK(CLK));
   SDFFRQX2M \edge_cnt_reg[2]  (.SI(edge_cnt[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(edge_cnt[2]), 
	.D(N37), 
	.CK(CLK));
   INVX2M U7 (.Y(n33), 
	.A(n21));
   INVX2M U8 (.Y(n36), 
	.A(enable));
   NOR2X2M U14 (.Y(n21), 
	.B(N14), 
	.A(n36));
   NOR2BX2M U15 (.Y(N36), 
	.B(n33), 
	.AN(N21));
   NOR2BX2M U16 (.Y(N37), 
	.B(n33), 
	.AN(N22));
   NOR2BX2M U17 (.Y(N38), 
	.B(n33), 
	.AN(N23));
   OAI32X1M U18 (.Y(n26), 
	.B1(n33), 
	.B0(n34), 
	.A2(n21), 
	.A1(bit_cnt[0]), 
	.A0(n36));
   OAI22X1M U19 (.Y(n25), 
	.B1(n36), 
	.B0(n20), 
	.A1(n33), 
	.A0(n35));
   AOI32X1M U20 (.Y(n20), 
	.B1(n34), 
	.B0(bit_cnt[1]), 
	.A2(bit_cnt[0]), 
	.A1(n35), 
	.A0(n33));
   INVX2M U21 (.Y(n35), 
	.A(bit_cnt[1]));
   AND3X2M U22 (.Y(n19), 
	.C(bit_cnt[0]), 
	.B(bit_cnt[1]), 
	.A(N14));
   OR2X2M U23 (.Y(n2), 
	.B(Prescale[0]), 
	.A(Prescale[1]));
   NOR2X2M U24 (.Y(N39), 
	.B(n33), 
	.A(n1));
   XNOR2X2M U25 (.Y(n1), 
	.B(edge_cnt[4]), 
	.A(\add_30/carry[4] ));
   NOR2X2M U26 (.Y(N35), 
	.B(n33), 
	.A(edge_cnt[0]));
   NOR2X2M U27 (.Y(n27), 
	.B(n36), 
	.A(n22));
   CLKXOR2X2M U28 (.Y(n22), 
	.B(bit_cnt[3]), 
	.A(n23));
   NAND2X2M U29 (.Y(n23), 
	.B(bit_cnt[2]), 
	.A(n19));
   NOR2X2M U30 (.Y(n24), 
	.B(n36), 
	.A(n18));
   XNOR2X2M U31 (.Y(n18), 
	.B(bit_cnt[2]), 
	.A(n19));
   ADDHX1M U32 (.S(N22), 
	.CO(\add_30/carry[3] ), 
	.B(\add_30/carry[2] ), 
	.A(edge_cnt[2]));
   ADDHX1M U33 (.S(N21), 
	.CO(\add_30/carry[2] ), 
	.B(edge_cnt[0]), 
	.A(edge_cnt[1]));
   INVX2M U34 (.Y(n34), 
	.A(bit_cnt[0]));
   ADDHX1M U35 (.S(N23), 
	.CO(\add_30/carry[4] ), 
	.B(\add_30/carry[3] ), 
	.A(edge_cnt[3]));
   CLKINVX1M U36 (.Y(N7), 
	.A(Prescale[0]));
   OAI2BB1X1M U37 (.Y(N8), 
	.B0(n2), 
	.A1N(Prescale[1]), 
	.A0N(Prescale[0]));
   OR2X1M U38 (.Y(n3), 
	.B(Prescale[2]), 
	.A(n2));
   OAI2BB1X1M U39 (.Y(N9), 
	.B0(n3), 
	.A1N(Prescale[2]), 
	.A0N(n2));
   OR2X1M U40 (.Y(n4), 
	.B(Prescale[3]), 
	.A(n3));
   OAI2BB1X1M U41 (.Y(N10), 
	.B0(n4), 
	.A1N(Prescale[3]), 
	.A0N(n3));
   OR2X1M U42 (.Y(n14), 
	.B(Prescale[4]), 
	.A(n4));
   OAI2BB1X1M U43 (.Y(N11), 
	.B0(n14), 
	.A1N(Prescale[4]), 
	.A0N(n4));
   NOR2X1M U44 (.Y(N13), 
	.B(Prescale[5]), 
	.A(n14));
   AO21XLM U45 (.Y(N12), 
	.B0(N13), 
	.A1(Prescale[5]), 
	.A0(n14));
   NOR2BX1M U46 (.Y(n15), 
	.B(N7), 
	.AN(edge_cnt[0]));
   OAI2B2X1M U47 (.Y(n28), 
	.B1(n15), 
	.B0(edge_cnt[1]), 
	.A1N(N8), 
	.A0(n15));
   NOR2BX1M U48 (.Y(n16), 
	.B(edge_cnt[0]), 
	.AN(N7));
   OAI2B2X1M U49 (.Y(n17), 
	.B1(n16), 
	.B0(N8), 
	.A1N(edge_cnt[1]), 
	.A0(n16));
   NAND4BBX1M U50 (.Y(n32), 
	.D(n17), 
	.C(n28), 
	.BN(N12), 
	.AN(N13));
   CLKXOR2X2M U51 (.Y(n31), 
	.B(edge_cnt[4]), 
	.A(N11));
   CLKXOR2X2M U52 (.Y(n30), 
	.B(edge_cnt[2]), 
	.A(N9));
   CLKXOR2X2M U53 (.Y(n29), 
	.B(edge_cnt[3]), 
	.A(N10));
   NOR4X1M U54 (.Y(N14), 
	.D(n29), 
	.C(n30), 
	.B(n31), 
	.A(n32));
endmodule

module data_sampling_test_1 (
	CLK, 
	RST, 
	RX_IN, 
	dat_samp_en, 
	Prescale, 
	edge_cnt, 
	sampled_bit, 
	test_se);
   input CLK;
   input RST;
   input RX_IN;
   input dat_samp_en;
   input [5:0] Prescale;
   input [4:0] edge_cnt;
   output sampled_bit;
   input test_se;

   // Internal wires
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire [1:0] majority;

   SDFFRQX2M \majority_reg[1]  (.SI(majority[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(majority[1]), 
	.D(n46), 
	.CK(CLK));
   SDFFRQX2M \majority_reg[0]  (.SI(edge_cnt[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(majority[0]), 
	.D(n45), 
	.CK(CLK));
   SDFFRQX2M sampled_bit_reg (.SI(majority[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sampled_bit), 
	.D(n44), 
	.CK(CLK));
   INVX2M U6 (.Y(n6), 
	.A(dat_samp_en));
   INVX2M U7 (.Y(n9), 
	.A(RX_IN));
   OAI31X1M U8 (.Y(n44), 
	.B0(n28), 
	.A2(n27), 
	.A1(n26), 
	.A0(n6));
   AOI21X2M U9 (.Y(n26), 
	.B0(n37), 
	.A1(RX_IN), 
	.A0(majority[0]));
   NAND2X2M U10 (.Y(n28), 
	.B(n27), 
	.A(sampled_bit));
   NOR2BX2M U11 (.Y(n27), 
	.B(n6), 
	.AN(n29));
   NOR3X2M U12 (.Y(n36), 
	.C(n8), 
	.B(Prescale[5]), 
	.A(Prescale[4]));
   NOR3X2M U13 (.Y(n35), 
	.C(n7), 
	.B(Prescale[5]), 
	.A(Prescale[3]));
   NAND4X2M U14 (.Y(n29), 
	.D(n5), 
	.C(n1), 
	.B(n31), 
	.A(n30));
   OAI32X1M U15 (.Y(n31), 
	.B1(n34), 
	.B0(edge_cnt[4]), 
	.A2(n2), 
	.A1(n33), 
	.A0(n32));
   NAND2X2M U16 (.Y(n32), 
	.B(n3), 
	.A(n4));
   AOI33X2M U17 (.Y(n34), 
	.B2(edge_cnt[2]), 
	.B1(n3), 
	.B0(n36), 
	.A2(edge_cnt[3]), 
	.A1(n4), 
	.A0(n35));
   AND4X2M U18 (.Y(n39), 
	.D(n42), 
	.C(n30), 
	.B(n2), 
	.A(n41));
   OAI32X1M U19 (.Y(n41), 
	.B1(n43), 
	.B0(edge_cnt[3]), 
	.A2(n3), 
	.A1(n33), 
	.A0(n4));
   NOR2X2M U20 (.Y(n42), 
	.B(n5), 
	.A(n6));
   AOI22X1M U21 (.Y(n43), 
	.B1(n4), 
	.B0(n36), 
	.A1(n35), 
	.A0(edge_cnt[2]));
   OAI2BB2X1M U22 (.Y(n45), 
	.B1(n38), 
	.B0(n9), 
	.A1N(majority[0]), 
	.A0N(n38));
   NAND2X2M U23 (.Y(n38), 
	.B(n1), 
	.A(n39));
   OAI2BB2X1M U24 (.Y(n46), 
	.B1(n40), 
	.B0(n9), 
	.A1N(majority[1]), 
	.A0N(n40));
   NAND2X2M U25 (.Y(n40), 
	.B(n39), 
	.A(edge_cnt[0]));
   INVX2M U26 (.Y(n8), 
	.A(Prescale[3]));
   INVX2M U27 (.Y(n7), 
	.A(Prescale[4]));
   NAND3X2M U28 (.Y(n33), 
	.C(Prescale[5]), 
	.B(n7), 
	.A(n8));
   NOR3X2M U29 (.Y(n30), 
	.C(Prescale[0]), 
	.B(Prescale[1]), 
	.A(Prescale[2]));
   INVX2M U30 (.Y(n4), 
	.A(edge_cnt[2]));
   INVX2M U31 (.Y(n1), 
	.A(edge_cnt[0]));
   INVX2M U32 (.Y(n3), 
	.A(edge_cnt[3]));
   INVX2M U33 (.Y(n5), 
	.A(edge_cnt[1]));
   OA21X2M U34 (.Y(n37), 
	.B0(majority[1]), 
	.A1(RX_IN), 
	.A0(majority[0]));
   INVX2M U35 (.Y(n2), 
	.A(edge_cnt[4]));
endmodule

module parity_check_test_1 (
	CLK, 
	RST, 
	par_chk_en, 
	PAR_TYP, 
	edge_cnt, 
	Prescale, 
	P_DATA, 
	sampled_bit, 
	par_err, 
	test_se);
   input CLK;
   input RST;
   input par_chk_en;
   input PAR_TYP;
   input [4:0] edge_cnt;
   input [5:0] Prescale;
   input [7:0] P_DATA;
   input sampled_bit;
   output par_err;
   input test_se;

   // Internal wires
   wire expected_parity;
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire N15;
   wire N16;
   wire N18;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n15;
   wire n16;
   wire \sub_25/carry[5] ;
   wire \sub_25/carry[4] ;
   wire \sub_25/carry[3] ;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;

   assign N11 = Prescale[0] ;

   SDFFRQX2M expected_parity_reg (.SI(sampled_bit), 
	.SE(test_se), 
	.RN(RST), 
	.Q(expected_parity), 
	.D(n15), 
	.CK(CLK));
   SDFFRQX4M par_err_reg (.SI(expected_parity), 
	.SE(test_se), 
	.RN(RST), 
	.Q(par_err), 
	.D(n16), 
	.CK(CLK));
   NOR2X2M U3 (.Y(n1), 
	.B(\sub_25/carry[5] ), 
	.A(Prescale[5]));
   OAI2BB2X1M U4 (.Y(n16), 
	.B1(n12), 
	.B0(n11), 
	.A1N(n12), 
	.A0N(par_err));
   XNOR2X2M U5 (.Y(n11), 
	.B(sampled_bit), 
	.A(expected_parity));
   NAND2X2M U6 (.Y(n12), 
	.B(par_chk_en), 
	.A(N18));
   INVX2M U7 (.Y(N12), 
	.A(Prescale[1]));
   XNOR2X2M U8 (.Y(n9), 
	.B(P_DATA[2]), 
	.A(P_DATA[3]));
   XOR3XLM U9 (.Y(n7), 
	.C(n10), 
	.B(P_DATA[4]), 
	.A(P_DATA[5]));
   CLKXOR2X2M U10 (.Y(n10), 
	.B(P_DATA[6]), 
	.A(P_DATA[7]));
   OAI2BB2X1M U11 (.Y(n15), 
	.B1(n6), 
	.B0(n21), 
	.A1N(expected_parity), 
	.A0N(n21));
   INVX2M U12 (.Y(n21), 
	.A(par_chk_en));
   XOR3XLM U13 (.Y(n6), 
	.C(n8), 
	.B(PAR_TYP), 
	.A(n7));
   XOR3XLM U14 (.Y(n8), 
	.C(n9), 
	.B(P_DATA[0]), 
	.A(P_DATA[1]));
   XNOR2X1M U17 (.Y(N16), 
	.B(Prescale[5]), 
	.A(\sub_25/carry[5] ));
   OR2X1M U18 (.Y(\sub_25/carry[5] ), 
	.B(\sub_25/carry[4] ), 
	.A(Prescale[4]));
   XNOR2X1M U19 (.Y(N15), 
	.B(Prescale[4]), 
	.A(\sub_25/carry[4] ));
   OR2X1M U20 (.Y(\sub_25/carry[4] ), 
	.B(\sub_25/carry[3] ), 
	.A(Prescale[3]));
   XNOR2X1M U21 (.Y(N14), 
	.B(Prescale[3]), 
	.A(\sub_25/carry[3] ));
   OR2X1M U22 (.Y(\sub_25/carry[3] ), 
	.B(Prescale[1]), 
	.A(Prescale[2]));
   XNOR2X1M U23 (.Y(N13), 
	.B(Prescale[2]), 
	.A(Prescale[1]));
   NOR2BX1M U24 (.Y(n2), 
	.B(N11), 
	.AN(edge_cnt[0]));
   OAI2B2X1M U25 (.Y(n5), 
	.B1(n2), 
	.B0(edge_cnt[1]), 
	.A1N(N12), 
	.A0(n2));
   NOR2BX1M U26 (.Y(n3), 
	.B(edge_cnt[0]), 
	.AN(N11));
   OAI2B2X1M U27 (.Y(n4), 
	.B1(n3), 
	.B0(N12), 
	.A1N(edge_cnt[1]), 
	.A0(n3));
   NAND4BBX1M U28 (.Y(n20), 
	.D(n4), 
	.C(n5), 
	.BN(N16), 
	.AN(n1));
   CLKXOR2X2M U29 (.Y(n19), 
	.B(edge_cnt[4]), 
	.A(N15));
   CLKXOR2X2M U30 (.Y(n18), 
	.B(edge_cnt[2]), 
	.A(N13));
   CLKXOR2X2M U31 (.Y(n17), 
	.B(edge_cnt[3]), 
	.A(N14));
   NOR4X1M U32 (.Y(N18), 
	.D(n17), 
	.C(n18), 
	.B(n19), 
	.A(n20));
endmodule

module deserializer_test_1 (
	CLK, 
	RST, 
	sampled_bit, 
	deser_en, 
	edge_cnt, 
	Prescale, 
	P_DATA, 
	test_si, 
	test_so, 
	test_se);
   input CLK;
   input RST;
   input sampled_bit;
   input deser_en;
   input [4:0] edge_cnt;
   input [5:0] Prescale;
   output [7:0] P_DATA;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire [2:0] i;

   assign test_so = n58 ;

   SDFFRQX2M \P_DATA_reg[5]  (.SI(P_DATA[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[5]), 
	.D(n47), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[1]  (.SI(P_DATA[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[1]), 
	.D(n43), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[4]  (.SI(P_DATA[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[4]), 
	.D(n46), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[0]), 
	.D(n42), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[3]  (.SI(P_DATA[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[3]), 
	.D(n45), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[2]  (.SI(P_DATA[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[2]), 
	.D(n44), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[6]  (.SI(P_DATA[5]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[6]), 
	.D(n48), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[7]  (.SI(P_DATA[6]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[7]), 
	.D(n49), 
	.CK(CLK));
   SDFFRQX2M \i_reg[2]  (.SI(n56), 
	.SE(test_se), 
	.RN(RST), 
	.Q(i[2]), 
	.D(n50), 
	.CK(CLK));
   SDFFRQX2M \i_reg[0]  (.SI(P_DATA[7]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(i[0]), 
	.D(n52), 
	.CK(CLK));
   SDFFRQX2M \i_reg[1]  (.SI(n55), 
	.SE(test_se), 
	.RN(RST), 
	.Q(i[1]), 
	.D(n51), 
	.CK(CLK));
   NAND2X2M U6 (.Y(n38), 
	.B(n41), 
	.A(deser_en));
   INVX2M U7 (.Y(n60), 
	.A(deser_en));
   NOR2X2M U16 (.Y(n25), 
	.B(n1), 
	.A(n60));
   OAI32X1M U17 (.Y(n50), 
	.B1(n58), 
	.B0(n39), 
	.A2(n31), 
	.A1(n55), 
	.A0(n38));
   AOI21X2M U18 (.Y(n39), 
	.B0(n40), 
	.A1(n56), 
	.A0(deser_en));
   NAND2X2M U19 (.Y(n41), 
	.B(n1), 
	.A(deser_en));
   OAI22X1M U20 (.Y(n24), 
	.B1(n58), 
	.B0(n37), 
	.A1(n55), 
	.A0(n56));
   INVX2M U21 (.Y(n57), 
	.A(n31));
   NOR3BX2M U22 (.Y(n33), 
	.C(i[0]), 
	.B(n58), 
	.AN(n25));
   OR4X1M U23 (.Y(n1), 
	.D(n21), 
	.C(n22), 
	.B(n53), 
	.A(n54));
   OAI2BB2X1M U24 (.Y(n46), 
	.B1(n32), 
	.B0(n59), 
	.A1N(n32), 
	.A0N(P_DATA[4]));
   NAND2X2M U25 (.Y(n32), 
	.B(n56), 
	.A(n33));
   OAI2BB2X1M U26 (.Y(n48), 
	.B1(n35), 
	.B0(n59), 
	.A1N(n35), 
	.A0N(P_DATA[6]));
   NAND2X2M U27 (.Y(n35), 
	.B(i[1]), 
	.A(n33));
   OR2X2M U28 (.Y(n2), 
	.B(Prescale[0]), 
	.A(Prescale[1]));
   OAI22X1M U29 (.Y(n52), 
	.B1(n38), 
	.B0(i[0]), 
	.A1(n41), 
	.A0(n55));
   OAI21X2M U30 (.Y(n40), 
	.B0(n41), 
	.A1(n60), 
	.A0(i[0]));
   OAI2BB2X1M U31 (.Y(n42), 
	.B1(n59), 
	.B0(n23), 
	.A1N(n23), 
	.A0N(P_DATA[0]));
   NAND3BX2M U32 (.Y(n23), 
	.C(n26), 
	.B(n25), 
	.AN(n24));
   OAI2BB2X1M U33 (.Y(n43), 
	.B1(n27), 
	.B0(n59), 
	.A1N(n27), 
	.A0N(P_DATA[1]));
   NAND3X2M U34 (.Y(n27), 
	.C(n28), 
	.B(n58), 
	.A(n25));
   OAI2BB2X1M U35 (.Y(n44), 
	.B1(n29), 
	.B0(n59), 
	.A1N(n29), 
	.A0N(P_DATA[2]));
   NAND3X2M U36 (.Y(n29), 
	.C(n57), 
	.B(n55), 
	.A(n25));
   OAI2BB2X1M U37 (.Y(n45), 
	.B1(n30), 
	.B0(n59), 
	.A1N(n30), 
	.A0N(P_DATA[3]));
   NAND3X2M U38 (.Y(n30), 
	.C(n57), 
	.B(i[0]), 
	.A(n25));
   OAI2BB2X1M U39 (.Y(n47), 
	.B1(n34), 
	.B0(n59), 
	.A1N(n34), 
	.A0N(P_DATA[5]));
   NAND3X2M U40 (.Y(n34), 
	.C(n28), 
	.B(i[2]), 
	.A(n25));
   OAI2BB2X1M U41 (.Y(n49), 
	.B1(n36), 
	.B0(n59), 
	.A1N(n36), 
	.A0N(P_DATA[7]));
   NAND3BX2M U42 (.Y(n36), 
	.C(n24), 
	.B(n25), 
	.AN(n26));
   AO2B2X2M U43 (.Y(n51), 
	.B1(i[1]), 
	.B0(n40), 
	.A1N(n38), 
	.A0(n28));
   AOI21X2M U44 (.Y(n37), 
	.B0(n28), 
	.A1(i[1]), 
	.A0(n55));
   NOR2X2M U45 (.Y(n28), 
	.B(i[1]), 
	.A(n55));
   INVX2M U46 (.Y(n59), 
	.A(sampled_bit));
   INVX2M U47 (.Y(n55), 
	.A(i[0]));
   NAND2X2M U48 (.Y(n31), 
	.B(n58), 
	.A(i[1]));
   INVX2M U49 (.Y(n56), 
	.A(i[1]));
   INVX2M U50 (.Y(n58), 
	.A(i[2]));
   CLKXOR2X2M U51 (.Y(n26), 
	.B(i[2]), 
	.A(n37));
   CLKINVX1M U52 (.Y(N19), 
	.A(Prescale[0]));
   OAI2BB1X1M U53 (.Y(N20), 
	.B0(n2), 
	.A1N(Prescale[1]), 
	.A0N(Prescale[0]));
   OR2X1M U54 (.Y(n3), 
	.B(Prescale[2]), 
	.A(n2));
   OAI2BB1X1M U55 (.Y(N21), 
	.B0(n3), 
	.A1N(Prescale[2]), 
	.A0N(n2));
   OR2X1M U56 (.Y(n4), 
	.B(Prescale[3]), 
	.A(n3));
   OAI2BB1X1M U57 (.Y(N22), 
	.B0(n4), 
	.A1N(Prescale[3]), 
	.A0N(n3));
   OR2X1M U58 (.Y(n16), 
	.B(Prescale[4]), 
	.A(n4));
   OAI2BB1X1M U59 (.Y(N23), 
	.B0(n16), 
	.A1N(Prescale[4]), 
	.A0N(n4));
   NOR2X1M U60 (.Y(N25), 
	.B(Prescale[5]), 
	.A(n16));
   AO21XLM U61 (.Y(N24), 
	.B0(N25), 
	.A1(Prescale[5]), 
	.A0(n16));
   NOR2BX1M U62 (.Y(n17), 
	.B(N19), 
	.AN(edge_cnt[0]));
   OAI2B2X1M U63 (.Y(n20), 
	.B1(n17), 
	.B0(edge_cnt[1]), 
	.A1N(N20), 
	.A0(n17));
   NOR2BX1M U64 (.Y(n18), 
	.B(edge_cnt[0]), 
	.AN(N19));
   OAI2B2X1M U65 (.Y(n19), 
	.B1(n18), 
	.B0(N20), 
	.A1N(edge_cnt[1]), 
	.A0(n18));
   NAND4BBX1M U66 (.Y(n54), 
	.D(n19), 
	.C(n20), 
	.BN(N24), 
	.AN(N25));
   CLKXOR2X2M U67 (.Y(n53), 
	.B(edge_cnt[4]), 
	.A(N23));
   CLKXOR2X2M U68 (.Y(n22), 
	.B(edge_cnt[2]), 
	.A(N21));
   CLKXOR2X2M U69 (.Y(n21), 
	.B(edge_cnt[3]), 
	.A(N22));
endmodule

module strt_check_test_1 (
	CLK, 
	RST, 
	strt_chk_en, 
	sampled_bit, 
	strt_glitch, 
	test_si, 
	test_se);
   input CLK;
   input RST;
   input strt_chk_en;
   input sampled_bit;
   output strt_glitch;
   input test_si;
   input test_se;

   // Internal wires
   wire n2;

   SDFFRQX2M strt_glitch_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(strt_glitch), 
	.D(n2), 
	.CK(CLK));
   AO2B2X2M U2 (.Y(n2), 
	.B1(sampled_bit), 
	.B0(strt_chk_en), 
	.A1N(strt_chk_en), 
	.A0(strt_glitch));
endmodule

module stop_check_test_1 (
	CLK, 
	RST, 
	stp_chk_en, 
	sampled_bit, 
	stp_err, 
	test_si, 
	test_se);
   input CLK;
   input RST;
   input stp_chk_en;
   input sampled_bit;
   output stp_err;
   input test_si;
   input test_se;

   // Internal wires
   wire n3;
   wire n1;

   SDFFRQX4M stp_err_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(stp_err), 
	.D(n3), 
	.CK(CLK));
   OAI2BB2X1M U2 (.Y(n3), 
	.B1(n1), 
	.B0(sampled_bit), 
	.A1N(n1), 
	.A0N(stp_err));
   INVX2M U3 (.Y(n1), 
	.A(stp_chk_en));
endmodule

module UART_RX_TOP_test_1 (
	CLK, 
	RST, 
	RX_IN, 
	Prescale, 
	PAR_EN, 
	PAR_TYP, 
	P_DATA, 
	Parity_Error, 
	Stop_Error, 
	data_valid, 
	test_si3, 
	test_si2, 
	test_si1, 
	test_so2, 
	test_so1, 
	test_se);
   input CLK;
   input RST;
   input RX_IN;
   input [5:0] Prescale;
   input PAR_EN;
   input PAR_TYP;
   output [7:0] P_DATA;
   output Parity_Error;
   output Stop_Error;
   output data_valid;
   input test_si3;
   input test_si2;
   input test_si1;
   output test_so2;
   output test_so1;
   input test_se;

   // Internal wires
   wire FE_PT0_;
   wire FE_UNCONNECTED_0;
   wire strt_glitch;
   wire par_chk_en;
   wire strt_chk_en;
   wire stp_chk_en;
   wire enable;
   wire deser_en;
   wire sampled_bit;
   wire n3;
   wire n9;
   wire [3:0] bit_cnt;
   wire [4:0] edge_cnt;

   assign test_so2 = strt_glitch ;

   INVXLM U3 (.Y(n9), 
	.A(Stop_Error));
   FSM_test_1 DUT1 (.CLK(CLK), 
	.RST(RST), 
	.RX_IN(RX_IN), 
	.PAR_EN(PAR_EN), 
	.bit_cnt({ bit_cnt[3],
		bit_cnt[2],
		bit_cnt[1],
		bit_cnt[0] }), 
	.edge_cnt({ edge_cnt[4],
		edge_cnt[3],
		edge_cnt[2],
		edge_cnt[1],
		edge_cnt[0] }), 
	.Prescale({ Prescale[5],
		Prescale[4],
		Prescale[3],
		Prescale[2],
		Prescale[1],
		Prescale[0] }), 
	.par_err(Parity_Error), 
	.strt_glitch(strt_glitch), 
	.stp_err(n9), 
	.par_chk_en(par_chk_en), 
	.strt_chk_en(strt_chk_en), 
	.stp_chk_en(stp_chk_en), 
	.enable(enable), 
	.dat_samp_en(FE_PT0_), 
	.deser_en(deser_en), 
	.data_valid(data_valid), 
	.test_si(test_si1), 
	.test_so(test_so1), 
	.test_se(test_se));
   edge_bit_counter_test_1 DUT2 (.CLK(CLK), 
	.RST(RST), 
	.enable(enable), 
	.Prescale({ Prescale[5],
		Prescale[4],
		Prescale[3],
		Prescale[2],
		Prescale[1],
		Prescale[0] }), 
	.bit_cnt({ bit_cnt[3],
		bit_cnt[2],
		bit_cnt[1],
		bit_cnt[0] }), 
	.edge_cnt({ edge_cnt[4],
		edge_cnt[3],
		edge_cnt[2],
		edge_cnt[1],
		edge_cnt[0] }), 
	.test_si(test_si2), 
	.test_se(test_se));
   data_sampling_test_1 DUT3 (.CLK(CLK), 
	.RST(RST), 
	.RX_IN(RX_IN), 
	.dat_samp_en(enable), 
	.Prescale({ Prescale[5],
		Prescale[4],
		Prescale[3],
		Prescale[2],
		Prescale[1],
		Prescale[0] }), 
	.edge_cnt({ edge_cnt[4],
		edge_cnt[3],
		edge_cnt[2],
		edge_cnt[1],
		edge_cnt[0] }), 
	.sampled_bit(sampled_bit), 
	.test_se(test_se));
   parity_check_test_1 DUT4 (.CLK(CLK), 
	.RST(RST), 
	.par_chk_en(par_chk_en), 
	.PAR_TYP(PAR_TYP), 
	.edge_cnt({ edge_cnt[4],
		edge_cnt[3],
		edge_cnt[2],
		edge_cnt[1],
		edge_cnt[0] }), 
	.Prescale({ Prescale[5],
		Prescale[4],
		Prescale[3],
		Prescale[2],
		Prescale[1],
		Prescale[0] }), 
	.P_DATA({ P_DATA[7],
		P_DATA[6],
		P_DATA[5],
		P_DATA[4],
		P_DATA[3],
		P_DATA[2],
		P_DATA[1],
		P_DATA[0] }), 
	.sampled_bit(sampled_bit), 
	.par_err(Parity_Error), 
	.test_se(test_se));
   deserializer_test_1 DUT5 (.CLK(CLK), 
	.RST(RST), 
	.sampled_bit(sampled_bit), 
	.deser_en(deser_en), 
	.edge_cnt({ edge_cnt[4],
		edge_cnt[3],
		edge_cnt[2],
		edge_cnt[1],
		edge_cnt[0] }), 
	.Prescale({ Prescale[5],
		Prescale[4],
		Prescale[3],
		Prescale[2],
		Prescale[1],
		Prescale[0] }), 
	.P_DATA({ P_DATA[7],
		P_DATA[6],
		P_DATA[5],
		P_DATA[4],
		P_DATA[3],
		P_DATA[2],
		P_DATA[1],
		P_DATA[0] }), 
	.test_si(Parity_Error), 
	.test_so(n3), 
	.test_se(test_se));
   strt_check_test_1 DUT6 (.CLK(CLK), 
	.RST(RST), 
	.strt_chk_en(strt_chk_en), 
	.sampled_bit(sampled_bit), 
	.strt_glitch(strt_glitch), 
	.test_si(n3), 
	.test_se(test_se));
   stop_check_test_1 DUT7 (.CLK(CLK), 
	.RST(RST), 
	.stp_chk_en(stp_chk_en), 
	.sampled_bit(sampled_bit), 
	.stp_err(Stop_Error), 
	.test_si(test_si3), 
	.test_se(test_se));
endmodule

module DATA_SYNC_NUM_STAGES2_test_1 (
	CLK, 
	RST, 
	Unsync_bus, 
	bus_enable, 
	sync_bus, 
	enable_pulse, 
	test_si, 
	test_so, 
	test_se);
   input CLK;
   input RST;
   input [7:0] Unsync_bus;
   input bus_enable;
   output [7:0] sync_bus;
   output enable_pulse;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire enable_flop;
   wire n1;
   wire n3;
   wire n5;
   wire n7;
   wire n9;
   wire n11;
   wire n13;
   wire n15;
   wire n17;
   wire n22;
   wire [1:0] sync_reg;

   assign test_so = sync_reg[1] ;

   SDFFRQX2M enable_flop_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(enable_flop), 
	.D(sync_reg[1]), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[1]  (.SI(sync_reg[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_reg[1]), 
	.D(sync_reg[0]), 
	.CK(CLK));
   SDFFRQX2M \sync_bus_reg[7]  (.SI(sync_bus[6]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[7]), 
	.D(n17), 
	.CK(CLK));
   SDFFRQX2M \sync_bus_reg[5]  (.SI(sync_bus[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[5]), 
	.D(n13), 
	.CK(CLK));
   SDFFRQX2M \sync_bus_reg[4]  (.SI(sync_bus[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[4]), 
	.D(n11), 
	.CK(CLK));
   SDFFRQX2M \sync_bus_reg[6]  (.SI(sync_bus[5]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[6]), 
	.D(n15), 
	.CK(CLK));
   SDFFRQX2M \sync_bus_reg[3]  (.SI(sync_bus[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[3]), 
	.D(n9), 
	.CK(CLK));
   SDFFRQX2M \sync_bus_reg[1]  (.SI(sync_bus[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[1]), 
	.D(n5), 
	.CK(CLK));
   SDFFRQX2M \sync_bus_reg[2]  (.SI(sync_bus[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[2]), 
	.D(n7), 
	.CK(CLK));
   SDFFRQX2M \sync_bus_reg[0]  (.SI(enable_pulse), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[0]), 
	.D(n3), 
	.CK(CLK));
   SDFFRQX2M enable_pulse_reg (.SI(enable_flop), 
	.SE(test_se), 
	.RN(RST), 
	.Q(enable_pulse), 
	.D(n22), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[0]  (.SI(sync_bus[7]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_reg[0]), 
	.D(bus_enable), 
	.CK(CLK));
   INVX2M U3 (.Y(n22), 
	.A(n1));
   NAND2BX2M U4 (.Y(n1), 
	.B(sync_reg[1]), 
	.AN(enable_flop));
   AO22X1M U5 (.Y(n3), 
	.B1(n1), 
	.B0(sync_bus[0]), 
	.A1(n22), 
	.A0(Unsync_bus[0]));
   AO22X1M U6 (.Y(n5), 
	.B1(n1), 
	.B0(sync_bus[1]), 
	.A1(n22), 
	.A0(Unsync_bus[1]));
   AO22X1M U7 (.Y(n7), 
	.B1(n1), 
	.B0(sync_bus[2]), 
	.A1(n22), 
	.A0(Unsync_bus[2]));
   AO22X1M U8 (.Y(n9), 
	.B1(n1), 
	.B0(sync_bus[3]), 
	.A1(n22), 
	.A0(Unsync_bus[3]));
   AO22X1M U9 (.Y(n11), 
	.B1(n1), 
	.B0(sync_bus[4]), 
	.A1(n22), 
	.A0(Unsync_bus[4]));
   AO22X1M U10 (.Y(n13), 
	.B1(n1), 
	.B0(sync_bus[5]), 
	.A1(n22), 
	.A0(Unsync_bus[5]));
   AO22X1M U11 (.Y(n15), 
	.B1(n1), 
	.B0(sync_bus[6]), 
	.A1(n22), 
	.A0(Unsync_bus[6]));
   AO22X1M U12 (.Y(n17), 
	.B1(n1), 
	.B0(sync_bus[7]), 
	.A1(n22), 
	.A0(Unsync_bus[7]));
endmodule

module Register_file_ADDR_WIDTH4_WIDTH8_DEPTH16_test_1 (
	WrData, 
	Address, 
	WrEn, 
	RdEn, 
	CLK, 
	RST, 
	RdData, 
	RdData_Valid, 
	REG0, 
	REG1, 
	REG2, 
	REG3, 
	test_si2, 
	test_si1, 
	test_so2, 
	test_so1, 
	test_se, 
	FE_OFN0_SYNC_RST11, 
	FE_OFN1_SYNC_RST11, 
	CLK_M__L4_N3, 
	CLK_M__L4_N4, 
	CLK_M__L4_N5);
   input [7:0] WrData;
   input [3:0] Address;
   input WrEn;
   input RdEn;
   input CLK;
   input RST;
   output [7:0] RdData;
   output RdData_Valid;
   output [7:0] REG0;
   output [7:0] REG1;
   output [7:0] REG2;
   output [7:0] REG3;
   input test_si2;
   input test_si1;
   output test_so2;
   output test_so1;
   input test_se;
   input FE_OFN0_SYNC_RST11;
   input FE_OFN1_SYNC_RST11;
   input CLK_M__L4_N3;
   input CLK_M__L4_N4;
   input CLK_M__L4_N5;

   // Internal wires
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire \Reg_File[15][7] ;
   wire \Reg_File[15][6] ;
   wire \Reg_File[15][5] ;
   wire \Reg_File[15][4] ;
   wire \Reg_File[15][3] ;
   wire \Reg_File[15][2] ;
   wire \Reg_File[15][1] ;
   wire \Reg_File[15][0] ;
   wire \Reg_File[14][7] ;
   wire \Reg_File[14][6] ;
   wire \Reg_File[14][5] ;
   wire \Reg_File[14][4] ;
   wire \Reg_File[14][3] ;
   wire \Reg_File[14][2] ;
   wire \Reg_File[14][1] ;
   wire \Reg_File[14][0] ;
   wire \Reg_File[13][7] ;
   wire \Reg_File[13][6] ;
   wire \Reg_File[13][5] ;
   wire \Reg_File[13][4] ;
   wire \Reg_File[13][3] ;
   wire \Reg_File[13][2] ;
   wire \Reg_File[13][1] ;
   wire \Reg_File[13][0] ;
   wire \Reg_File[12][7] ;
   wire \Reg_File[12][6] ;
   wire \Reg_File[12][5] ;
   wire \Reg_File[12][4] ;
   wire \Reg_File[12][3] ;
   wire \Reg_File[12][2] ;
   wire \Reg_File[12][1] ;
   wire \Reg_File[12][0] ;
   wire \Reg_File[11][7] ;
   wire \Reg_File[11][6] ;
   wire \Reg_File[11][5] ;
   wire \Reg_File[11][4] ;
   wire \Reg_File[11][3] ;
   wire \Reg_File[11][2] ;
   wire \Reg_File[11][1] ;
   wire \Reg_File[11][0] ;
   wire \Reg_File[10][7] ;
   wire \Reg_File[10][6] ;
   wire \Reg_File[10][5] ;
   wire \Reg_File[10][4] ;
   wire \Reg_File[10][3] ;
   wire \Reg_File[10][2] ;
   wire \Reg_File[10][1] ;
   wire \Reg_File[10][0] ;
   wire \Reg_File[9][7] ;
   wire \Reg_File[9][6] ;
   wire \Reg_File[9][5] ;
   wire \Reg_File[9][4] ;
   wire \Reg_File[9][3] ;
   wire \Reg_File[9][2] ;
   wire \Reg_File[9][1] ;
   wire \Reg_File[9][0] ;
   wire \Reg_File[8][7] ;
   wire \Reg_File[8][6] ;
   wire \Reg_File[8][5] ;
   wire \Reg_File[8][4] ;
   wire \Reg_File[8][3] ;
   wire \Reg_File[8][2] ;
   wire \Reg_File[8][1] ;
   wire \Reg_File[8][0] ;
   wire \Reg_File[7][7] ;
   wire \Reg_File[7][6] ;
   wire \Reg_File[7][5] ;
   wire \Reg_File[7][4] ;
   wire \Reg_File[7][3] ;
   wire \Reg_File[7][2] ;
   wire \Reg_File[7][1] ;
   wire \Reg_File[7][0] ;
   wire \Reg_File[6][7] ;
   wire \Reg_File[6][6] ;
   wire \Reg_File[6][5] ;
   wire \Reg_File[6][4] ;
   wire \Reg_File[6][3] ;
   wire \Reg_File[6][2] ;
   wire \Reg_File[6][1] ;
   wire \Reg_File[6][0] ;
   wire \Reg_File[5][7] ;
   wire \Reg_File[5][6] ;
   wire \Reg_File[5][5] ;
   wire \Reg_File[5][4] ;
   wire \Reg_File[5][3] ;
   wire \Reg_File[5][2] ;
   wire \Reg_File[5][1] ;
   wire \Reg_File[5][0] ;
   wire \Reg_File[4][7] ;
   wire \Reg_File[4][6] ;
   wire \Reg_File[4][5] ;
   wire \Reg_File[4][4] ;
   wire \Reg_File[4][3] ;
   wire \Reg_File[4][2] ;
   wire \Reg_File[4][1] ;
   wire \Reg_File[4][0] ;
   wire N36;
   wire N37;
   wire N38;
   wire N39;
   wire N40;
   wire N41;
   wire N42;
   wire N43;
   wire n149;
   wire n150;
   wire n151;
   wire n152;
   wire n153;
   wire n154;
   wire n155;
   wire n156;
   wire n157;
   wire n158;
   wire n159;
   wire n160;
   wire n161;
   wire n162;
   wire n163;
   wire n164;
   wire n165;
   wire n166;
   wire n167;
   wire n168;
   wire n169;
   wire n170;
   wire n171;
   wire n172;
   wire n173;
   wire n174;
   wire n175;
   wire n176;
   wire n177;
   wire n178;
   wire n179;
   wire n180;
   wire n181;
   wire n182;
   wire n183;
   wire n184;
   wire n185;
   wire n186;
   wire n187;
   wire n188;
   wire n189;
   wire n190;
   wire n191;
   wire n192;
   wire n193;
   wire n194;
   wire n195;
   wire n196;
   wire n197;
   wire n198;
   wire n199;
   wire n200;
   wire n201;
   wire n202;
   wire n203;
   wire n204;
   wire n205;
   wire n206;
   wire n207;
   wire n208;
   wire n209;
   wire n210;
   wire n211;
   wire n212;
   wire n213;
   wire n214;
   wire n215;
   wire n216;
   wire n217;
   wire n218;
   wire n219;
   wire n220;
   wire n221;
   wire n222;
   wire n223;
   wire n224;
   wire n225;
   wire n226;
   wire n227;
   wire n228;
   wire n229;
   wire n230;
   wire n231;
   wire n232;
   wire n233;
   wire n234;
   wire n235;
   wire n236;
   wire n237;
   wire n238;
   wire n239;
   wire n240;
   wire n241;
   wire n242;
   wire n243;
   wire n244;
   wire n245;
   wire n246;
   wire n247;
   wire n248;
   wire n249;
   wire n250;
   wire n251;
   wire n252;
   wire n253;
   wire n254;
   wire n255;
   wire n256;
   wire n257;
   wire n258;
   wire n259;
   wire n260;
   wire n261;
   wire n262;
   wire n263;
   wire n264;
   wire n265;
   wire n266;
   wire n267;
   wire n268;
   wire n269;
   wire n270;
   wire n271;
   wire n272;
   wire n273;
   wire n274;
   wire n275;
   wire n276;
   wire n277;
   wire n278;
   wire n279;
   wire n280;
   wire n281;
   wire n282;
   wire n283;
   wire n284;
   wire n285;
   wire n286;
   wire n287;
   wire n288;
   wire n289;
   wire n290;
   wire n291;
   wire n292;
   wire n293;
   wire n294;
   wire n295;
   wire n296;
   wire n297;
   wire n298;
   wire n299;
   wire n300;
   wire n301;
   wire n302;
   wire n303;
   wire n304;
   wire n305;
   wire n306;
   wire n307;
   wire n308;
   wire n309;
   wire n310;
   wire n311;
   wire n312;
   wire n138;
   wire n139;
   wire n140;
   wire n141;
   wire n142;
   wire n143;
   wire n144;
   wire n145;
   wire n146;
   wire n147;
   wire n148;
   wire n313;
   wire n314;
   wire n315;
   wire n316;
   wire n317;
   wire n318;
   wire n319;
   wire n320;
   wire n321;
   wire n322;
   wire n323;
   wire n324;
   wire n325;
   wire n326;
   wire n327;
   wire n328;
   wire n329;
   wire n330;
   wire n331;
   wire n332;
   wire n333;
   wire n335;
   wire n337;
   wire n338;
   wire n339;
   wire n340;
   wire n356;
   wire n357;
   wire n358;
   wire n359;
   wire n360;
   wire n361;
   wire n362;
   wire n363;
   wire n364;
   wire n368;
   wire n369;
   wire n370;
   wire n371;

   assign N11 = Address[0] ;
   assign N12 = Address[1] ;
   assign N13 = Address[2] ;
   assign N14 = Address[3] ;
   assign test_so2 = \Reg_File[15][7]  ;
   assign test_so1 = \Reg_File[5][4]  ;

   SDFFRQX2M \Reg_File_reg[13][7]  (.SI(\Reg_File[13][6] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[13][7] ), 
	.D(n296), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[13][6]  (.SI(\Reg_File[13][5] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[13][6] ), 
	.D(n295), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[13][5]  (.SI(\Reg_File[13][4] ), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[13][5] ), 
	.D(n294), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[13][4]  (.SI(\Reg_File[13][3] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[13][4] ), 
	.D(n293), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[13][3]  (.SI(\Reg_File[13][2] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[13][3] ), 
	.D(n292), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[13][2]  (.SI(\Reg_File[13][1] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[13][2] ), 
	.D(n291), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[13][1]  (.SI(\Reg_File[13][0] ), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[13][1] ), 
	.D(n290), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[13][0]  (.SI(\Reg_File[12][7] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[13][0] ), 
	.D(n289), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[9][7]  (.SI(\Reg_File[9][6] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[9][7] ), 
	.D(n264), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[9][6]  (.SI(\Reg_File[9][5] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[9][6] ), 
	.D(n263), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[9][5]  (.SI(\Reg_File[9][4] ), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[9][5] ), 
	.D(n262), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[9][4]  (.SI(\Reg_File[9][3] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[9][4] ), 
	.D(n261), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[9][3]  (.SI(\Reg_File[9][2] ), 
	.SE(n370), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(\Reg_File[9][3] ), 
	.D(n260), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[9][2]  (.SI(\Reg_File[9][1] ), 
	.SE(n369), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(\Reg_File[9][2] ), 
	.D(n259), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[9][1]  (.SI(\Reg_File[9][0] ), 
	.SE(n368), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(\Reg_File[9][1] ), 
	.D(n258), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[9][0]  (.SI(\Reg_File[8][7] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[9][0] ), 
	.D(n257), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[5][7]  (.SI(\Reg_File[5][6] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[5][7] ), 
	.D(n232), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[5][6]  (.SI(\Reg_File[5][5] ), 
	.SE(n369), 
	.RN(RST), 
	.Q(\Reg_File[5][6] ), 
	.D(n231), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[5][5]  (.SI(test_si2), 
	.SE(n368), 
	.RN(RST), 
	.Q(\Reg_File[5][5] ), 
	.D(n230), 
	.CK(CLK_M__L4_N5));
   SDFFRQX4M \Reg_File_reg[5][4]  (.SI(\Reg_File[5][3] ), 
	.SE(n371), 
	.RN(RST), 
	.Q(\Reg_File[5][4] ), 
	.D(n229), 
	.CK(CLK));
   SDFFRQX2M \Reg_File_reg[5][3]  (.SI(\Reg_File[5][2] ), 
	.SE(n370), 
	.RN(RST), 
	.Q(\Reg_File[5][3] ), 
	.D(n228), 
	.CK(CLK));
   SDFFRQX2M \Reg_File_reg[5][2]  (.SI(\Reg_File[5][1] ), 
	.SE(n369), 
	.RN(RST), 
	.Q(\Reg_File[5][2] ), 
	.D(n227), 
	.CK(CLK));
   SDFFRQX2M \Reg_File_reg[5][1]  (.SI(\Reg_File[5][0] ), 
	.SE(n368), 
	.RN(RST), 
	.Q(\Reg_File[5][1] ), 
	.D(n226), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[5][0]  (.SI(\Reg_File[4][7] ), 
	.SE(n371), 
	.RN(RST), 
	.Q(\Reg_File[5][0] ), 
	.D(n225), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[15][7]  (.SI(\Reg_File[15][6] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[15][7] ), 
	.D(n312), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[15][6]  (.SI(\Reg_File[15][5] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[15][6] ), 
	.D(n311), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[15][5]  (.SI(\Reg_File[15][4] ), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[15][5] ), 
	.D(n310), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[15][4]  (.SI(\Reg_File[15][3] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[15][4] ), 
	.D(n309), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[15][3]  (.SI(\Reg_File[15][2] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[15][3] ), 
	.D(n308), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[15][2]  (.SI(\Reg_File[15][1] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[15][2] ), 
	.D(n307), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[15][1]  (.SI(\Reg_File[15][0] ), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[15][1] ), 
	.D(n306), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[15][0]  (.SI(\Reg_File[14][7] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[15][0] ), 
	.D(n305), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[11][7]  (.SI(\Reg_File[11][6] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[11][7] ), 
	.D(n280), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[11][6]  (.SI(\Reg_File[11][5] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[11][6] ), 
	.D(n279), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[11][5]  (.SI(\Reg_File[11][4] ), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[11][5] ), 
	.D(n278), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[11][4]  (.SI(\Reg_File[11][3] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[11][4] ), 
	.D(n277), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[11][3]  (.SI(\Reg_File[11][2] ), 
	.SE(n370), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(\Reg_File[11][3] ), 
	.D(n276), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[11][2]  (.SI(\Reg_File[11][1] ), 
	.SE(n369), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(\Reg_File[11][2] ), 
	.D(n275), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[11][1]  (.SI(\Reg_File[11][0] ), 
	.SE(n368), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(\Reg_File[11][1] ), 
	.D(n274), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[11][0]  (.SI(\Reg_File[10][7] ), 
	.SE(n371), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(\Reg_File[11][0] ), 
	.D(n273), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[7][7]  (.SI(\Reg_File[7][6] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[7][7] ), 
	.D(n248), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[7][6]  (.SI(\Reg_File[7][5] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[7][6] ), 
	.D(n247), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[7][5]  (.SI(\Reg_File[7][4] ), 
	.SE(n368), 
	.RN(RST), 
	.Q(\Reg_File[7][5] ), 
	.D(n246), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[7][4]  (.SI(\Reg_File[7][3] ), 
	.SE(n371), 
	.RN(RST), 
	.Q(\Reg_File[7][4] ), 
	.D(n245), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[7][3]  (.SI(\Reg_File[7][2] ), 
	.SE(n370), 
	.RN(RST), 
	.Q(\Reg_File[7][3] ), 
	.D(n244), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[7][2]  (.SI(\Reg_File[7][1] ), 
	.SE(n369), 
	.RN(RST), 
	.Q(\Reg_File[7][2] ), 
	.D(n243), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[7][1]  (.SI(\Reg_File[7][0] ), 
	.SE(n368), 
	.RN(RST), 
	.Q(\Reg_File[7][1] ), 
	.D(n242), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[7][0]  (.SI(\Reg_File[6][7] ), 
	.SE(n371), 
	.RN(RST), 
	.Q(\Reg_File[7][0] ), 
	.D(n241), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[14][7]  (.SI(\Reg_File[14][6] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[14][7] ), 
	.D(n304), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[14][6]  (.SI(\Reg_File[14][5] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[14][6] ), 
	.D(n303), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[14][5]  (.SI(\Reg_File[14][4] ), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[14][5] ), 
	.D(n302), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[14][4]  (.SI(\Reg_File[14][3] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[14][4] ), 
	.D(n301), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[14][3]  (.SI(\Reg_File[14][2] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[14][3] ), 
	.D(n300), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[14][2]  (.SI(\Reg_File[14][1] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[14][2] ), 
	.D(n299), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[14][1]  (.SI(\Reg_File[14][0] ), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[14][1] ), 
	.D(n298), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[14][0]  (.SI(\Reg_File[13][7] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[14][0] ), 
	.D(n297), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[10][7]  (.SI(\Reg_File[10][6] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[10][7] ), 
	.D(n272), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[10][6]  (.SI(\Reg_File[10][5] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[10][6] ), 
	.D(n271), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[10][5]  (.SI(\Reg_File[10][4] ), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[10][5] ), 
	.D(n270), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[10][4]  (.SI(\Reg_File[10][3] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[10][4] ), 
	.D(n269), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[10][3]  (.SI(\Reg_File[10][2] ), 
	.SE(n370), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(\Reg_File[10][3] ), 
	.D(n268), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[10][2]  (.SI(\Reg_File[10][1] ), 
	.SE(n369), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(\Reg_File[10][2] ), 
	.D(n267), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[10][1]  (.SI(\Reg_File[10][0] ), 
	.SE(n368), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(\Reg_File[10][1] ), 
	.D(n266), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[10][0]  (.SI(\Reg_File[9][7] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[10][0] ), 
	.D(n265), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[6][7]  (.SI(\Reg_File[6][6] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[6][7] ), 
	.D(n240), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[6][6]  (.SI(\Reg_File[6][5] ), 
	.SE(n369), 
	.RN(RST), 
	.Q(\Reg_File[6][6] ), 
	.D(n239), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[6][5]  (.SI(\Reg_File[6][4] ), 
	.SE(n368), 
	.RN(RST), 
	.Q(\Reg_File[6][5] ), 
	.D(n238), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[6][4]  (.SI(\Reg_File[6][3] ), 
	.SE(n371), 
	.RN(RST), 
	.Q(\Reg_File[6][4] ), 
	.D(n237), 
	.CK(CLK));
   SDFFRQX2M \Reg_File_reg[6][3]  (.SI(\Reg_File[6][2] ), 
	.SE(n370), 
	.RN(RST), 
	.Q(\Reg_File[6][3] ), 
	.D(n236), 
	.CK(CLK));
   SDFFRQX2M \Reg_File_reg[6][2]  (.SI(\Reg_File[6][1] ), 
	.SE(n369), 
	.RN(RST), 
	.Q(\Reg_File[6][2] ), 
	.D(n235), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[6][1]  (.SI(\Reg_File[6][0] ), 
	.SE(n368), 
	.RN(RST), 
	.Q(\Reg_File[6][1] ), 
	.D(n234), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[6][0]  (.SI(\Reg_File[5][7] ), 
	.SE(n371), 
	.RN(RST), 
	.Q(\Reg_File[6][0] ), 
	.D(n233), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[12][7]  (.SI(\Reg_File[12][6] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[12][7] ), 
	.D(n288), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[12][6]  (.SI(\Reg_File[12][5] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[12][6] ), 
	.D(n287), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[12][5]  (.SI(\Reg_File[12][4] ), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[12][5] ), 
	.D(n286), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[12][4]  (.SI(\Reg_File[12][3] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[12][4] ), 
	.D(n285), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[12][3]  (.SI(\Reg_File[12][2] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[12][3] ), 
	.D(n284), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[12][2]  (.SI(\Reg_File[12][1] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[12][2] ), 
	.D(n283), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[12][1]  (.SI(\Reg_File[12][0] ), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[12][1] ), 
	.D(n282), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[12][0]  (.SI(\Reg_File[11][7] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[12][0] ), 
	.D(n281), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[8][7]  (.SI(\Reg_File[8][6] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[8][7] ), 
	.D(n256), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[8][6]  (.SI(\Reg_File[8][5] ), 
	.SE(n369), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[8][6] ), 
	.D(n255), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[8][5]  (.SI(\Reg_File[8][4] ), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[8][5] ), 
	.D(n254), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[8][4]  (.SI(\Reg_File[8][3] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[8][4] ), 
	.D(n253), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[8][3]  (.SI(\Reg_File[8][2] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[8][3] ), 
	.D(n252), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[8][2]  (.SI(\Reg_File[8][1] ), 
	.SE(n369), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(\Reg_File[8][2] ), 
	.D(n251), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[8][1]  (.SI(\Reg_File[8][0] ), 
	.SE(n368), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(\Reg_File[8][1] ), 
	.D(n250), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[8][0]  (.SI(\Reg_File[7][7] ), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[8][0] ), 
	.D(n249), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[4][7]  (.SI(\Reg_File[4][6] ), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(\Reg_File[4][7] ), 
	.D(n224), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[4][6]  (.SI(\Reg_File[4][5] ), 
	.SE(n369), 
	.RN(RST), 
	.Q(\Reg_File[4][6] ), 
	.D(n223), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[4][5]  (.SI(\Reg_File[4][4] ), 
	.SE(n368), 
	.RN(RST), 
	.Q(\Reg_File[4][5] ), 
	.D(n222), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[4][4]  (.SI(\Reg_File[4][3] ), 
	.SE(n371), 
	.RN(RST), 
	.Q(\Reg_File[4][4] ), 
	.D(n221), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[4][3]  (.SI(\Reg_File[4][2] ), 
	.SE(n370), 
	.RN(RST), 
	.Q(\Reg_File[4][3] ), 
	.D(n220), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[4][2]  (.SI(\Reg_File[4][1] ), 
	.SE(n369), 
	.RN(RST), 
	.Q(\Reg_File[4][2] ), 
	.D(n219), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[4][1]  (.SI(\Reg_File[4][0] ), 
	.SE(n368), 
	.RN(RST), 
	.Q(\Reg_File[4][1] ), 
	.D(n218), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[4][0]  (.SI(REG3[7]), 
	.SE(n371), 
	.RN(RST), 
	.Q(\Reg_File[4][0] ), 
	.D(n217), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \RdData_reg[7]  (.SI(RdData[6]), 
	.SE(n370), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(RdData[7]), 
	.D(n184), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \RdData_reg[6]  (.SI(RdData[5]), 
	.SE(n369), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(RdData[6]), 
	.D(n183), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \RdData_reg[5]  (.SI(RdData[4]), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(RdData[5]), 
	.D(n182), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \RdData_reg[4]  (.SI(RdData[3]), 
	.SE(n371), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(RdData[4]), 
	.D(n181), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \RdData_reg[3]  (.SI(RdData[2]), 
	.SE(n370), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(RdData[3]), 
	.D(n180), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \RdData_reg[2]  (.SI(RdData[1]), 
	.SE(n369), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(RdData[2]), 
	.D(n179), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \RdData_reg[1]  (.SI(RdData[0]), 
	.SE(n368), 
	.RN(RST), 
	.Q(RdData[1]), 
	.D(n178), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \RdData_reg[0]  (.SI(RdData_Valid), 
	.SE(n371), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(RdData[0]), 
	.D(n177), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[3][0]  (.SI(REG2[7]), 
	.SE(n370), 
	.RN(RST), 
	.Q(REG3[0]), 
	.D(n209), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[2][1]  (.SI(REG2[0]), 
	.SE(n369), 
	.RN(RST), 
	.Q(REG2[1]), 
	.D(n202), 
	.CK(CLK));
   SDFFRQX2M \Reg_File_reg[0][7]  (.SI(REG0[6]), 
	.SE(n368), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(REG0[7]), 
	.D(n192), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[0][6]  (.SI(REG0[5]), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(REG0[6]), 
	.D(n191), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[0][5]  (.SI(REG0[4]), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(REG0[5]), 
	.D(n190), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[0][4]  (.SI(REG0[3]), 
	.SE(n369), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(REG0[4]), 
	.D(n189), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[0][3]  (.SI(REG0[2]), 
	.SE(n368), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(REG0[3]), 
	.D(n188), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[0][2]  (.SI(REG0[1]), 
	.SE(n371), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(REG0[2]), 
	.D(n187), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[0][1]  (.SI(REG0[0]), 
	.SE(n370), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(REG0[1]), 
	.D(n186), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[0][0]  (.SI(RdData[7]), 
	.SE(n369), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(REG0[0]), 
	.D(n185), 
	.CK(CLK_M__L4_N3));
   SDFFSQX2M \Reg_File_reg[2][0]  (.SN(RST), 
	.SI(REG1[7]), 
	.SE(test_se), 
	.Q(REG2[0]), 
	.D(n201), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[1][5]  (.SI(REG1[4]), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(REG1[5]), 
	.D(n198), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[1][4]  (.SI(REG1[3]), 
	.SE(n371), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(REG1[4]), 
	.D(n197), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[1][7]  (.SI(REG1[6]), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(REG1[7]), 
	.D(n200), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[1][1]  (.SI(REG1[0]), 
	.SE(n369), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(REG1[1]), 
	.D(n194), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[1][3]  (.SI(REG1[2]), 
	.SE(n368), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(REG1[3]), 
	.D(n196), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[1][2]  (.SI(REG1[1]), 
	.SE(n371), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(REG1[2]), 
	.D(n195), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[1][6]  (.SI(REG1[5]), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(REG1[6]), 
	.D(n199), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M \Reg_File_reg[1][0]  (.SI(REG0[7]), 
	.SE(n369), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(REG1[0]), 
	.D(n193), 
	.CK(CLK_M__L4_N3));
   SDFFRQX2M RdData_Valid_reg (.SI(test_si1), 
	.SE(n368), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(RdData_Valid), 
	.D(n364), 
	.CK(CLK_M__L4_N3));
   SDFFSQX2M \Reg_File_reg[3][5]  (.SN(FE_OFN0_SYNC_RST11), 
	.SI(REG3[4]), 
	.SE(n368), 
	.Q(REG3[5]), 
	.D(n214), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[3][3]  (.SI(REG3[2]), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(REG3[3]), 
	.D(n212), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[3][4]  (.SI(REG3[3]), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(REG3[4]), 
	.D(n213), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[3][7]  (.SI(REG3[6]), 
	.SE(n369), 
	.RN(RST), 
	.Q(REG3[7]), 
	.D(n216), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[3][6]  (.SI(REG3[5]), 
	.SE(n368), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(REG3[6]), 
	.D(n215), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[3][2]  (.SI(REG3[1]), 
	.SE(n371), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(REG3[2]), 
	.D(n211), 
	.CK(CLK_M__L4_N4));
   SDFFRQX2M \Reg_File_reg[3][1]  (.SI(REG3[0]), 
	.SE(n370), 
	.RN(FE_OFN0_SYNC_RST11), 
	.Q(REG3[1]), 
	.D(n210), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[2][4]  (.SI(REG2[3]), 
	.SE(n369), 
	.RN(RST), 
	.Q(REG2[4]), 
	.D(n205), 
	.CK(CLK));
   SDFFRQX2M \Reg_File_reg[2][3]  (.SI(REG2[2]), 
	.SE(n368), 
	.RN(RST), 
	.Q(REG2[3]), 
	.D(n204), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[2][6]  (.SI(REG2[5]), 
	.SE(n371), 
	.RN(RST), 
	.Q(REG2[6]), 
	.D(n207), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[2][5]  (.SI(REG2[4]), 
	.SE(n370), 
	.RN(RST), 
	.Q(REG2[5]), 
	.D(n206), 
	.CK(CLK));
   SDFFSQX2M \Reg_File_reg[2][7]  (.SN(RST), 
	.SI(REG2[6]), 
	.SE(n371), 
	.Q(REG2[7]), 
	.D(n208), 
	.CK(CLK_M__L4_N5));
   SDFFRQX2M \Reg_File_reg[2][2]  (.SI(REG2[1]), 
	.SE(n369), 
	.RN(RST), 
	.Q(REG2[2]), 
	.D(n203), 
	.CK(CLK));
   NOR2X2M U140 (.Y(n156), 
	.B(N13), 
	.A(n340));
   NOR2X2M U141 (.Y(n151), 
	.B(N13), 
	.A(N12));
   NOR2BX2M U142 (.Y(n169), 
	.B(n339), 
	.AN(n175));
   NOR2BX2M U143 (.Y(n159), 
	.B(N12), 
	.AN(N13));
   NOR2BX2M U144 (.Y(n162), 
	.B(n340), 
	.AN(N13));
   NOR2BX2M U145 (.Y(n154), 
	.B(n339), 
	.AN(n163));
   INVX2M U146 (.Y(n362), 
	.A(WrData[6]));
   INVX4M U147 (.Y(n338), 
	.A(n339));
   INVX4M U148 (.Y(n337), 
	.A(n339));
   INVX2M U149 (.Y(n335), 
	.A(n340));
   INVX2M U152 (.Y(n364), 
	.A(n149));
   NOR2BX2M U153 (.Y(n152), 
	.B(n337), 
	.AN(n163));
   NOR2BX2M U154 (.Y(n167), 
	.B(n337), 
	.AN(n175));
   NAND2X2M U155 (.Y(n153), 
	.B(n151), 
	.A(n154));
   NAND2X2M U156 (.Y(n166), 
	.B(n151), 
	.A(n167));
   NAND2X2M U157 (.Y(n168), 
	.B(n151), 
	.A(n169));
   NAND2X2M U158 (.Y(n170), 
	.B(n156), 
	.A(n167));
   NAND2X2M U159 (.Y(n171), 
	.B(n156), 
	.A(n169));
   NAND2X2M U160 (.Y(n155), 
	.B(n152), 
	.A(n156));
   NAND2X2M U161 (.Y(n157), 
	.B(n154), 
	.A(n156));
   NAND2X2M U162 (.Y(n158), 
	.B(n152), 
	.A(n159));
   NAND2X2M U163 (.Y(n160), 
	.B(n154), 
	.A(n159));
   NAND2X2M U164 (.Y(n161), 
	.B(n152), 
	.A(n162));
   NAND2X2M U165 (.Y(n164), 
	.B(n154), 
	.A(n162));
   NAND2X2M U166 (.Y(n172), 
	.B(n159), 
	.A(n167));
   NAND2X2M U167 (.Y(n173), 
	.B(n159), 
	.A(n169));
   NAND2X2M U168 (.Y(n174), 
	.B(n162), 
	.A(n167));
   NAND2X2M U169 (.Y(n176), 
	.B(n162), 
	.A(n169));
   NAND2X2M U170 (.Y(n150), 
	.B(n152), 
	.A(n151));
   NOR2BX2M U171 (.Y(n165), 
	.B(RdEn), 
	.AN(WrEn));
   NAND2BX2M U172 (.Y(n149), 
	.B(RdEn), 
	.AN(WrEn));
   NOR2BX2M U183 (.Y(n163), 
	.B(N14), 
	.AN(n165));
   AND2X2M U184 (.Y(n175), 
	.B(n165), 
	.A(N14));
   INVX2M U185 (.Y(n357), 
	.A(WrData[1]));
   INVX2M U186 (.Y(n358), 
	.A(WrData[2]));
   INVX2M U187 (.Y(n356), 
	.A(WrData[0]));
   INVX2M U188 (.Y(n359), 
	.A(WrData[3]));
   INVX2M U189 (.Y(n360), 
	.A(WrData[4]));
   INVX2M U190 (.Y(n361), 
	.A(WrData[5]));
   INVX2M U191 (.Y(n363), 
	.A(WrData[7]));
   OAI2BB2X1M U197 (.Y(n185), 
	.B1(n356), 
	.B0(n150), 
	.A1N(n150), 
	.A0N(REG0[0]));
   OAI2BB2X1M U198 (.Y(n186), 
	.B1(n357), 
	.B0(n150), 
	.A1N(n150), 
	.A0N(REG0[1]));
   OAI2BB2X1M U199 (.Y(n187), 
	.B1(n358), 
	.B0(n150), 
	.A1N(n150), 
	.A0N(REG0[2]));
   OAI2BB2X1M U200 (.Y(n188), 
	.B1(n359), 
	.B0(n150), 
	.A1N(n150), 
	.A0N(REG0[3]));
   OAI2BB2X1M U201 (.Y(n189), 
	.B1(n360), 
	.B0(n150), 
	.A1N(n150), 
	.A0N(REG0[4]));
   OAI2BB2X1M U202 (.Y(n190), 
	.B1(n361), 
	.B0(n150), 
	.A1N(n150), 
	.A0N(REG0[5]));
   OAI2BB2X1M U203 (.Y(n191), 
	.B1(n362), 
	.B0(n150), 
	.A1N(n150), 
	.A0N(REG0[6]));
   OAI2BB2X1M U204 (.Y(n192), 
	.B1(n363), 
	.B0(n150), 
	.A1N(n150), 
	.A0N(REG0[7]));
   OAI2BB2X1M U205 (.Y(n193), 
	.B1(n153), 
	.B0(n356), 
	.A1N(n153), 
	.A0N(REG1[0]));
   OAI2BB2X1M U206 (.Y(n194), 
	.B1(n153), 
	.B0(n357), 
	.A1N(n153), 
	.A0N(REG1[1]));
   OAI2BB2X1M U207 (.Y(n195), 
	.B1(n153), 
	.B0(n358), 
	.A1N(n153), 
	.A0N(REG1[2]));
   OAI2BB2X1M U208 (.Y(n196), 
	.B1(n153), 
	.B0(n359), 
	.A1N(n153), 
	.A0N(REG1[3]));
   OAI2BB2X1M U209 (.Y(n197), 
	.B1(n153), 
	.B0(n360), 
	.A1N(n153), 
	.A0N(REG1[4]));
   OAI2BB2X1M U210 (.Y(n198), 
	.B1(n153), 
	.B0(n361), 
	.A1N(n153), 
	.A0N(REG1[5]));
   OAI2BB2X1M U211 (.Y(n199), 
	.B1(n153), 
	.B0(n362), 
	.A1N(n153), 
	.A0N(REG1[6]));
   OAI2BB2X1M U212 (.Y(n200), 
	.B1(n153), 
	.B0(n363), 
	.A1N(n153), 
	.A0N(REG1[7]));
   OAI2BB2X1M U213 (.Y(n217), 
	.B1(n158), 
	.B0(n356), 
	.A1N(n158), 
	.A0N(\Reg_File[4][0] ));
   OAI2BB2X1M U214 (.Y(n218), 
	.B1(n158), 
	.B0(n357), 
	.A1N(n158), 
	.A0N(\Reg_File[4][1] ));
   OAI2BB2X1M U215 (.Y(n219), 
	.B1(n158), 
	.B0(n358), 
	.A1N(n158), 
	.A0N(\Reg_File[4][2] ));
   OAI2BB2X1M U216 (.Y(n220), 
	.B1(n158), 
	.B0(n359), 
	.A1N(n158), 
	.A0N(\Reg_File[4][3] ));
   OAI2BB2X1M U217 (.Y(n221), 
	.B1(n158), 
	.B0(n360), 
	.A1N(n158), 
	.A0N(\Reg_File[4][4] ));
   OAI2BB2X1M U218 (.Y(n222), 
	.B1(n158), 
	.B0(n361), 
	.A1N(n158), 
	.A0N(\Reg_File[4][5] ));
   OAI2BB2X1M U219 (.Y(n223), 
	.B1(n158), 
	.B0(n362), 
	.A1N(n158), 
	.A0N(\Reg_File[4][6] ));
   OAI2BB2X1M U220 (.Y(n224), 
	.B1(n158), 
	.B0(n363), 
	.A1N(n158), 
	.A0N(\Reg_File[4][7] ));
   OAI2BB2X1M U221 (.Y(n225), 
	.B1(n160), 
	.B0(n356), 
	.A1N(n160), 
	.A0N(\Reg_File[5][0] ));
   OAI2BB2X1M U222 (.Y(n226), 
	.B1(n160), 
	.B0(n357), 
	.A1N(n160), 
	.A0N(\Reg_File[5][1] ));
   OAI2BB2X1M U223 (.Y(n227), 
	.B1(n160), 
	.B0(n358), 
	.A1N(n160), 
	.A0N(\Reg_File[5][2] ));
   OAI2BB2X1M U224 (.Y(n228), 
	.B1(n160), 
	.B0(n359), 
	.A1N(n160), 
	.A0N(\Reg_File[5][3] ));
   OAI2BB2X1M U225 (.Y(n229), 
	.B1(n160), 
	.B0(n360), 
	.A1N(n160), 
	.A0N(\Reg_File[5][4] ));
   OAI2BB2X1M U226 (.Y(n230), 
	.B1(n160), 
	.B0(n361), 
	.A1N(n160), 
	.A0N(\Reg_File[5][5] ));
   OAI2BB2X1M U227 (.Y(n231), 
	.B1(n160), 
	.B0(n362), 
	.A1N(n160), 
	.A0N(\Reg_File[5][6] ));
   OAI2BB2X1M U228 (.Y(n232), 
	.B1(n160), 
	.B0(n363), 
	.A1N(n160), 
	.A0N(\Reg_File[5][7] ));
   OAI2BB2X1M U229 (.Y(n233), 
	.B1(n161), 
	.B0(n356), 
	.A1N(n161), 
	.A0N(\Reg_File[6][0] ));
   OAI2BB2X1M U230 (.Y(n234), 
	.B1(n161), 
	.B0(n357), 
	.A1N(n161), 
	.A0N(\Reg_File[6][1] ));
   OAI2BB2X1M U231 (.Y(n235), 
	.B1(n161), 
	.B0(n358), 
	.A1N(n161), 
	.A0N(\Reg_File[6][2] ));
   OAI2BB2X1M U232 (.Y(n236), 
	.B1(n161), 
	.B0(n359), 
	.A1N(n161), 
	.A0N(\Reg_File[6][3] ));
   OAI2BB2X1M U233 (.Y(n237), 
	.B1(n161), 
	.B0(n360), 
	.A1N(n161), 
	.A0N(\Reg_File[6][4] ));
   OAI2BB2X1M U234 (.Y(n238), 
	.B1(n161), 
	.B0(n361), 
	.A1N(n161), 
	.A0N(\Reg_File[6][5] ));
   OAI2BB2X1M U235 (.Y(n239), 
	.B1(n161), 
	.B0(n362), 
	.A1N(n161), 
	.A0N(\Reg_File[6][6] ));
   OAI2BB2X1M U236 (.Y(n240), 
	.B1(n161), 
	.B0(n363), 
	.A1N(n161), 
	.A0N(\Reg_File[6][7] ));
   OAI2BB2X1M U237 (.Y(n241), 
	.B1(n164), 
	.B0(n356), 
	.A1N(n164), 
	.A0N(\Reg_File[7][0] ));
   OAI2BB2X1M U238 (.Y(n242), 
	.B1(n164), 
	.B0(n357), 
	.A1N(n164), 
	.A0N(\Reg_File[7][1] ));
   OAI2BB2X1M U239 (.Y(n243), 
	.B1(n164), 
	.B0(n358), 
	.A1N(n164), 
	.A0N(\Reg_File[7][2] ));
   OAI2BB2X1M U240 (.Y(n244), 
	.B1(n164), 
	.B0(n359), 
	.A1N(n164), 
	.A0N(\Reg_File[7][3] ));
   OAI2BB2X1M U241 (.Y(n245), 
	.B1(n164), 
	.B0(n360), 
	.A1N(n164), 
	.A0N(\Reg_File[7][4] ));
   OAI2BB2X1M U242 (.Y(n246), 
	.B1(n164), 
	.B0(n361), 
	.A1N(n164), 
	.A0N(\Reg_File[7][5] ));
   OAI2BB2X1M U243 (.Y(n247), 
	.B1(n164), 
	.B0(n362), 
	.A1N(n164), 
	.A0N(\Reg_File[7][6] ));
   OAI2BB2X1M U244 (.Y(n248), 
	.B1(n164), 
	.B0(n363), 
	.A1N(n164), 
	.A0N(\Reg_File[7][7] ));
   OAI2BB2X1M U245 (.Y(n202), 
	.B1(n155), 
	.B0(n357), 
	.A1N(n155), 
	.A0N(REG2[1]));
   OAI2BB2X1M U246 (.Y(n203), 
	.B1(n155), 
	.B0(n358), 
	.A1N(n155), 
	.A0N(REG2[2]));
   OAI2BB2X1M U247 (.Y(n204), 
	.B1(n155), 
	.B0(n359), 
	.A1N(n155), 
	.A0N(REG2[3]));
   OAI2BB2X1M U248 (.Y(n205), 
	.B1(n155), 
	.B0(n360), 
	.A1N(n155), 
	.A0N(REG2[4]));
   OAI2BB2X1M U249 (.Y(n206), 
	.B1(n155), 
	.B0(n361), 
	.A1N(n155), 
	.A0N(REG2[5]));
   OAI2BB2X1M U250 (.Y(n207), 
	.B1(n155), 
	.B0(n362), 
	.A1N(n155), 
	.A0N(REG2[6]));
   OAI2BB2X1M U251 (.Y(n209), 
	.B1(n157), 
	.B0(n356), 
	.A1N(n157), 
	.A0N(REG3[0]));
   OAI2BB2X1M U252 (.Y(n210), 
	.B1(n157), 
	.B0(n357), 
	.A1N(n157), 
	.A0N(REG3[1]));
   OAI2BB2X1M U253 (.Y(n211), 
	.B1(n157), 
	.B0(n358), 
	.A1N(n157), 
	.A0N(REG3[2]));
   OAI2BB2X1M U254 (.Y(n212), 
	.B1(n157), 
	.B0(n359), 
	.A1N(n157), 
	.A0N(REG3[3]));
   OAI2BB2X1M U255 (.Y(n213), 
	.B1(n157), 
	.B0(n360), 
	.A1N(n157), 
	.A0N(REG3[4]));
   OAI2BB2X1M U256 (.Y(n215), 
	.B1(n157), 
	.B0(n362), 
	.A1N(n157), 
	.A0N(REG3[6]));
   OAI2BB2X1M U257 (.Y(n216), 
	.B1(n157), 
	.B0(n363), 
	.A1N(n157), 
	.A0N(REG3[7]));
   OAI2BB2X1M U258 (.Y(n249), 
	.B1(n166), 
	.B0(n356), 
	.A1N(n166), 
	.A0N(\Reg_File[8][0] ));
   OAI2BB2X1M U259 (.Y(n250), 
	.B1(n166), 
	.B0(n357), 
	.A1N(n166), 
	.A0N(\Reg_File[8][1] ));
   OAI2BB2X1M U260 (.Y(n251), 
	.B1(n166), 
	.B0(n358), 
	.A1N(n166), 
	.A0N(\Reg_File[8][2] ));
   OAI2BB2X1M U261 (.Y(n252), 
	.B1(n166), 
	.B0(n359), 
	.A1N(n166), 
	.A0N(\Reg_File[8][3] ));
   OAI2BB2X1M U262 (.Y(n253), 
	.B1(n166), 
	.B0(n360), 
	.A1N(n166), 
	.A0N(\Reg_File[8][4] ));
   OAI2BB2X1M U263 (.Y(n254), 
	.B1(n166), 
	.B0(n361), 
	.A1N(n166), 
	.A0N(\Reg_File[8][5] ));
   OAI2BB2X1M U264 (.Y(n255), 
	.B1(n166), 
	.B0(n362), 
	.A1N(n166), 
	.A0N(\Reg_File[8][6] ));
   OAI2BB2X1M U265 (.Y(n256), 
	.B1(n166), 
	.B0(n363), 
	.A1N(n166), 
	.A0N(\Reg_File[8][7] ));
   OAI2BB2X1M U266 (.Y(n257), 
	.B1(n168), 
	.B0(n356), 
	.A1N(n168), 
	.A0N(\Reg_File[9][0] ));
   OAI2BB2X1M U267 (.Y(n258), 
	.B1(n168), 
	.B0(n357), 
	.A1N(n168), 
	.A0N(\Reg_File[9][1] ));
   OAI2BB2X1M U268 (.Y(n259), 
	.B1(n168), 
	.B0(n358), 
	.A1N(n168), 
	.A0N(\Reg_File[9][2] ));
   OAI2BB2X1M U269 (.Y(n260), 
	.B1(n168), 
	.B0(n359), 
	.A1N(n168), 
	.A0N(\Reg_File[9][3] ));
   OAI2BB2X1M U270 (.Y(n261), 
	.B1(n168), 
	.B0(n360), 
	.A1N(n168), 
	.A0N(\Reg_File[9][4] ));
   OAI2BB2X1M U271 (.Y(n262), 
	.B1(n168), 
	.B0(n361), 
	.A1N(n168), 
	.A0N(\Reg_File[9][5] ));
   OAI2BB2X1M U272 (.Y(n263), 
	.B1(n168), 
	.B0(n362), 
	.A1N(n168), 
	.A0N(\Reg_File[9][6] ));
   OAI2BB2X1M U273 (.Y(n264), 
	.B1(n168), 
	.B0(n363), 
	.A1N(n168), 
	.A0N(\Reg_File[9][7] ));
   OAI2BB2X1M U274 (.Y(n265), 
	.B1(n170), 
	.B0(n356), 
	.A1N(n170), 
	.A0N(\Reg_File[10][0] ));
   OAI2BB2X1M U275 (.Y(n266), 
	.B1(n170), 
	.B0(n357), 
	.A1N(n170), 
	.A0N(\Reg_File[10][1] ));
   OAI2BB2X1M U276 (.Y(n267), 
	.B1(n170), 
	.B0(n358), 
	.A1N(n170), 
	.A0N(\Reg_File[10][2] ));
   OAI2BB2X1M U277 (.Y(n268), 
	.B1(n170), 
	.B0(n359), 
	.A1N(n170), 
	.A0N(\Reg_File[10][3] ));
   OAI2BB2X1M U278 (.Y(n269), 
	.B1(n170), 
	.B0(n360), 
	.A1N(n170), 
	.A0N(\Reg_File[10][4] ));
   OAI2BB2X1M U279 (.Y(n270), 
	.B1(n170), 
	.B0(n361), 
	.A1N(n170), 
	.A0N(\Reg_File[10][5] ));
   OAI2BB2X1M U280 (.Y(n271), 
	.B1(n170), 
	.B0(n362), 
	.A1N(n170), 
	.A0N(\Reg_File[10][6] ));
   OAI2BB2X1M U281 (.Y(n272), 
	.B1(n170), 
	.B0(n363), 
	.A1N(n170), 
	.A0N(\Reg_File[10][7] ));
   OAI2BB2X1M U282 (.Y(n273), 
	.B1(n171), 
	.B0(n356), 
	.A1N(n171), 
	.A0N(\Reg_File[11][0] ));
   OAI2BB2X1M U283 (.Y(n274), 
	.B1(n171), 
	.B0(n357), 
	.A1N(n171), 
	.A0N(\Reg_File[11][1] ));
   OAI2BB2X1M U284 (.Y(n275), 
	.B1(n171), 
	.B0(n358), 
	.A1N(n171), 
	.A0N(\Reg_File[11][2] ));
   OAI2BB2X1M U285 (.Y(n276), 
	.B1(n171), 
	.B0(n359), 
	.A1N(n171), 
	.A0N(\Reg_File[11][3] ));
   OAI2BB2X1M U286 (.Y(n277), 
	.B1(n171), 
	.B0(n360), 
	.A1N(n171), 
	.A0N(\Reg_File[11][4] ));
   OAI2BB2X1M U287 (.Y(n278), 
	.B1(n171), 
	.B0(n361), 
	.A1N(n171), 
	.A0N(\Reg_File[11][5] ));
   OAI2BB2X1M U288 (.Y(n279), 
	.B1(n171), 
	.B0(n362), 
	.A1N(n171), 
	.A0N(\Reg_File[11][6] ));
   OAI2BB2X1M U289 (.Y(n280), 
	.B1(n171), 
	.B0(n363), 
	.A1N(n171), 
	.A0N(\Reg_File[11][7] ));
   OAI2BB2X1M U290 (.Y(n281), 
	.B1(n172), 
	.B0(n356), 
	.A1N(n172), 
	.A0N(\Reg_File[12][0] ));
   OAI2BB2X1M U291 (.Y(n282), 
	.B1(n172), 
	.B0(n357), 
	.A1N(n172), 
	.A0N(\Reg_File[12][1] ));
   OAI2BB2X1M U292 (.Y(n283), 
	.B1(n172), 
	.B0(n358), 
	.A1N(n172), 
	.A0N(\Reg_File[12][2] ));
   OAI2BB2X1M U293 (.Y(n284), 
	.B1(n172), 
	.B0(n359), 
	.A1N(n172), 
	.A0N(\Reg_File[12][3] ));
   OAI2BB2X1M U294 (.Y(n285), 
	.B1(n172), 
	.B0(n360), 
	.A1N(n172), 
	.A0N(\Reg_File[12][4] ));
   OAI2BB2X1M U295 (.Y(n286), 
	.B1(n172), 
	.B0(n361), 
	.A1N(n172), 
	.A0N(\Reg_File[12][5] ));
   OAI2BB2X1M U296 (.Y(n287), 
	.B1(n172), 
	.B0(n362), 
	.A1N(n172), 
	.A0N(\Reg_File[12][6] ));
   OAI2BB2X1M U297 (.Y(n288), 
	.B1(n172), 
	.B0(n363), 
	.A1N(n172), 
	.A0N(\Reg_File[12][7] ));
   OAI2BB2X1M U298 (.Y(n289), 
	.B1(n173), 
	.B0(n356), 
	.A1N(n173), 
	.A0N(\Reg_File[13][0] ));
   OAI2BB2X1M U299 (.Y(n290), 
	.B1(n173), 
	.B0(n357), 
	.A1N(n173), 
	.A0N(\Reg_File[13][1] ));
   OAI2BB2X1M U300 (.Y(n291), 
	.B1(n173), 
	.B0(n358), 
	.A1N(n173), 
	.A0N(\Reg_File[13][2] ));
   OAI2BB2X1M U301 (.Y(n292), 
	.B1(n173), 
	.B0(n359), 
	.A1N(n173), 
	.A0N(\Reg_File[13][3] ));
   OAI2BB2X1M U302 (.Y(n293), 
	.B1(n173), 
	.B0(n360), 
	.A1N(n173), 
	.A0N(\Reg_File[13][4] ));
   OAI2BB2X1M U303 (.Y(n294), 
	.B1(n173), 
	.B0(n361), 
	.A1N(n173), 
	.A0N(\Reg_File[13][5] ));
   OAI2BB2X1M U304 (.Y(n295), 
	.B1(n173), 
	.B0(n362), 
	.A1N(n173), 
	.A0N(\Reg_File[13][6] ));
   OAI2BB2X1M U305 (.Y(n296), 
	.B1(n173), 
	.B0(n363), 
	.A1N(n173), 
	.A0N(\Reg_File[13][7] ));
   OAI2BB2X1M U306 (.Y(n297), 
	.B1(n174), 
	.B0(n356), 
	.A1N(n174), 
	.A0N(\Reg_File[14][0] ));
   OAI2BB2X1M U307 (.Y(n298), 
	.B1(n174), 
	.B0(n357), 
	.A1N(n174), 
	.A0N(\Reg_File[14][1] ));
   OAI2BB2X1M U308 (.Y(n299), 
	.B1(n174), 
	.B0(n358), 
	.A1N(n174), 
	.A0N(\Reg_File[14][2] ));
   OAI2BB2X1M U309 (.Y(n300), 
	.B1(n174), 
	.B0(n359), 
	.A1N(n174), 
	.A0N(\Reg_File[14][3] ));
   OAI2BB2X1M U310 (.Y(n301), 
	.B1(n174), 
	.B0(n360), 
	.A1N(n174), 
	.A0N(\Reg_File[14][4] ));
   OAI2BB2X1M U311 (.Y(n302), 
	.B1(n174), 
	.B0(n361), 
	.A1N(n174), 
	.A0N(\Reg_File[14][5] ));
   OAI2BB2X1M U312 (.Y(n303), 
	.B1(n174), 
	.B0(n362), 
	.A1N(n174), 
	.A0N(\Reg_File[14][6] ));
   OAI2BB2X1M U313 (.Y(n304), 
	.B1(n174), 
	.B0(n363), 
	.A1N(n174), 
	.A0N(\Reg_File[14][7] ));
   OAI2BB2X1M U314 (.Y(n305), 
	.B1(n176), 
	.B0(n356), 
	.A1N(n176), 
	.A0N(\Reg_File[15][0] ));
   OAI2BB2X1M U315 (.Y(n306), 
	.B1(n176), 
	.B0(n357), 
	.A1N(n176), 
	.A0N(\Reg_File[15][1] ));
   OAI2BB2X1M U316 (.Y(n307), 
	.B1(n176), 
	.B0(n358), 
	.A1N(n176), 
	.A0N(\Reg_File[15][2] ));
   OAI2BB2X1M U317 (.Y(n308), 
	.B1(n176), 
	.B0(n359), 
	.A1N(n176), 
	.A0N(\Reg_File[15][3] ));
   OAI2BB2X1M U318 (.Y(n309), 
	.B1(n176), 
	.B0(n360), 
	.A1N(n176), 
	.A0N(\Reg_File[15][4] ));
   OAI2BB2X1M U319 (.Y(n310), 
	.B1(n176), 
	.B0(n361), 
	.A1N(n176), 
	.A0N(\Reg_File[15][5] ));
   OAI2BB2X1M U320 (.Y(n311), 
	.B1(n176), 
	.B0(n362), 
	.A1N(n176), 
	.A0N(\Reg_File[15][6] ));
   OAI2BB2X1M U321 (.Y(n312), 
	.B1(n176), 
	.B0(n363), 
	.A1N(n176), 
	.A0N(\Reg_File[15][7] ));
   OAI2BB2X1M U322 (.Y(n201), 
	.B1(n155), 
	.B0(n356), 
	.A1N(n155), 
	.A0N(REG2[0]));
   OAI2BB2X1M U323 (.Y(n208), 
	.B1(n155), 
	.B0(n363), 
	.A1N(n155), 
	.A0N(REG2[7]));
   OAI2BB2X1M U324 (.Y(n214), 
	.B1(n157), 
	.B0(n361), 
	.A1N(n157), 
	.A0N(REG3[5]));
   MX4X1M U325 (.Y(n145), 
	.S1(N12), 
	.S0(n338), 
	.D(REG3[1]), 
	.C(REG2[1]), 
	.B(REG1[1]), 
	.A(REG0[1]));
   MX4X1M U326 (.Y(n140), 
	.S1(N12), 
	.S0(n337), 
	.D(\Reg_File[7][0] ), 
	.C(\Reg_File[6][0] ), 
	.B(\Reg_File[5][0] ), 
	.A(\Reg_File[4][0] ));
   MX4X1M U327 (.Y(n144), 
	.S1(n335), 
	.S0(n338), 
	.D(\Reg_File[7][1] ), 
	.C(\Reg_File[6][1] ), 
	.B(\Reg_File[5][1] ), 
	.A(\Reg_File[4][1] ));
   MX4X1M U328 (.Y(n148), 
	.S1(n335), 
	.S0(n338), 
	.D(\Reg_File[7][2] ), 
	.C(\Reg_File[6][2] ), 
	.B(\Reg_File[5][2] ), 
	.A(\Reg_File[4][2] ));
   MX4X1M U329 (.Y(n316), 
	.S1(n335), 
	.S0(n338), 
	.D(\Reg_File[7][3] ), 
	.C(\Reg_File[6][3] ), 
	.B(\Reg_File[5][3] ), 
	.A(\Reg_File[4][3] ));
   MX4X1M U330 (.Y(n320), 
	.S1(n335), 
	.S0(n338), 
	.D(\Reg_File[7][4] ), 
	.C(\Reg_File[6][4] ), 
	.B(\Reg_File[5][4] ), 
	.A(\Reg_File[4][4] ));
   MX4X1M U331 (.Y(n324), 
	.S1(N12), 
	.S0(n337), 
	.D(\Reg_File[7][5] ), 
	.C(\Reg_File[6][5] ), 
	.B(\Reg_File[5][5] ), 
	.A(\Reg_File[4][5] ));
   MX4X1M U332 (.Y(n328), 
	.S1(N12), 
	.S0(n337), 
	.D(\Reg_File[7][6] ), 
	.C(\Reg_File[6][6] ), 
	.B(\Reg_File[5][6] ), 
	.A(\Reg_File[4][6] ));
   MX4X1M U333 (.Y(n332), 
	.S1(N12), 
	.S0(n337), 
	.D(\Reg_File[7][7] ), 
	.C(\Reg_File[6][7] ), 
	.B(\Reg_File[5][7] ), 
	.A(\Reg_File[4][7] ));
   MX4X1M U334 (.Y(n138), 
	.S1(n335), 
	.S0(n337), 
	.D(\Reg_File[15][0] ), 
	.C(\Reg_File[14][0] ), 
	.B(\Reg_File[13][0] ), 
	.A(\Reg_File[12][0] ));
   MX4X1M U335 (.Y(n146), 
	.S1(n335), 
	.S0(n338), 
	.D(\Reg_File[15][2] ), 
	.C(\Reg_File[14][2] ), 
	.B(\Reg_File[13][2] ), 
	.A(\Reg_File[12][2] ));
   MX4X1M U336 (.Y(n314), 
	.S1(n335), 
	.S0(n338), 
	.D(\Reg_File[15][3] ), 
	.C(\Reg_File[14][3] ), 
	.B(\Reg_File[13][3] ), 
	.A(\Reg_File[12][3] ));
   MX4X1M U337 (.Y(n318), 
	.S1(n335), 
	.S0(n338), 
	.D(\Reg_File[15][4] ), 
	.C(\Reg_File[14][4] ), 
	.B(\Reg_File[13][4] ), 
	.A(\Reg_File[12][4] ));
   MX4X1M U338 (.Y(n322), 
	.S1(N12), 
	.S0(n337), 
	.D(\Reg_File[15][5] ), 
	.C(\Reg_File[14][5] ), 
	.B(\Reg_File[13][5] ), 
	.A(\Reg_File[12][5] ));
   MX4X1M U339 (.Y(n326), 
	.S1(N12), 
	.S0(n337), 
	.D(\Reg_File[15][6] ), 
	.C(\Reg_File[14][6] ), 
	.B(\Reg_File[13][6] ), 
	.A(\Reg_File[12][6] ));
   MX4X1M U340 (.Y(n330), 
	.S1(N12), 
	.S0(n337), 
	.D(\Reg_File[15][7] ), 
	.C(\Reg_File[14][7] ), 
	.B(\Reg_File[13][7] ), 
	.A(\Reg_File[12][7] ));
   AO22X1M U341 (.Y(n177), 
	.B1(n149), 
	.B0(RdData[0]), 
	.A1(n364), 
	.A0(N43));
   MX4X1M U342 (.Y(N43), 
	.S1(N13), 
	.S0(N14), 
	.D(n138), 
	.C(n140), 
	.B(n139), 
	.A(n141));
   MX4X1M U343 (.Y(n141), 
	.S1(N12), 
	.S0(n337), 
	.D(REG3[0]), 
	.C(REG2[0]), 
	.B(REG1[0]), 
	.A(REG0[0]));
   MX4X1M U344 (.Y(n139), 
	.S1(N12), 
	.S0(n337), 
	.D(\Reg_File[11][0] ), 
	.C(\Reg_File[10][0] ), 
	.B(\Reg_File[9][0] ), 
	.A(\Reg_File[8][0] ));
   AO22X1M U345 (.Y(n178), 
	.B1(n149), 
	.B0(RdData[1]), 
	.A1(n364), 
	.A0(N42));
   MX4X1M U346 (.Y(N42), 
	.S1(N13), 
	.S0(N14), 
	.D(n142), 
	.C(n144), 
	.B(n143), 
	.A(n145));
   MX4X1M U347 (.Y(n143), 
	.S1(N12), 
	.S0(n337), 
	.D(\Reg_File[11][1] ), 
	.C(\Reg_File[10][1] ), 
	.B(\Reg_File[9][1] ), 
	.A(\Reg_File[8][1] ));
   MX4X1M U348 (.Y(n142), 
	.S1(n335), 
	.S0(n337), 
	.D(\Reg_File[15][1] ), 
	.C(\Reg_File[14][1] ), 
	.B(\Reg_File[13][1] ), 
	.A(\Reg_File[12][1] ));
   AO22X1M U349 (.Y(n179), 
	.B1(n149), 
	.B0(RdData[2]), 
	.A1(n364), 
	.A0(N41));
   MX4X1M U350 (.Y(N41), 
	.S1(N13), 
	.S0(N14), 
	.D(n146), 
	.C(n148), 
	.B(n147), 
	.A(n313));
   MX4X1M U351 (.Y(n313), 
	.S1(n335), 
	.S0(n338), 
	.D(REG3[2]), 
	.C(REG2[2]), 
	.B(REG1[2]), 
	.A(REG0[2]));
   MX4X1M U352 (.Y(n147), 
	.S1(n335), 
	.S0(n338), 
	.D(\Reg_File[11][2] ), 
	.C(\Reg_File[10][2] ), 
	.B(\Reg_File[9][2] ), 
	.A(\Reg_File[8][2] ));
   AO22X1M U353 (.Y(n180), 
	.B1(n149), 
	.B0(RdData[3]), 
	.A1(n364), 
	.A0(N40));
   MX4X1M U354 (.Y(N40), 
	.S1(N13), 
	.S0(N14), 
	.D(n314), 
	.C(n316), 
	.B(n315), 
	.A(n317));
   MX4X1M U355 (.Y(n317), 
	.S1(n335), 
	.S0(n338), 
	.D(REG3[3]), 
	.C(REG2[3]), 
	.B(REG1[3]), 
	.A(REG0[3]));
   MX4X1M U356 (.Y(n315), 
	.S1(n335), 
	.S0(n338), 
	.D(\Reg_File[11][3] ), 
	.C(\Reg_File[10][3] ), 
	.B(\Reg_File[9][3] ), 
	.A(\Reg_File[8][3] ));
   AO22X1M U357 (.Y(n181), 
	.B1(n149), 
	.B0(RdData[4]), 
	.A1(n364), 
	.A0(N39));
   MX4X1M U358 (.Y(N39), 
	.S1(N13), 
	.S0(N14), 
	.D(n318), 
	.C(n320), 
	.B(n319), 
	.A(n321));
   MX4X1M U359 (.Y(n321), 
	.S1(n335), 
	.S0(N11), 
	.D(REG3[4]), 
	.C(REG2[4]), 
	.B(REG1[4]), 
	.A(REG0[4]));
   MX4X1M U360 (.Y(n319), 
	.S1(n335), 
	.S0(n338), 
	.D(\Reg_File[11][4] ), 
	.C(\Reg_File[10][4] ), 
	.B(\Reg_File[9][4] ), 
	.A(\Reg_File[8][4] ));
   AO22X1M U361 (.Y(n182), 
	.B1(n149), 
	.B0(RdData[5]), 
	.A1(n364), 
	.A0(N38));
   MX4X1M U362 (.Y(N38), 
	.S1(N13), 
	.S0(N14), 
	.D(n322), 
	.C(n324), 
	.B(n323), 
	.A(n325));
   MX4X1M U363 (.Y(n325), 
	.S1(N12), 
	.S0(N11), 
	.D(REG3[5]), 
	.C(REG2[5]), 
	.B(REG1[5]), 
	.A(REG0[5]));
   MX4X1M U364 (.Y(n323), 
	.S1(N12), 
	.S0(n337), 
	.D(\Reg_File[11][5] ), 
	.C(\Reg_File[10][5] ), 
	.B(\Reg_File[9][5] ), 
	.A(\Reg_File[8][5] ));
   AO22X1M U365 (.Y(n183), 
	.B1(n149), 
	.B0(RdData[6]), 
	.A1(n364), 
	.A0(N37));
   MX4X1M U366 (.Y(N37), 
	.S1(N13), 
	.S0(N14), 
	.D(n326), 
	.C(n328), 
	.B(n327), 
	.A(n329));
   MX4X1M U367 (.Y(n329), 
	.S1(N12), 
	.S0(N11), 
	.D(REG3[6]), 
	.C(REG2[6]), 
	.B(REG1[6]), 
	.A(REG0[6]));
   MX4X1M U368 (.Y(n327), 
	.S1(N12), 
	.S0(n338), 
	.D(\Reg_File[11][6] ), 
	.C(\Reg_File[10][6] ), 
	.B(\Reg_File[9][6] ), 
	.A(\Reg_File[8][6] ));
   AO22X1M U369 (.Y(n184), 
	.B1(n149), 
	.B0(RdData[7]), 
	.A1(n364), 
	.A0(N36));
   MX4X1M U370 (.Y(N36), 
	.S1(N13), 
	.S0(N14), 
	.D(n330), 
	.C(n332), 
	.B(n331), 
	.A(n333));
   MX4X1M U371 (.Y(n333), 
	.S1(N12), 
	.S0(N11), 
	.D(REG3[7]), 
	.C(REG2[7]), 
	.B(REG1[7]), 
	.A(REG0[7]));
   MX4X1M U372 (.Y(n331), 
	.S1(N12), 
	.S0(N11), 
	.D(\Reg_File[11][7] ), 
	.C(\Reg_File[10][7] ), 
	.B(\Reg_File[9][7] ), 
	.A(\Reg_File[8][7] ));
   INVX2M U373 (.Y(n339), 
	.A(N11));
   INVX2M U374 (.Y(n340), 
	.A(N12));
   DLY1X4M U375 (.Y(n368), 
	.A(test_se));
   DLY1X4M U376 (.Y(n369), 
	.A(test_se));
   DLY1X4M U377 (.Y(n370), 
	.A(test_se));
   DLY1X4M U378 (.Y(n371), 
	.A(test_se));
endmodule

module system_control_test_1 (
	CLK, 
	RST, 
	FIFO_Full, 
	ALU_OUT, 
	OUT_Valid, 
	Rd_D, 
	Rd_D_Vld, 
	RX_P_DATA, 
	RX_D_VLD, 
	ALU_FUN, 
	EN, 
	CLK_EN, 
	Address, 
	WrEn, 
	RdEn, 
	WrData, 
	TX_P_DATA, 
	TX_D_VLD, 
	clk_div_en, 
	test_si, 
	test_so, 
	test_se, 
	FE_OFN1_SYNC_RST11, 
	FE_OFN2_SYNC_RST11, 
	CLK_M__L4_N1, 
	CLK_M__L4_N2);
   input CLK;
   input RST;
   input FIFO_Full;
   input [15:0] ALU_OUT;
   input OUT_Valid;
   input [7:0] Rd_D;
   input Rd_D_Vld;
   input [7:0] RX_P_DATA;
   input RX_D_VLD;
   output [3:0] ALU_FUN;
   output EN;
   output CLK_EN;
   output [3:0] Address;
   output WrEn;
   output RdEn;
   output [7:0] WrData;
   output [7:0] TX_P_DATA;
   output TX_D_VLD;
   output clk_div_en;
   input test_si;
   output test_so;
   input test_se;
   input FE_OFN1_SYNC_RST11;
   input FE_OFN2_SYNC_RST11;
   input CLK_M__L4_N1;
   input CLK_M__L4_N2;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire RX_D_VLD_delayed;
   wire N119;
   wire N120;
   wire N121;
   wire N122;
   wire N123;
   wire N135;
   wire N136;
   wire N137;
   wire N138;
   wire N150;
   wire N151;
   wire N152;
   wire N153;
   wire N154;
   wire N155;
   wire N156;
   wire N157;
   wire N159;
   wire N160;
   wire N161;
   wire N162;
   wire N163;
   wire N164;
   wire N165;
   wire N166;
   wire N179;
   wire N180;
   wire N181;
   wire N182;
   wire N183;
   wire N184;
   wire N185;
   wire N186;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n79;
   wire n80;
   wire n81;
   wire n82;
   wire n83;
   wire n84;
   wire n85;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n36;
   wire n37;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n96;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire [3:0] storeadd;
   wire [15:8] store_ALU_OUT;
   wire [7:0] TX_P_DATA_store;
   wire [3:0] current_state;
   wire [3:0] next_state;

   assign test_so = storeadd[3] ;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   SDFFRX1M \TX_P_DATA_store_reg[6]  (.SI(n30), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.QN(n29), 
	.Q(TX_P_DATA_store[6]), 
	.D(TX_P_DATA[6]), 
	.CK(CLK_M__L4_N1));
   SDFFRX1M \TX_P_DATA_store_reg[5]  (.SI(n31), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.QN(n30), 
	.Q(TX_P_DATA_store[5]), 
	.D(TX_P_DATA[5]), 
	.CK(CLK_M__L4_N1));
   SDFFRX1M \TX_P_DATA_store_reg[4]  (.SI(n32), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.QN(n31), 
	.Q(TX_P_DATA_store[4]), 
	.D(TX_P_DATA[4]), 
	.CK(CLK_M__L4_N1));
   SDFFRX1M \TX_P_DATA_store_reg[3]  (.SI(n33), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.QN(n32), 
	.Q(TX_P_DATA_store[3]), 
	.D(TX_P_DATA[3]), 
	.CK(CLK_M__L4_N1));
   SDFFRX1M \TX_P_DATA_store_reg[2]  (.SI(n34), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.QN(n33), 
	.Q(TX_P_DATA_store[2]), 
	.D(TX_P_DATA[2]), 
	.CK(CLK_M__L4_N1));
   SDFFRX1M \TX_P_DATA_store_reg[1]  (.SI(n35), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.QN(n34), 
	.Q(TX_P_DATA_store[1]), 
	.D(TX_P_DATA[1]), 
	.CK(CLK_M__L4_N1));
   SDFFRX1M \TX_P_DATA_store_reg[0]  (.SI(RX_D_VLD_delayed), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.QN(n35), 
	.Q(TX_P_DATA_store[0]), 
	.D(TX_P_DATA[0]), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \store_ALU_OUT_reg[15]  (.SI(store_ALU_OUT[14]), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(store_ALU_OUT[15]), 
	.D(ALU_OUT[15]), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \store_ALU_OUT_reg[14]  (.SI(store_ALU_OUT[13]), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(store_ALU_OUT[14]), 
	.D(ALU_OUT[14]), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \store_ALU_OUT_reg[13]  (.SI(store_ALU_OUT[12]), 
	.SE(test_se), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(store_ALU_OUT[13]), 
	.D(ALU_OUT[13]), 
	.CK(CLK));
   SDFFRQX2M \store_ALU_OUT_reg[12]  (.SI(store_ALU_OUT[11]), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(store_ALU_OUT[12]), 
	.D(ALU_OUT[12]), 
	.CK(CLK));
   SDFFRQX2M \store_ALU_OUT_reg[11]  (.SI(store_ALU_OUT[10]), 
	.SE(test_se), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(store_ALU_OUT[11]), 
	.D(ALU_OUT[11]), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \store_ALU_OUT_reg[10]  (.SI(store_ALU_OUT[9]), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(store_ALU_OUT[10]), 
	.D(ALU_OUT[10]), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \store_ALU_OUT_reg[9]  (.SI(store_ALU_OUT[8]), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(store_ALU_OUT[9]), 
	.D(ALU_OUT[9]), 
	.CK(CLK));
   SDFFRQX2M \store_ALU_OUT_reg[8]  (.SI(current_state[3]), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(store_ALU_OUT[8]), 
	.D(ALU_OUT[8]), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M RX_D_VLD_delayed_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(RX_D_VLD_delayed), 
	.D(RX_D_VLD), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \storeadd_reg[3]  (.SI(storeadd[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(storeadd[3]), 
	.D(RX_P_DATA[3]), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \storeadd_reg[2]  (.SI(storeadd[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(storeadd[2]), 
	.D(RX_P_DATA[2]), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \storeadd_reg[1]  (.SI(storeadd[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(storeadd[1]), 
	.D(RX_P_DATA[1]), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \storeadd_reg[0]  (.SI(store_ALU_OUT[15]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(storeadd[0]), 
	.D(RX_P_DATA[0]), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \current_state_reg[2]  (.SI(n111), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(current_state[2]), 
	.D(next_state[2]), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \current_state_reg[1]  (.SI(current_state[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(current_state[1]), 
	.D(next_state[1]), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \current_state_reg[3]  (.SI(n55), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(current_state[3]), 
	.D(next_state[3]), 
	.CK(CLK_M__L4_N2));
   SDFFRQX4M \current_state_reg[0]  (.SI(n28), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.Q(current_state[0]), 
	.D(next_state[0]), 
	.CK(CLK_M__L4_N2));
   SDFFRX1M \TX_P_DATA_store_reg[7]  (.SI(n29), 
	.SE(test_se), 
	.RN(FE_OFN1_SYNC_RST11), 
	.QN(n28), 
	.Q(TX_P_DATA_store[7]), 
	.D(TX_P_DATA[7]), 
	.CK(CLK_M__L4_N2));
   AOI221XLM U30 (.Y(n56), 
	.C0(RdEn), 
	.B1(FIFO_Full), 
	.B0(n110), 
	.A1(n107), 
	.A0(n65));
   NOR2X2M U31 (.Y(n36), 
	.B(n96), 
	.A(current_state[2]));
   NOR2X2M U32 (.Y(n37), 
	.B(n55), 
	.A(current_state[1]));
   NOR2X2M U34 (.Y(ALU_FUN[2]), 
	.B(n109), 
	.A(n118));
   NOR2X2M U35 (.Y(ALU_FUN[3]), 
	.B(n109), 
	.A(n117));
   NOR2X2M U36 (.Y(ALU_FUN[1]), 
	.B(n109), 
	.A(n119));
   MX3X2M U37 (.Y(Address[3]), 
	.S1(current_state[3]), 
	.S0(current_state[1]), 
	.C(storeadd[3]), 
	.B(n53), 
	.A(n54));
   MX3X1M U38 (.Y(Address[2]), 
	.S1(current_state[3]), 
	.S0(current_state[1]), 
	.C(storeadd[2]), 
	.B(n51), 
	.A(n52));
   NAND2X2M U40 (.Y(n57), 
	.B(n89), 
	.A(n108));
   INVX2M U41 (.Y(n108), 
	.A(n90));
   INVX2M U42 (.Y(n109), 
	.A(EN));
   NAND2X2M U43 (.Y(n62), 
	.B(n96), 
	.A(n88));
   OAI21X2M U44 (.Y(N119), 
	.B0(n95), 
	.A1(n120), 
	.A0(n112));
   OAI21X2M U45 (.Y(N120), 
	.B0(n94), 
	.A1(n119), 
	.A0(n112));
   OAI21X2M U46 (.Y(N122), 
	.B0(n92), 
	.A1(n117), 
	.A0(n112));
   NAND3X2M U47 (.Y(n90), 
	.C(n87), 
	.B(n111), 
	.A(n96));
   NAND2X2M U48 (.Y(n71), 
	.B(n81), 
	.A(n62));
   INVX2M U49 (.Y(WrEn), 
	.A(n86));
   INVX2M U50 (.Y(N136), 
	.A(n94));
   INVX2M U51 (.Y(N123), 
	.A(n95));
   NAND2X2M U52 (.Y(next_state[2]), 
	.B(n59), 
	.A(n58));
   NOR4BX1M U53 (.Y(n59), 
	.D(n61), 
	.C(n105), 
	.B(n108), 
	.AN(n60));
   AOI221XLM U54 (.Y(n58), 
	.C0(n101), 
	.B1(n112), 
	.B0(n64), 
	.A1(n114), 
	.A0(n103));
   AOI21X2M U55 (.Y(n61), 
	.B0(n112), 
	.A1(n63), 
	.A0(n62));
   NOR2X2M U56 (.Y(WrData[1]), 
	.B(n86), 
	.A(n119));
   NOR2X2M U57 (.Y(WrData[2]), 
	.B(n86), 
	.A(n118));
   NOR2X2M U58 (.Y(WrData[0]), 
	.B(n86), 
	.A(n120));
   NOR3X2M U59 (.Y(n76), 
	.C(n115), 
	.B(n72), 
	.A(n119));
   NOR2X2M U60 (.Y(RdEn), 
	.B(n79), 
	.A(n112));
   NOR2X2M U61 (.Y(WrData[3]), 
	.B(n86), 
	.A(n117));
   NOR2X2M U62 (.Y(WrData[4]), 
	.B(n86), 
	.A(n116));
   NOR2X2M U63 (.Y(WrData[5]), 
	.B(n86), 
	.A(n115));
   NOR2X2M U64 (.Y(WrData[7]), 
	.B(n86), 
	.A(n113));
   NAND2X2M U65 (.Y(next_state[3]), 
	.B(n57), 
	.A(n56));
   OAI21X2M U66 (.Y(N121), 
	.B0(n93), 
	.A1(n118), 
	.A0(n112));
   INVX2M U67 (.Y(n101), 
	.A(n56));
   INVX2M U68 (.Y(n100), 
	.A(n65));
   NAND2X2M U69 (.Y(n66), 
	.B(n96), 
	.A(n91));
   INVX2M U72 (.Y(n103), 
	.A(n72));
   INVX2M U73 (.Y(n104), 
	.A(n70));
   INVX2M U74 (.Y(n110), 
	.A(n83));
   INVX2M U75 (.Y(n105), 
	.A(n81));
   INVX2M U76 (.Y(n114), 
	.A(n67));
   NOR2X2M U77 (.Y(EN), 
	.B(n112), 
	.A(n60));
   NOR2X2M U78 (.Y(ALU_FUN[0]), 
	.B(n109), 
	.A(n120));
   NAND3X2M U79 (.Y(CLK_EN), 
	.C(n60), 
	.B(n83), 
	.A(n90));
   NOR3BX2M U80 (.Y(n64), 
	.C(n96), 
	.B(current_state[1]), 
	.AN(n87));
   OAI221X1M U81 (.Y(TX_D_VLD), 
	.C0(n57), 
	.B1(n83), 
	.B0(FIFO_Full), 
	.A1(n65), 
	.A0(n66));
   NOR3X2M U82 (.Y(n88), 
	.C(n111), 
	.B(current_state[3]), 
	.A(current_state[2]));
   NOR2BX2M U83 (.Y(n87), 
	.B(current_state[3]), 
	.AN(current_state[2]));
   NAND2X2M U84 (.Y(n83), 
	.B(current_state[0]), 
	.A(n91));
   INVX2M U85 (.Y(n112), 
	.A(RX_D_VLD));
   AND3X2M U86 (.Y(n91), 
	.C(current_state[3]), 
	.B(n111), 
	.A(current_state[2]));
   INVX2M U87 (.Y(n120), 
	.A(RX_P_DATA[0]));
   NAND3X2M U88 (.Y(n81), 
	.C(current_state[1]), 
	.B(n96), 
	.A(n87));
   OAI21X2M U89 (.Y(n86), 
	.B0(RX_D_VLD), 
	.A1(n71), 
	.A0(n64));
   INVX2M U90 (.Y(n111), 
	.A(current_state[1]));
   NAND2X2M U91 (.Y(n95), 
	.B(n112), 
	.A(storeadd[0]));
   NAND2X2M U92 (.Y(n94), 
	.B(n112), 
	.A(storeadd[1]));
   NAND2X2M U93 (.Y(n92), 
	.B(n112), 
	.A(storeadd[3]));
   MX2X2M U94 (.Y(n50), 
	.S0(n36), 
	.B(N120), 
	.A(storeadd[1]));
   MX4X1M U95 (.Y(n53), 
	.S1(current_state[2]), 
	.S0(current_state[0]), 
	.D(storeadd[3]), 
	.C(N138), 
	.B(N122), 
	.A(N138));
   MX2X2M U96 (.Y(n54), 
	.S0(n36), 
	.B(N122), 
	.A(storeadd[3]));
   INVX2M U97 (.Y(N138), 
	.A(n92));
   MX2X2M U98 (.Y(n48), 
	.S0(n36), 
	.B(N119), 
	.A(storeadd[0]));
   INVX2M U99 (.Y(n96), 
	.A(current_state[0]));
   MX3X1M U100 (.Y(Address[0]), 
	.S1(current_state[3]), 
	.S0(current_state[1]), 
	.C(storeadd[0]), 
	.B(n47), 
	.A(n48));
   MX4X1M U101 (.Y(n47), 
	.S1(current_state[2]), 
	.S0(current_state[0]), 
	.D(storeadd[0]), 
	.C(N135), 
	.B(N119), 
	.A(N123));
   MX3X1M U102 (.Y(Address[1]), 
	.S1(current_state[3]), 
	.S0(current_state[1]), 
	.C(storeadd[1]), 
	.B(n49), 
	.A(n50));
   MX4X1M U103 (.Y(n49), 
	.S1(current_state[2]), 
	.S0(current_state[0]), 
	.D(storeadd[1]), 
	.C(N136), 
	.B(N120), 
	.A(N136));
   OR2X2M U104 (.Y(N135), 
	.B(RX_D_VLD), 
	.A(storeadd[0]));
   INVX2M U105 (.Y(n107), 
	.A(n66));
   MX4X1M U106 (.Y(n51), 
	.S1(current_state[2]), 
	.S0(current_state[0]), 
	.D(storeadd[2]), 
	.C(N137), 
	.B(N121), 
	.A(N137));
   MX2X2M U107 (.Y(n52), 
	.S0(n36), 
	.B(N121), 
	.A(storeadd[2]));
   INVX2M U108 (.Y(N137), 
	.A(n93));
   NOR3X2M U109 (.Y(n84), 
	.C(current_state[1]), 
	.B(current_state[3]), 
	.A(current_state[2]));
   OAI21X2M U110 (.Y(n70), 
	.B0(n75), 
	.A1(n72), 
	.A0(n67));
   AOI31X2M U111 (.Y(n75), 
	.B0(n78), 
	.A2(n77), 
	.A1(RX_P_DATA[4]), 
	.A0(n76));
   NOR3X2M U112 (.Y(n77), 
	.C(RX_P_DATA[2]), 
	.B(RX_P_DATA[6]), 
	.A(n120));
   AOI21X2M U113 (.Y(n78), 
	.B0(RX_D_VLD), 
	.A1(n60), 
	.A0(n79));
   NOR2BX2M U114 (.Y(WrData[6]), 
	.B(n86), 
	.AN(RX_P_DATA[6]));
   NAND4X2M U115 (.Y(n72), 
	.D(n85), 
	.C(n84), 
	.B(n96), 
	.A(RX_D_VLD));
   NOR2X2M U116 (.Y(n85), 
	.B(n113), 
	.A(n117));
   NAND3X2M U117 (.Y(n60), 
	.C(current_state[0]), 
	.B(n87), 
	.A(current_state[1]));
   NAND2X2M U118 (.Y(n79), 
	.B(n88), 
	.A(current_state[0]));
   INVX2M U119 (.Y(n102), 
	.A(FIFO_Full));
   OAI211X2M U120 (.Y(next_state[1]), 
	.C0(n104), 
	.B0(n106), 
	.A1(n69), 
	.A0(n68));
   NAND4X2M U121 (.Y(n68), 
	.D(n115), 
	.C(n116), 
	.B(n119), 
	.A(n120));
   INVX2M U122 (.Y(n106), 
	.A(n71));
   NAND3X2M U123 (.Y(n69), 
	.C(n103), 
	.B(RX_P_DATA[2]), 
	.A(RX_P_DATA[6]));
   NAND3X2M U124 (.Y(n65), 
	.C(Rd_D_Vld), 
	.B(n102), 
	.A(RX_D_VLD_delayed));
   OAI2BB2X1M U125 (.Y(N150), 
	.B1(n35), 
	.B0(n89), 
	.A1N(n89), 
	.A0N(ALU_OUT[0]));
   OAI2BB2X1M U126 (.Y(N151), 
	.B1(n34), 
	.B0(n89), 
	.A1N(n89), 
	.A0N(ALU_OUT[1]));
   OAI2BB2X1M U127 (.Y(N152), 
	.B1(n33), 
	.B0(n89), 
	.A1N(n89), 
	.A0N(ALU_OUT[2]));
   OAI2BB2X1M U128 (.Y(N153), 
	.B1(n32), 
	.B0(n89), 
	.A1N(n89), 
	.A0N(ALU_OUT[3]));
   OAI2BB2X1M U129 (.Y(N154), 
	.B1(n31), 
	.B0(n89), 
	.A1N(n89), 
	.A0N(ALU_OUT[4]));
   OAI2BB2X1M U130 (.Y(N155), 
	.B1(n30), 
	.B0(n89), 
	.A1N(n89), 
	.A0N(ALU_OUT[5]));
   OAI2BB2X1M U131 (.Y(N156), 
	.B1(n29), 
	.B0(n89), 
	.A1N(n89), 
	.A0N(ALU_OUT[6]));
   OAI2BB2X1M U132 (.Y(N157), 
	.B1(n28), 
	.B0(n89), 
	.A1N(n89), 
	.A0N(ALU_OUT[7]));
   INVX2M U133 (.Y(n119), 
	.A(RX_P_DATA[1]));
   INVX2M U134 (.Y(n118), 
	.A(RX_P_DATA[2]));
   NAND4X2M U135 (.Y(next_state[0]), 
	.D(n74), 
	.C(n73), 
	.B(n63), 
	.A(n57));
   AOI32X1M U136 (.Y(n73), 
	.B1(n110), 
	.B0(FIFO_Full), 
	.A2(n82), 
	.A1(n120), 
	.A0(n76));
   AOI221XLM U137 (.Y(n74), 
	.C0(n70), 
	.B1(n112), 
	.B0(n64), 
	.A1(RX_D_VLD), 
	.A0(n105));
   NOR3X2M U138 (.Y(n82), 
	.C(RX_P_DATA[4]), 
	.B(RX_P_DATA[6]), 
	.A(RX_P_DATA[2]));
   NAND2X2M U139 (.Y(n93), 
	.B(n112), 
	.A(storeadd[2]));
   INVX2M U140 (.Y(n117), 
	.A(RX_P_DATA[3]));
   MX2X2M U141 (.Y(TX_P_DATA[0]), 
	.S0(n37), 
	.B(n39), 
	.A(TX_P_DATA_store[0]));
   MX4X1M U142 (.Y(n39), 
	.S1(current_state[3]), 
	.S0(current_state[0]), 
	.D(N159), 
	.C(N179), 
	.B(TX_P_DATA_store[0]), 
	.A(N150));
   OAI2BB2X1M U143 (.Y(N159), 
	.B1(n35), 
	.B0(n102), 
	.A1N(n102), 
	.A0N(store_ALU_OUT[8]));
   OAI2BB2X1M U144 (.Y(N179), 
	.B1(n35), 
	.B0(n100), 
	.A1N(n100), 
	.A0N(Rd_D[0]));
   MX2X2M U145 (.Y(TX_P_DATA[1]), 
	.S0(n37), 
	.B(n40), 
	.A(TX_P_DATA_store[1]));
   MX4X1M U146 (.Y(n40), 
	.S1(current_state[3]), 
	.S0(current_state[0]), 
	.D(N160), 
	.C(N180), 
	.B(TX_P_DATA_store[1]), 
	.A(N151));
   OAI2BB2X1M U147 (.Y(N160), 
	.B1(n34), 
	.B0(n102), 
	.A1N(n102), 
	.A0N(store_ALU_OUT[9]));
   OAI2BB2X1M U148 (.Y(N180), 
	.B1(n34), 
	.B0(n100), 
	.A1N(n100), 
	.A0N(Rd_D[1]));
   MX2X2M U149 (.Y(TX_P_DATA[2]), 
	.S0(n37), 
	.B(n41), 
	.A(TX_P_DATA_store[2]));
   MX4X1M U150 (.Y(n41), 
	.S1(current_state[3]), 
	.S0(current_state[0]), 
	.D(N161), 
	.C(N181), 
	.B(TX_P_DATA_store[2]), 
	.A(N152));
   OAI2BB2X1M U151 (.Y(N161), 
	.B1(n33), 
	.B0(n102), 
	.A1N(n102), 
	.A0N(store_ALU_OUT[10]));
   OAI2BB2X1M U152 (.Y(N181), 
	.B1(n33), 
	.B0(n100), 
	.A1N(n100), 
	.A0N(Rd_D[2]));
   MX2X2M U153 (.Y(TX_P_DATA[3]), 
	.S0(n37), 
	.B(n42), 
	.A(TX_P_DATA_store[3]));
   MX4X1M U154 (.Y(n42), 
	.S1(current_state[3]), 
	.S0(current_state[0]), 
	.D(N162), 
	.C(N182), 
	.B(TX_P_DATA_store[3]), 
	.A(N153));
   OAI2BB2X1M U155 (.Y(N162), 
	.B1(n32), 
	.B0(n102), 
	.A1N(n102), 
	.A0N(store_ALU_OUT[11]));
   OAI2BB2X1M U156 (.Y(N182), 
	.B1(n32), 
	.B0(n100), 
	.A1N(n100), 
	.A0N(Rd_D[3]));
   MX2X2M U157 (.Y(TX_P_DATA[4]), 
	.S0(n37), 
	.B(n43), 
	.A(TX_P_DATA_store[4]));
   MX4X1M U158 (.Y(n43), 
	.S1(current_state[3]), 
	.S0(current_state[0]), 
	.D(N163), 
	.C(N183), 
	.B(TX_P_DATA_store[4]), 
	.A(N154));
   OAI2BB2X1M U159 (.Y(N163), 
	.B1(n31), 
	.B0(n102), 
	.A1N(n102), 
	.A0N(store_ALU_OUT[12]));
   OAI2BB2X1M U160 (.Y(N183), 
	.B1(n31), 
	.B0(n100), 
	.A1N(n100), 
	.A0N(Rd_D[4]));
   MX2X2M U161 (.Y(TX_P_DATA[5]), 
	.S0(n37), 
	.B(n44), 
	.A(TX_P_DATA_store[5]));
   MX4X1M U162 (.Y(n44), 
	.S1(current_state[3]), 
	.S0(current_state[0]), 
	.D(N164), 
	.C(N184), 
	.B(TX_P_DATA_store[5]), 
	.A(N155));
   OAI2BB2X1M U163 (.Y(N164), 
	.B1(n30), 
	.B0(n102), 
	.A1N(n102), 
	.A0N(store_ALU_OUT[13]));
   OAI2BB2X1M U164 (.Y(N184), 
	.B1(n30), 
	.B0(n100), 
	.A1N(n100), 
	.A0N(Rd_D[5]));
   MX2X2M U165 (.Y(TX_P_DATA[6]), 
	.S0(n37), 
	.B(n45), 
	.A(TX_P_DATA_store[6]));
   MX4X1M U166 (.Y(n45), 
	.S1(current_state[3]), 
	.S0(current_state[0]), 
	.D(N165), 
	.C(N185), 
	.B(TX_P_DATA_store[6]), 
	.A(N156));
   OAI2BB2X1M U167 (.Y(N165), 
	.B1(n29), 
	.B0(n102), 
	.A1N(n102), 
	.A0N(store_ALU_OUT[14]));
   OAI2BB2X1M U168 (.Y(N185), 
	.B1(n29), 
	.B0(n100), 
	.A1N(n100), 
	.A0N(Rd_D[6]));
   MX2X2M U169 (.Y(TX_P_DATA[7]), 
	.S0(n37), 
	.B(n46), 
	.A(TX_P_DATA_store[7]));
   MX4X1M U170 (.Y(n46), 
	.S1(current_state[3]), 
	.S0(current_state[0]), 
	.D(N166), 
	.C(N186), 
	.B(TX_P_DATA_store[7]), 
	.A(N157));
   OAI2BB2X1M U171 (.Y(N166), 
	.B1(n28), 
	.B0(n102), 
	.A1N(n102), 
	.A0N(store_ALU_OUT[15]));
   OAI2BB2X1M U172 (.Y(N186), 
	.B1(n28), 
	.B0(n100), 
	.A1N(n100), 
	.A0N(Rd_D[7]));
   AND3X2M U173 (.Y(n89), 
	.C(RX_D_VLD_delayed), 
	.B(n102), 
	.A(OUT_Valid));
   NAND4X2M U174 (.Y(n67), 
	.D(n80), 
	.C(RX_P_DATA[6]), 
	.B(RX_P_DATA[2]), 
	.A(RX_P_DATA[4]));
   NOR3X2M U175 (.Y(n80), 
	.C(RX_P_DATA[1]), 
	.B(RX_P_DATA[5]), 
	.A(n120));
   NAND2X2M U176 (.Y(n63), 
	.B(current_state[0]), 
	.A(n84));
   INVX2M U177 (.Y(n115), 
	.A(RX_P_DATA[5]));
   INVX2M U178 (.Y(n116), 
	.A(RX_P_DATA[4]));
   INVX2M U179 (.Y(n113), 
	.A(RX_P_DATA[7]));
   INVX2M U180 (.Y(n55), 
	.A(current_state[2]));
   INVX2M U3 (.Y(clk_div_en), 
	.A(HTIE_LTIEHI_NET));
endmodule

module P_MUX (
	sel, 
	ratio);
   input [5:0] sel;
   output [7:0] ratio;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n14;
   wire n15;
   wire n16;
   wire n17;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   NAND4BX1M U11 (.Y(n6), 
	.D(n14), 
	.C(n15), 
	.B(sel[3]), 
	.AN(sel[4]));
   NAND4BX1M U12 (.Y(n7), 
	.D(n14), 
	.C(n15), 
	.B(sel[4]), 
	.AN(sel[3]));
   NOR3X2M U13 (.Y(ratio[1]), 
	.C(sel[0]), 
	.B(sel[1]), 
	.A(n7));
   NOR4X1M U14 (.Y(ratio[3]), 
	.D(sel[4]), 
	.C(sel[5]), 
	.B(sel[3]), 
	.A(n5));
   NAND3X2M U15 (.Y(n5), 
	.C(sel[2]), 
	.B(n16), 
	.A(n17));
   NOR3X2M U16 (.Y(ratio[2]), 
	.C(sel[0]), 
	.B(sel[1]), 
	.A(n6));
   INVX2M U17 (.Y(n17), 
	.A(sel[0]));
   INVX2M U18 (.Y(n16), 
	.A(sel[1]));
   INVX2M U19 (.Y(n15), 
	.A(sel[2]));
   INVX2M U20 (.Y(n14), 
	.A(sel[5]));
   OAI211X2M U21 (.Y(ratio[0]), 
	.C0(n16), 
	.B0(n17), 
	.A1(n9), 
	.A0(n8));
   NOR4X1M U22 (.Y(n8), 
	.D(n15), 
	.C(sel[3]), 
	.B(sel[4]), 
	.A(sel[5]));
   NAND2X2M U23 (.Y(n9), 
	.B(n6), 
	.A(n7));
   INVX2M U3 (.Y(ratio[4]), 
	.A(HTIE_LTIEHI_NET));
   INVX2M U5 (.Y(ratio[5]), 
	.A(HTIE_LTIEHI_NET));
   INVX2M U7 (.Y(ratio[6]), 
	.A(HTIE_LTIEHI_NET));
   INVX2M U9 (.Y(ratio[7]), 
	.A(HTIE_LTIEHI_NET));
endmodule

module ClkDiv_0_DW01_inc_0 (
	A, 
	SUM);
   input [7:0] A;
   output [7:0] SUM;

   // Internal wires
   wire [7:2] carry;

   ADDHX1M U1_1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.B(carry[6]), 
	.A(A[6]));
   ADDHX1M U1_1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.B(A[0]), 
	.A(A[1]));
   ADDHX1M U1_1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.B(carry[4]), 
	.A(A[4]));
   ADDHX1M U1_1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.B(carry[3]), 
	.A(A[3]));
   ADDHX1M U1_1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.B(carry[2]), 
	.A(A[2]));
   ADDHX1M U1_1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.B(carry[5]), 
	.A(A[5]));
   CLKXOR2X2M U1 (.Y(SUM[7]), 
	.B(A[7]), 
	.A(carry[7]));
endmodule

module ClkDiv_0_DW01_inc_1 (
	A, 
	SUM);
   input [7:0] A;
   output [7:0] SUM;

   // Internal wires
   wire [7:2] carry;

   ADDHX1M U1_1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.B(carry[6]), 
	.A(A[6]));
   ADDHX1M U1_1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.B(carry[3]), 
	.A(A[3]));
   ADDHX1M U1_1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.B(carry[4]), 
	.A(A[4]));
   ADDHX1M U1_1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.B(carry[5]), 
	.A(A[5]));
   ADDHX1M U1_1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.B(carry[2]), 
	.A(A[2]));
   ADDHX1M U1_1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.B(A[0]), 
	.A(A[1]));
   CLKXOR2X2M U1 (.Y(SUM[7]), 
	.B(A[7]), 
	.A(carry[7]));
   CLKINVX1M U2 (.Y(SUM[0]), 
	.A(A[0]));
endmodule

module ClkDiv_test_0 (
	I_ref_clk, 
	I_rst_n, 
	I_clk_en, 
	I_div_ratio, 
	o_div_clk, 
	test_si, 
	test_so, 
	test_se, 
	SYNC_RST22__Exclude_0_NET, 
	CLKR__L14_N0, 
	CLKR__L7_N0, 
	FE_OFN4_SYNC_RST22__Exclude_0_NET);
   input I_ref_clk;
   input I_rst_n;
   input I_clk_en;
   input [7:0] I_div_ratio;
   output o_div_clk;
   input test_si;
   output test_so;
   input test_se;
   input SYNC_RST22__Exclude_0_NET;
   input CLKR__L14_N0;
   input CLKR__L7_N0;
   input FE_OFN4_SYNC_RST22__Exclude_0_NET;

   // Internal wires
   wire FE_PHN12_div_clk__Exclude_0_NET;
   wire div_clk__Exclude_0_NET;
   wire n7__L1_N0;
   wire HTIE_LTIEHI_NET;
   wire LTIE_LTIELO_NET;
   wire FE_UNCONNECTED_0;
   wire div_clk;
   wire flag;
   wire N7;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire N40;
   wire N41;
   wire N42;
   wire N43;
   wire N44;
   wire N45;
   wire N46;
   wire N47;
   wire n36;
   wire n37;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire [7:0] half_toggle;
   wire [7:0] half_toggle_p;
   wire [7:0] counter;

   assign test_so = flag ;

   DLY2X1M FE_PHC12_div_clk__Exclude_0_NET (.Y(FE_PHN12_div_clk__Exclude_0_NET), 
	.A(div_clk__Exclude_0_NET));
   BUFX2M div_clk__Exclude_0 (.Y(div_clk__Exclude_0_NET), 
	.A(div_clk));
   BUFX2M n7__L1_I0 (.Y(n7__L1_N0), 
	.A(n7));
   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   TIELOM LTIE_LTIELO (.Y(LTIE_LTIELO_NET));
   SDFFRQX2M div_clk_reg (.SI(counter[7]), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(div_clk), 
	.D(n36), 
	.CK(CLKR__L7_N0));
   SDFFRQX2M flag_reg (.SI(FE_PHN12_div_clk__Exclude_0_NET), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(flag), 
	.D(n37), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[7]  (.SI(counter[6]), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(counter[7]), 
	.D(N47), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(FE_OFN4_SYNC_RST22__Exclude_0_NET), 
	.Q(counter[0]), 
	.D(N40), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[6]  (.SI(counter[5]), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(counter[6]), 
	.D(N46), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[4]  (.SI(n38), 
	.SE(test_se), 
	.RN(FE_OFN4_SYNC_RST22__Exclude_0_NET), 
	.Q(counter[4]), 
	.D(N44), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[3]  (.SI(counter[2]), 
	.SE(test_se), 
	.RN(FE_OFN4_SYNC_RST22__Exclude_0_NET), 
	.Q(counter[3]), 
	.D(N43), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[5]  (.SI(counter[4]), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(counter[5]), 
	.D(N45), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[1]  (.SI(counter[0]), 
	.SE(test_se), 
	.RN(FE_OFN4_SYNC_RST22__Exclude_0_NET), 
	.Q(counter[1]), 
	.D(N41), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[2]  (.SI(counter[1]), 
	.SE(test_se), 
	.RN(FE_OFN4_SYNC_RST22__Exclude_0_NET), 
	.Q(counter[2]), 
	.D(N42), 
	.CK(CLKR__L14_N0));
   OR2X2M U5 (.Y(n1), 
	.B(I_div_ratio[1]), 
	.A(I_div_ratio[2]));
   OAI211X2M U6 (.Y(n12), 
	.C0(n13), 
	.B0(n10), 
	.A1(n14), 
	.A0(I_div_ratio[0]));
   CLKINVX1M U7 (.Y(half_toggle[0]), 
	.A(I_div_ratio[1]));
   OAI2BB1X1M U8 (.Y(half_toggle[1]), 
	.B0(n1), 
	.A1N(I_div_ratio[2]), 
	.A0N(I_div_ratio[1]));
   OR2X1M U9 (.Y(n2), 
	.B(I_div_ratio[3]), 
	.A(n1));
   OAI2BB1X1M U10 (.Y(half_toggle[2]), 
	.B0(n2), 
	.A1N(I_div_ratio[3]), 
	.A0N(n1));
   OR2X1M U19 (.Y(n3), 
	.B(LTIE_LTIELO_NET), 
	.A(n2));
   OAI2BB1X1M U20 (.Y(half_toggle[3]), 
	.B0(n3), 
	.A1N(LTIE_LTIELO_NET), 
	.A0N(n2));
   OR2X1M U21 (.Y(n4), 
	.B(LTIE_LTIELO_NET), 
	.A(n3));
   OAI2BB1X1M U22 (.Y(half_toggle[4]), 
	.B0(n4), 
	.A1N(LTIE_LTIELO_NET), 
	.A0N(n3));
   XNOR2X1M U23 (.Y(half_toggle[5]), 
	.B(n4), 
	.A(LTIE_LTIELO_NET));
   NOR3X1M U24 (.Y(half_toggle[7]), 
	.C(n4), 
	.B(LTIE_LTIELO_NET), 
	.A(LTIE_LTIELO_NET));
   OAI21X1M U25 (.Y(n5), 
	.B0(LTIE_LTIELO_NET), 
	.A1(n4), 
	.A0(LTIE_LTIELO_NET));
   NAND2BX1M U26 (.Y(half_toggle[6]), 
	.B(n5), 
	.AN(half_toggle[7]));
   OR4X1M U27 (.Y(n6), 
	.D(LTIE_LTIELO_NET), 
	.C(LTIE_LTIELO_NET), 
	.B(LTIE_LTIELO_NET), 
	.A(LTIE_LTIELO_NET));
   OR4X1M U28 (.Y(N7), 
	.D(n6), 
	.C(I_div_ratio[1]), 
	.B(I_div_ratio[2]), 
	.A(I_div_ratio[3]));
   CLKMX2X2M U29 (.Y(o_div_clk), 
	.S0(n7__L1_N0), 
	.B(div_clk), 
	.A(I_ref_clk));
   NOR2BX1M U30 (.Y(n7), 
	.B(n8), 
	.AN(I_rst_n));
   NOR2X1M U31 (.Y(n37), 
	.B(n8), 
	.A(n9));
   CLKXOR2X2M U32 (.Y(n9), 
	.B(n10), 
	.A(flag));
   MXI2X1M U33 (.Y(n36), 
	.S0(div_clk__Exclude_0_NET), 
	.B(n12), 
	.A(n11));
   CLKNAND2X2M U34 (.Y(n11), 
	.B(n12), 
	.A(n13));
   NOR2BX1M U35 (.Y(N47), 
	.B(n12), 
	.AN(N25));
   NOR2BX1M U36 (.Y(N46), 
	.B(n12), 
	.AN(N24));
   NOR2BX1M U37 (.Y(N45), 
	.B(n12), 
	.AN(N23));
   NOR2BX1M U38 (.Y(N44), 
	.B(n12), 
	.AN(N22));
   NOR2BX1M U39 (.Y(N43), 
	.B(n12), 
	.AN(N21));
   NOR2BX1M U40 (.Y(N42), 
	.B(n12), 
	.AN(N20));
   NOR2BX1M U41 (.Y(N41), 
	.B(n12), 
	.AN(N19));
   NOR2BX1M U42 (.Y(N40), 
	.B(n12), 
	.AN(n46));
   CLKINVX1M U43 (.Y(n13), 
	.A(n8));
   CLKNAND2X2M U44 (.Y(n8), 
	.B(HTIE_LTIEHI_NET), 
	.A(N7));
   CLKNAND2X2M U45 (.Y(n10), 
	.B(I_div_ratio[0]), 
	.A(n15));
   MXI2X1M U46 (.Y(n15), 
	.S0(flag), 
	.B(n26), 
	.A(n14));
   AOI2B1X1M U47 (.Y(n26), 
	.B0(n27), 
	.A1N(half_toggle_p[7]), 
	.A0(counter[7]));
   AOI221XLM U48 (.Y(n27), 
	.C0(n30), 
	.B1(n29), 
	.B0(half_toggle_p[6]), 
	.A1(n28), 
	.A0(half_toggle_p[7]));
   AOI2B1X1M U49 (.Y(n30), 
	.B0(n31), 
	.A1N(half_toggle_p[6]), 
	.A0(counter[6]));
   AOI2B1X1M U50 (.Y(n31), 
	.B0(n32), 
	.A1N(counter[5]), 
	.A0(half_toggle_p[5]));
   AOI221XLM U51 (.Y(n32), 
	.C0(n35), 
	.B1(n34), 
	.B0(counter[5]), 
	.A1(n33), 
	.A0(counter[4]));
   AOI221XLM U52 (.Y(n35), 
	.C0(n40), 
	.B1(n39), 
	.B0(half_toggle_p[4]), 
	.A1(n38), 
	.A0(half_toggle_p[3]));
   AOI222X1M U53 (.Y(n40), 
	.C1(n44), 
	.C0(counter[3]), 
	.B1(n43), 
	.B0(n42), 
	.A1(n41), 
	.A0(counter[2]));
   CLKINVX1M U54 (.Y(n44), 
	.A(half_toggle_p[3]));
   OAI211X1M U55 (.Y(n43), 
	.C0(half_toggle_p[0]), 
	.B0(n46), 
	.A1(n45), 
	.A0(half_toggle_p[1]));
   AOI22X1M U56 (.Y(n42), 
	.B1(n45), 
	.B0(half_toggle_p[1]), 
	.A1(n47), 
	.A0(half_toggle_p[2]));
   CLKINVX1M U57 (.Y(n41), 
	.A(half_toggle_p[2]));
   CLKINVX1M U58 (.Y(n34), 
	.A(half_toggle_p[5]));
   CLKINVX1M U59 (.Y(n33), 
	.A(half_toggle_p[4]));
   NOR2X1M U60 (.Y(n14), 
	.B(n49), 
	.A(n48));
   AOI221XLM U61 (.Y(n49), 
	.C0(n50), 
	.B1(half_toggle[7]), 
	.B0(n28), 
	.A1(half_toggle[6]), 
	.A0(n29));
   OA22X1M U62 (.Y(n50), 
	.B1(n29), 
	.B0(half_toggle[6]), 
	.A1(n52), 
	.A0(n51));
   NOR2X1M U63 (.Y(n52), 
	.B(n53), 
	.A(counter[5]));
   AOI221XLM U64 (.Y(n51), 
	.C0(n55), 
	.B1(n53), 
	.B0(counter[5]), 
	.A1(n54), 
	.A0(counter[4]));
   AOI221XLM U65 (.Y(n55), 
	.C0(n56), 
	.B1(n39), 
	.B0(half_toggle[4]), 
	.A1(n38), 
	.A0(half_toggle[3]));
   AOI222X1M U66 (.Y(n56), 
	.C1(n60), 
	.C0(counter[3]), 
	.B1(n59), 
	.B0(n58), 
	.A1(n57), 
	.A0(counter[2]));
   CLKINVX1M U67 (.Y(n60), 
	.A(half_toggle[3]));
   OAI211X1M U68 (.Y(n59), 
	.C0(half_toggle[0]), 
	.B0(n46), 
	.A1(n45), 
	.A0(half_toggle[1]));
   CLKINVX1M U69 (.Y(n46), 
	.A(counter[0]));
   AOI22X1M U70 (.Y(n58), 
	.B1(n45), 
	.B0(half_toggle[1]), 
	.A1(n47), 
	.A0(half_toggle[2]));
   CLKINVX1M U71 (.Y(n45), 
	.A(counter[1]));
   CLKINVX1M U72 (.Y(n47), 
	.A(counter[2]));
   CLKINVX1M U73 (.Y(n57), 
	.A(half_toggle[2]));
   CLKINVX1M U74 (.Y(n39), 
	.A(counter[4]));
   CLKINVX1M U75 (.Y(n38), 
	.A(counter[3]));
   CLKINVX1M U76 (.Y(n53), 
	.A(half_toggle[5]));
   CLKINVX1M U77 (.Y(n54), 
	.A(half_toggle[4]));
   CLKINVX1M U78 (.Y(n29), 
	.A(counter[6]));
   NOR2X1M U79 (.Y(n48), 
	.B(half_toggle[7]), 
	.A(n28));
   CLKINVX1M U80 (.Y(n28), 
	.A(counter[7]));
   ClkDiv_0_DW01_inc_0 add_49 (.A({ counter[7],
		counter[6],
		counter[5],
		counter[4],
		counter[3],
		counter[2],
		counter[1],
		counter[0] }), 
	.SUM({ N25,
		N24,
		N23,
		N22,
		N21,
		N20,
		N19,
		FE_UNCONNECTED_0 }));
   ClkDiv_0_DW01_inc_1 add_20 (.A({ half_toggle[7],
		half_toggle[6],
		half_toggle[5],
		half_toggle[4],
		half_toggle[3],
		half_toggle[2],
		half_toggle[1],
		half_toggle[0] }), 
	.SUM({ half_toggle_p[7],
		half_toggle_p[6],
		half_toggle_p[5],
		half_toggle_p[4],
		half_toggle_p[3],
		half_toggle_p[2],
		half_toggle_p[1],
		half_toggle_p[0] }));
endmodule

module RST_SYNC_NUM_STAGES2_test_0 (
	RST, 
	CLK, 
	SYNC_RST, 
	test_si, 
	test_se);
   input RST;
   input CLK;
   output SYNC_RST;
   input test_si;
   input test_se;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire \sync_reg[0] ;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   SDFFRQX2M \sync_reg_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(\sync_reg[0] ), 
	.D(HTIE_LTIEHI_NET), 
	.CK(CLK));
   SDFFRQX1M \sync_reg_reg[1]  (.SI(\sync_reg[0] ), 
	.SE(test_se), 
	.RN(RST), 
	.Q(SYNC_RST), 
	.D(\sync_reg[0] ), 
	.CK(CLK));
endmodule

module RST_SYNC_NUM_STAGES2_test_1 (
	RST, 
	CLK, 
	SYNC_RST, 
	test_si, 
	test_se, 
	CLKR__L1_N0);
   input RST;
   input CLK;
   output SYNC_RST;
   input test_si;
   input test_se;
   input CLKR__L1_N0;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire \sync_reg[0] ;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   SDFFRQX2M \sync_reg_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(\sync_reg[0] ), 
	.D(HTIE_LTIEHI_NET), 
	.CK(CLK));
   SDFFRQX1M \sync_reg_reg[1]  (.SI(\sync_reg[0] ), 
	.SE(test_se), 
	.RN(RST), 
	.Q(SYNC_RST), 
	.D(\sync_reg[0] ), 
	.CK(CLKR__L1_N0));
endmodule

module CLK_GATE (
	CLK_EN, 
	CLK, 
	GATED_CLK);
   input CLK_EN;
   input CLK;
   output GATED_CLK;

   TLATNCAX12M U0_TLATNCAX12M (.ECK(GATED_CLK), 
	.E(CLK_EN), 
	.CK(CLK));
endmodule

module ALU_16B_DW_div_uns_0 (
	a, 
	b, 
	quotient, 
	remainder, 
	divide_by_0, 
	n159, 
	n157, 
	n167, 
	n163, 
	n155, 
	n154, 
	n139, 
	n164, 
	n161, 
	n160, 
	n168, 
	n165, 
	n158, 
	n156, 
	n166);
   input [7:0] a;
   input [7:0] b;
   output [7:0] quotient;
   output [7:0] remainder;
   output divide_by_0;
   input n159;
   input n157;
   input n167;
   input n163;
   input n155;
   input n154;
   input n139;
   input n164;
   input n161;
   input n160;
   input n168;
   input n165;
   input n158;
   input n156;
   input n166;

   // Internal wires
   wire \u_div/SumTmp[1][0] ;
   wire \u_div/SumTmp[1][1] ;
   wire \u_div/SumTmp[1][2] ;
   wire \u_div/SumTmp[1][3] ;
   wire \u_div/SumTmp[1][4] ;
   wire \u_div/SumTmp[1][5] ;
   wire \u_div/SumTmp[1][6] ;
   wire \u_div/SumTmp[2][0] ;
   wire \u_div/SumTmp[2][1] ;
   wire \u_div/SumTmp[2][2] ;
   wire \u_div/SumTmp[2][3] ;
   wire \u_div/SumTmp[2][4] ;
   wire \u_div/SumTmp[2][5] ;
   wire \u_div/SumTmp[3][0] ;
   wire \u_div/SumTmp[3][1] ;
   wire \u_div/SumTmp[3][2] ;
   wire \u_div/SumTmp[3][3] ;
   wire \u_div/SumTmp[3][4] ;
   wire \u_div/SumTmp[4][0] ;
   wire \u_div/SumTmp[4][1] ;
   wire \u_div/SumTmp[4][2] ;
   wire \u_div/SumTmp[4][3] ;
   wire \u_div/SumTmp[5][0] ;
   wire \u_div/SumTmp[5][1] ;
   wire \u_div/SumTmp[5][2] ;
   wire \u_div/SumTmp[6][0] ;
   wire \u_div/SumTmp[6][1] ;
   wire \u_div/SumTmp[7][0] ;
   wire \u_div/CryTmp[0][1] ;
   wire \u_div/CryTmp[0][2] ;
   wire \u_div/CryTmp[0][3] ;
   wire \u_div/CryTmp[0][4] ;
   wire \u_div/CryTmp[0][5] ;
   wire \u_div/CryTmp[0][6] ;
   wire \u_div/CryTmp[0][7] ;
   wire \u_div/CryTmp[1][1] ;
   wire \u_div/CryTmp[1][2] ;
   wire \u_div/CryTmp[1][3] ;
   wire \u_div/CryTmp[1][4] ;
   wire \u_div/CryTmp[1][5] ;
   wire \u_div/CryTmp[1][6] ;
   wire \u_div/CryTmp[1][7] ;
   wire \u_div/CryTmp[2][1] ;
   wire \u_div/CryTmp[2][2] ;
   wire \u_div/CryTmp[2][3] ;
   wire \u_div/CryTmp[2][4] ;
   wire \u_div/CryTmp[2][5] ;
   wire \u_div/CryTmp[2][6] ;
   wire \u_div/CryTmp[3][1] ;
   wire \u_div/CryTmp[3][2] ;
   wire \u_div/CryTmp[3][3] ;
   wire \u_div/CryTmp[3][4] ;
   wire \u_div/CryTmp[3][5] ;
   wire \u_div/CryTmp[4][1] ;
   wire \u_div/CryTmp[4][2] ;
   wire \u_div/CryTmp[4][3] ;
   wire \u_div/CryTmp[4][4] ;
   wire \u_div/CryTmp[5][1] ;
   wire \u_div/CryTmp[5][2] ;
   wire \u_div/CryTmp[5][3] ;
   wire \u_div/CryTmp[6][1] ;
   wire \u_div/CryTmp[6][2] ;
   wire \u_div/CryTmp[7][1] ;
   wire \u_div/PartRem[1][1] ;
   wire \u_div/PartRem[1][2] ;
   wire \u_div/PartRem[1][3] ;
   wire \u_div/PartRem[1][4] ;
   wire \u_div/PartRem[1][5] ;
   wire \u_div/PartRem[1][6] ;
   wire \u_div/PartRem[1][7] ;
   wire \u_div/PartRem[2][1] ;
   wire \u_div/PartRem[2][2] ;
   wire \u_div/PartRem[2][3] ;
   wire \u_div/PartRem[2][4] ;
   wire \u_div/PartRem[2][5] ;
   wire \u_div/PartRem[2][6] ;
   wire \u_div/PartRem[3][1] ;
   wire \u_div/PartRem[3][2] ;
   wire \u_div/PartRem[3][3] ;
   wire \u_div/PartRem[3][4] ;
   wire \u_div/PartRem[3][5] ;
   wire \u_div/PartRem[4][1] ;
   wire \u_div/PartRem[4][2] ;
   wire \u_div/PartRem[4][3] ;
   wire \u_div/PartRem[4][4] ;
   wire \u_div/PartRem[5][1] ;
   wire \u_div/PartRem[5][2] ;
   wire \u_div/PartRem[5][3] ;
   wire \u_div/PartRem[6][1] ;
   wire \u_div/PartRem[6][2] ;
   wire \u_div/PartRem[7][1] ;
   wire n1;
   wire n2;
   wire n3;
   wire n5;
   wire n7;
   wire n8;
   wire n9;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;

   ADDFX2M \u_div/u_fa_PartRem_0_1_6  (.S(\u_div/SumTmp[1][6] ), 
	.CO(\u_div/CryTmp[1][7] ), 
	.CI(\u_div/CryTmp[1][6] ), 
	.B(n13), 
	.A(\u_div/PartRem[2][6] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_5  (.S(\u_div/SumTmp[2][5] ), 
	.CO(\u_div/CryTmp[2][6] ), 
	.CI(\u_div/CryTmp[2][5] ), 
	.B(n14), 
	.A(\u_div/PartRem[3][5] ));
   ADDFX2M \u_div/u_fa_PartRem_0_4_3  (.S(\u_div/SumTmp[4][3] ), 
	.CO(\u_div/CryTmp[4][4] ), 
	.CI(\u_div/CryTmp[4][3] ), 
	.B(n16), 
	.A(\u_div/PartRem[5][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_5_2  (.S(\u_div/SumTmp[5][2] ), 
	.CO(\u_div/CryTmp[5][3] ), 
	.CI(\u_div/CryTmp[5][2] ), 
	.B(n17), 
	.A(\u_div/PartRem[6][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_6_1  (.S(\u_div/SumTmp[6][1] ), 
	.CO(\u_div/CryTmp[6][2] ), 
	.CI(\u_div/CryTmp[6][1] ), 
	.B(n18), 
	.A(\u_div/PartRem[7][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_4  (.S(\u_div/SumTmp[3][4] ), 
	.CO(\u_div/CryTmp[3][5] ), 
	.CI(\u_div/CryTmp[3][4] ), 
	.B(n15), 
	.A(\u_div/PartRem[4][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_6  (.CO(\u_div/CryTmp[0][7] ), 
	.CI(\u_div/CryTmp[0][6] ), 
	.B(n13), 
	.A(\u_div/PartRem[1][6] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_7  (.CO(quotient[0]), 
	.CI(\u_div/CryTmp[0][7] ), 
	.B(n12), 
	.A(\u_div/PartRem[1][7] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_1  (.S(\u_div/SumTmp[1][1] ), 
	.CO(\u_div/CryTmp[1][2] ), 
	.CI(\u_div/CryTmp[1][1] ), 
	.B(n18), 
	.A(\u_div/PartRem[2][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_1  (.S(\u_div/SumTmp[2][1] ), 
	.CO(\u_div/CryTmp[2][2] ), 
	.CI(\u_div/CryTmp[2][1] ), 
	.B(n18), 
	.A(\u_div/PartRem[3][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_1  (.S(\u_div/SumTmp[3][1] ), 
	.CO(\u_div/CryTmp[3][2] ), 
	.CI(\u_div/CryTmp[3][1] ), 
	.B(n18), 
	.A(\u_div/PartRem[4][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_4_1  (.S(\u_div/SumTmp[4][1] ), 
	.CO(\u_div/CryTmp[4][2] ), 
	.CI(\u_div/CryTmp[4][1] ), 
	.B(n18), 
	.A(\u_div/PartRem[5][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_5_1  (.S(\u_div/SumTmp[5][1] ), 
	.CO(\u_div/CryTmp[5][2] ), 
	.CI(\u_div/CryTmp[5][1] ), 
	.B(n18), 
	.A(\u_div/PartRem[6][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_3  (.CO(\u_div/CryTmp[0][4] ), 
	.CI(\u_div/CryTmp[0][3] ), 
	.B(n16), 
	.A(\u_div/PartRem[1][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_4  (.CO(\u_div/CryTmp[0][5] ), 
	.CI(\u_div/CryTmp[0][4] ), 
	.B(n15), 
	.A(\u_div/PartRem[1][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_5  (.CO(\u_div/CryTmp[0][6] ), 
	.CI(\u_div/CryTmp[0][5] ), 
	.B(n14), 
	.A(\u_div/PartRem[1][5] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_4  (.S(\u_div/SumTmp[1][4] ), 
	.CO(\u_div/CryTmp[1][5] ), 
	.CI(\u_div/CryTmp[1][4] ), 
	.B(n15), 
	.A(\u_div/PartRem[2][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_1  (.CO(\u_div/CryTmp[0][2] ), 
	.CI(\u_div/CryTmp[0][1] ), 
	.B(n18), 
	.A(\u_div/PartRem[1][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_2  (.CO(\u_div/CryTmp[0][3] ), 
	.CI(\u_div/CryTmp[0][2] ), 
	.B(n17), 
	.A(\u_div/PartRem[1][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_3  (.S(\u_div/SumTmp[1][3] ), 
	.CO(\u_div/CryTmp[1][4] ), 
	.CI(\u_div/CryTmp[1][3] ), 
	.B(n16), 
	.A(\u_div/PartRem[2][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_5  (.S(\u_div/SumTmp[1][5] ), 
	.CO(\u_div/CryTmp[1][6] ), 
	.CI(\u_div/CryTmp[1][5] ), 
	.B(n14), 
	.A(\u_div/PartRem[2][5] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_2  (.S(\u_div/SumTmp[1][2] ), 
	.CO(\u_div/CryTmp[1][3] ), 
	.CI(\u_div/CryTmp[1][2] ), 
	.B(n17), 
	.A(\u_div/PartRem[2][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_4  (.S(\u_div/SumTmp[2][4] ), 
	.CO(\u_div/CryTmp[2][5] ), 
	.CI(\u_div/CryTmp[2][4] ), 
	.B(n15), 
	.A(\u_div/PartRem[3][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_3  (.S(\u_div/SumTmp[2][3] ), 
	.CO(\u_div/CryTmp[2][4] ), 
	.CI(\u_div/CryTmp[2][3] ), 
	.B(n16), 
	.A(\u_div/PartRem[3][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_2  (.S(\u_div/SumTmp[2][2] ), 
	.CO(\u_div/CryTmp[2][3] ), 
	.CI(\u_div/CryTmp[2][2] ), 
	.B(n17), 
	.A(\u_div/PartRem[3][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_3  (.S(\u_div/SumTmp[3][3] ), 
	.CO(\u_div/CryTmp[3][4] ), 
	.CI(\u_div/CryTmp[3][3] ), 
	.B(n16), 
	.A(\u_div/PartRem[4][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_2  (.S(\u_div/SumTmp[3][2] ), 
	.CO(\u_div/CryTmp[3][3] ), 
	.CI(\u_div/CryTmp[3][2] ), 
	.B(n17), 
	.A(\u_div/PartRem[4][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_4_2  (.S(\u_div/SumTmp[4][2] ), 
	.CO(\u_div/CryTmp[4][3] ), 
	.CI(\u_div/CryTmp[4][2] ), 
	.B(n17), 
	.A(\u_div/PartRem[5][2] ));
   INVX2M U1 (.Y(n19), 
	.A(b[0]));
   XNOR2X2M U2 (.Y(\u_div/SumTmp[7][0] ), 
	.B(a[7]), 
	.A(n19));
   XNOR2X2M U3 (.Y(\u_div/SumTmp[6][0] ), 
	.B(a[6]), 
	.A(n19));
   XNOR2X2M U4 (.Y(\u_div/SumTmp[5][0] ), 
	.B(a[5]), 
	.A(n19));
   XNOR2X2M U5 (.Y(\u_div/SumTmp[4][0] ), 
	.B(a[4]), 
	.A(n19));
   XNOR2X2M U6 (.Y(\u_div/SumTmp[3][0] ), 
	.B(a[3]), 
	.A(n19));
   XNOR2X2M U7 (.Y(\u_div/SumTmp[2][0] ), 
	.B(a[2]), 
	.A(n19));
   XNOR2X2M U8 (.Y(\u_div/SumTmp[1][0] ), 
	.B(a[1]), 
	.A(n19));
   OR2X2M U9 (.Y(\u_div/CryTmp[7][1] ), 
	.B(a[7]), 
	.A(n19));
   NAND2X2M U10 (.Y(\u_div/CryTmp[0][1] ), 
	.B(n11), 
	.A(n2));
   NAND2X2M U11 (.Y(\u_div/CryTmp[5][1] ), 
	.B(n3), 
	.A(n2));
   INVX2M U12 (.Y(n3), 
	.A(a[5]));
   INVX2M U13 (.Y(n2), 
	.A(n19));
   NAND2X2M U14 (.Y(\u_div/CryTmp[4][1] ), 
	.B(n5), 
	.A(n2));
   INVX2M U15 (.Y(n5), 
	.A(a[4]));
   NAND2X2M U17 (.Y(\u_div/CryTmp[3][1] ), 
	.B(n7), 
	.A(n2));
   INVX2M U18 (.Y(n7), 
	.A(a[3]));
   NAND2X2M U20 (.Y(\u_div/CryTmp[2][1] ), 
	.B(n8), 
	.A(n2));
   INVX2M U21 (.Y(n8), 
	.A(a[2]));
   NAND2X2M U22 (.Y(\u_div/CryTmp[1][1] ), 
	.B(n9), 
	.A(n2));
   INVX2M U23 (.Y(n9), 
	.A(a[1]));
   NAND2X2M U25 (.Y(\u_div/CryTmp[6][1] ), 
	.B(n1), 
	.A(n2));
   INVX2M U26 (.Y(n1), 
	.A(a[6]));
   INVX2M U27 (.Y(n11), 
	.A(a[0]));
   INVX2M U28 (.Y(n18), 
	.A(b[1]));
   INVX2M U29 (.Y(n17), 
	.A(b[2]));
   INVX2M U30 (.Y(n16), 
	.A(b[3]));
   INVX2M U31 (.Y(n15), 
	.A(b[4]));
   INVX2M U32 (.Y(n14), 
	.A(b[5]));
   INVX2M U33 (.Y(n13), 
	.A(b[6]));
   INVX2M U34 (.Y(n12), 
	.A(b[7]));
   CLKMX2X2M U35 (.Y(\u_div/PartRem[1][7] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][6] ), 
	.A(\u_div/PartRem[2][6] ));
   CLKMX2X2M U36 (.Y(\u_div/PartRem[2][6] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][5] ), 
	.A(\u_div/PartRem[3][5] ));
   CLKMX2X2M U37 (.Y(\u_div/PartRem[3][5] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][4] ), 
	.A(\u_div/PartRem[4][4] ));
   CLKMX2X2M U38 (.Y(\u_div/PartRem[4][4] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][3] ), 
	.A(\u_div/PartRem[5][3] ));
   CLKMX2X2M U39 (.Y(\u_div/PartRem[5][3] ), 
	.S0(quotient[5]), 
	.B(\u_div/SumTmp[5][2] ), 
	.A(\u_div/PartRem[6][2] ));
   CLKMX2X2M U40 (.Y(\u_div/PartRem[6][2] ), 
	.S0(quotient[6]), 
	.B(\u_div/SumTmp[6][1] ), 
	.A(\u_div/PartRem[7][1] ));
   CLKMX2X2M U41 (.Y(\u_div/PartRem[7][1] ), 
	.S0(quotient[7]), 
	.B(\u_div/SumTmp[7][0] ), 
	.A(a[7]));
   CLKMX2X2M U42 (.Y(\u_div/PartRem[1][6] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][5] ), 
	.A(\u_div/PartRem[2][5] ));
   CLKMX2X2M U43 (.Y(\u_div/PartRem[2][5] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][4] ), 
	.A(\u_div/PartRem[3][4] ));
   CLKMX2X2M U44 (.Y(\u_div/PartRem[3][4] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][3] ), 
	.A(\u_div/PartRem[4][3] ));
   CLKMX2X2M U45 (.Y(\u_div/PartRem[4][3] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][2] ), 
	.A(\u_div/PartRem[5][2] ));
   CLKMX2X2M U46 (.Y(\u_div/PartRem[5][2] ), 
	.S0(quotient[5]), 
	.B(\u_div/SumTmp[5][1] ), 
	.A(\u_div/PartRem[6][1] ));
   CLKMX2X2M U47 (.Y(\u_div/PartRem[6][1] ), 
	.S0(quotient[6]), 
	.B(\u_div/SumTmp[6][0] ), 
	.A(a[6]));
   CLKMX2X2M U48 (.Y(\u_div/PartRem[1][5] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][4] ), 
	.A(\u_div/PartRem[2][4] ));
   CLKMX2X2M U49 (.Y(\u_div/PartRem[2][4] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][3] ), 
	.A(\u_div/PartRem[3][3] ));
   CLKMX2X2M U50 (.Y(\u_div/PartRem[3][3] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][2] ), 
	.A(\u_div/PartRem[4][2] ));
   CLKMX2X2M U51 (.Y(\u_div/PartRem[4][2] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][1] ), 
	.A(\u_div/PartRem[5][1] ));
   CLKMX2X2M U52 (.Y(\u_div/PartRem[5][1] ), 
	.S0(quotient[5]), 
	.B(\u_div/SumTmp[5][0] ), 
	.A(a[5]));
   CLKMX2X2M U53 (.Y(\u_div/PartRem[1][4] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][3] ), 
	.A(\u_div/PartRem[2][3] ));
   CLKMX2X2M U54 (.Y(\u_div/PartRem[2][3] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][2] ), 
	.A(\u_div/PartRem[3][2] ));
   CLKMX2X2M U55 (.Y(\u_div/PartRem[3][2] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][1] ), 
	.A(\u_div/PartRem[4][1] ));
   CLKMX2X2M U56 (.Y(\u_div/PartRem[4][1] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][0] ), 
	.A(a[4]));
   CLKMX2X2M U57 (.Y(\u_div/PartRem[1][3] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][2] ), 
	.A(\u_div/PartRem[2][2] ));
   CLKMX2X2M U58 (.Y(\u_div/PartRem[2][2] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][1] ), 
	.A(\u_div/PartRem[3][1] ));
   CLKMX2X2M U59 (.Y(\u_div/PartRem[3][1] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][0] ), 
	.A(a[3]));
   CLKMX2X2M U60 (.Y(\u_div/PartRem[1][2] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][1] ), 
	.A(\u_div/PartRem[2][1] ));
   CLKMX2X2M U61 (.Y(\u_div/PartRem[2][1] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][0] ), 
	.A(a[2]));
   CLKMX2X2M U62 (.Y(\u_div/PartRem[1][1] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][0] ), 
	.A(a[1]));
   AND4X1M U63 (.Y(quotient[7]), 
	.D(n17), 
	.C(n18), 
	.B(n20), 
	.A(\u_div/CryTmp[7][1] ));
   AND3X1M U64 (.Y(quotient[6]), 
	.C(\u_div/CryTmp[6][2] ), 
	.B(n17), 
	.A(n20));
   AND2X1M U65 (.Y(quotient[5]), 
	.B(n20), 
	.A(\u_div/CryTmp[5][3] ));
   AND2X1M U66 (.Y(n20), 
	.B(n16), 
	.A(n21));
   AND2X1M U67 (.Y(quotient[4]), 
	.B(n21), 
	.A(\u_div/CryTmp[4][4] ));
   AND3X1M U68 (.Y(n21), 
	.C(n14), 
	.B(n15), 
	.A(n22));
   AND3X1M U69 (.Y(quotient[3]), 
	.C(\u_div/CryTmp[3][5] ), 
	.B(n14), 
	.A(n22));
   AND2X1M U70 (.Y(quotient[2]), 
	.B(n22), 
	.A(\u_div/CryTmp[2][6] ));
   NOR2X1M U71 (.Y(n22), 
	.B(b[7]), 
	.A(b[6]));
   AND2X1M U72 (.Y(quotient[1]), 
	.B(n12), 
	.A(\u_div/CryTmp[1][7] ));
endmodule

module ALU_16B_DW01_sub_0 (
	A, 
	B, 
	CI, 
	DIFF, 
	CO, 
	n159, 
	n157, 
	n155, 
	n154, 
	n161, 
	n160, 
	n168, 
	n158, 
	n156);
   input [8:0] A;
   input [8:0] B;
   input CI;
   output [8:0] DIFF;
   output CO;
   input n159;
   input n157;
   input n155;
   input n154;
   input n161;
   input n160;
   input n168;
   input n158;
   input n156;

   // Internal wires
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire [9:0] carry;

   ADDFX2M U2_7 (.S(DIFF[7]), 
	.CO(carry[8]), 
	.CI(carry[7]), 
	.B(n2), 
	.A(A[7]));
   ADDFX2M U2_1 (.S(DIFF[1]), 
	.CO(carry[2]), 
	.CI(carry[1]), 
	.B(n8), 
	.A(A[1]));
   ADDFX2M U2_6 (.S(DIFF[6]), 
	.CO(carry[7]), 
	.CI(carry[6]), 
	.B(n3), 
	.A(A[6]));
   ADDFX2M U2_5 (.S(DIFF[5]), 
	.CO(carry[6]), 
	.CI(carry[5]), 
	.B(n4), 
	.A(A[5]));
   ADDFX2M U2_4 (.S(DIFF[4]), 
	.CO(carry[5]), 
	.CI(carry[4]), 
	.B(n5), 
	.A(A[4]));
   ADDFX2M U2_3 (.S(DIFF[3]), 
	.CO(carry[4]), 
	.CI(carry[3]), 
	.B(n6), 
	.A(A[3]));
   ADDFX2M U2_2 (.S(DIFF[2]), 
	.CO(carry[3]), 
	.CI(carry[2]), 
	.B(n7), 
	.A(A[2]));
   XNOR2X2M U1 (.Y(DIFF[0]), 
	.B(A[0]), 
	.A(n9));
   INVX2M U2 (.Y(n9), 
	.A(B[0]));
   INVX2M U3 (.Y(n7), 
	.A(B[2]));
   INVX2M U4 (.Y(n6), 
	.A(B[3]));
   INVX2M U5 (.Y(n5), 
	.A(B[4]));
   INVX2M U6 (.Y(n4), 
	.A(B[5]));
   INVX2M U7 (.Y(n3), 
	.A(B[6]));
   NAND2X2M U8 (.Y(carry[1]), 
	.B(n1), 
	.A(B[0]));
   INVX2M U9 (.Y(n8), 
	.A(B[1]));
   INVX2M U10 (.Y(n1), 
	.A(A[0]));
   INVX2M U11 (.Y(n2), 
	.A(B[7]));
   CLKINVX1M U12 (.Y(DIFF[8]), 
	.A(carry[8]));
endmodule

module ALU_16B_DW01_add_0 (
	A, 
	B, 
	CI, 
	SUM, 
	CO);
   input [8:0] A;
   input [8:0] B;
   input CI;
   output [8:0] SUM;
   output CO;

   // Internal wires
   wire n1;
   wire [8:1] carry;

   ADDFX2M U1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.CI(n1), 
	.B(B[1]), 
	.A(A[1]));
   ADDFX2M U1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.CI(carry[6]), 
	.B(B[6]), 
	.A(A[6]));
   ADDFX2M U1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.CI(carry[5]), 
	.B(B[5]), 
	.A(A[5]));
   ADDFX2M U1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.CI(carry[4]), 
	.B(B[4]), 
	.A(A[4]));
   ADDFX2M U1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.CI(carry[3]), 
	.B(B[3]), 
	.A(A[3]));
   ADDFX2M U1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.CI(carry[2]), 
	.B(B[2]), 
	.A(A[2]));
   ADDFX2M U1_7 (.S(SUM[7]), 
	.CO(SUM[8]), 
	.CI(carry[7]), 
	.B(B[7]), 
	.A(A[7]));
   AND2X2M U1 (.Y(n1), 
	.B(A[0]), 
	.A(B[0]));
   CLKXOR2X2M U2 (.Y(SUM[0]), 
	.B(A[0]), 
	.A(B[0]));
endmodule

module ALU_16B_DW01_add_1 (
	A, 
	B, 
	CI, 
	SUM, 
	CO);
   input [13:0] A;
   input [13:0] B;
   input CI;
   output [13:0] SUM;
   output CO;

   // Internal wires
   wire n1;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;

   AOI21BX2M U2 (.Y(n1), 
	.B0N(n19), 
	.A1(A[12]), 
	.A0(n18));
   NAND2X2M U3 (.Y(n15), 
	.B(B[7]), 
	.A(A[7]));
   XNOR2X2M U4 (.Y(SUM[7]), 
	.B(n8), 
	.A(A[7]));
   INVX2M U5 (.Y(n8), 
	.A(B[7]));
   XNOR2X2M U6 (.Y(SUM[13]), 
	.B(n1), 
	.A(B[13]));
   INVX2M U7 (.Y(n9), 
	.A(A[6]));
   INVX2M U8 (.Y(SUM[6]), 
	.A(n9));
   BUFX2M U9 (.Y(SUM[0]), 
	.A(A[0]));
   BUFX2M U10 (.Y(SUM[1]), 
	.A(A[1]));
   BUFX2M U11 (.Y(SUM[2]), 
	.A(A[2]));
   BUFX2M U12 (.Y(SUM[3]), 
	.A(A[3]));
   BUFX2M U13 (.Y(SUM[4]), 
	.A(A[4]));
   BUFX2M U14 (.Y(SUM[5]), 
	.A(A[5]));
   XNOR2X1M U15 (.Y(SUM[9]), 
	.B(n11), 
	.A(n10));
   NOR2X1M U16 (.Y(n11), 
	.B(n13), 
	.A(n12));
   CLKXOR2X2M U17 (.Y(SUM[8]), 
	.B(n15), 
	.A(n14));
   NAND2BX1M U18 (.Y(n14), 
	.B(n17), 
	.AN(n16));
   OAI21X1M U19 (.Y(n19), 
	.B0(B[12]), 
	.A1(n18), 
	.A0(A[12]));
   XOR3XLM U20 (.Y(SUM[12]), 
	.C(n18), 
	.B(A[12]), 
	.A(B[12]));
   OAI21BX1M U21 (.Y(n18), 
	.B0N(n22), 
	.A1(n21), 
	.A0(n20));
   XNOR2X1M U22 (.Y(SUM[11]), 
	.B(n23), 
	.A(n21));
   NOR2X1M U23 (.Y(n23), 
	.B(n20), 
	.A(n22));
   NOR2X1M U24 (.Y(n20), 
	.B(A[11]), 
	.A(B[11]));
   AND2X1M U25 (.Y(n22), 
	.B(A[11]), 
	.A(B[11]));
   OA21X1M U26 (.Y(n21), 
	.B0(n26), 
	.A1(n25), 
	.A0(n24));
   CLKXOR2X2M U27 (.Y(SUM[10]), 
	.B(n25), 
	.A(n27));
   AOI2BB1X1M U28 (.Y(n25), 
	.B0(n12), 
	.A1N(n13), 
	.A0N(n10));
   AND2X1M U29 (.Y(n12), 
	.B(A[9]), 
	.A(B[9]));
   NOR2X1M U30 (.Y(n13), 
	.B(A[9]), 
	.A(B[9]));
   OA21X1M U31 (.Y(n10), 
	.B0(n17), 
	.A1(n16), 
	.A0(n15));
   CLKNAND2X2M U32 (.Y(n17), 
	.B(A[8]), 
	.A(B[8]));
   NOR2X1M U33 (.Y(n16), 
	.B(A[8]), 
	.A(B[8]));
   NAND2BX1M U34 (.Y(n27), 
	.B(n26), 
	.AN(n24));
   CLKNAND2X2M U35 (.Y(n26), 
	.B(A[10]), 
	.A(B[10]));
   NOR2X1M U36 (.Y(n24), 
	.B(A[10]), 
	.A(B[10]));
endmodule

module ALU_16B_DW02_mult_0 (
	A, 
	B, 
	TC, 
	PRODUCT, 
	n159, 
	n157, 
	n167, 
	n163, 
	n155, 
	n154, 
	n139, 
	n164, 
	n161, 
	n160, 
	n168, 
	n165, 
	n158, 
	n156, 
	n166, 
	n162);
   input [7:0] A;
   input [7:0] B;
   input TC;
   output [15:0] PRODUCT;
   input n159;
   input n157;
   input n167;
   input n163;
   input n155;
   input n154;
   input n139;
   input n164;
   input n161;
   input n160;
   input n168;
   input n165;
   input n158;
   input n156;
   input n166;
   input n162;

   // Internal wires
   wire \ab[7][7] ;
   wire \ab[7][6] ;
   wire \ab[7][5] ;
   wire \ab[7][4] ;
   wire \ab[7][3] ;
   wire \ab[7][2] ;
   wire \ab[7][1] ;
   wire \ab[7][0] ;
   wire \ab[6][7] ;
   wire \ab[6][6] ;
   wire \ab[6][5] ;
   wire \ab[6][4] ;
   wire \ab[6][3] ;
   wire \ab[6][2] ;
   wire \ab[6][1] ;
   wire \ab[6][0] ;
   wire \ab[5][7] ;
   wire \ab[5][6] ;
   wire \ab[5][5] ;
   wire \ab[5][4] ;
   wire \ab[5][3] ;
   wire \ab[5][2] ;
   wire \ab[5][1] ;
   wire \ab[5][0] ;
   wire \ab[4][7] ;
   wire \ab[4][6] ;
   wire \ab[4][5] ;
   wire \ab[4][4] ;
   wire \ab[4][3] ;
   wire \ab[4][2] ;
   wire \ab[4][1] ;
   wire \ab[4][0] ;
   wire \ab[3][7] ;
   wire \ab[3][6] ;
   wire \ab[3][5] ;
   wire \ab[3][4] ;
   wire \ab[3][3] ;
   wire \ab[3][2] ;
   wire \ab[3][1] ;
   wire \ab[3][0] ;
   wire \ab[2][7] ;
   wire \ab[2][6] ;
   wire \ab[2][5] ;
   wire \ab[2][4] ;
   wire \ab[2][3] ;
   wire \ab[2][2] ;
   wire \ab[2][1] ;
   wire \ab[2][0] ;
   wire \ab[1][7] ;
   wire \ab[1][6] ;
   wire \ab[1][5] ;
   wire \ab[1][4] ;
   wire \ab[1][3] ;
   wire \ab[1][2] ;
   wire \ab[1][1] ;
   wire \ab[1][0] ;
   wire \ab[0][7] ;
   wire \ab[0][6] ;
   wire \ab[0][5] ;
   wire \ab[0][4] ;
   wire \ab[0][3] ;
   wire \ab[0][2] ;
   wire \ab[0][1] ;
   wire \CARRYB[7][6] ;
   wire \CARRYB[7][5] ;
   wire \CARRYB[7][4] ;
   wire \CARRYB[7][3] ;
   wire \CARRYB[7][2] ;
   wire \CARRYB[7][1] ;
   wire \CARRYB[7][0] ;
   wire \CARRYB[6][6] ;
   wire \CARRYB[6][5] ;
   wire \CARRYB[6][4] ;
   wire \CARRYB[6][3] ;
   wire \CARRYB[6][2] ;
   wire \CARRYB[6][1] ;
   wire \CARRYB[6][0] ;
   wire \CARRYB[5][6] ;
   wire \CARRYB[5][5] ;
   wire \CARRYB[5][4] ;
   wire \CARRYB[5][3] ;
   wire \CARRYB[5][2] ;
   wire \CARRYB[5][1] ;
   wire \CARRYB[5][0] ;
   wire \CARRYB[4][6] ;
   wire \CARRYB[4][5] ;
   wire \CARRYB[4][4] ;
   wire \CARRYB[4][3] ;
   wire \CARRYB[4][2] ;
   wire \CARRYB[4][1] ;
   wire \CARRYB[4][0] ;
   wire \CARRYB[3][6] ;
   wire \CARRYB[3][5] ;
   wire \CARRYB[3][4] ;
   wire \CARRYB[3][3] ;
   wire \CARRYB[3][2] ;
   wire \CARRYB[3][1] ;
   wire \CARRYB[3][0] ;
   wire \CARRYB[2][6] ;
   wire \CARRYB[2][5] ;
   wire \CARRYB[2][4] ;
   wire \CARRYB[2][3] ;
   wire \CARRYB[2][2] ;
   wire \CARRYB[2][1] ;
   wire \CARRYB[2][0] ;
   wire \SUMB[7][6] ;
   wire \SUMB[7][5] ;
   wire \SUMB[7][4] ;
   wire \SUMB[7][3] ;
   wire \SUMB[7][2] ;
   wire \SUMB[7][1] ;
   wire \SUMB[7][0] ;
   wire \SUMB[6][6] ;
   wire \SUMB[6][5] ;
   wire \SUMB[6][4] ;
   wire \SUMB[6][3] ;
   wire \SUMB[6][2] ;
   wire \SUMB[6][1] ;
   wire \SUMB[5][6] ;
   wire \SUMB[5][5] ;
   wire \SUMB[5][4] ;
   wire \SUMB[5][3] ;
   wire \SUMB[5][2] ;
   wire \SUMB[5][1] ;
   wire \SUMB[4][6] ;
   wire \SUMB[4][5] ;
   wire \SUMB[4][4] ;
   wire \SUMB[4][3] ;
   wire \SUMB[4][2] ;
   wire \SUMB[4][1] ;
   wire \SUMB[3][6] ;
   wire \SUMB[3][5] ;
   wire \SUMB[3][4] ;
   wire \SUMB[3][3] ;
   wire \SUMB[3][2] ;
   wire \SUMB[3][1] ;
   wire \SUMB[2][6] ;
   wire \SUMB[2][5] ;
   wire \SUMB[2][4] ;
   wire \SUMB[2][3] ;
   wire \SUMB[2][2] ;
   wire \SUMB[2][1] ;
   wire \SUMB[1][6] ;
   wire \SUMB[1][5] ;
   wire \SUMB[1][4] ;
   wire \SUMB[1][3] ;
   wire \SUMB[1][2] ;
   wire \SUMB[1][1] ;
   wire \A1[12] ;
   wire \A1[11] ;
   wire \A1[10] ;
   wire \A1[9] ;
   wire \A1[8] ;
   wire \A1[7] ;
   wire \A1[6] ;
   wire \A1[4] ;
   wire \A1[3] ;
   wire \A1[2] ;
   wire \A1[1] ;
   wire \A1[0] ;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;

   ADDFX2M S1_6_0 (.S(\A1[4] ), 
	.CO(\CARRYB[6][0] ), 
	.CI(\SUMB[5][1] ), 
	.B(\CARRYB[5][0] ), 
	.A(\ab[6][0] ));
   ADDFX2M S1_5_0 (.S(\A1[3] ), 
	.CO(\CARRYB[5][0] ), 
	.CI(\SUMB[4][1] ), 
	.B(\CARRYB[4][0] ), 
	.A(\ab[5][0] ));
   ADDFX2M S1_4_0 (.S(\A1[2] ), 
	.CO(\CARRYB[4][0] ), 
	.CI(\SUMB[3][1] ), 
	.B(\CARRYB[3][0] ), 
	.A(\ab[4][0] ));
   ADDFX2M S1_3_0 (.S(\A1[1] ), 
	.CO(\CARRYB[3][0] ), 
	.CI(\SUMB[2][1] ), 
	.B(\CARRYB[2][0] ), 
	.A(\ab[3][0] ));
   ADDFX2M S2_6_5 (.S(\SUMB[6][5] ), 
	.CO(\CARRYB[6][5] ), 
	.CI(\SUMB[5][6] ), 
	.B(\CARRYB[5][5] ), 
	.A(\ab[6][5] ));
   ADDFX2M S2_6_4 (.S(\SUMB[6][4] ), 
	.CO(\CARRYB[6][4] ), 
	.CI(\SUMB[5][5] ), 
	.B(\CARRYB[5][4] ), 
	.A(\ab[6][4] ));
   ADDFX2M S2_5_5 (.S(\SUMB[5][5] ), 
	.CO(\CARRYB[5][5] ), 
	.CI(\SUMB[4][6] ), 
	.B(\CARRYB[4][5] ), 
	.A(\ab[5][5] ));
   ADDFX2M S2_6_3 (.S(\SUMB[6][3] ), 
	.CO(\CARRYB[6][3] ), 
	.CI(\SUMB[5][4] ), 
	.B(\CARRYB[5][3] ), 
	.A(\ab[6][3] ));
   ADDFX2M S2_5_4 (.S(\SUMB[5][4] ), 
	.CO(\CARRYB[5][4] ), 
	.CI(\SUMB[4][5] ), 
	.B(\CARRYB[4][4] ), 
	.A(\ab[5][4] ));
   ADDFX2M S2_6_1 (.S(\SUMB[6][1] ), 
	.CO(\CARRYB[6][1] ), 
	.CI(\SUMB[5][2] ), 
	.B(\CARRYB[5][1] ), 
	.A(\ab[6][1] ));
   ADDFX2M S2_6_2 (.S(\SUMB[6][2] ), 
	.CO(\CARRYB[6][2] ), 
	.CI(\SUMB[5][3] ), 
	.B(\CARRYB[5][2] ), 
	.A(\ab[6][2] ));
   ADDFX2M S2_4_5 (.S(\SUMB[4][5] ), 
	.CO(\CARRYB[4][5] ), 
	.CI(\SUMB[3][6] ), 
	.B(\CARRYB[3][5] ), 
	.A(\ab[4][5] ));
   ADDFX2M S2_5_1 (.S(\SUMB[5][1] ), 
	.CO(\CARRYB[5][1] ), 
	.CI(\SUMB[4][2] ), 
	.B(\CARRYB[4][1] ), 
	.A(\ab[5][1] ));
   ADDFX2M S2_5_2 (.S(\SUMB[5][2] ), 
	.CO(\CARRYB[5][2] ), 
	.CI(\SUMB[4][3] ), 
	.B(\CARRYB[4][2] ), 
	.A(\ab[5][2] ));
   ADDFX2M S2_5_3 (.S(\SUMB[5][3] ), 
	.CO(\CARRYB[5][3] ), 
	.CI(\SUMB[4][4] ), 
	.B(\CARRYB[4][3] ), 
	.A(\ab[5][3] ));
   ADDFX2M S2_4_1 (.S(\SUMB[4][1] ), 
	.CO(\CARRYB[4][1] ), 
	.CI(\SUMB[3][2] ), 
	.B(\CARRYB[3][1] ), 
	.A(\ab[4][1] ));
   ADDFX2M S2_4_2 (.S(\SUMB[4][2] ), 
	.CO(\CARRYB[4][2] ), 
	.CI(\SUMB[3][3] ), 
	.B(\CARRYB[3][2] ), 
	.A(\ab[4][2] ));
   ADDFX2M S2_4_3 (.S(\SUMB[4][3] ), 
	.CO(\CARRYB[4][3] ), 
	.CI(\SUMB[3][4] ), 
	.B(\CARRYB[3][3] ), 
	.A(\ab[4][3] ));
   ADDFX2M S2_4_4 (.S(\SUMB[4][4] ), 
	.CO(\CARRYB[4][4] ), 
	.CI(\SUMB[3][5] ), 
	.B(\CARRYB[3][4] ), 
	.A(\ab[4][4] ));
   ADDFX2M S2_3_1 (.S(\SUMB[3][1] ), 
	.CO(\CARRYB[3][1] ), 
	.CI(\SUMB[2][2] ), 
	.B(\CARRYB[2][1] ), 
	.A(\ab[3][1] ));
   ADDFX2M S2_3_2 (.S(\SUMB[3][2] ), 
	.CO(\CARRYB[3][2] ), 
	.CI(\SUMB[2][3] ), 
	.B(\CARRYB[2][2] ), 
	.A(\ab[3][2] ));
   ADDFX2M S2_3_3 (.S(\SUMB[3][3] ), 
	.CO(\CARRYB[3][3] ), 
	.CI(\SUMB[2][4] ), 
	.B(\CARRYB[2][3] ), 
	.A(\ab[3][3] ));
   ADDFX2M S2_3_4 (.S(\SUMB[3][4] ), 
	.CO(\CARRYB[3][4] ), 
	.CI(\SUMB[2][5] ), 
	.B(\CARRYB[2][4] ), 
	.A(\ab[3][4] ));
   ADDFX2M S2_3_5 (.S(\SUMB[3][5] ), 
	.CO(\CARRYB[3][5] ), 
	.CI(\SUMB[2][6] ), 
	.B(\CARRYB[2][5] ), 
	.A(\ab[3][5] ));
   ADDFX2M S3_6_6 (.S(\SUMB[6][6] ), 
	.CO(\CARRYB[6][6] ), 
	.CI(\ab[5][7] ), 
	.B(\CARRYB[5][6] ), 
	.A(\ab[6][6] ));
   ADDFX2M S3_5_6 (.S(\SUMB[5][6] ), 
	.CO(\CARRYB[5][6] ), 
	.CI(\ab[4][7] ), 
	.B(\CARRYB[4][6] ), 
	.A(\ab[5][6] ));
   ADDFX2M S3_4_6 (.S(\SUMB[4][6] ), 
	.CO(\CARRYB[4][6] ), 
	.CI(\ab[3][7] ), 
	.B(\CARRYB[3][6] ), 
	.A(\ab[4][6] ));
   ADDFX2M S3_3_6 (.S(\SUMB[3][6] ), 
	.CO(\CARRYB[3][6] ), 
	.CI(\ab[2][7] ), 
	.B(\CARRYB[2][6] ), 
	.A(\ab[3][6] ));
   ADDFX2M S3_2_6 (.S(\SUMB[2][6] ), 
	.CO(\CARRYB[2][6] ), 
	.CI(\ab[1][7] ), 
	.B(n8), 
	.A(\ab[2][6] ));
   ADDFX2M S1_2_0 (.S(\A1[0] ), 
	.CO(\CARRYB[2][0] ), 
	.CI(\SUMB[1][1] ), 
	.B(n9), 
	.A(\ab[2][0] ));
   ADDFX2M S2_2_1 (.S(\SUMB[2][1] ), 
	.CO(\CARRYB[2][1] ), 
	.CI(\SUMB[1][2] ), 
	.B(n7), 
	.A(\ab[2][1] ));
   ADDFX2M S2_2_2 (.S(\SUMB[2][2] ), 
	.CO(\CARRYB[2][2] ), 
	.CI(\SUMB[1][3] ), 
	.B(n6), 
	.A(\ab[2][2] ));
   ADDFX2M S2_2_3 (.S(\SUMB[2][3] ), 
	.CO(\CARRYB[2][3] ), 
	.CI(\SUMB[1][4] ), 
	.B(n5), 
	.A(\ab[2][3] ));
   ADDFX2M S2_2_4 (.S(\SUMB[2][4] ), 
	.CO(\CARRYB[2][4] ), 
	.CI(\SUMB[1][5] ), 
	.B(n4), 
	.A(\ab[2][4] ));
   ADDFX2M S2_2_5 (.S(\SUMB[2][5] ), 
	.CO(\CARRYB[2][5] ), 
	.CI(\SUMB[1][6] ), 
	.B(n3), 
	.A(\ab[2][5] ));
   ADDFX2M S4_0 (.S(\SUMB[7][0] ), 
	.CO(\CARRYB[7][0] ), 
	.CI(\SUMB[6][1] ), 
	.B(\CARRYB[6][0] ), 
	.A(\ab[7][0] ));
   ADDFX2M S5_6 (.S(\SUMB[7][6] ), 
	.CO(\CARRYB[7][6] ), 
	.CI(\ab[6][7] ), 
	.B(\CARRYB[6][6] ), 
	.A(\ab[7][6] ));
   ADDFX2M S4_5 (.S(\SUMB[7][5] ), 
	.CO(\CARRYB[7][5] ), 
	.CI(\SUMB[6][6] ), 
	.B(\CARRYB[6][5] ), 
	.A(\ab[7][5] ));
   ADDFX2M S4_4 (.S(\SUMB[7][4] ), 
	.CO(\CARRYB[7][4] ), 
	.CI(\SUMB[6][5] ), 
	.B(\CARRYB[6][4] ), 
	.A(\ab[7][4] ));
   ADDFX2M S4_3 (.S(\SUMB[7][3] ), 
	.CO(\CARRYB[7][3] ), 
	.CI(\SUMB[6][4] ), 
	.B(\CARRYB[6][3] ), 
	.A(\ab[7][3] ));
   ADDFX2M S4_2 (.S(\SUMB[7][2] ), 
	.CO(\CARRYB[7][2] ), 
	.CI(\SUMB[6][3] ), 
	.B(\CARRYB[6][2] ), 
	.A(\ab[7][2] ));
   ADDFX2M S4_1 (.S(\SUMB[7][1] ), 
	.CO(\CARRYB[7][1] ), 
	.CI(\SUMB[6][2] ), 
	.B(\CARRYB[6][1] ), 
	.A(\ab[7][1] ));
   AND2X2M U2 (.Y(n3), 
	.B(\ab[1][5] ), 
	.A(\ab[0][6] ));
   AND2X2M U3 (.Y(n4), 
	.B(\ab[1][4] ), 
	.A(\ab[0][5] ));
   AND2X2M U4 (.Y(n5), 
	.B(\ab[1][3] ), 
	.A(\ab[0][4] ));
   AND2X2M U5 (.Y(n6), 
	.B(\ab[1][2] ), 
	.A(\ab[0][3] ));
   AND2X2M U6 (.Y(n7), 
	.B(\ab[1][1] ), 
	.A(\ab[0][2] ));
   AND2X2M U7 (.Y(n8), 
	.B(\ab[1][6] ), 
	.A(\ab[0][7] ));
   AND2X2M U8 (.Y(n9), 
	.B(\ab[1][0] ), 
	.A(\ab[0][1] ));
   AND2X2M U9 (.Y(n10), 
	.B(\ab[7][7] ), 
	.A(\CARRYB[7][6] ));
   CLKXOR2X2M U10 (.Y(\A1[7] ), 
	.B(\SUMB[7][2] ), 
	.A(\CARRYB[7][1] ));
   CLKXOR2X2M U11 (.Y(PRODUCT[1]), 
	.B(\ab[0][1] ), 
	.A(\ab[1][0] ));
   CLKXOR2X2M U12 (.Y(\A1[12] ), 
	.B(\ab[7][7] ), 
	.A(\CARRYB[7][6] ));
   CLKXOR2X2M U13 (.Y(\A1[8] ), 
	.B(\SUMB[7][3] ), 
	.A(\CARRYB[7][2] ));
   CLKXOR2X2M U14 (.Y(\A1[10] ), 
	.B(\SUMB[7][5] ), 
	.A(\CARRYB[7][4] ));
   CLKXOR2X2M U15 (.Y(\A1[9] ), 
	.B(\SUMB[7][4] ), 
	.A(\CARRYB[7][3] ));
   CLKXOR2X2M U16 (.Y(\A1[11] ), 
	.B(\SUMB[7][6] ), 
	.A(\CARRYB[7][5] ));
   INVX2M U17 (.Y(n23), 
	.A(\ab[0][7] ));
   INVX2M U18 (.Y(n21), 
	.A(\ab[0][5] ));
   INVX2M U19 (.Y(n20), 
	.A(\ab[0][4] ));
   INVX2M U20 (.Y(n22), 
	.A(\ab[0][6] ));
   INVX2M U21 (.Y(n19), 
	.A(\ab[0][3] ));
   INVX2M U22 (.Y(n18), 
	.A(\ab[0][2] ));
   XNOR2X2M U23 (.Y(\A1[6] ), 
	.B(n17), 
	.A(\CARRYB[7][0] ));
   INVX2M U24 (.Y(n17), 
	.A(\SUMB[7][1] ));
   AND2X2M U25 (.Y(n11), 
	.B(\SUMB[7][1] ), 
	.A(\CARRYB[7][0] ));
   AND2X2M U26 (.Y(n12), 
	.B(\SUMB[7][2] ), 
	.A(\CARRYB[7][1] ));
   AND2X2M U27 (.Y(n13), 
	.B(\SUMB[7][4] ), 
	.A(\CARRYB[7][3] ));
   AND2X2M U28 (.Y(n14), 
	.B(\SUMB[7][6] ), 
	.A(\CARRYB[7][5] ));
   AND2X2M U29 (.Y(n15), 
	.B(\SUMB[7][3] ), 
	.A(\CARRYB[7][2] ));
   AND2X2M U30 (.Y(n16), 
	.B(\SUMB[7][5] ), 
	.A(\CARRYB[7][4] ));
   XNOR2X2M U31 (.Y(\SUMB[1][6] ), 
	.B(n23), 
	.A(\ab[1][6] ));
   XNOR2X2M U32 (.Y(\SUMB[1][5] ), 
	.B(n22), 
	.A(\ab[1][5] ));
   XNOR2X2M U33 (.Y(\SUMB[1][4] ), 
	.B(n21), 
	.A(\ab[1][4] ));
   XNOR2X2M U34 (.Y(\SUMB[1][3] ), 
	.B(n20), 
	.A(\ab[1][3] ));
   XNOR2X2M U35 (.Y(\SUMB[1][2] ), 
	.B(n19), 
	.A(\ab[1][2] ));
   XNOR2X2M U36 (.Y(\SUMB[1][1] ), 
	.B(n18), 
	.A(\ab[1][1] ));
   INVX2M U37 (.Y(n33), 
	.A(A[6]));
   INVX2M U38 (.Y(n32), 
	.A(A[7]));
   INVX2M U39 (.Y(n38), 
	.A(A[1]));
   INVX2M U40 (.Y(n39), 
	.A(A[0]));
   INVX2M U41 (.Y(n37), 
	.A(A[2]));
   INVX2M U42 (.Y(n36), 
	.A(A[3]));
   INVX2M U43 (.Y(n34), 
	.A(A[5]));
   INVX2M U44 (.Y(n35), 
	.A(A[4]));
   INVX2M U45 (.Y(n31), 
	.A(B[0]));
   INVX2M U46 (.Y(n25), 
	.A(B[6]));
   INVX2M U47 (.Y(n29), 
	.A(B[2]));
   INVX2M U48 (.Y(n28), 
	.A(B[3]));
   INVX2M U49 (.Y(n30), 
	.A(B[1]));
   INVX2M U50 (.Y(n24), 
	.A(B[7]));
   INVX2M U51 (.Y(n27), 
	.A(B[4]));
   INVX2M U52 (.Y(n26), 
	.A(B[5]));
   NOR2X1M U54 (.Y(\ab[7][7] ), 
	.B(n24), 
	.A(n32));
   NOR2X1M U55 (.Y(\ab[7][6] ), 
	.B(n25), 
	.A(n32));
   NOR2X1M U56 (.Y(\ab[7][5] ), 
	.B(n26), 
	.A(n32));
   NOR2X1M U57 (.Y(\ab[7][4] ), 
	.B(n27), 
	.A(n32));
   NOR2X1M U58 (.Y(\ab[7][3] ), 
	.B(n28), 
	.A(n32));
   NOR2X1M U59 (.Y(\ab[7][2] ), 
	.B(n29), 
	.A(n32));
   NOR2X1M U60 (.Y(\ab[7][1] ), 
	.B(n30), 
	.A(n32));
   NOR2X1M U61 (.Y(\ab[7][0] ), 
	.B(n31), 
	.A(n32));
   NOR2X1M U62 (.Y(\ab[6][7] ), 
	.B(n33), 
	.A(n24));
   NOR2X1M U63 (.Y(\ab[6][6] ), 
	.B(n33), 
	.A(n25));
   NOR2X1M U64 (.Y(\ab[6][5] ), 
	.B(n33), 
	.A(n26));
   NOR2X1M U65 (.Y(\ab[6][4] ), 
	.B(n33), 
	.A(n27));
   NOR2X1M U66 (.Y(\ab[6][3] ), 
	.B(n33), 
	.A(n28));
   NOR2X1M U67 (.Y(\ab[6][2] ), 
	.B(n33), 
	.A(n29));
   NOR2X1M U68 (.Y(\ab[6][1] ), 
	.B(n33), 
	.A(n30));
   NOR2X1M U69 (.Y(\ab[6][0] ), 
	.B(n33), 
	.A(n31));
   NOR2X1M U70 (.Y(\ab[5][7] ), 
	.B(n34), 
	.A(n24));
   NOR2X1M U71 (.Y(\ab[5][6] ), 
	.B(n34), 
	.A(n25));
   NOR2X1M U72 (.Y(\ab[5][5] ), 
	.B(n34), 
	.A(n26));
   NOR2X1M U73 (.Y(\ab[5][4] ), 
	.B(n34), 
	.A(n27));
   NOR2X1M U74 (.Y(\ab[5][3] ), 
	.B(n34), 
	.A(n28));
   NOR2X1M U75 (.Y(\ab[5][2] ), 
	.B(n34), 
	.A(n29));
   NOR2X1M U76 (.Y(\ab[5][1] ), 
	.B(n34), 
	.A(n30));
   NOR2X1M U77 (.Y(\ab[5][0] ), 
	.B(n34), 
	.A(n31));
   NOR2X1M U78 (.Y(\ab[4][7] ), 
	.B(n35), 
	.A(n24));
   NOR2X1M U79 (.Y(\ab[4][6] ), 
	.B(n35), 
	.A(n25));
   NOR2X1M U80 (.Y(\ab[4][5] ), 
	.B(n35), 
	.A(n26));
   NOR2X1M U81 (.Y(\ab[4][4] ), 
	.B(n35), 
	.A(n27));
   NOR2X1M U82 (.Y(\ab[4][3] ), 
	.B(n35), 
	.A(n28));
   NOR2X1M U83 (.Y(\ab[4][2] ), 
	.B(n35), 
	.A(n29));
   NOR2X1M U84 (.Y(\ab[4][1] ), 
	.B(n35), 
	.A(n30));
   NOR2X1M U85 (.Y(\ab[4][0] ), 
	.B(n35), 
	.A(n31));
   NOR2X1M U86 (.Y(\ab[3][7] ), 
	.B(n36), 
	.A(n24));
   NOR2X1M U87 (.Y(\ab[3][6] ), 
	.B(n36), 
	.A(n25));
   NOR2X1M U88 (.Y(\ab[3][5] ), 
	.B(n36), 
	.A(n26));
   NOR2X1M U89 (.Y(\ab[3][4] ), 
	.B(n36), 
	.A(n27));
   NOR2X1M U90 (.Y(\ab[3][3] ), 
	.B(n36), 
	.A(n28));
   NOR2X1M U91 (.Y(\ab[3][2] ), 
	.B(n36), 
	.A(n29));
   NOR2X1M U92 (.Y(\ab[3][1] ), 
	.B(n36), 
	.A(n30));
   NOR2X1M U93 (.Y(\ab[3][0] ), 
	.B(n36), 
	.A(n31));
   NOR2X1M U94 (.Y(\ab[2][7] ), 
	.B(n37), 
	.A(n24));
   NOR2X1M U95 (.Y(\ab[2][6] ), 
	.B(n37), 
	.A(n25));
   NOR2X1M U96 (.Y(\ab[2][5] ), 
	.B(n37), 
	.A(n26));
   NOR2X1M U97 (.Y(\ab[2][4] ), 
	.B(n37), 
	.A(n27));
   NOR2X1M U98 (.Y(\ab[2][3] ), 
	.B(n37), 
	.A(n28));
   NOR2X1M U99 (.Y(\ab[2][2] ), 
	.B(n37), 
	.A(n29));
   NOR2X1M U100 (.Y(\ab[2][1] ), 
	.B(n37), 
	.A(n30));
   NOR2X1M U101 (.Y(\ab[2][0] ), 
	.B(n37), 
	.A(n31));
   NOR2X1M U102 (.Y(\ab[1][7] ), 
	.B(n38), 
	.A(n24));
   NOR2X1M U103 (.Y(\ab[1][6] ), 
	.B(n38), 
	.A(n25));
   NOR2X1M U104 (.Y(\ab[1][5] ), 
	.B(n38), 
	.A(n26));
   NOR2X1M U105 (.Y(\ab[1][4] ), 
	.B(n38), 
	.A(n27));
   NOR2X1M U106 (.Y(\ab[1][3] ), 
	.B(n38), 
	.A(n28));
   NOR2X1M U107 (.Y(\ab[1][2] ), 
	.B(n38), 
	.A(n29));
   NOR2X1M U108 (.Y(\ab[1][1] ), 
	.B(n38), 
	.A(n30));
   NOR2X1M U109 (.Y(\ab[1][0] ), 
	.B(n38), 
	.A(n31));
   NOR2X1M U110 (.Y(\ab[0][7] ), 
	.B(n39), 
	.A(n24));
   NOR2X1M U111 (.Y(\ab[0][6] ), 
	.B(n39), 
	.A(n25));
   NOR2X1M U112 (.Y(\ab[0][5] ), 
	.B(n39), 
	.A(n26));
   NOR2X1M U113 (.Y(\ab[0][4] ), 
	.B(n39), 
	.A(n27));
   NOR2X1M U114 (.Y(\ab[0][3] ), 
	.B(n39), 
	.A(n28));
   NOR2X1M U115 (.Y(\ab[0][2] ), 
	.B(n39), 
	.A(n29));
   NOR2X1M U116 (.Y(\ab[0][1] ), 
	.B(n39), 
	.A(n30));
   NOR2X1M U117 (.Y(PRODUCT[0]), 
	.B(n39), 
	.A(n31));
   ALU_16B_DW01_add_1 FS_1 (.A({ 1'b0,
		\A1[12] ,
		\A1[11] ,
		\A1[10] ,
		\A1[9] ,
		\A1[8] ,
		\A1[7] ,
		\A1[6] ,
		\SUMB[7][0] ,
		\A1[4] ,
		\A1[3] ,
		\A1[2] ,
		\A1[1] ,
		\A1[0]  }), 
	.B({ n10,
		n14,
		n16,
		n13,
		n15,
		n12,
		n11,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.CI(1'b0), 
	.SUM({ PRODUCT[15],
		PRODUCT[14],
		PRODUCT[13],
		PRODUCT[12],
		PRODUCT[11],
		PRODUCT[10],
		PRODUCT[9],
		PRODUCT[8],
		PRODUCT[7],
		PRODUCT[6],
		PRODUCT[5],
		PRODUCT[4],
		PRODUCT[3],
		PRODUCT[2] }));
endmodule

module ALU_16B_test_1 (
	CLK, 
	RST, 
	A, 
	B, 
	EN, 
	ALU_FUN, 
	ALU_OUT, 
	OUT_VALID, 
	test_si, 
	test_se);
   input CLK;
   input RST;
   input [7:0] A;
   input [7:0] B;
   input EN;
   input [3:0] ALU_FUN;
   output [15:0] ALU_OUT;
   output OUT_VALID;
   input test_si;
   input test_se;

   // Internal wires
   wire OUT_VALID_COMP;
   wire N92;
   wire N93;
   wire N94;
   wire N95;
   wire N96;
   wire N97;
   wire N98;
   wire N99;
   wire N100;
   wire N101;
   wire N102;
   wire N103;
   wire N104;
   wire N105;
   wire N106;
   wire N107;
   wire N108;
   wire N109;
   wire N110;
   wire N111;
   wire N112;
   wire N113;
   wire N114;
   wire N115;
   wire N116;
   wire N117;
   wire N118;
   wire N119;
   wire N120;
   wire N121;
   wire N122;
   wire N123;
   wire N124;
   wire N125;
   wire N128;
   wire N129;
   wire N130;
   wire N131;
   wire N132;
   wire N133;
   wire N134;
   wire N135;
   wire N168;
   wire N169;
   wire N170;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n79;
   wire n80;
   wire n81;
   wire n82;
   wire n83;
   wire n84;
   wire n85;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire n121;
   wire n122;
   wire n123;
   wire n124;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n134;
   wire n135;
   wire n136;
   wire n137;
   wire n138;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n139;
   wire n140;
   wire n141;
   wire n142;
   wire n143;
   wire n144;
   wire n145;
   wire n146;
   wire n147;
   wire n148;
   wire n149;
   wire n150;
   wire n151;
   wire n152;
   wire n153;
   wire n154;
   wire n155;
   wire n156;
   wire n157;
   wire n158;
   wire n159;
   wire n160;
   wire n161;
   wire n162;
   wire n163;
   wire n164;
   wire n165;
   wire n166;
   wire n167;
   wire n168;
   wire [15:0] ALU_OUT_COMP;

   SDFFRQX2M \ALU_OUT_reg[7]  (.SI(ALU_OUT[6]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[7]), 
	.D(ALU_OUT_COMP[7]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[6]  (.SI(ALU_OUT[5]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[6]), 
	.D(ALU_OUT_COMP[6]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[5]  (.SI(ALU_OUT[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[5]), 
	.D(ALU_OUT_COMP[5]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[4]  (.SI(ALU_OUT[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[4]), 
	.D(ALU_OUT_COMP[4]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[3]  (.SI(ALU_OUT[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[3]), 
	.D(ALU_OUT_COMP[3]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[2]  (.SI(ALU_OUT[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[2]), 
	.D(ALU_OUT_COMP[2]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[1]  (.SI(ALU_OUT[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[1]), 
	.D(ALU_OUT_COMP[1]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[0]), 
	.D(ALU_OUT_COMP[0]), 
	.CK(CLK));
   SDFFRQX2M OUT_VALID_reg (.SI(ALU_OUT[15]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(OUT_VALID), 
	.D(OUT_VALID_COMP), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[15]  (.SI(ALU_OUT[14]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[15]), 
	.D(ALU_OUT_COMP[15]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[14]  (.SI(ALU_OUT[13]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[14]), 
	.D(ALU_OUT_COMP[14]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[13]  (.SI(ALU_OUT[12]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[13]), 
	.D(ALU_OUT_COMP[13]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[12]  (.SI(ALU_OUT[11]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[12]), 
	.D(ALU_OUT_COMP[12]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[11]  (.SI(ALU_OUT[10]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[11]), 
	.D(ALU_OUT_COMP[11]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[10]  (.SI(ALU_OUT[9]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[10]), 
	.D(ALU_OUT_COMP[10]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[9]  (.SI(ALU_OUT[8]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[9]), 
	.D(ALU_OUT_COMP[9]), 
	.CK(CLK));
   SDFFRQX2M \ALU_OUT_reg[8]  (.SI(ALU_OUT[7]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[8]), 
	.D(ALU_OUT_COMP[8]), 
	.CK(CLK));
   NOR4X2M U8 (.Y(n73), 
	.D(ALU_FUN[2]), 
	.C(ALU_FUN[1]), 
	.B(ALU_FUN[0]), 
	.A(n145));
   INVX2M U23 (.Y(n147), 
	.A(n111));
   INVX2M U24 (.Y(n150), 
	.A(n69));
   OAI21X2M U25 (.Y(n111), 
	.B0(n129), 
	.A1(n149), 
	.A0(n152));
   NOR3X2M U26 (.Y(n55), 
	.C(n145), 
	.B(n152), 
	.A(n151));
   INVX2M U27 (.Y(n148), 
	.A(n74));
   AND3X2M U28 (.Y(n67), 
	.C(n145), 
	.B(n151), 
	.A(n130));
   INVX2M U29 (.Y(n143), 
	.A(n73));
   NAND2X2M U30 (.Y(n69), 
	.B(n138), 
	.A(n130));
   AND2X2M U31 (.Y(n62), 
	.B(n153), 
	.A(n137));
   AND2X2M U32 (.Y(n61), 
	.B(n153), 
	.A(n55));
   INVX2M U33 (.Y(n149), 
	.A(n138));
   OAI2BB1X2M U34 (.Y(ALU_OUT_COMP[9]), 
	.B0(n57), 
	.A1N(n56), 
	.A0N(N119));
   OAI2BB1X2M U35 (.Y(ALU_OUT_COMP[10]), 
	.B0(n57), 
	.A1N(n56), 
	.A0N(N120));
   OAI2BB1X2M U36 (.Y(ALU_OUT_COMP[11]), 
	.B0(n57), 
	.A1N(n56), 
	.A0N(N121));
   OAI2BB1X2M U37 (.Y(ALU_OUT_COMP[12]), 
	.B0(n57), 
	.A1N(n56), 
	.A0N(N122));
   OAI2BB1X2M U38 (.Y(ALU_OUT_COMP[13]), 
	.B0(n57), 
	.A1N(n56), 
	.A0N(N123));
   OAI2BB1X2M U39 (.Y(ALU_OUT_COMP[14]), 
	.B0(n57), 
	.A1N(n56), 
	.A0N(N124));
   OAI2BB1X2M U40 (.Y(ALU_OUT_COMP[15]), 
	.B0(n57), 
	.A1N(n56), 
	.A0N(N125));
   NOR3X2M U41 (.Y(n74), 
	.C(n149), 
	.B(ALU_FUN[0]), 
	.A(n152));
   NOR4X2M U42 (.Y(n63), 
	.D(ALU_FUN[3]), 
	.C(ALU_FUN[2]), 
	.B(ALU_FUN[1]), 
	.A(ALU_FUN[0]));
   OAI21X2M U43 (.Y(n72), 
	.B0(n129), 
	.A1(n149), 
	.A0(ALU_FUN[1]));
   NOR3X2M U44 (.Y(n137), 
	.C(n152), 
	.B(ALU_FUN[3]), 
	.A(ALU_FUN[2]));
   NOR2X2M U45 (.Y(n130), 
	.B(ALU_FUN[1]), 
	.A(n153));
   INVX2M U46 (.Y(n152), 
	.A(ALU_FUN[1]));
   NOR2X2M U47 (.Y(n138), 
	.B(ALU_FUN[3]), 
	.A(n151));
   NOR3X2M U48 (.Y(n132), 
	.C(ALU_FUN[0]), 
	.B(ALU_FUN[2]), 
	.A(n152));
   INVX2M U49 (.Y(n151), 
	.A(ALU_FUN[2]));
   INVX2M U50 (.Y(n145), 
	.A(ALU_FUN[3]));
   AND3X2M U51 (.Y(n78), 
	.C(ALU_FUN[2]), 
	.B(ALU_FUN[3]), 
	.A(n130));
   NAND3X2M U52 (.Y(n129), 
	.C(n130), 
	.B(n151), 
	.A(ALU_FUN[3]));
   OAI2BB2X1M U53 (.Y(n68), 
	.B1(n69), 
	.B0(n162), 
	.A1N(n62), 
	.A0N(N117));
   NAND2BX2M U54 (.Y(n57), 
	.B(EN), 
	.AN(n58));
   AOI21X2M U55 (.Y(OUT_VALID_COMP), 
	.B0(n142), 
	.A1(n55), 
	.A0(ALU_FUN[0]));
   INVX2M U56 (.Y(n142), 
	.A(EN));
   INVX2M U57 (.Y(n153), 
	.A(ALU_FUN[0]));
   AND2X2M U58 (.Y(n56), 
	.B(EN), 
	.A(n62));
   OAI221X1M U59 (.Y(n70), 
	.C0(n148), 
	.B1(n143), 
	.B0(n162), 
	.A1(n147), 
	.A0(A[7]));
   AOI21X2M U60 (.Y(n58), 
	.B0(n111), 
	.A1(n67), 
	.A0(N109));
   AOI31X2M U61 (.Y(ALU_OUT_COMP[4]), 
	.B0(n142), 
	.A2(n92), 
	.A1(n91), 
	.A0(n90));
   AOI22X1M U62 (.Y(n90), 
	.B1(n63), 
	.B0(N96), 
	.A1(n67), 
	.A0(N105));
   AOI221XLM U63 (.Y(n92), 
	.C0(n93), 
	.B1(A[5]), 
	.B0(n78), 
	.A1(n61), 
	.A0(A[3]));
   AOI222X1M U64 (.Y(n91), 
	.C1(n150), 
	.C0(A[4]), 
	.B1(n165), 
	.B0(n74), 
	.A1(n62), 
	.A0(N114));
   AOI31X2M U65 (.Y(ALU_OUT_COMP[5]), 
	.B0(n142), 
	.A2(n85), 
	.A1(n84), 
	.A0(n83));
   AOI22X1M U66 (.Y(n83), 
	.B1(n63), 
	.B0(N97), 
	.A1(n67), 
	.A0(N106));
   AOI221XLM U67 (.Y(n85), 
	.C0(n86), 
	.B1(A[6]), 
	.B0(n78), 
	.A1(n61), 
	.A0(A[4]));
   AOI222X1M U68 (.Y(n84), 
	.C1(n150), 
	.C0(A[5]), 
	.B1(n164), 
	.B0(n74), 
	.A1(n62), 
	.A0(N115));
   AOI31X2M U69 (.Y(ALU_OUT_COMP[6]), 
	.B0(n142), 
	.A2(n77), 
	.A1(n76), 
	.A0(n75));
   AOI22X1M U70 (.Y(n75), 
	.B1(n63), 
	.B0(N98), 
	.A1(n67), 
	.A0(N107));
   AOI221XLM U71 (.Y(n77), 
	.C0(n79), 
	.B1(A[7]), 
	.B0(n78), 
	.A1(n61), 
	.A0(A[5]));
   AOI222X1M U72 (.Y(n76), 
	.C1(A[6]), 
	.C0(n150), 
	.B1(n163), 
	.B0(n74), 
	.A1(n62), 
	.A0(N116));
   AOI31X2M U73 (.Y(ALU_OUT_COMP[0]), 
	.B0(n142), 
	.A2(n124), 
	.A1(n123), 
	.A0(n122));
   AOI22X1M U74 (.Y(n122), 
	.B1(n63), 
	.B0(N92), 
	.A1(n67), 
	.A0(N101));
   AOI211X2M U75 (.Y(n124), 
	.C0(n126), 
	.B0(n125), 
	.A1(n78), 
	.A0(A[1]));
   AOI222X1M U76 (.Y(n123), 
	.C1(n150), 
	.C0(A[0]), 
	.B1(n168), 
	.B0(n74), 
	.A1(n62), 
	.A0(N110));
   AOI31X2M U77 (.Y(ALU_OUT_COMP[1]), 
	.B0(n142), 
	.A2(n114), 
	.A1(n113), 
	.A0(n112));
   AOI211X2M U78 (.Y(n114), 
	.C0(n116), 
	.B0(n115), 
	.A1(n61), 
	.A0(A[0]));
   AOI222X1M U79 (.Y(n113), 
	.C1(n139), 
	.C0(n74), 
	.B1(n78), 
	.B0(A[2]), 
	.A1(n150), 
	.A0(A[1]));
   AOI222X1M U80 (.Y(n112), 
	.C1(n67), 
	.C0(N102), 
	.B1(n62), 
	.B0(N111), 
	.A1(n63), 
	.A0(N93));
   AOI31X2M U81 (.Y(ALU_OUT_COMP[2]), 
	.B0(n142), 
	.A2(n106), 
	.A1(n105), 
	.A0(n104));
   AOI22X1M U82 (.Y(n104), 
	.B1(n63), 
	.B0(N94), 
	.A1(n67), 
	.A0(N103));
   AOI221XLM U83 (.Y(n106), 
	.C0(n107), 
	.B1(n78), 
	.B0(A[3]), 
	.A1(n61), 
	.A0(A[1]));
   AOI222X1M U84 (.Y(n105), 
	.C1(n150), 
	.C0(A[2]), 
	.B1(n167), 
	.B0(n74), 
	.A1(n62), 
	.A0(N112));
   AOI31X2M U85 (.Y(ALU_OUT_COMP[3]), 
	.B0(n142), 
	.A2(n99), 
	.A1(n98), 
	.A0(n97));
   AOI22X1M U86 (.Y(n97), 
	.B1(n63), 
	.B0(N95), 
	.A1(n67), 
	.A0(N104));
   AOI221XLM U87 (.Y(n99), 
	.C0(n100), 
	.B1(n78), 
	.B0(A[4]), 
	.A1(n61), 
	.A0(A[2]));
   AOI222X1M U88 (.Y(n98), 
	.C1(n150), 
	.C0(A[3]), 
	.B1(n166), 
	.B0(n74), 
	.A1(n62), 
	.A0(N113));
   AOI31X2M U89 (.Y(ALU_OUT_COMP[8]), 
	.B0(n142), 
	.A2(n60), 
	.A1(n59), 
	.A0(n58));
   NAND2X2M U90 (.Y(n59), 
	.B(n63), 
	.A(N100));
   AOI22X1M U91 (.Y(n60), 
	.B1(n62), 
	.B0(N118), 
	.A1(n61), 
	.A0(A[7]));
   OAI21X2M U92 (.Y(n107), 
	.B0(n109), 
	.A1(n159), 
	.A0(n108));
   AOI22X1M U93 (.Y(n109), 
	.B1(n159), 
	.B0(n110), 
	.A1(n146), 
	.A0(N130));
   AOI221XLM U94 (.Y(n108), 
	.C0(n150), 
	.B1(n72), 
	.B0(A[2]), 
	.A1(n167), 
	.A0(n73));
   OAI221X1M U95 (.Y(n110), 
	.C0(n148), 
	.B1(n167), 
	.B0(n143), 
	.A1(n147), 
	.A0(A[2]));
   OAI21X2M U96 (.Y(n100), 
	.B0(n102), 
	.A1(n158), 
	.A0(n101));
   AOI22X1M U97 (.Y(n102), 
	.B1(n158), 
	.B0(n103), 
	.A1(n146), 
	.A0(N131));
   AOI221XLM U98 (.Y(n101), 
	.C0(n150), 
	.B1(n72), 
	.B0(A[3]), 
	.A1(n166), 
	.A0(n73));
   OAI221X1M U99 (.Y(n103), 
	.C0(n148), 
	.B1(n166), 
	.B0(n143), 
	.A1(n147), 
	.A0(A[3]));
   OAI21X2M U100 (.Y(n93), 
	.B0(n95), 
	.A1(n157), 
	.A0(n94));
   AOI22X1M U101 (.Y(n95), 
	.B1(n157), 
	.B0(n96), 
	.A1(n146), 
	.A0(N132));
   AOI221XLM U102 (.Y(n94), 
	.C0(n150), 
	.B1(n72), 
	.B0(A[4]), 
	.A1(n165), 
	.A0(n73));
   OAI221X1M U103 (.Y(n96), 
	.C0(n148), 
	.B1(n165), 
	.B0(n143), 
	.A1(n147), 
	.A0(A[4]));
   OAI21X2M U104 (.Y(n86), 
	.B0(n88), 
	.A1(n156), 
	.A0(n87));
   AOI22X1M U105 (.Y(n88), 
	.B1(n156), 
	.B0(n89), 
	.A1(n146), 
	.A0(N133));
   AOI221XLM U106 (.Y(n87), 
	.C0(n150), 
	.B1(n72), 
	.B0(A[5]), 
	.A1(n164), 
	.A0(n73));
   OAI221X1M U107 (.Y(n89), 
	.C0(n148), 
	.B1(n164), 
	.B0(n143), 
	.A1(n147), 
	.A0(A[5]));
   OAI21X2M U108 (.Y(n79), 
	.B0(n81), 
	.A1(n155), 
	.A0(n80));
   AOI22X1M U109 (.Y(n81), 
	.B1(n155), 
	.B0(n82), 
	.A1(n146), 
	.A0(N134));
   AOI221XLM U110 (.Y(n80), 
	.C0(n150), 
	.B1(n72), 
	.B0(A[6]), 
	.A1(n163), 
	.A0(n73));
   OAI221X1M U111 (.Y(n82), 
	.C0(n148), 
	.B1(n163), 
	.B0(n143), 
	.A1(n147), 
	.A0(A[6]));
   INVX2M U113 (.Y(n146), 
	.A(n134));
   OAI211X2M U114 (.Y(n134), 
	.C0(n137), 
	.B0(ALU_FUN[0]), 
	.A1(n136), 
	.A0(n135));
   NAND4X2M U115 (.Y(n136), 
	.D(n158), 
	.C(n159), 
	.B(n160), 
	.A(n161));
   NAND4X2M U116 (.Y(n135), 
	.D(n154), 
	.C(n155), 
	.B(n156), 
	.A(n157));
   INVX2M U117 (.Y(n144), 
	.A(n71));
   AOI221XLM U118 (.Y(n71), 
	.C0(n150), 
	.B1(n73), 
	.B0(n162), 
	.A1(A[7]), 
	.A0(n72));
   OAI2BB1X2M U119 (.Y(n125), 
	.B0(n131), 
	.A1N(n146), 
	.A0N(N128));
   AOI31X2M U120 (.Y(n131), 
	.B0(n121), 
	.A2(n132), 
	.A1(ALU_FUN[3]), 
	.A0(N168));
   AND4X2M U121 (.Y(n121), 
	.D(ALU_FUN[2]), 
	.C(n133), 
	.B(ALU_FUN[3]), 
	.A(N170));
   NOR2X2M U122 (.Y(n133), 
	.B(ALU_FUN[0]), 
	.A(ALU_FUN[1]));
   OAI2BB1X2M U123 (.Y(n115), 
	.B0(n119), 
	.A1N(n146), 
	.A0N(N129));
   AOI31X2M U124 (.Y(n119), 
	.B0(n121), 
	.A2(n120), 
	.A1(ALU_FUN[0]), 
	.A0(N169));
   NOR3X2M U125 (.Y(n120), 
	.C(n152), 
	.B(ALU_FUN[2]), 
	.A(n145));
   INVX2M U126 (.Y(n162), 
	.A(A[7]));
   INVX2M U127 (.Y(n163), 
	.A(A[6]));
   INVX2M U128 (.Y(n168), 
	.A(A[0]));
   INVX2M U129 (.Y(n167), 
	.A(A[2]));
   INVX2M U130 (.Y(n166), 
	.A(A[3]));
   INVX2M U131 (.Y(n164), 
	.A(A[5]));
   INVX2M U132 (.Y(n165), 
	.A(A[4]));
   INVX2M U133 (.Y(n139), 
	.A(A[1]));
   INVX2M U134 (.Y(n140), 
	.A(n29));
   OAI22X1M U135 (.Y(n126), 
	.B1(n128), 
	.B0(B[0]), 
	.A1(n161), 
	.A0(n127));
   AOI221XLM U136 (.Y(n128), 
	.C0(n74), 
	.B1(n168), 
	.B0(n111), 
	.A1(n73), 
	.A0(A[0]));
   AOI221XLM U137 (.Y(n127), 
	.C0(n150), 
	.B1(n72), 
	.B0(A[0]), 
	.A1(n168), 
	.A0(n73));
   OAI22X1M U138 (.Y(n116), 
	.B1(n118), 
	.B0(B[1]), 
	.A1(n160), 
	.A0(n117));
   AOI221XLM U139 (.Y(n118), 
	.C0(n74), 
	.B1(n139), 
	.B0(n111), 
	.A1(n73), 
	.A0(A[1]));
   AOI221XLM U140 (.Y(n117), 
	.C0(n150), 
	.B1(n72), 
	.B0(A[1]), 
	.A1(n139), 
	.A0(n73));
   AOI31X2M U141 (.Y(ALU_OUT_COMP[7]), 
	.B0(n142), 
	.A2(n66), 
	.A1(n65), 
	.A0(n64));
   AOI22X1M U142 (.Y(n64), 
	.B1(n162), 
	.B0(n74), 
	.A1(n61), 
	.A0(A[6]));
   AOI221XLM U143 (.Y(n66), 
	.C0(n68), 
	.B1(n63), 
	.B0(N99), 
	.A1(n67), 
	.A0(N108));
   AOI222X1M U144 (.Y(n65), 
	.C1(n154), 
	.C0(n70), 
	.B1(n146), 
	.B0(N135), 
	.A1(n144), 
	.A0(B[7]));
   INVX2M U145 (.Y(n141), 
	.A(n40));
   INVX2M U154 (.Y(n155), 
	.A(B[6]));
   INVX2M U155 (.Y(n161), 
	.A(B[0]));
   INVX2M U156 (.Y(n158), 
	.A(B[3]));
   INVX2M U157 (.Y(n159), 
	.A(B[2]));
   INVX2M U158 (.Y(n157), 
	.A(B[4]));
   INVX2M U159 (.Y(n156), 
	.A(B[5]));
   INVX2M U160 (.Y(n160), 
	.A(B[1]));
   INVX2M U161 (.Y(n154), 
	.A(B[7]));
   NOR2X1M U162 (.Y(n51), 
	.B(B[7]), 
	.A(n162));
   NAND2BX1M U163 (.Y(n44), 
	.B(A[4]), 
	.AN(B[4]));
   NAND2BX1M U164 (.Y(n33), 
	.B(B[4]), 
	.AN(A[4]));
   CLKNAND2X2M U165 (.Y(n46), 
	.B(n33), 
	.A(n44));
   NOR2X1M U166 (.Y(n41), 
	.B(A[3]), 
	.A(n158));
   NOR2X1M U167 (.Y(n32), 
	.B(A[2]), 
	.A(n159));
   NOR2X1M U168 (.Y(n29), 
	.B(A[0]), 
	.A(n161));
   CLKNAND2X2M U169 (.Y(n43), 
	.B(n159), 
	.A(A[2]));
   NAND2BX1M U170 (.Y(n38), 
	.B(n43), 
	.AN(n32));
   AOI21X1M U171 (.Y(n30), 
	.B0(B[1]), 
	.A1(n139), 
	.A0(n29));
   AOI211X1M U172 (.Y(n31), 
	.C0(n30), 
	.B0(n38), 
	.A1(n140), 
	.A0(A[1]));
   CLKNAND2X2M U173 (.Y(n42), 
	.B(n158), 
	.A(A[3]));
   OAI31X1M U174 (.Y(n34), 
	.B0(n42), 
	.A2(n31), 
	.A1(n32), 
	.A0(n41));
   NAND2BX1M U175 (.Y(n49), 
	.B(B[5]), 
	.AN(A[5]));
   OAI211X1M U176 (.Y(n35), 
	.C0(n49), 
	.B0(n33), 
	.A1(n34), 
	.A0(n46));
   NAND2BX1M U177 (.Y(n45), 
	.B(A[5]), 
	.AN(B[5]));
   XNOR2X1M U178 (.Y(n48), 
	.B(B[6]), 
	.A(A[6]));
   AOI32X1M U179 (.Y(n36), 
	.B1(n163), 
	.B0(B[6]), 
	.A2(n48), 
	.A1(n45), 
	.A0(n35));
   CLKNAND2X2M U180 (.Y(n52), 
	.B(n162), 
	.A(B[7]));
   OAI21X1M U181 (.Y(N170), 
	.B0(n52), 
	.A1(n36), 
	.A0(n51));
   CLKNAND2X2M U182 (.Y(n39), 
	.B(n161), 
	.A(A[0]));
   OA21X1M U183 (.Y(n37), 
	.B0(B[1]), 
	.A1(n139), 
	.A0(n39));
   AOI211X1M U184 (.Y(n40), 
	.C0(n37), 
	.B0(n38), 
	.A1(n139), 
	.A0(n39));
   AOI31X1M U185 (.Y(n47), 
	.B0(n41), 
	.A2(n42), 
	.A1(n43), 
	.A0(n141));
   OAI2B11X1M U186 (.Y(n50), 
	.C0(n44), 
	.B0(n45), 
	.A1N(n47), 
	.A0(n46));
   AOI32X1M U187 (.Y(n53), 
	.B1(n155), 
	.B0(A[6]), 
	.A2(n48), 
	.A1(n49), 
	.A0(n50));
   AOI2B1X1M U188 (.Y(n54), 
	.B0(n51), 
	.A1N(n53), 
	.A0(n52));
   CLKINVX1M U189 (.Y(N169), 
	.A(n54));
   NOR2X1M U190 (.Y(N168), 
	.B(N169), 
	.A(N170));
   ALU_16B_DW_div_uns_0 div_56 (.a({ A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.b({ B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.quotient({ N135,
		N134,
		N133,
		N132,
		N131,
		N130,
		N129,
		N128 }), 
	.n159(n159), 
	.n157(n157), 
	.n167(n167), 
	.n163(n163), 
	.n155(n155), 
	.n154(n154), 
	.n139(n139), 
	.n164(n164), 
	.n161(n161), 
	.n160(n160), 
	.n168(n168), 
	.n165(n165), 
	.n158(n158), 
	.n156(n156), 
	.n166(n166));
   ALU_16B_DW01_sub_0 sub_44 (.A({ 1'b0,
		A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ 1'b0,
		B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.CI(1'b0), 
	.DIFF({ N109,
		N108,
		N107,
		N106,
		N105,
		N104,
		N103,
		N102,
		N101 }), 
	.n159(n159), 
	.n157(n157), 
	.n155(n155), 
	.n154(n154), 
	.n161(n161), 
	.n160(n160), 
	.n168(n168), 
	.n158(n158), 
	.n156(n156));
   ALU_16B_DW01_add_0 add_39 (.A({ 1'b0,
		A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ 1'b0,
		B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.CI(1'b0), 
	.SUM({ N100,
		N99,
		N98,
		N97,
		N96,
		N95,
		N94,
		N93,
		N92 }));
   ALU_16B_DW02_mult_0 mult_49 (.A({ A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.TC(1'b0), 
	.PRODUCT({ N125,
		N124,
		N123,
		N122,
		N121,
		N120,
		N119,
		N118,
		N117,
		N116,
		N115,
		N114,
		N113,
		N112,
		N111,
		N110 }), 
	.n159(n159), 
	.n157(n157), 
	.n167(n167), 
	.n163(n163), 
	.n155(n155), 
	.n154(n154), 
	.n139(n139), 
	.n164(n164), 
	.n161(n161), 
	.n160(n160), 
	.n168(n168), 
	.n165(n165), 
	.n158(n158), 
	.n156(n156), 
	.n166(n166), 
	.n162(n162));
endmodule

module FIFO_MEM_CNTRL_DATA_WIDTH8_DEPTH8_ADDR_SIZE3_test_1 (
	wdata, 
	waddr, 
	raddr, 
	wfull, 
	winc, 
	wclk, 
	RST, 
	rdata, 
	test_si2, 
	test_si1, 
	test_so2, 
	test_so1, 
	test_se, 
	FE_OFN2_SYNC_RST11, 
	CLK_M__L4_N1);
   input [7:0] wdata;
   input [2:0] waddr;
   input [2:0] raddr;
   input wfull;
   input winc;
   input wclk;
   input RST;
   output [7:0] rdata;
   input test_si2;
   input test_si1;
   output test_so2;
   output test_so1;
   input test_se;
   input FE_OFN2_SYNC_RST11;
   input CLK_M__L4_N1;

   // Internal wires
   wire N10;
   wire N11;
   wire N12;
   wire \Reg_File[7][7] ;
   wire \Reg_File[7][6] ;
   wire \Reg_File[7][5] ;
   wire \Reg_File[7][4] ;
   wire \Reg_File[7][3] ;
   wire \Reg_File[7][2] ;
   wire \Reg_File[7][1] ;
   wire \Reg_File[7][0] ;
   wire \Reg_File[6][7] ;
   wire \Reg_File[6][6] ;
   wire \Reg_File[6][5] ;
   wire \Reg_File[6][4] ;
   wire \Reg_File[6][3] ;
   wire \Reg_File[6][2] ;
   wire \Reg_File[6][1] ;
   wire \Reg_File[6][0] ;
   wire \Reg_File[5][7] ;
   wire \Reg_File[5][6] ;
   wire \Reg_File[5][5] ;
   wire \Reg_File[5][4] ;
   wire \Reg_File[5][3] ;
   wire \Reg_File[5][2] ;
   wire \Reg_File[5][1] ;
   wire \Reg_File[5][0] ;
   wire \Reg_File[4][7] ;
   wire \Reg_File[4][6] ;
   wire \Reg_File[4][5] ;
   wire \Reg_File[4][4] ;
   wire \Reg_File[4][3] ;
   wire \Reg_File[4][2] ;
   wire \Reg_File[4][1] ;
   wire \Reg_File[4][0] ;
   wire \Reg_File[3][7] ;
   wire \Reg_File[3][6] ;
   wire \Reg_File[3][5] ;
   wire \Reg_File[3][4] ;
   wire \Reg_File[3][3] ;
   wire \Reg_File[3][2] ;
   wire \Reg_File[3][1] ;
   wire \Reg_File[3][0] ;
   wire \Reg_File[2][7] ;
   wire \Reg_File[2][6] ;
   wire \Reg_File[2][5] ;
   wire \Reg_File[2][4] ;
   wire \Reg_File[2][3] ;
   wire \Reg_File[2][2] ;
   wire \Reg_File[2][1] ;
   wire \Reg_File[2][0] ;
   wire \Reg_File[1][7] ;
   wire \Reg_File[1][6] ;
   wire \Reg_File[1][5] ;
   wire \Reg_File[1][4] ;
   wire \Reg_File[1][3] ;
   wire \Reg_File[1][2] ;
   wire \Reg_File[1][1] ;
   wire \Reg_File[1][0] ;
   wire \Reg_File[0][7] ;
   wire \Reg_File[0][6] ;
   wire \Reg_File[0][5] ;
   wire \Reg_File[0][4] ;
   wire \Reg_File[0][3] ;
   wire \Reg_File[0][2] ;
   wire \Reg_File[0][1] ;
   wire \Reg_File[0][0] ;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n79;
   wire n80;
   wire n81;
   wire n82;
   wire n83;
   wire n84;
   wire n85;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire n121;
   wire n122;
   wire n123;
   wire n124;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n134;
   wire n135;
   wire n136;
   wire n137;
   wire n138;
   wire n139;
   wire n140;
   wire n141;
   wire n142;
   wire n143;
   wire n144;
   wire n145;
   wire n146;
   wire n147;
   wire n148;
   wire n149;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n150;
   wire n151;
   wire n152;
   wire n153;
   wire n154;
   wire n155;
   wire n156;
   wire n157;
   wire n169;
   wire n170;
   wire n171;
   wire n172;
   wire n173;
   wire n174;
   wire n175;
   wire n176;
   wire n177;
   wire n178;
   wire n182;
   wire n183;
   wire n184;
   wire n185;
   wire n186;

   assign N10 = raddr[0] ;
   assign N11 = raddr[1] ;
   assign N12 = raddr[2] ;
   assign test_so2 = \Reg_File[7][7]  ;
   assign test_so1 = \Reg_File[7][5]  ;

   SDFFRQX2M \Reg_File_reg[5][7]  (.SI(\Reg_File[5][6] ), 
	.SE(n186), 
	.RN(RST), 
	.Q(\Reg_File[5][7] ), 
	.D(n133), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[5][6]  (.SI(\Reg_File[5][5] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[5][6] ), 
	.D(n132), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[5][5]  (.SI(\Reg_File[5][4] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[5][5] ), 
	.D(n131), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[5][4]  (.SI(\Reg_File[5][3] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[5][4] ), 
	.D(n130), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[5][3]  (.SI(\Reg_File[5][2] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[5][3] ), 
	.D(n129), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[5][2]  (.SI(\Reg_File[5][1] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[5][2] ), 
	.D(n128), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[5][1]  (.SI(\Reg_File[5][0] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[5][1] ), 
	.D(n127), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[5][0]  (.SI(\Reg_File[4][7] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[5][0] ), 
	.D(n126), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[1][7]  (.SI(\Reg_File[1][6] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[1][7] ), 
	.D(n101), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[1][6]  (.SI(\Reg_File[1][5] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[1][6] ), 
	.D(n100), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[1][5]  (.SI(\Reg_File[1][4] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[1][5] ), 
	.D(n99), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[1][4]  (.SI(\Reg_File[1][3] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[1][4] ), 
	.D(n98), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[1][3]  (.SI(\Reg_File[1][2] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[1][3] ), 
	.D(n97), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[1][2]  (.SI(\Reg_File[1][1] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[1][2] ), 
	.D(n96), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[1][1]  (.SI(\Reg_File[1][0] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[1][1] ), 
	.D(n95), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[1][0]  (.SI(\Reg_File[0][7] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[1][0] ), 
	.D(n94), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[7][7]  (.SI(\Reg_File[7][6] ), 
	.SE(n186), 
	.RN(RST), 
	.Q(\Reg_File[7][7] ), 
	.D(n149), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[7][6]  (.SI(test_si2), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[7][6] ), 
	.D(n148), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[7][5]  (.SI(\Reg_File[7][4] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[7][5] ), 
	.D(n147), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[7][4]  (.SI(\Reg_File[7][3] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[7][4] ), 
	.D(n146), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[7][3]  (.SI(\Reg_File[7][2] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[7][3] ), 
	.D(n145), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[7][2]  (.SI(\Reg_File[7][1] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[7][2] ), 
	.D(n144), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[7][1]  (.SI(\Reg_File[7][0] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[7][1] ), 
	.D(n143), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[7][0]  (.SI(\Reg_File[6][7] ), 
	.SE(n183), 
	.RN(RST), 
	.Q(\Reg_File[7][0] ), 
	.D(n142), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[3][7]  (.SI(\Reg_File[3][6] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[3][7] ), 
	.D(n117), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[3][6]  (.SI(\Reg_File[3][5] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[3][6] ), 
	.D(n116), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[3][5]  (.SI(\Reg_File[3][4] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[3][5] ), 
	.D(n115), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[3][4]  (.SI(\Reg_File[3][3] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[3][4] ), 
	.D(n114), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[3][3]  (.SI(\Reg_File[3][2] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[3][3] ), 
	.D(n113), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[3][2]  (.SI(\Reg_File[3][1] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[3][2] ), 
	.D(n112), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[3][1]  (.SI(\Reg_File[3][0] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[3][1] ), 
	.D(n111), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[3][0]  (.SI(\Reg_File[2][7] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[3][0] ), 
	.D(n110), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[6][7]  (.SI(\Reg_File[6][6] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[6][7] ), 
	.D(n141), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[6][6]  (.SI(\Reg_File[6][5] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[6][6] ), 
	.D(n140), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[6][5]  (.SI(\Reg_File[6][4] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[6][5] ), 
	.D(n139), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[6][4]  (.SI(\Reg_File[6][3] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[6][4] ), 
	.D(n138), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[6][3]  (.SI(\Reg_File[6][2] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[6][3] ), 
	.D(n137), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[6][2]  (.SI(\Reg_File[6][1] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[6][2] ), 
	.D(n136), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[6][1]  (.SI(\Reg_File[6][0] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[6][1] ), 
	.D(n135), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[6][0]  (.SI(\Reg_File[5][7] ), 
	.SE(n183), 
	.RN(RST), 
	.Q(\Reg_File[6][0] ), 
	.D(n134), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[2][7]  (.SI(\Reg_File[2][6] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[2][7] ), 
	.D(n109), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[2][6]  (.SI(\Reg_File[2][5] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[2][6] ), 
	.D(n108), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[2][5]  (.SI(\Reg_File[2][4] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[2][5] ), 
	.D(n107), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[2][4]  (.SI(\Reg_File[2][3] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[2][4] ), 
	.D(n106), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[2][3]  (.SI(\Reg_File[2][2] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[2][3] ), 
	.D(n105), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[2][2]  (.SI(\Reg_File[2][1] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[2][2] ), 
	.D(n104), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[2][1]  (.SI(\Reg_File[2][0] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[2][1] ), 
	.D(n103), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[2][0]  (.SI(\Reg_File[1][7] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[2][0] ), 
	.D(n102), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[4][7]  (.SI(\Reg_File[4][6] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[4][7] ), 
	.D(n125), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[4][6]  (.SI(\Reg_File[4][5] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[4][6] ), 
	.D(n124), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[4][5]  (.SI(\Reg_File[4][4] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[4][5] ), 
	.D(n123), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[4][4]  (.SI(\Reg_File[4][3] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[4][4] ), 
	.D(n122), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[4][3]  (.SI(\Reg_File[4][2] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[4][3] ), 
	.D(n121), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[4][2]  (.SI(\Reg_File[4][1] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[4][2] ), 
	.D(n120), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[4][1]  (.SI(\Reg_File[4][0] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[4][1] ), 
	.D(n119), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[4][0]  (.SI(\Reg_File[3][7] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[4][0] ), 
	.D(n118), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[0][7]  (.SI(\Reg_File[0][6] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[0][7] ), 
	.D(n93), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[0][6]  (.SI(\Reg_File[0][5] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[0][6] ), 
	.D(n92), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[0][5]  (.SI(\Reg_File[0][4] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[0][5] ), 
	.D(n91), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[0][4]  (.SI(\Reg_File[0][3] ), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[0][4] ), 
	.D(n90), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[0][3]  (.SI(\Reg_File[0][2] ), 
	.SE(n186), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[0][3] ), 
	.D(n89), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[0][2]  (.SI(\Reg_File[0][1] ), 
	.SE(n185), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[0][2] ), 
	.D(n88), 
	.CK(wclk));
   SDFFRQX2M \Reg_File_reg[0][1]  (.SI(\Reg_File[0][0] ), 
	.SE(n184), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[0][1] ), 
	.D(n87), 
	.CK(CLK_M__L4_N1));
   SDFFRQX2M \Reg_File_reg[0][0]  (.SI(test_si1), 
	.SE(n183), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\Reg_File[0][0] ), 
	.D(n86), 
	.CK(CLK_M__L4_N1));
   NOR2BX2M U66 (.Y(n76), 
	.B(waddr[2]), 
	.AN(n80));
   NAND3X2M U78 (.Y(n81), 
	.C(n82), 
	.B(n178), 
	.A(n169));
   NAND3X2M U79 (.Y(n75), 
	.C(n76), 
	.B(n178), 
	.A(n169));
   INVX2M U80 (.Y(n177), 
	.A(wdata[0]));
   INVX2M U81 (.Y(n176), 
	.A(wdata[1]));
   INVX2M U82 (.Y(n175), 
	.A(wdata[2]));
   INVX2M U83 (.Y(n174), 
	.A(wdata[3]));
   INVX2M U84 (.Y(n173), 
	.A(wdata[4]));
   INVX2M U85 (.Y(n172), 
	.A(wdata[5]));
   INVX2M U86 (.Y(n171), 
	.A(wdata[6]));
   INVX2M U87 (.Y(n170), 
	.A(wdata[7]));
   NAND3X2M U88 (.Y(n78), 
	.C(waddr[1]), 
	.B(n169), 
	.A(n76));
   NAND3X2M U89 (.Y(n79), 
	.C(waddr[1]), 
	.B(n76), 
	.A(waddr[0]));
   NAND3X2M U90 (.Y(n77), 
	.C(waddr[0]), 
	.B(n178), 
	.A(n76));
   OAI2BB2X1M U91 (.Y(n86), 
	.B1(n177), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\Reg_File[0][0] ));
   OAI2BB2X1M U92 (.Y(n87), 
	.B1(n176), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\Reg_File[0][1] ));
   OAI2BB2X1M U93 (.Y(n88), 
	.B1(n175), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\Reg_File[0][2] ));
   OAI2BB2X1M U94 (.Y(n89), 
	.B1(n174), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\Reg_File[0][3] ));
   OAI2BB2X1M U95 (.Y(n90), 
	.B1(n173), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\Reg_File[0][4] ));
   OAI2BB2X1M U96 (.Y(n91), 
	.B1(n172), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\Reg_File[0][5] ));
   OAI2BB2X1M U97 (.Y(n92), 
	.B1(n171), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\Reg_File[0][6] ));
   OAI2BB2X1M U98 (.Y(n93), 
	.B1(n170), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\Reg_File[0][7] ));
   OAI2BB2X1M U99 (.Y(n102), 
	.B1(n78), 
	.B0(n177), 
	.A1N(n78), 
	.A0N(\Reg_File[2][0] ));
   OAI2BB2X1M U100 (.Y(n103), 
	.B1(n78), 
	.B0(n176), 
	.A1N(n78), 
	.A0N(\Reg_File[2][1] ));
   OAI2BB2X1M U101 (.Y(n104), 
	.B1(n78), 
	.B0(n175), 
	.A1N(n78), 
	.A0N(\Reg_File[2][2] ));
   OAI2BB2X1M U102 (.Y(n105), 
	.B1(n78), 
	.B0(n174), 
	.A1N(n78), 
	.A0N(\Reg_File[2][3] ));
   OAI2BB2X1M U103 (.Y(n106), 
	.B1(n78), 
	.B0(n173), 
	.A1N(n78), 
	.A0N(\Reg_File[2][4] ));
   OAI2BB2X1M U104 (.Y(n107), 
	.B1(n78), 
	.B0(n172), 
	.A1N(n78), 
	.A0N(\Reg_File[2][5] ));
   OAI2BB2X1M U105 (.Y(n108), 
	.B1(n78), 
	.B0(n171), 
	.A1N(n78), 
	.A0N(\Reg_File[2][6] ));
   OAI2BB2X1M U106 (.Y(n109), 
	.B1(n78), 
	.B0(n170), 
	.A1N(n78), 
	.A0N(\Reg_File[2][7] ));
   OAI2BB2X1M U107 (.Y(n110), 
	.B1(n79), 
	.B0(n177), 
	.A1N(n79), 
	.A0N(\Reg_File[3][0] ));
   OAI2BB2X1M U108 (.Y(n111), 
	.B1(n79), 
	.B0(n176), 
	.A1N(n79), 
	.A0N(\Reg_File[3][1] ));
   OAI2BB2X1M U109 (.Y(n112), 
	.B1(n79), 
	.B0(n175), 
	.A1N(n79), 
	.A0N(\Reg_File[3][2] ));
   OAI2BB2X1M U110 (.Y(n113), 
	.B1(n79), 
	.B0(n174), 
	.A1N(n79), 
	.A0N(\Reg_File[3][3] ));
   OAI2BB2X1M U111 (.Y(n114), 
	.B1(n79), 
	.B0(n173), 
	.A1N(n79), 
	.A0N(\Reg_File[3][4] ));
   OAI2BB2X1M U112 (.Y(n115), 
	.B1(n79), 
	.B0(n172), 
	.A1N(n79), 
	.A0N(\Reg_File[3][5] ));
   OAI2BB2X1M U113 (.Y(n116), 
	.B1(n79), 
	.B0(n171), 
	.A1N(n79), 
	.A0N(\Reg_File[3][6] ));
   OAI2BB2X1M U114 (.Y(n117), 
	.B1(n79), 
	.B0(n170), 
	.A1N(n79), 
	.A0N(\Reg_File[3][7] ));
   OAI2BB2X1M U115 (.Y(n94), 
	.B1(n77), 
	.B0(n177), 
	.A1N(n77), 
	.A0N(\Reg_File[1][0] ));
   OAI2BB2X1M U116 (.Y(n95), 
	.B1(n77), 
	.B0(n176), 
	.A1N(n77), 
	.A0N(\Reg_File[1][1] ));
   OAI2BB2X1M U117 (.Y(n96), 
	.B1(n77), 
	.B0(n175), 
	.A1N(n77), 
	.A0N(\Reg_File[1][2] ));
   OAI2BB2X1M U118 (.Y(n97), 
	.B1(n77), 
	.B0(n174), 
	.A1N(n77), 
	.A0N(\Reg_File[1][3] ));
   OAI2BB2X1M U119 (.Y(n98), 
	.B1(n77), 
	.B0(n173), 
	.A1N(n77), 
	.A0N(\Reg_File[1][4] ));
   OAI2BB2X1M U120 (.Y(n99), 
	.B1(n77), 
	.B0(n172), 
	.A1N(n77), 
	.A0N(\Reg_File[1][5] ));
   OAI2BB2X1M U121 (.Y(n100), 
	.B1(n77), 
	.B0(n171), 
	.A1N(n77), 
	.A0N(\Reg_File[1][6] ));
   OAI2BB2X1M U122 (.Y(n101), 
	.B1(n77), 
	.B0(n170), 
	.A1N(n77), 
	.A0N(\Reg_File[1][7] ));
   OAI2BB2X1M U123 (.Y(n118), 
	.B1(n81), 
	.B0(n177), 
	.A1N(n81), 
	.A0N(\Reg_File[4][0] ));
   OAI2BB2X1M U124 (.Y(n119), 
	.B1(n81), 
	.B0(n176), 
	.A1N(n81), 
	.A0N(\Reg_File[4][1] ));
   OAI2BB2X1M U125 (.Y(n120), 
	.B1(n81), 
	.B0(n175), 
	.A1N(n81), 
	.A0N(\Reg_File[4][2] ));
   OAI2BB2X1M U126 (.Y(n121), 
	.B1(n81), 
	.B0(n174), 
	.A1N(n81), 
	.A0N(\Reg_File[4][3] ));
   OAI2BB2X1M U127 (.Y(n122), 
	.B1(n81), 
	.B0(n173), 
	.A1N(n81), 
	.A0N(\Reg_File[4][4] ));
   OAI2BB2X1M U128 (.Y(n123), 
	.B1(n81), 
	.B0(n172), 
	.A1N(n81), 
	.A0N(\Reg_File[4][5] ));
   OAI2BB2X1M U129 (.Y(n124), 
	.B1(n81), 
	.B0(n171), 
	.A1N(n81), 
	.A0N(\Reg_File[4][6] ));
   OAI2BB2X1M U130 (.Y(n125), 
	.B1(n81), 
	.B0(n170), 
	.A1N(n81), 
	.A0N(\Reg_File[4][7] ));
   MX2X2M U131 (.Y(rdata[7]), 
	.S0(N12), 
	.B(n154), 
	.A(n155));
   MX4X1M U132 (.Y(n155), 
	.S1(N11), 
	.S0(n157), 
	.D(\Reg_File[3][7] ), 
	.C(\Reg_File[2][7] ), 
	.B(\Reg_File[1][7] ), 
	.A(\Reg_File[0][7] ));
   MX4X1M U133 (.Y(n154), 
	.S1(N11), 
	.S0(n156), 
	.D(\Reg_File[7][7] ), 
	.C(\Reg_File[6][7] ), 
	.B(\Reg_File[5][7] ), 
	.A(\Reg_File[4][7] ));
   OAI2BB2X1M U134 (.Y(n126), 
	.B1(n83), 
	.B0(n177), 
	.A1N(n83), 
	.A0N(\Reg_File[5][0] ));
   OAI2BB2X1M U135 (.Y(n127), 
	.B1(n83), 
	.B0(n176), 
	.A1N(n83), 
	.A0N(\Reg_File[5][1] ));
   OAI2BB2X1M U136 (.Y(n128), 
	.B1(n83), 
	.B0(n175), 
	.A1N(n83), 
	.A0N(\Reg_File[5][2] ));
   OAI2BB2X1M U137 (.Y(n129), 
	.B1(n83), 
	.B0(n174), 
	.A1N(n83), 
	.A0N(\Reg_File[5][3] ));
   OAI2BB2X1M U138 (.Y(n130), 
	.B1(n83), 
	.B0(n173), 
	.A1N(n83), 
	.A0N(\Reg_File[5][4] ));
   OAI2BB2X1M U139 (.Y(n131), 
	.B1(n83), 
	.B0(n172), 
	.A1N(n83), 
	.A0N(\Reg_File[5][5] ));
   OAI2BB2X1M U140 (.Y(n132), 
	.B1(n83), 
	.B0(n171), 
	.A1N(n83), 
	.A0N(\Reg_File[5][6] ));
   OAI2BB2X1M U141 (.Y(n133), 
	.B1(n83), 
	.B0(n170), 
	.A1N(n83), 
	.A0N(\Reg_File[5][7] ));
   OAI2BB2X1M U142 (.Y(n134), 
	.B1(n84), 
	.B0(n177), 
	.A1N(n84), 
	.A0N(\Reg_File[6][0] ));
   OAI2BB2X1M U143 (.Y(n135), 
	.B1(n84), 
	.B0(n176), 
	.A1N(n84), 
	.A0N(\Reg_File[6][1] ));
   OAI2BB2X1M U144 (.Y(n136), 
	.B1(n84), 
	.B0(n175), 
	.A1N(n84), 
	.A0N(\Reg_File[6][2] ));
   OAI2BB2X1M U145 (.Y(n137), 
	.B1(n84), 
	.B0(n174), 
	.A1N(n84), 
	.A0N(\Reg_File[6][3] ));
   OAI2BB2X1M U146 (.Y(n138), 
	.B1(n84), 
	.B0(n173), 
	.A1N(n84), 
	.A0N(\Reg_File[6][4] ));
   OAI2BB2X1M U147 (.Y(n139), 
	.B1(n84), 
	.B0(n172), 
	.A1N(n84), 
	.A0N(\Reg_File[6][5] ));
   OAI2BB2X1M U148 (.Y(n140), 
	.B1(n84), 
	.B0(n171), 
	.A1N(n84), 
	.A0N(\Reg_File[6][6] ));
   OAI2BB2X1M U149 (.Y(n141), 
	.B1(n84), 
	.B0(n170), 
	.A1N(n84), 
	.A0N(\Reg_File[6][7] ));
   OAI2BB2X1M U150 (.Y(n142), 
	.B1(n85), 
	.B0(n177), 
	.A1N(n85), 
	.A0N(\Reg_File[7][0] ));
   OAI2BB2X1M U151 (.Y(n143), 
	.B1(n85), 
	.B0(n176), 
	.A1N(n85), 
	.A0N(\Reg_File[7][1] ));
   OAI2BB2X1M U152 (.Y(n144), 
	.B1(n85), 
	.B0(n175), 
	.A1N(n85), 
	.A0N(\Reg_File[7][2] ));
   OAI2BB2X1M U153 (.Y(n145), 
	.B1(n85), 
	.B0(n174), 
	.A1N(n85), 
	.A0N(\Reg_File[7][3] ));
   OAI2BB2X1M U154 (.Y(n146), 
	.B1(n85), 
	.B0(n173), 
	.A1N(n85), 
	.A0N(\Reg_File[7][4] ));
   OAI2BB2X1M U155 (.Y(n147), 
	.B1(n85), 
	.B0(n172), 
	.A1N(n85), 
	.A0N(\Reg_File[7][5] ));
   OAI2BB2X1M U156 (.Y(n148), 
	.B1(n85), 
	.B0(n171), 
	.A1N(n85), 
	.A0N(\Reg_File[7][6] ));
   OAI2BB2X1M U157 (.Y(n149), 
	.B1(n85), 
	.B0(n170), 
	.A1N(n85), 
	.A0N(\Reg_File[7][7] ));
   NOR2BX2M U158 (.Y(n80), 
	.B(wfull), 
	.AN(winc));
   AND2X2M U159 (.Y(n82), 
	.B(n80), 
	.A(waddr[2]));
   MX2X2M U160 (.Y(rdata[6]), 
	.S0(N12), 
	.B(n152), 
	.A(n153));
   MX4X1M U161 (.Y(n153), 
	.S1(N11), 
	.S0(n157), 
	.D(\Reg_File[3][6] ), 
	.C(\Reg_File[2][6] ), 
	.B(\Reg_File[1][6] ), 
	.A(\Reg_File[0][6] ));
   MX4X1M U162 (.Y(n152), 
	.S1(N11), 
	.S0(n156), 
	.D(\Reg_File[7][6] ), 
	.C(\Reg_File[6][6] ), 
	.B(\Reg_File[5][6] ), 
	.A(\Reg_File[4][6] ));
   NAND3X2M U163 (.Y(n83), 
	.C(n82), 
	.B(n178), 
	.A(waddr[0]));
   NAND3X2M U164 (.Y(n84), 
	.C(n82), 
	.B(n169), 
	.A(waddr[1]));
   NAND3X2M U165 (.Y(n85), 
	.C(n82), 
	.B(waddr[0]), 
	.A(waddr[1]));
   MX2X2M U166 (.Y(rdata[2]), 
	.S0(N12), 
	.B(n69), 
	.A(n70));
   MX4X1M U167 (.Y(n70), 
	.S1(N11), 
	.S0(n157), 
	.D(\Reg_File[3][2] ), 
	.C(\Reg_File[2][2] ), 
	.B(\Reg_File[1][2] ), 
	.A(\Reg_File[0][2] ));
   MX4X1M U168 (.Y(n69), 
	.S1(N11), 
	.S0(n156), 
	.D(\Reg_File[7][2] ), 
	.C(\Reg_File[6][2] ), 
	.B(\Reg_File[5][2] ), 
	.A(\Reg_File[4][2] ));
   MX2X2M U169 (.Y(rdata[3]), 
	.S0(N12), 
	.B(n71), 
	.A(n72));
   MX4X1M U170 (.Y(n72), 
	.S1(N11), 
	.S0(n157), 
	.D(\Reg_File[3][3] ), 
	.C(\Reg_File[2][3] ), 
	.B(\Reg_File[1][3] ), 
	.A(\Reg_File[0][3] ));
   MX4X1M U171 (.Y(n71), 
	.S1(N11), 
	.S0(n156), 
	.D(\Reg_File[7][3] ), 
	.C(\Reg_File[6][3] ), 
	.B(\Reg_File[5][3] ), 
	.A(\Reg_File[4][3] ));
   MX2X2M U172 (.Y(rdata[4]), 
	.S0(N12), 
	.B(n73), 
	.A(n74));
   MX4X1M U173 (.Y(n74), 
	.S1(N11), 
	.S0(n157), 
	.D(\Reg_File[3][4] ), 
	.C(\Reg_File[2][4] ), 
	.B(\Reg_File[1][4] ), 
	.A(\Reg_File[0][4] ));
   MX4X1M U174 (.Y(n73), 
	.S1(N11), 
	.S0(n156), 
	.D(\Reg_File[7][4] ), 
	.C(\Reg_File[6][4] ), 
	.B(\Reg_File[5][4] ), 
	.A(\Reg_File[4][4] ));
   MX2X2M U175 (.Y(rdata[5]), 
	.S0(N12), 
	.B(n150), 
	.A(n151));
   MX4X1M U176 (.Y(n151), 
	.S1(N11), 
	.S0(n157), 
	.D(\Reg_File[3][5] ), 
	.C(\Reg_File[2][5] ), 
	.B(\Reg_File[1][5] ), 
	.A(\Reg_File[0][5] ));
   MX4X1M U177 (.Y(n150), 
	.S1(N11), 
	.S0(n156), 
	.D(\Reg_File[7][5] ), 
	.C(\Reg_File[6][5] ), 
	.B(\Reg_File[5][5] ), 
	.A(\Reg_File[4][5] ));
   MX2X2M U178 (.Y(rdata[1]), 
	.S0(N12), 
	.B(n67), 
	.A(n68));
   MX4X1M U179 (.Y(n68), 
	.S1(N11), 
	.S0(n157), 
	.D(\Reg_File[3][1] ), 
	.C(\Reg_File[2][1] ), 
	.B(\Reg_File[1][1] ), 
	.A(\Reg_File[0][1] ));
   MX4X1M U180 (.Y(n67), 
	.S1(N11), 
	.S0(n156), 
	.D(\Reg_File[7][1] ), 
	.C(\Reg_File[6][1] ), 
	.B(\Reg_File[5][1] ), 
	.A(\Reg_File[4][1] ));
   MX2X2M U181 (.Y(rdata[0]), 
	.S0(N12), 
	.B(n65), 
	.A(n66));
   MX4X1M U182 (.Y(n66), 
	.S1(N11), 
	.S0(n157), 
	.D(\Reg_File[3][0] ), 
	.C(\Reg_File[2][0] ), 
	.B(\Reg_File[1][0] ), 
	.A(\Reg_File[0][0] ));
   MX4X1M U183 (.Y(n65), 
	.S1(N11), 
	.S0(n156), 
	.D(\Reg_File[7][0] ), 
	.C(\Reg_File[6][0] ), 
	.B(\Reg_File[5][0] ), 
	.A(\Reg_File[4][0] ));
   BUFX2M U184 (.Y(n156), 
	.A(N10));
   BUFX2M U185 (.Y(n157), 
	.A(N10));
   INVX2M U186 (.Y(n178), 
	.A(waddr[1]));
   INVX2M U187 (.Y(n169), 
	.A(waddr[0]));
   INVXLM U188 (.Y(n182), 
	.A(test_se));
   INVX2M U189 (.Y(n183), 
	.A(n182));
   INVX2M U190 (.Y(n184), 
	.A(n182));
   INVX2M U191 (.Y(n185), 
	.A(n182));
   INVX2M U192 (.Y(n186), 
	.A(n182));
endmodule

module FIFO_WR_ADDR_SIZE3_test_1 (
	wclk, 
	wrst_n, 
	winc, 
	wq2_rptr, 
	wptr, 
	waddr, 
	wfull, 
	test_si, 
	test_se, 
	FE_OFN2_SYNC_RST11, 
	CLK_M__L4_N2);
   input wclk;
   input wrst_n;
   input winc;
   input [3:0] wq2_rptr;
   output [3:0] wptr;
   output [2:0] waddr;
   output wfull;
   input test_si;
   input test_se;
   input FE_OFN2_SYNC_RST11;
   input CLK_M__L4_N2;

   // Internal wires
   wire \w_binary[3] ;
   wire wfull_assign;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire [3:0] w_binarynext;
   wire [2:0] w_gray_next;

   SDFFRQX2M \w_binary_reg[3]  (.SI(waddr[2]), 
	.SE(test_se), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\w_binary[3] ), 
	.D(w_binarynext[3]), 
	.CK(wclk));
   SDFFRQX2M \w_binary_reg[2]  (.SI(waddr[1]), 
	.SE(test_se), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(waddr[2]), 
	.D(w_binarynext[2]), 
	.CK(wclk));
   SDFFRQX2M wfull_reg (.SI(\w_binary[3] ), 
	.SE(test_se), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(wfull), 
	.D(wfull_assign), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \w_binary_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(waddr[0]), 
	.D(w_binarynext[0]), 
	.CK(wclk));
   SDFFRQX2M \w_binary_reg[1]  (.SI(waddr[0]), 
	.SE(test_se), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(waddr[1]), 
	.D(w_binarynext[1]), 
	.CK(wclk));
   SDFFRQX2M \wptr_reg[3]  (.SI(wptr[2]), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(wptr[3]), 
	.D(w_binarynext[3]), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \wptr_reg[2]  (.SI(wptr[1]), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(wptr[2]), 
	.D(w_gray_next[2]), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \wptr_reg[1]  (.SI(wptr[0]), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(wptr[1]), 
	.D(w_gray_next[1]), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \wptr_reg[0]  (.SI(wfull), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(wptr[0]), 
	.D(w_gray_next[0]), 
	.CK(CLK_M__L4_N2));
   CLKXOR2X2M U12 (.Y(w_gray_next[0]), 
	.B(w_binarynext[0]), 
	.A(w_binarynext[1]));
   CLKXOR2X2M U13 (.Y(w_gray_next[1]), 
	.B(w_binarynext[1]), 
	.A(w_binarynext[2]));
   CLKXOR2X2M U14 (.Y(w_gray_next[2]), 
	.B(w_binarynext[2]), 
	.A(w_binarynext[3]));
   XNOR2X2M U15 (.Y(w_binarynext[2]), 
	.B(waddr[2]), 
	.A(n16));
   NAND2X2M U16 (.Y(n16), 
	.B(n15), 
	.A(waddr[1]));
   XNOR2X2M U17 (.Y(w_binarynext[3]), 
	.B(\w_binary[3] ), 
	.A(n14));
   NAND3X2M U18 (.Y(n14), 
	.C(waddr[2]), 
	.B(n15), 
	.A(waddr[1]));
   NOR4X1M U19 (.Y(wfull_assign), 
	.D(n13), 
	.C(n12), 
	.B(n11), 
	.A(n10));
   XNOR2X2M U20 (.Y(n10), 
	.B(wq2_rptr[3]), 
	.A(w_binarynext[3]));
   XNOR2X2M U21 (.Y(n11), 
	.B(wq2_rptr[2]), 
	.A(w_gray_next[2]));
   CLKXOR2X2M U22 (.Y(n12), 
	.B(w_gray_next[0]), 
	.A(wq2_rptr[0]));
   NOR2BX2M U23 (.Y(n17), 
	.B(wfull), 
	.AN(winc));
   AND2X2M U24 (.Y(n15), 
	.B(n17), 
	.A(waddr[0]));
   CLKXOR2X2M U25 (.Y(w_binarynext[1]), 
	.B(waddr[1]), 
	.A(n15));
   CLKXOR2X2M U26 (.Y(n13), 
	.B(w_gray_next[1]), 
	.A(wq2_rptr[1]));
   CLKXOR2X2M U27 (.Y(w_binarynext[0]), 
	.B(waddr[0]), 
	.A(n17));
endmodule

module FIFO_RD_ADDR_SIZE3_test_1 (
	rclk, 
	rrst_n, 
	rinc, 
	rq2_wptr, 
	rptr, 
	raddr, 
	rempty, 
	test_si, 
	test_se);
   input rclk;
   input rrst_n;
   input rinc;
   input [3:0] rq2_wptr;
   output [3:0] rptr;
   output [2:0] raddr;
   output rempty;
   input test_si;
   input test_se;

   // Internal wires
   wire \r_binary[3] ;
   wire rempty_assign;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire [2:0] r_gray_next;
   wire [3:0] r_binarynext;

   SDFFRQX2M \r_binary_reg[3]  (.SI(raddr[2]), 
	.SE(test_se), 
	.RN(rrst_n), 
	.Q(\r_binary[3] ), 
	.D(r_binarynext[3]), 
	.CK(rclk));
   SDFFRQX2M \r_binary_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(rrst_n), 
	.Q(raddr[0]), 
	.D(r_binarynext[0]), 
	.CK(rclk));
   SDFFRQX2M \r_binary_reg[2]  (.SI(raddr[1]), 
	.SE(test_se), 
	.RN(rrst_n), 
	.Q(raddr[2]), 
	.D(r_binarynext[2]), 
	.CK(rclk));
   SDFFRQX4M \r_binary_reg[1]  (.SI(raddr[0]), 
	.SE(test_se), 
	.RN(rrst_n), 
	.Q(raddr[1]), 
	.D(r_binarynext[1]), 
	.CK(rclk));
   SDFFRQX2M \rptr_reg[3]  (.SI(rptr[2]), 
	.SE(test_se), 
	.RN(rrst_n), 
	.Q(rptr[3]), 
	.D(r_binarynext[3]), 
	.CK(rclk));
   SDFFRQX2M \rptr_reg[2]  (.SI(rptr[1]), 
	.SE(test_se), 
	.RN(rrst_n), 
	.Q(rptr[2]), 
	.D(r_gray_next[2]), 
	.CK(rclk));
   SDFFRQX2M \rptr_reg[1]  (.SI(rptr[0]), 
	.SE(test_se), 
	.RN(rrst_n), 
	.Q(rptr[1]), 
	.D(r_gray_next[1]), 
	.CK(rclk));
   SDFFRQX2M \rptr_reg[0]  (.SI(rempty), 
	.SE(test_se), 
	.RN(rrst_n), 
	.Q(rptr[0]), 
	.D(r_gray_next[0]), 
	.CK(rclk));
   SDFFSQX1M rempty_reg (.SN(rrst_n), 
	.SI(\r_binary[3] ), 
	.SE(test_se), 
	.Q(rempty), 
	.D(rempty_assign), 
	.CK(rclk));
   CLKXOR2X2M U13 (.Y(r_gray_next[2]), 
	.B(r_binarynext[2]), 
	.A(r_binarynext[3]));
   CLKXOR2X2M U14 (.Y(r_gray_next[0]), 
	.B(r_binarynext[0]), 
	.A(r_binarynext[1]));
   CLKXOR2X2M U15 (.Y(r_gray_next[1]), 
	.B(r_binarynext[1]), 
	.A(r_binarynext[2]));
   XNOR2X2M U16 (.Y(r_binarynext[3]), 
	.B(\r_binary[3] ), 
	.A(n14));
   NAND3X2M U17 (.Y(n14), 
	.C(raddr[2]), 
	.B(n15), 
	.A(raddr[1]));
   XNOR2X2M U18 (.Y(r_binarynext[2]), 
	.B(raddr[2]), 
	.A(n16));
   NAND2X2M U19 (.Y(n16), 
	.B(n15), 
	.A(raddr[1]));
   NOR4X1M U20 (.Y(rempty_assign), 
	.D(n13), 
	.C(n12), 
	.B(n11), 
	.A(n10));
   CLKXOR2X2M U21 (.Y(n11), 
	.B(r_binarynext[3]), 
	.A(rq2_wptr[3]));
   CLKXOR2X2M U22 (.Y(n10), 
	.B(r_gray_next[2]), 
	.A(rq2_wptr[2]));
   CLKXOR2X2M U23 (.Y(n12), 
	.B(r_gray_next[0]), 
	.A(rq2_wptr[0]));
   NOR2BX2M U24 (.Y(n17), 
	.B(rempty), 
	.AN(rinc));
   AND2X2M U25 (.Y(n15), 
	.B(n17), 
	.A(raddr[0]));
   CLKXOR2X2M U26 (.Y(r_binarynext[1]), 
	.B(raddr[1]), 
	.A(n15));
   CLKXOR2X2M U27 (.Y(n13), 
	.B(r_gray_next[1]), 
	.A(rq2_wptr[1]));
   CLKXOR2X2M U28 (.Y(r_binarynext[0]), 
	.B(raddr[0]), 
	.A(n17));
endmodule

module DF_SYNC_BUS_WIDTH4_test_0 (
	CLK, 
	RST, 
	ASYNC, 
	SYNC, 
	test_si, 
	test_se, 
	FE_OFN2_SYNC_RST11, 
	CLK_M__L4_N2);
   input CLK;
   input RST;
   input [3:0] ASYNC;
   output [3:0] SYNC;
   input test_si;
   input test_se;
   input FE_OFN2_SYNC_RST11;
   input CLK_M__L4_N2;

   // Internal wires
   wire \sync_reg[3][0] ;
   wire \sync_reg[2][0] ;
   wire \sync_reg[1][0] ;
   wire \sync_reg[0][0] ;

   SDFFRQX2M \sync_reg_reg[3][1]  (.SI(\sync_reg[3][0] ), 
	.SE(test_se), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(SYNC[3]), 
	.D(\sync_reg[3][0] ), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[2][1]  (.SI(\sync_reg[2][0] ), 
	.SE(test_se), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(SYNC[2]), 
	.D(\sync_reg[2][0] ), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[1][1]  (.SI(\sync_reg[1][0] ), 
	.SE(test_se), 
	.RN(RST), 
	.Q(SYNC[1]), 
	.D(\sync_reg[1][0] ), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \sync_reg_reg[0][1]  (.SI(\sync_reg[0][0] ), 
	.SE(test_se), 
	.RN(RST), 
	.Q(SYNC[0]), 
	.D(\sync_reg[0][0] ), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \sync_reg_reg[3][0]  (.SI(SYNC[2]), 
	.SE(test_se), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\sync_reg[3][0] ), 
	.D(ASYNC[3]), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[2][0]  (.SI(SYNC[1]), 
	.SE(test_se), 
	.RN(FE_OFN2_SYNC_RST11), 
	.Q(\sync_reg[2][0] ), 
	.D(ASYNC[2]), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \sync_reg_reg[1][0]  (.SI(SYNC[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(\sync_reg[1][0] ), 
	.D(ASYNC[1]), 
	.CK(CLK_M__L4_N2));
   SDFFRQX2M \sync_reg_reg[0][0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(\sync_reg[0][0] ), 
	.D(ASYNC[0]), 
	.CK(CLK_M__L4_N2));
endmodule

module DF_SYNC_BUS_WIDTH4_test_1 (
	CLK, 
	RST, 
	ASYNC, 
	SYNC, 
	test_si, 
	test_se);
   input CLK;
   input RST;
   input [3:0] ASYNC;
   output [3:0] SYNC;
   input test_si;
   input test_se;

   // Internal wires
   wire \sync_reg[3][0] ;
   wire \sync_reg[2][0] ;
   wire \sync_reg[1][0] ;
   wire \sync_reg[0][0] ;

   SDFFRQX2M \sync_reg_reg[3][1]  (.SI(\sync_reg[3][0] ), 
	.SE(test_se), 
	.RN(RST), 
	.Q(SYNC[3]), 
	.D(\sync_reg[3][0] ), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[2][1]  (.SI(\sync_reg[2][0] ), 
	.SE(test_se), 
	.RN(RST), 
	.Q(SYNC[2]), 
	.D(\sync_reg[2][0] ), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[1][1]  (.SI(\sync_reg[1][0] ), 
	.SE(test_se), 
	.RN(RST), 
	.Q(SYNC[1]), 
	.D(\sync_reg[1][0] ), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[0][1]  (.SI(\sync_reg[0][0] ), 
	.SE(test_se), 
	.RN(RST), 
	.Q(SYNC[0]), 
	.D(\sync_reg[0][0] ), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[3][0]  (.SI(SYNC[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(\sync_reg[3][0] ), 
	.D(ASYNC[3]), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[2][0]  (.SI(SYNC[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(\sync_reg[2][0] ), 
	.D(ASYNC[2]), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[1][0]  (.SI(SYNC[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(\sync_reg[1][0] ), 
	.D(ASYNC[1]), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[0][0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(\sync_reg[0][0] ), 
	.D(ASYNC[0]), 
	.CK(CLK));
endmodule

module ASYNC_FIFO_DATA_WIDTH8_DEPTH8_ADDR_SIZE3_test_1 (
	W_CLK, 
	W_RST, 
	W_INC, 
	R_CLK, 
	R_RST, 
	R_INC, 
	WR_DATA, 
	FULL, 
	EMPTY, 
	RD_DATA, 
	test_si2, 
	test_si1, 
	test_so2, 
	test_so1, 
	test_se, 
	FE_OFN1_SYNC_RST11, 
	FE_OFN2_SYNC_RST11, 
	CLK_M__L4_N1, 
	CLK_M__L4_N2);
   input W_CLK;
   input W_RST;
   input W_INC;
   input R_CLK;
   input R_RST;
   input R_INC;
   input [7:0] WR_DATA;
   output FULL;
   output EMPTY;
   output [7:0] RD_DATA;
   input test_si2;
   input test_si1;
   output test_so2;
   output test_so1;
   input test_se;
   input FE_OFN1_SYNC_RST11;
   input FE_OFN2_SYNC_RST11;
   input CLK_M__L4_N1;
   input CLK_M__L4_N2;

   // Internal wires
   wire n5;
   wire [2:0] waddr;
   wire [2:0] raddr;
   wire [3:0] wptr;
   wire [3:0] wq2_rptr;
   wire [3:0] rptr;
   wire [3:0] rq2_wptr;

   assign test_so2 = rq2_wptr[3] ;

   FIFO_MEM_CNTRL_DATA_WIDTH8_DEPTH8_ADDR_SIZE3_test_1 MEM (.wdata({ WR_DATA[7],
		WR_DATA[6],
		WR_DATA[5],
		WR_DATA[4],
		WR_DATA[3],
		WR_DATA[2],
		WR_DATA[1],
		WR_DATA[0] }), 
	.waddr({ waddr[2],
		waddr[1],
		waddr[0] }), 
	.raddr({ raddr[2],
		raddr[1],
		raddr[0] }), 
	.wfull(FULL), 
	.winc(W_INC), 
	.wclk(W_CLK), 
	.RST(FE_OFN1_SYNC_RST11), 
	.rdata({ RD_DATA[7],
		RD_DATA[6],
		RD_DATA[5],
		RD_DATA[4],
		RD_DATA[3],
		RD_DATA[2],
		RD_DATA[1],
		RD_DATA[0] }), 
	.test_si2(test_si2), 
	.test_si1(test_si1), 
	.test_so2(n5), 
	.test_so1(test_so1), 
	.test_se(test_se), 
	.FE_OFN2_SYNC_RST11(FE_OFN2_SYNC_RST11), 
	.CLK_M__L4_N1(CLK_M__L4_N1));
   FIFO_WR_ADDR_SIZE3_test_1 WR (.wclk(CLK_M__L4_N1), 
	.wrst_n(W_RST), 
	.winc(W_INC), 
	.wq2_rptr({ wq2_rptr[3],
		wq2_rptr[2],
		wq2_rptr[1],
		wq2_rptr[0] }), 
	.wptr({ wptr[3],
		wptr[2],
		wptr[1],
		wptr[0] }), 
	.waddr({ waddr[2],
		waddr[1],
		waddr[0] }), 
	.wfull(FULL), 
	.test_si(rptr[3]), 
	.test_se(test_se), 
	.FE_OFN2_SYNC_RST11(FE_OFN2_SYNC_RST11), 
	.CLK_M__L4_N2(CLK_M__L4_N2));
   FIFO_RD_ADDR_SIZE3_test_1 RD (.rclk(R_CLK), 
	.rrst_n(R_RST), 
	.rinc(R_INC), 
	.rq2_wptr({ rq2_wptr[3],
		rq2_wptr[2],
		rq2_wptr[1],
		rq2_wptr[0] }), 
	.rptr({ rptr[3],
		rptr[2],
		rptr[1],
		rptr[0] }), 
	.raddr({ raddr[2],
		raddr[1],
		raddr[0] }), 
	.rempty(EMPTY), 
	.test_si(n5), 
	.test_se(test_se));
   DF_SYNC_BUS_WIDTH4_test_0 sync_r2w (.CLK(CLK_M__L4_N1), 
	.RST(W_RST), 
	.ASYNC({ rptr[3],
		rptr[2],
		rptr[1],
		rptr[0] }), 
	.SYNC({ wq2_rptr[3],
		wq2_rptr[2],
		wq2_rptr[1],
		wq2_rptr[0] }), 
	.test_si(wptr[3]), 
	.test_se(test_se), 
	.FE_OFN2_SYNC_RST11(FE_OFN2_SYNC_RST11), 
	.CLK_M__L4_N2(CLK_M__L4_N2));
   DF_SYNC_BUS_WIDTH4_test_1 sync_w2r (.CLK(R_CLK), 
	.RST(R_RST), 
	.ASYNC({ wptr[3],
		wptr[2],
		wptr[1],
		wptr[0] }), 
	.SYNC({ rq2_wptr[3],
		rq2_wptr[2],
		rq2_wptr[1],
		rq2_wptr[0] }), 
	.test_si(wq2_rptr[3]), 
	.test_se(test_se));
endmodule

module Serializer_test_1 (
	CLK, 
	RST, 
	P_DATA, 
	SER_EN, 
	SER_DATA, 
	SER_DONE, 
	test_si, 
	test_so, 
	test_se);
   input CLK;
   input RST;
   input [7:0] P_DATA;
   input SER_EN;
   output SER_DATA;
   output SER_DONE;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire N32;
   wire n24;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n1;
   wire n2;
   wire n4;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire [3:0] COUNT;
   wire [7:0] S_DATA;

   assign test_so = S_DATA[6] ;

   SDFFRQX2M SER_DATA_reg (.SI(n21), 
	.SE(test_se), 
	.RN(RST), 
	.Q(SER_DATA), 
	.D(n1), 
	.CK(CLK));
   SDFFRQX2M \S_DATA_reg[0]  (.SI(SER_DONE), 
	.SE(test_se), 
	.RN(RST), 
	.Q(S_DATA[0]), 
	.D(n50), 
	.CK(CLK));
   SDFFRQX2M \S_DATA_reg[6]  (.SI(S_DATA[5]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(S_DATA[6]), 
	.D(n44), 
	.CK(CLK));
   SDFFRQX2M \S_DATA_reg[5]  (.SI(S_DATA[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(S_DATA[5]), 
	.D(n45), 
	.CK(CLK));
   SDFFRQX2M \S_DATA_reg[4]  (.SI(S_DATA[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(S_DATA[4]), 
	.D(n46), 
	.CK(CLK));
   SDFFRQX2M \S_DATA_reg[3]  (.SI(S_DATA[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(S_DATA[3]), 
	.D(n47), 
	.CK(CLK));
   SDFFRQX2M \S_DATA_reg[2]  (.SI(S_DATA[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(S_DATA[2]), 
	.D(n48), 
	.CK(CLK));
   SDFFRQX2M \S_DATA_reg[1]  (.SI(S_DATA[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(S_DATA[1]), 
	.D(n49), 
	.CK(CLK));
   SDFFRQX2M SER_DONE_reg (.SI(SER_DATA), 
	.SE(test_se), 
	.RN(RST), 
	.Q(SER_DONE), 
	.D(n43), 
	.CK(CLK));
   SDFFRQX2M \COUNT_reg[2]  (.SI(n20), 
	.SE(test_se), 
	.RN(RST), 
	.Q(COUNT[2]), 
	.D(n51), 
	.CK(CLK));
   SDFFRQX2M \COUNT_reg[1]  (.SI(n19), 
	.SE(test_se), 
	.RN(RST), 
	.Q(COUNT[1]), 
	.D(n52), 
	.CK(CLK));
   SDFFRQX2M \COUNT_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(COUNT[0]), 
	.D(n53), 
	.CK(CLK));
   AO22X1M U4 (.Y(n1), 
	.B1(n26), 
	.B0(S_DATA[0]), 
	.A1(n17), 
	.A0(P_DATA[0]));
   NAND2X2M U13 (.Y(N32), 
	.B(n28), 
	.A(n27));
   AND2X2M U14 (.Y(n30), 
	.B(N32), 
	.A(n39));
   NOR4BX1M U15 (.Y(n24), 
	.D(n39), 
	.C(n2), 
	.B(n16), 
	.AN(n18));
   NOR2X2M U19 (.Y(n39), 
	.B(n42), 
	.A(n2));
   NAND2X2M U20 (.Y(n27), 
	.B(SER_EN), 
	.A(n39));
   NAND2X2M U21 (.Y(n28), 
	.B(SER_EN), 
	.A(n2));
   AND2X2M U22 (.Y(n31), 
	.B(N32), 
	.A(n2));
   INVX2M U23 (.Y(n16), 
	.A(SER_EN));
   INVX2M U24 (.Y(n18), 
	.A(n42));
   NOR3X2M U25 (.Y(n42), 
	.C(n21), 
	.B(n19), 
	.A(n20));
   OAI32X1M U26 (.Y(n51), 
	.B1(n21), 
	.B0(n40), 
	.A2(n20), 
	.A1(n19), 
	.A0(n27));
   AND2X2M U27 (.Y(n40), 
	.B(n27), 
	.A(n41));
   AND3X2M U28 (.Y(n2), 
	.C(n21), 
	.B(n19), 
	.A(n20));
   OAI32X1M U29 (.Y(n52), 
	.B1(n20), 
	.B0(n41), 
	.A2(n19), 
	.A1(COUNT[1]), 
	.A0(n27));
   OAI221X1M U30 (.Y(n53), 
	.C0(n28), 
	.B1(n4), 
	.B0(n19), 
	.A1(n27), 
	.A0(COUNT[0]));
   INVX2M U31 (.Y(n4), 
	.A(n24));
   AOI2BB1X2M U32 (.Y(n41), 
	.B0(n24), 
	.A1N(COUNT[0]), 
	.A0N(n27));
   OAI2B1X2M U33 (.Y(n50), 
	.B0(n37), 
	.A1N(S_DATA[0]), 
	.A0(N32));
   AOI22X1M U34 (.Y(n37), 
	.B1(n31), 
	.B0(P_DATA[1]), 
	.A1(n30), 
	.A0(S_DATA[1]));
   OAI2B1X2M U35 (.Y(n49), 
	.B0(n36), 
	.A1N(S_DATA[1]), 
	.A0(N32));
   AOI22X1M U36 (.Y(n36), 
	.B1(n31), 
	.B0(P_DATA[2]), 
	.A1(n30), 
	.A0(S_DATA[2]));
   OAI2B1X2M U37 (.Y(n48), 
	.B0(n35), 
	.A1N(S_DATA[2]), 
	.A0(N32));
   AOI22X1M U38 (.Y(n35), 
	.B1(n31), 
	.B0(P_DATA[3]), 
	.A1(n30), 
	.A0(S_DATA[3]));
   OAI2B1X2M U39 (.Y(n47), 
	.B0(n34), 
	.A1N(S_DATA[3]), 
	.A0(N32));
   AOI22X1M U40 (.Y(n34), 
	.B1(n31), 
	.B0(P_DATA[4]), 
	.A1(n30), 
	.A0(S_DATA[4]));
   OAI2B1X2M U41 (.Y(n46), 
	.B0(n33), 
	.A1N(S_DATA[4]), 
	.A0(N32));
   AOI22X1M U42 (.Y(n33), 
	.B1(n31), 
	.B0(P_DATA[5]), 
	.A1(n30), 
	.A0(S_DATA[5]));
   OAI2B1X2M U43 (.Y(n45), 
	.B0(n32), 
	.A1N(S_DATA[5]), 
	.A0(N32));
   AOI22X1M U44 (.Y(n32), 
	.B1(n31), 
	.B0(P_DATA[6]), 
	.A1(n30), 
	.A0(S_DATA[6]));
   INVX2M U45 (.Y(n19), 
	.A(COUNT[0]));
   INVX2M U46 (.Y(n20), 
	.A(COUNT[1]));
   INVX2M U47 (.Y(n21), 
	.A(COUNT[2]));
   OAI2B1X2M U48 (.Y(n44), 
	.B0(n29), 
	.A1N(S_DATA[6]), 
	.A0(N32));
   NAND2X2M U49 (.Y(n29), 
	.B(n31), 
	.A(P_DATA[7]));
   OAI2BB2X1M U50 (.Y(n43), 
	.B1(n16), 
	.B0(n18), 
	.A1N(n24), 
	.A0N(SER_DONE));
   INVX2M U51 (.Y(n17), 
	.A(n28));
   OAI21X2M U52 (.Y(n26), 
	.B0(n27), 
	.A1(n16), 
	.A0(n18));
endmodule

module uart_fsm_test_1 (
	CLK, 
	RST, 
	Data_Valid, 
	PAR_EN, 
	SER_DONE, 
	SER_EN, 
	mux_sel, 
	busy, 
	test_si, 
	test_so, 
	test_se);
   input CLK;
   input RST;
   input Data_Valid;
   input PAR_EN;
   input SER_DONE;
   output SER_EN;
   output [1:0] mux_sel;
   output busy;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n4;
   wire n5;
   wire n6;
   wire [2:0] current_state;
   wire [2:0] next_state;

   assign test_so = current_state[2] ;

   SDFFRQX2M \current_state_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(current_state[0]), 
	.D(next_state[0]), 
	.CK(CLK));
   SDFFRQX2M \current_state_reg[2]  (.SI(current_state[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(current_state[2]), 
	.D(next_state[2]), 
	.CK(CLK));
   SDFFRQX2M \current_state_reg[1]  (.SI(n4), 
	.SE(test_se), 
	.RN(RST), 
	.Q(current_state[1]), 
	.D(next_state[1]), 
	.CK(CLK));
   NAND2X2M U6 (.Y(SER_EN), 
	.B(n10), 
	.A(n7));
   NAND2BX2M U7 (.Y(busy), 
	.B(n12), 
	.AN(SER_EN));
   OAI2BB1X2M U8 (.Y(mux_sel[0]), 
	.B0(n12), 
	.A1N(n11), 
	.A0N(n4));
   NAND2X2M U9 (.Y(mux_sel[1]), 
	.B(n8), 
	.A(n7));
   NOR2X2M U10 (.Y(n11), 
	.B(current_state[2]), 
	.A(current_state[1]));
   NAND3X2M U11 (.Y(n7), 
	.C(current_state[1]), 
	.B(n5), 
	.A(current_state[0]));
   NAND2X2M U12 (.Y(n10), 
	.B(current_state[0]), 
	.A(n11));
   INVX2M U13 (.Y(n5), 
	.A(current_state[2]));
   OAI31X1M U14 (.Y(next_state[2]), 
	.B0(n8), 
	.A2(n7), 
	.A1(PAR_EN), 
	.A0(n6));
   INVX2M U15 (.Y(n6), 
	.A(SER_DONE));
   OAI211X2M U16 (.Y(next_state[0]), 
	.C0(n10), 
	.B0(n9), 
	.A1(n7), 
	.A0(SER_DONE));
   NAND2X2M U17 (.Y(n9), 
	.B(n11), 
	.A(Data_Valid));
   NAND3X2M U18 (.Y(n8), 
	.C(current_state[1]), 
	.B(n5), 
	.A(n4));
   NAND2X2M U19 (.Y(n12), 
	.B(n4), 
	.A(current_state[1]));
   INVX2M U20 (.Y(n4), 
	.A(current_state[0]));
   AOI2BB1X2M U21 (.Y(next_state[1]), 
	.B0(current_state[2]), 
	.A1N(current_state[0]), 
	.A0N(current_state[1]));
endmodule

module parity_calc_test_1 (
	CLK, 
	RST, 
	P_DATA, 
	Data_Valid, 
	PAR_TYP, 
	busy_par, 
	par_bit, 
	test_si, 
	test_se);
   input CLK;
   input RST;
   input [7:0] P_DATA;
   input Data_Valid;
   input PAR_TYP;
   input busy_par;
   output par_bit;
   input test_si;
   input test_se;

   // Internal wires
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n8;

   SDFFRQX2M par_bit_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(par_bit), 
	.D(n8), 
	.CK(CLK));
   XNOR2X2M U2 (.Y(n5), 
	.B(P_DATA[2]), 
	.A(P_DATA[3]));
   XOR3XLM U3 (.Y(n3), 
	.C(n6), 
	.B(P_DATA[4]), 
	.A(P_DATA[5]));
   CLKXOR2X2M U4 (.Y(n6), 
	.B(P_DATA[6]), 
	.A(P_DATA[7]));
   OAI2BB2X1M U5 (.Y(n8), 
	.B1(n2), 
	.B0(n1), 
	.A1N(n2), 
	.A0N(par_bit));
   NAND2BX2M U6 (.Y(n2), 
	.B(Data_Valid), 
	.AN(busy_par));
   XOR3XLM U7 (.Y(n1), 
	.C(n4), 
	.B(PAR_TYP), 
	.A(n3));
   XOR3XLM U8 (.Y(n4), 
	.C(n5), 
	.B(P_DATA[0]), 
	.A(P_DATA[1]));
endmodule

module mux (
	CLK, 
	RST, 
	mux_sel, 
	SER_DATA, 
	par_bit, 
	TX_OUT);
   input CLK;
   input RST;
   input [1:0] mux_sel;
   input SER_DATA;
   input par_bit;
   output TX_OUT;

   // Internal wires
   wire n2;
   wire n3;
   wire n1;

   OAI21X6M U3 (.Y(TX_OUT), 
	.B0(n3), 
	.A1(n1), 
	.A0(n2));
   NAND3X2M U4 (.Y(n3), 
	.C(mux_sel[1]), 
	.B(n1), 
	.A(SER_DATA));
   NOR2BX2M U5 (.Y(n2), 
	.B(par_bit), 
	.AN(mux_sel[1]));
   INVX2M U6 (.Y(n1), 
	.A(mux_sel[0]));
endmodule

module UART_TX_test_1 (
	CLK, 
	RST, 
	P_DATA, 
	Data_Valid, 
	PAR_EN, 
	PAR_TYP, 
	TX_OUT, 
	busy, 
	test_si, 
	test_so, 
	test_se);
   input CLK;
   input RST;
   input [7:0] P_DATA;
   input Data_Valid;
   input PAR_EN;
   input PAR_TYP;
   output TX_OUT;
   output busy;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire SER_EN;
   wire SER_DATA;
   wire SER_DONE;
   wire par_bit;
   wire n1;
   wire n2;
   wire [1:0] mux_sel;

   assign test_so = par_bit ;

   Serializer_test_1 DUT1 (.CLK(CLK), 
	.RST(RST), 
	.P_DATA({ P_DATA[7],
		P_DATA[6],
		P_DATA[5],
		P_DATA[4],
		P_DATA[3],
		P_DATA[2],
		P_DATA[1],
		P_DATA[0] }), 
	.SER_EN(SER_EN), 
	.SER_DATA(SER_DATA), 
	.SER_DONE(SER_DONE), 
	.test_si(test_si), 
	.test_so(n2), 
	.test_se(test_se));
   uart_fsm_test_1 DUT2 (.CLK(CLK), 
	.RST(RST), 
	.Data_Valid(Data_Valid), 
	.PAR_EN(PAR_EN), 
	.SER_DONE(SER_DONE), 
	.SER_EN(SER_EN), 
	.mux_sel({ mux_sel[1],
		mux_sel[0] }), 
	.busy(busy), 
	.test_si(n2), 
	.test_so(n1), 
	.test_se(test_se));
   parity_calc_test_1 DUT3 (.CLK(CLK), 
	.RST(RST), 
	.P_DATA({ P_DATA[7],
		P_DATA[6],
		P_DATA[5],
		P_DATA[4],
		P_DATA[3],
		P_DATA[2],
		P_DATA[1],
		P_DATA[0] }), 
	.Data_Valid(Data_Valid), 
	.PAR_TYP(PAR_TYP), 
	.busy_par(busy), 
	.par_bit(par_bit), 
	.test_si(n1), 
	.test_se(test_se));
   mux DUT4 (.CLK(CLK), 
	.RST(RST), 
	.mux_sel({ mux_sel[1],
		mux_sel[0] }), 
	.SER_DATA(SER_DATA), 
	.par_bit(par_bit), 
	.TX_OUT(TX_OUT));
endmodule

module ClkDiv_1_DW01_inc_0 (
	A, 
	SUM);
   input [7:0] A;
   output [7:0] SUM;

   // Internal wires
   wire [7:2] carry;

   ADDHX1M U1_1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.B(carry[6]), 
	.A(A[6]));
   ADDHX1M U1_1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.B(A[0]), 
	.A(A[1]));
   ADDHX1M U1_1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.B(carry[4]), 
	.A(A[4]));
   ADDHX1M U1_1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.B(carry[3]), 
	.A(A[3]));
   ADDHX1M U1_1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.B(carry[2]), 
	.A(A[2]));
   ADDHX1M U1_1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.B(carry[5]), 
	.A(A[5]));
   CLKXOR2X2M U1 (.Y(SUM[7]), 
	.B(A[7]), 
	.A(carry[7]));
endmodule

module ClkDiv_1_DW01_inc_1 (
	A, 
	SUM);
   input [7:0] A;
   output [7:0] SUM;

   // Internal wires
   wire [7:2] carry;

   ADDHX1M U1_1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.B(carry[2]), 
	.A(A[2]));
   ADDHX1M U1_1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.B(A[0]), 
	.A(A[1]));
   ADDHX1M U1_1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.B(carry[6]), 
	.A(A[6]));
   ADDHX1M U1_1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.B(carry[3]), 
	.A(A[3]));
   ADDHX1M U1_1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.B(carry[4]), 
	.A(A[4]));
   ADDHX1M U1_1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.B(carry[5]), 
	.A(A[5]));
   CLKXOR2X2M U1 (.Y(SUM[7]), 
	.B(A[7]), 
	.A(carry[7]));
   CLKINVX1M U2 (.Y(SUM[0]), 
	.A(A[0]));
endmodule

module ClkDiv_test_1 (
	I_ref_clk, 
	I_rst_n, 
	I_clk_en, 
	I_div_ratio, 
	o_div_clk, 
	test_si, 
	test_so, 
	test_se, 
	SYNC_RST22__Exclude_0_NET, 
	CLKR__L14_N0, 
	CLKR__L7_N0);
   input I_ref_clk;
   input I_rst_n;
   input I_clk_en;
   input [7:0] I_div_ratio;
   output o_div_clk;
   input test_si;
   output test_so;
   input test_se;
   input SYNC_RST22__Exclude_0_NET;
   input CLKR__L14_N0;
   input CLKR__L7_N0;

   // Internal wires
   wire FE_PHN9_div_clk__Exclude_0_NET;
   wire n7__L1_N0;
   wire div_clk__Exclude_0_NET;
   wire HTIE_LTIEHI_NET;
   wire FE_UNCONNECTED_0;
   wire div_clk;
   wire flag;
   wire N7;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire N40;
   wire N41;
   wire N42;
   wire N43;
   wire N44;
   wire N45;
   wire N46;
   wire N47;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire [7:0] half_toggle;
   wire [7:0] half_toggle_p;
   wire [7:0] counter;

   assign test_so = flag ;

   DLY2X1M FE_PHC9_div_clk__Exclude_0_NET (.Y(FE_PHN9_div_clk__Exclude_0_NET), 
	.A(div_clk__Exclude_0_NET));
   BUFX2M n7__L1_I0 (.Y(n7__L1_N0), 
	.A(n7));
   BUFX2M div_clk__Exclude_0 (.Y(div_clk__Exclude_0_NET), 
	.A(div_clk));
   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   SDFFRQX2M div_clk_reg (.SI(counter[7]), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(div_clk), 
	.D(n62), 
	.CK(CLKR__L7_N0));
   SDFFRQX2M flag_reg (.SI(FE_PHN9_div_clk__Exclude_0_NET), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(flag), 
	.D(n61), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[7]  (.SI(counter[6]), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(counter[7]), 
	.D(N47), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(counter[0]), 
	.D(N40), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[6]  (.SI(counter[5]), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(counter[6]), 
	.D(N46), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[4]  (.SI(n38), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(counter[4]), 
	.D(N44), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[3]  (.SI(counter[2]), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(counter[3]), 
	.D(N43), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[5]  (.SI(counter[4]), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(counter[5]), 
	.D(N45), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[1]  (.SI(counter[0]), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(counter[1]), 
	.D(N41), 
	.CK(CLKR__L14_N0));
   SDFFRQX2M \counter_reg[2]  (.SI(counter[1]), 
	.SE(test_se), 
	.RN(SYNC_RST22__Exclude_0_NET), 
	.Q(counter[2]), 
	.D(N42), 
	.CK(CLKR__L14_N0));
   OR2X2M U5 (.Y(n1), 
	.B(I_div_ratio[1]), 
	.A(I_div_ratio[2]));
   OAI211X2M U6 (.Y(n12), 
	.C0(n13), 
	.B0(n10), 
	.A1(n14), 
	.A0(I_div_ratio[0]));
   CLKINVX1M U7 (.Y(half_toggle[0]), 
	.A(I_div_ratio[1]));
   OAI2BB1X1M U8 (.Y(half_toggle[1]), 
	.B0(n1), 
	.A1N(I_div_ratio[2]), 
	.A0N(I_div_ratio[1]));
   OR2X1M U9 (.Y(n2), 
	.B(I_div_ratio[3]), 
	.A(n1));
   OAI2BB1X1M U10 (.Y(half_toggle[2]), 
	.B0(n2), 
	.A1N(I_div_ratio[3]), 
	.A0N(n1));
   OR2X1M U19 (.Y(n3), 
	.B(I_div_ratio[4]), 
	.A(n2));
   OAI2BB1X1M U20 (.Y(half_toggle[3]), 
	.B0(n3), 
	.A1N(I_div_ratio[4]), 
	.A0N(n2));
   OR2X1M U21 (.Y(n4), 
	.B(I_div_ratio[5]), 
	.A(n3));
   OAI2BB1X1M U22 (.Y(half_toggle[4]), 
	.B0(n4), 
	.A1N(I_div_ratio[5]), 
	.A0N(n3));
   XNOR2X1M U23 (.Y(half_toggle[5]), 
	.B(n4), 
	.A(I_div_ratio[6]));
   NOR3X1M U24 (.Y(half_toggle[7]), 
	.C(n4), 
	.B(I_div_ratio[7]), 
	.A(I_div_ratio[6]));
   OAI21X1M U25 (.Y(n5), 
	.B0(I_div_ratio[7]), 
	.A1(n4), 
	.A0(I_div_ratio[6]));
   NAND2BX1M U26 (.Y(half_toggle[6]), 
	.B(n5), 
	.AN(half_toggle[7]));
   OR4X1M U27 (.Y(n6), 
	.D(I_div_ratio[6]), 
	.C(I_div_ratio[7]), 
	.B(I_div_ratio[4]), 
	.A(I_div_ratio[5]));
   OR4X1M U28 (.Y(N7), 
	.D(n6), 
	.C(I_div_ratio[1]), 
	.B(I_div_ratio[2]), 
	.A(I_div_ratio[3]));
   CLKMX2X2M U29 (.Y(o_div_clk), 
	.S0(n7__L1_N0), 
	.B(div_clk), 
	.A(I_ref_clk));
   NOR2BX1M U30 (.Y(n7), 
	.B(n8), 
	.AN(I_rst_n));
   NOR2X1M U31 (.Y(n61), 
	.B(n8), 
	.A(n9));
   CLKXOR2X2M U32 (.Y(n9), 
	.B(n10), 
	.A(flag));
   MXI2X1M U33 (.Y(n62), 
	.S0(div_clk__Exclude_0_NET), 
	.B(n12), 
	.A(n11));
   CLKNAND2X2M U34 (.Y(n11), 
	.B(n12), 
	.A(n13));
   NOR2BX1M U35 (.Y(N47), 
	.B(n12), 
	.AN(N25));
   NOR2BX1M U36 (.Y(N46), 
	.B(n12), 
	.AN(N24));
   NOR2BX1M U37 (.Y(N45), 
	.B(n12), 
	.AN(N23));
   NOR2BX1M U38 (.Y(N44), 
	.B(n12), 
	.AN(N22));
   NOR2BX1M U39 (.Y(N43), 
	.B(n12), 
	.AN(N21));
   NOR2BX1M U40 (.Y(N42), 
	.B(n12), 
	.AN(N20));
   NOR2BX1M U41 (.Y(N41), 
	.B(n12), 
	.AN(N19));
   NOR2BX1M U42 (.Y(N40), 
	.B(n12), 
	.AN(n46));
   CLKINVX1M U43 (.Y(n13), 
	.A(n8));
   CLKNAND2X2M U44 (.Y(n8), 
	.B(HTIE_LTIEHI_NET), 
	.A(N7));
   CLKNAND2X2M U45 (.Y(n10), 
	.B(I_div_ratio[0]), 
	.A(n15));
   MXI2X1M U46 (.Y(n15), 
	.S0(flag), 
	.B(n26), 
	.A(n14));
   AOI2B1X1M U47 (.Y(n26), 
	.B0(n27), 
	.A1N(half_toggle_p[7]), 
	.A0(counter[7]));
   AOI221XLM U48 (.Y(n27), 
	.C0(n30), 
	.B1(n29), 
	.B0(half_toggle_p[6]), 
	.A1(n28), 
	.A0(half_toggle_p[7]));
   AOI2B1X1M U49 (.Y(n30), 
	.B0(n31), 
	.A1N(half_toggle_p[6]), 
	.A0(counter[6]));
   AOI2B1X1M U50 (.Y(n31), 
	.B0(n32), 
	.A1N(counter[5]), 
	.A0(half_toggle_p[5]));
   AOI221XLM U51 (.Y(n32), 
	.C0(n35), 
	.B1(n34), 
	.B0(counter[5]), 
	.A1(n33), 
	.A0(counter[4]));
   AOI221XLM U52 (.Y(n35), 
	.C0(n40), 
	.B1(n39), 
	.B0(half_toggle_p[4]), 
	.A1(n38), 
	.A0(half_toggle_p[3]));
   AOI222X1M U53 (.Y(n40), 
	.C1(n44), 
	.C0(counter[3]), 
	.B1(n43), 
	.B0(n42), 
	.A1(n41), 
	.A0(counter[2]));
   CLKINVX1M U54 (.Y(n44), 
	.A(half_toggle_p[3]));
   OAI211X1M U55 (.Y(n43), 
	.C0(half_toggle_p[0]), 
	.B0(n46), 
	.A1(n45), 
	.A0(half_toggle_p[1]));
   AOI22X1M U56 (.Y(n42), 
	.B1(n45), 
	.B0(half_toggle_p[1]), 
	.A1(n47), 
	.A0(half_toggle_p[2]));
   CLKINVX1M U57 (.Y(n41), 
	.A(half_toggle_p[2]));
   CLKINVX1M U58 (.Y(n34), 
	.A(half_toggle_p[5]));
   CLKINVX1M U59 (.Y(n33), 
	.A(half_toggle_p[4]));
   NOR2X1M U60 (.Y(n14), 
	.B(n49), 
	.A(n48));
   AOI221XLM U61 (.Y(n49), 
	.C0(n50), 
	.B1(half_toggle[7]), 
	.B0(n28), 
	.A1(half_toggle[6]), 
	.A0(n29));
   OA22X1M U62 (.Y(n50), 
	.B1(n29), 
	.B0(half_toggle[6]), 
	.A1(n52), 
	.A0(n51));
   NOR2X1M U63 (.Y(n52), 
	.B(n53), 
	.A(counter[5]));
   AOI221XLM U64 (.Y(n51), 
	.C0(n55), 
	.B1(n53), 
	.B0(counter[5]), 
	.A1(n54), 
	.A0(counter[4]));
   AOI221XLM U65 (.Y(n55), 
	.C0(n56), 
	.B1(n39), 
	.B0(half_toggle[4]), 
	.A1(n38), 
	.A0(half_toggle[3]));
   AOI222X1M U66 (.Y(n56), 
	.C1(n60), 
	.C0(counter[3]), 
	.B1(n59), 
	.B0(n58), 
	.A1(n57), 
	.A0(counter[2]));
   CLKINVX1M U67 (.Y(n60), 
	.A(half_toggle[3]));
   OAI211X1M U68 (.Y(n59), 
	.C0(half_toggle[0]), 
	.B0(n46), 
	.A1(n45), 
	.A0(half_toggle[1]));
   CLKINVX1M U69 (.Y(n46), 
	.A(counter[0]));
   AOI22X1M U70 (.Y(n58), 
	.B1(n45), 
	.B0(half_toggle[1]), 
	.A1(n47), 
	.A0(half_toggle[2]));
   CLKINVX1M U71 (.Y(n45), 
	.A(counter[1]));
   CLKINVX1M U72 (.Y(n47), 
	.A(counter[2]));
   CLKINVX1M U73 (.Y(n57), 
	.A(half_toggle[2]));
   CLKINVX1M U74 (.Y(n39), 
	.A(counter[4]));
   CLKINVX1M U75 (.Y(n38), 
	.A(counter[3]));
   CLKINVX1M U76 (.Y(n53), 
	.A(half_toggle[5]));
   CLKINVX1M U77 (.Y(n54), 
	.A(half_toggle[4]));
   CLKINVX1M U78 (.Y(n29), 
	.A(counter[6]));
   NOR2X1M U79 (.Y(n48), 
	.B(half_toggle[7]), 
	.A(n28));
   CLKINVX1M U80 (.Y(n28), 
	.A(counter[7]));
   ClkDiv_1_DW01_inc_0 add_49 (.A({ counter[7],
		counter[6],
		counter[5],
		counter[4],
		counter[3],
		counter[2],
		counter[1],
		counter[0] }), 
	.SUM({ N25,
		N24,
		N23,
		N22,
		N21,
		N20,
		N19,
		FE_UNCONNECTED_0 }));
   ClkDiv_1_DW01_inc_1 add_20 (.A({ half_toggle[7],
		half_toggle[6],
		half_toggle[5],
		half_toggle[4],
		half_toggle[3],
		half_toggle[2],
		half_toggle[1],
		half_toggle[0] }), 
	.SUM({ half_toggle_p[7],
		half_toggle_p[6],
		half_toggle_p[5],
		half_toggle_p[4],
		half_toggle_p[3],
		half_toggle_p[2],
		half_toggle_p[1],
		half_toggle_p[0] }));
endmodule

module pulse_gen_test_1 (
	CLK, 
	RST, 
	LVL_SIG, 
	PULSE_SIG, 
	test_si, 
	test_so, 
	test_se);
   input CLK;
   input RST;
   input LVL_SIG;
   output PULSE_SIG;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire pls_flop;
   wire rcv_flop;

   assign test_so = rcv_flop ;

   SDFFRQX2M rcv_flop_reg (.SI(pls_flop), 
	.SE(test_se), 
	.RN(RST), 
	.Q(rcv_flop), 
	.D(LVL_SIG), 
	.CK(CLK));
   SDFFRQX2M pls_flop_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(pls_flop), 
	.D(rcv_flop), 
	.CK(CLK));
   NOR2BX2M U5 (.Y(PULSE_SIG), 
	.B(pls_flop), 
	.AN(rcv_flop));
endmodule

module SYS_TOP (
	SI, 
	SE, 
	scan_clk, 
	scan_rst, 
	test_mode, 
	SO, 
	REF_CLK, 
	UART_CLK, 
	RST_N, 
	UART_RX_IN, 
	UART_TX_O, 
	parity_error, 
	framing_error);
   input [3:0] SI;
   input SE;
   input scan_clk;
   input scan_rst;
   input test_mode;
   output [3:0] SO;
   input REF_CLK;
   input UART_CLK;
   input RST_N;
   input UART_RX_IN;
   output UART_TX_O;
   output parity_error;
   output framing_error;

   // Internal wires
   wire FE_PHN14_SYNC_RST22__Exclude_0_NET;
   wire FE_PHN13_SYNC_RST22__Exclude_0_NET;
   wire FE_PHN11_SYNC_RST2__Exclude_0_NET;
   wire FE_PHN10_SYNC_RST2__Exclude_0_NET;
   wire FE_OFN4_SYNC_RST22__Exclude_0_NET;
   wire REF_CLK__L2_N0;
   wire REF_CLK__L1_N0;
   wire UART_CLK__L2_N0;
   wire UART_CLK__L1_N0;
   wire scan_clk__L11_N0;
   wire scan_clk__L10_N1;
   wire scan_clk__L10_N0;
   wire scan_clk__L9_N0;
   wire scan_clk__L8_N0;
   wire scan_clk__L7_N0;
   wire scan_clk__L6_N0;
   wire scan_clk__L5_N0;
   wire scan_clk__L4_N0;
   wire scan_clk__L3_N0;
   wire scan_clk__L2_N1;
   wire scan_clk__L2_N0;
   wire scan_clk__L1_N0;
   wire CLK_M__L4_N5;
   wire CLK_M__L4_N4;
   wire CLK_M__L4_N3;
   wire CLK_M__L4_N2;
   wire CLK_M__L4_N1;
   wire CLK_M__L4_N0;
   wire CLK_M__L3_N1;
   wire CLK_M__L3_N0;
   wire CLK_M__L2_N0;
   wire CLK_M__L1_N0;
   wire ALU_CLK__L1_N0;
   wire CLKR__L14_N0;
   wire CLKR__L13_N0;
   wire CLKR__L12_N1;
   wire CLKR__L12_N0;
   wire CLKR__L11_N1;
   wire CLKR__L11_N0;
   wire CLKR__L10_N1;
   wire CLKR__L10_N0;
   wire CLKR__L9_N1;
   wire CLKR__L9_N0;
   wire CLKR__L8_N1;
   wire CLKR__L8_N0;
   wire CLKR__L7_N1;
   wire CLKR__L7_N0;
   wire CLKR__L6_N1;
   wire CLKR__L6_N0;
   wire CLKR__L5_N1;
   wire CLKR__L5_N0;
   wire CLKR__L4_N1;
   wire CLKR__L4_N0;
   wire CLKR__L3_N1;
   wire CLKR__L3_N0;
   wire CLKR__L2_N0;
   wire CLKR__L1_N0;
   wire SYNC_RST2__L1_N0;
   wire SYNC_RST2__Exclude_0_NET;
   wire SYNC_RST22__Exclude_0_NET;
   wire RX_CLK1__L2_N0;
   wire RX_CLK1__L1_N0;
   wire TX_CLK1__L2_N0;
   wire TX_CLK1__L1_N0;
   wire FE_OFN3_SE;
   wire FE_OFN2_SYNC_RST11;
   wire FE_OFN1_SYNC_RST11;
   wire FE_OFN0_SYNC_RST11;
   wire CLK_M;
   wire CLKR;
   wire RX_CLK;
   wire RX_CLK1;
   wire TX_CLK;
   wire TX_CLK1;
   wire RST_M;
   wire SYNC_RST1;
   wire SYNC_RST11;
   wire SYNC_RST2;
   wire SYNC_RST22;
   wire data_valid;
   wire RX_D_VLD;
   wire WrEn;
   wire RdEn;
   wire Rd_D_Vld;
   wire OUT_Valid;
   wire EN;
   wire CLK_EN;
   wire TX_D_VLD;
   wire FIFO_Full;
   wire _1_net_;
   wire ALU_CLK;
   wire RD_INC;
   wire F_EMPTY;
   wire Busy;
   wire n1;
   wire n3;
   wire n4;
   wire n5;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n19;
   wire n22;
   wire n25;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire [7:0] REG2internal;
   wire [7:0] P_DATA;
   wire [7:0] RX_P_DATA;
   wire [7:0] WrData;
   wire [3:0] Address;
   wire [7:0] Rd_D;
   wire [7:0] REG0internal;
   wire [7:0] REG1internal;
   wire [7:0] REG3internal;
   wire [15:0] ALU_OUT;
   wire [3:0] ALU_FUN;
   wire [7:0] TX_P_DATA;
   wire [7:0] ratio;
   wire [7:0] RD_DATA;
   wire SYNOPSYS_UNCONNECTED__0;
   wire SYNOPSYS_UNCONNECTED__1;
   wire SYNOPSYS_UNCONNECTED__2;
   wire SYNOPSYS_UNCONNECTED__3;

   DLY4X4M FE_PHC14_SYNC_RST22__Exclude_0_NET (.Y(FE_PHN13_SYNC_RST22__Exclude_0_NET), 
	.A(FE_PHN14_SYNC_RST22__Exclude_0_NET));
   DLY4X4M FE_PHC13_SYNC_RST22__Exclude_0_NET (.Y(SYNC_RST22__Exclude_0_NET), 
	.A(FE_PHN13_SYNC_RST22__Exclude_0_NET));
   DLY4X1M FE_PHC11_SYNC_RST2__Exclude_0_NET (.Y(FE_PHN10_SYNC_RST2__Exclude_0_NET), 
	.A(FE_PHN11_SYNC_RST2__Exclude_0_NET));
   DLY4X1M FE_PHC10_SYNC_RST2__Exclude_0_NET (.Y(SYNC_RST2__Exclude_0_NET), 
	.A(FE_PHN10_SYNC_RST2__Exclude_0_NET));
   CLKBUFX8M FE_OFC4_SYNC_RST22__Exclude_0_NET (.Y(FE_OFN4_SYNC_RST22__Exclude_0_NET), 
	.A(SYNC_RST22__Exclude_0_NET));
   CLKINVX8M REF_CLK__L2_I0 (.Y(REF_CLK__L2_N0), 
	.A(REF_CLK__L1_N0));
   CLKINVX40M REF_CLK__L1_I0 (.Y(REF_CLK__L1_N0), 
	.A(REF_CLK));
   CLKINVX8M UART_CLK__L2_I0 (.Y(UART_CLK__L2_N0), 
	.A(UART_CLK__L1_N0));
   CLKINVX40M UART_CLK__L1_I0 (.Y(UART_CLK__L1_N0), 
	.A(UART_CLK));
   INVX2M scan_clk__L11_I0 (.Y(scan_clk__L11_N0), 
	.A(scan_clk__L10_N1));
   CLKBUFX2M scan_clk__L10_I1 (.Y(scan_clk__L10_N1), 
	.A(scan_clk__L9_N0));
   INVX2M scan_clk__L10_I0 (.Y(scan_clk__L10_N0), 
	.A(scan_clk__L9_N0));
   CLKBUFX4M scan_clk__L9_I0 (.Y(scan_clk__L9_N0), 
	.A(scan_clk__L8_N0));
   CLKBUFX4M scan_clk__L8_I0 (.Y(scan_clk__L8_N0), 
	.A(scan_clk__L7_N0));
   CLKBUFX4M scan_clk__L7_I0 (.Y(scan_clk__L7_N0), 
	.A(scan_clk__L6_N0));
   CLKBUFX4M scan_clk__L6_I0 (.Y(scan_clk__L6_N0), 
	.A(scan_clk__L5_N0));
   CLKBUFX4M scan_clk__L5_I0 (.Y(scan_clk__L5_N0), 
	.A(scan_clk__L4_N0));
   CLKBUFX4M scan_clk__L4_I0 (.Y(scan_clk__L4_N0), 
	.A(scan_clk__L3_N0));
   CLKBUFX4M scan_clk__L3_I0 (.Y(scan_clk__L3_N0), 
	.A(scan_clk__L2_N1));
   CLKBUFX4M scan_clk__L2_I1 (.Y(scan_clk__L2_N1), 
	.A(scan_clk__L1_N0));
   INVX2M scan_clk__L2_I0 (.Y(scan_clk__L2_N0), 
	.A(scan_clk__L1_N0));
   CLKINVX40M scan_clk__L1_I0 (.Y(scan_clk__L1_N0), 
	.A(scan_clk));
   CLKINVX40M CLK_M__L4_I5 (.Y(CLK_M__L4_N5), 
	.A(CLK_M__L3_N1));
   CLKINVX40M CLK_M__L4_I4 (.Y(CLK_M__L4_N4), 
	.A(CLK_M__L3_N1));
   CLKINVX40M CLK_M__L4_I3 (.Y(CLK_M__L4_N3), 
	.A(CLK_M__L3_N1));
   CLKINVX40M CLK_M__L4_I2 (.Y(CLK_M__L4_N2), 
	.A(CLK_M__L3_N0));
   CLKINVX40M CLK_M__L4_I1 (.Y(CLK_M__L4_N1), 
	.A(CLK_M__L3_N0));
   CLKINVX40M CLK_M__L4_I0 (.Y(CLK_M__L4_N0), 
	.A(CLK_M__L3_N0));
   CLKINVX40M CLK_M__L3_I1 (.Y(CLK_M__L3_N1), 
	.A(CLK_M__L2_N0));
   CLKINVX40M CLK_M__L3_I0 (.Y(CLK_M__L3_N0), 
	.A(CLK_M__L2_N0));
   CLKBUFX40M CLK_M__L2_I0 (.Y(CLK_M__L2_N0), 
	.A(CLK_M__L1_N0));
   CLKBUFX12M CLK_M__L1_I0 (.Y(CLK_M__L1_N0), 
	.A(CLK_M));
   CLKBUFX20M ALU_CLK__L1_I0 (.Y(ALU_CLK__L1_N0), 
	.A(ALU_CLK));
   CLKINVX32M CLKR__L14_I0 (.Y(CLKR__L14_N0), 
	.A(CLKR__L13_N0));
   CLKINVX40M CLKR__L13_I0 (.Y(CLKR__L13_N0), 
	.A(CLKR__L12_N1));
   CLKBUFX32M CLKR__L12_I1 (.Y(CLKR__L12_N1), 
	.A(CLKR__L11_N1));
   CLKINVX32M CLKR__L12_I0 (.Y(CLKR__L12_N0), 
	.A(CLKR__L11_N0));
   CLKBUFX4M CLKR__L11_I1 (.Y(CLKR__L11_N1), 
	.A(CLKR__L10_N1));
   CLKINVX40M CLKR__L11_I0 (.Y(CLKR__L11_N0), 
	.A(CLKR__L10_N0));
   CLKBUFX4M CLKR__L10_I1 (.Y(CLKR__L10_N1), 
	.A(CLKR__L9_N1));
   CLKBUFX40M CLKR__L10_I0 (.Y(CLKR__L10_N0), 
	.A(CLKR__L9_N0));
   CLKBUFX4M CLKR__L9_I1 (.Y(CLKR__L9_N1), 
	.A(CLKR__L8_N1));
   CLKBUFX40M CLKR__L9_I0 (.Y(CLKR__L9_N0), 
	.A(CLKR__L8_N0));
   CLKBUFX4M CLKR__L8_I1 (.Y(CLKR__L8_N1), 
	.A(CLKR__L7_N1));
   CLKBUFX40M CLKR__L8_I0 (.Y(CLKR__L8_N0), 
	.A(CLKR__L7_N0));
   CLKBUFX4M CLKR__L7_I1 (.Y(CLKR__L7_N1), 
	.A(CLKR__L6_N1));
   CLKINVX32M CLKR__L7_I0 (.Y(CLKR__L7_N0), 
	.A(CLKR__L6_N0));
   CLKBUFX4M CLKR__L6_I1 (.Y(CLKR__L6_N1), 
	.A(CLKR__L5_N1));
   CLKINVX40M CLKR__L6_I0 (.Y(CLKR__L6_N0), 
	.A(CLKR__L5_N0));
   CLKBUFX4M CLKR__L5_I1 (.Y(CLKR__L5_N1), 
	.A(CLKR__L4_N1));
   CLKBUFX40M CLKR__L5_I0 (.Y(CLKR__L5_N0), 
	.A(CLKR__L4_N0));
   CLKBUFX4M CLKR__L4_I1 (.Y(CLKR__L4_N1), 
	.A(CLKR__L3_N1));
   CLKBUFX4M CLKR__L4_I0 (.Y(CLKR__L4_N0), 
	.A(CLKR__L3_N0));
   CLKBUFX4M CLKR__L3_I1 (.Y(CLKR__L3_N1), 
	.A(CLKR__L2_N0));
   CLKBUFX4M CLKR__L3_I0 (.Y(CLKR__L3_N0), 
	.A(CLKR__L2_N0));
   CLKBUFX4M CLKR__L2_I0 (.Y(CLKR__L2_N0), 
	.A(CLKR__L1_N0));
   CLKBUFX6M CLKR__L1_I0 (.Y(CLKR__L1_N0), 
	.A(CLKR));
   CLKBUFX6M SYNC_RST2__L1_I0 (.Y(SYNC_RST2__L1_N0), 
	.A(SYNC_RST2));
   BUFX2M SYNC_RST2__Exclude_0 (.Y(FE_PHN11_SYNC_RST2__Exclude_0_NET), 
	.A(SYNC_RST2));
   BUFX2M SYNC_RST22__Exclude_0 (.Y(FE_PHN14_SYNC_RST22__Exclude_0_NET), 
	.A(SYNC_RST22));
   BUFX32M RX_CLK1__L2_I0 (.Y(RX_CLK1__L2_N0), 
	.A(RX_CLK1__L1_N0));
   CLKBUFX12M RX_CLK1__L1_I0 (.Y(RX_CLK1__L1_N0), 
	.A(RX_CLK1));
   CLKBUFX40M TX_CLK1__L2_I0 (.Y(TX_CLK1__L2_N0), 
	.A(TX_CLK1__L1_N0));
   CLKBUFX12M TX_CLK1__L1_I0 (.Y(TX_CLK1__L1_N0), 
	.A(TX_CLK1));
   BUFX4M FE_OFC3_SE (.Y(FE_OFN3_SE), 
	.A(SE));
   BUFX8M FE_OFC2_SYNC_RST11 (.Y(FE_OFN2_SYNC_RST11), 
	.A(FE_OFN1_SYNC_RST11));
   BUFX8M FE_OFC1_SYNC_RST11 (.Y(FE_OFN1_SYNC_RST11), 
	.A(FE_OFN0_SYNC_RST11));
   BUFX8M FE_OFC0_SYNC_RST11 (.Y(FE_OFN0_SYNC_RST11), 
	.A(SYNC_RST11));
   OR2X2M U4 (.Y(_1_net_), 
	.B(n3), 
	.A(CLK_EN));
   BUFX2M U5 (.Y(n4), 
	.A(Address[0]));
   BUFX4M U6 (.Y(n5), 
	.A(Address[1]));
   INVX2M U7 (.Y(n1), 
	.A(F_EMPTY));
   BUFX2M U13 (.Y(n3), 
	.A(test_mode));
   DLY1X4M U19 (.Y(n28), 
	.A(n30));
   INVXLM U20 (.Y(n29), 
	.A(n39));
   INVXLM U21 (.Y(n30), 
	.A(n29));
   CLKINVX2M U22 (.Y(n31), 
	.A(n29));
   INVX2M U23 (.Y(n32), 
	.A(n29));
   DLY1X4M U24 (.Y(n33), 
	.A(n35));
   INVXLM U25 (.Y(n34), 
	.A(n40));
   INVXLM U26 (.Y(n35), 
	.A(n34));
   CLKINVX2M U27 (.Y(n36), 
	.A(n34));
   CLKINVX2M U28 (.Y(n37), 
	.A(n34));
   INVXLM U29 (.Y(n38), 
	.A(FE_OFN3_SE));
   INVXLM U30 (.Y(n39), 
	.A(n38));
   CLKINVX2M U31 (.Y(n40), 
	.A(n38));
   mux2X1_1 U0_mux2X1 (.IN_0(REF_CLK__L2_N0), 
	.IN_1(scan_clk__L10_N0), 
	.SEL(n3), 
	.OUT(CLK_M));
   mux2X1_4 U1_mux2X1 (.IN_0(UART_CLK__L2_N0), 
	.IN_1(scan_clk__L2_N0), 
	.SEL(n3), 
	.OUT(CLKR));
   mux2X1_3 U3_mux2X1 (.IN_0(RX_CLK), 
	.IN_1(scan_clk__L11_N0), 
	.SEL(n3), 
	.OUT(RX_CLK1));
   mux2X1_2 U4_mux2X1 (.IN_0(TX_CLK), 
	.IN_1(scan_clk__L11_N0), 
	.SEL(n3), 
	.OUT(TX_CLK1));
   mux2X1_0 U2_mux2X1 (.IN_0(RST_N), 
	.IN_1(scan_rst), 
	.SEL(n3), 
	.OUT(RST_M));
   mux2X1_6 U6_mux2X1 (.IN_0(SYNC_RST1), 
	.IN_1(scan_rst), 
	.SEL(n3), 
	.OUT(SYNC_RST11));
   mux2X1_5 U7_mux2X1 (.IN_0(SYNC_RST2__L1_N0), 
	.IN_1(scan_rst), 
	.SEL(n3), 
	.OUT(SYNC_RST22));
   UART_RX_TOP_test_1 RX (.CLK(RX_CLK1__L2_N0), 
	.RST(FE_OFN4_SYNC_RST22__Exclude_0_NET), 
	.RX_IN(UART_RX_IN), 
	.Prescale({ REG2internal[7],
		REG2internal[6],
		REG2internal[5],
		REG2internal[4],
		REG2internal[3],
		REG2internal[2] }), 
	.PAR_EN(REG2internal[0]), 
	.PAR_TYP(REG2internal[1]), 
	.P_DATA({ P_DATA[7],
		P_DATA[6],
		P_DATA[5],
		P_DATA[4],
		P_DATA[3],
		P_DATA[2],
		P_DATA[1],
		P_DATA[0] }), 
	.Parity_Error(parity_error), 
	.Stop_Error(SO[0]), 
	.data_valid(data_valid), 
	.test_si3(n11), 
	.test_si2(SI[0]), 
	.test_si1(SYNC_RST2__Exclude_0_NET), 
	.test_so2(n16), 
	.test_so1(SO[1]), 
	.test_se(n33));
   DATA_SYNC_NUM_STAGES2_test_1 Data_sync (.CLK(CLK_M__L4_N2), 
	.RST(SYNC_RST11), 
	.Unsync_bus({ P_DATA[7],
		P_DATA[6],
		P_DATA[5],
		P_DATA[4],
		P_DATA[3],
		P_DATA[2],
		P_DATA[1],
		P_DATA[0] }), 
	.bus_enable(data_valid), 
	.sync_bus({ RX_P_DATA[7],
		RX_P_DATA[6],
		RX_P_DATA[5],
		RX_P_DATA[4],
		RX_P_DATA[3],
		RX_P_DATA[2],
		RX_P_DATA[1],
		RX_P_DATA[0] }), 
	.enable_pulse(RX_D_VLD), 
	.test_si(OUT_Valid), 
	.test_so(n25), 
	.test_se(n36));
   Register_file_ADDR_WIDTH4_WIDTH8_DEPTH16_test_1 REGISTER (.WrData({ WrData[7],
		WrData[6],
		WrData[5],
		WrData[4],
		WrData[3],
		WrData[2],
		WrData[1],
		WrData[0] }), 
	.Address({ Address[3],
		Address[2],
		n5,
		n4 }), 
	.WrEn(WrEn), 
	.RdEn(RdEn), 
	.CLK(CLK_M__L4_N2), 
	.RST(SYNC_RST11), 
	.RdData({ Rd_D[7],
		Rd_D[6],
		Rd_D[5],
		Rd_D[4],
		Rd_D[3],
		Rd_D[2],
		Rd_D[1],
		Rd_D[0] }), 
	.RdData_Valid(Rd_D_Vld), 
	.REG0({ REG0internal[7],
		REG0internal[6],
		REG0internal[5],
		REG0internal[4],
		REG0internal[3],
		REG0internal[2],
		REG0internal[1],
		REG0internal[0] }), 
	.REG1({ REG1internal[7],
		REG1internal[6],
		REG1internal[5],
		REG1internal[4],
		REG1internal[3],
		REG1internal[2],
		REG1internal[1],
		REG1internal[0] }), 
	.REG2({ REG2internal[7],
		REG2internal[6],
		REG2internal[5],
		REG2internal[4],
		REG2internal[3],
		REG2internal[2],
		REG2internal[1],
		REG2internal[0] }), 
	.REG3({ REG3internal[7],
		REG3internal[6],
		REG3internal[5],
		REG3internal[4],
		REG3internal[3],
		REG3internal[2],
		REG3internal[1],
		REG3internal[0] }), 
	.test_si2(SI[1]), 
	.test_si1(n22), 
	.test_so2(n19), 
	.test_so1(SO[2]), 
	.test_se(FE_OFN3_SE), 
	.FE_OFN0_SYNC_RST11(FE_OFN0_SYNC_RST11), 
	.FE_OFN1_SYNC_RST11(FE_OFN1_SYNC_RST11), 
	.CLK_M__L4_N3(CLK_M__L4_N3), 
	.CLK_M__L4_N4(CLK_M__L4_N4), 
	.CLK_M__L4_N5(CLK_M__L4_N5));
   system_control_test_1 U_system_control (.CLK(CLK_M__L4_N0), 
	.RST(SYNC_RST11), 
	.FIFO_Full(FIFO_Full), 
	.ALU_OUT({ ALU_OUT[15],
		ALU_OUT[14],
		ALU_OUT[13],
		ALU_OUT[12],
		ALU_OUT[11],
		ALU_OUT[10],
		ALU_OUT[9],
		ALU_OUT[8],
		ALU_OUT[7],
		ALU_OUT[6],
		ALU_OUT[5],
		ALU_OUT[4],
		ALU_OUT[3],
		ALU_OUT[2],
		ALU_OUT[1],
		ALU_OUT[0] }), 
	.OUT_Valid(OUT_Valid), 
	.Rd_D({ Rd_D[7],
		Rd_D[6],
		Rd_D[5],
		Rd_D[4],
		Rd_D[3],
		Rd_D[2],
		Rd_D[1],
		Rd_D[0] }), 
	.Rd_D_Vld(Rd_D_Vld), 
	.RX_P_DATA({ RX_P_DATA[7],
		RX_P_DATA[6],
		RX_P_DATA[5],
		RX_P_DATA[4],
		RX_P_DATA[3],
		RX_P_DATA[2],
		RX_P_DATA[1],
		RX_P_DATA[0] }), 
	.RX_D_VLD(RX_D_VLD), 
	.ALU_FUN({ ALU_FUN[3],
		ALU_FUN[2],
		ALU_FUN[1],
		ALU_FUN[0] }), 
	.EN(EN), 
	.CLK_EN(CLK_EN), 
	.Address({ Address[3],
		Address[2],
		Address[1],
		Address[0] }), 
	.WrEn(WrEn), 
	.RdEn(RdEn), 
	.WrData({ WrData[7],
		WrData[6],
		WrData[5],
		WrData[4],
		WrData[3],
		WrData[2],
		WrData[1],
		WrData[0] }), 
	.TX_P_DATA({ TX_P_DATA[7],
		TX_P_DATA[6],
		TX_P_DATA[5],
		TX_P_DATA[4],
		TX_P_DATA[3],
		TX_P_DATA[2],
		TX_P_DATA[1],
		TX_P_DATA[0] }), 
	.TX_D_VLD(TX_D_VLD), 
	.test_si(n15), 
	.test_so(n14), 
	.test_se(n28), 
	.FE_OFN1_SYNC_RST11(FE_OFN1_SYNC_RST11), 
	.FE_OFN2_SYNC_RST11(FE_OFN2_SYNC_RST11), 
	.CLK_M__L4_N1(CLK_M__L4_N1), 
	.CLK_M__L4_N2(CLK_M__L4_N2));
   P_MUX Prescalemux (.sel({ REG2internal[7],
		REG2internal[6],
		REG2internal[5],
		REG2internal[4],
		REG2internal[3],
		REG2internal[2] }), 
	.ratio({ SYNOPSYS_UNCONNECTED__0,
		SYNOPSYS_UNCONNECTED__1,
		SYNOPSYS_UNCONNECTED__2,
		SYNOPSYS_UNCONNECTED__3,
		ratio[3],
		ratio[2],
		ratio[1],
		ratio[0] }));
   ClkDiv_test_0 clock_divider_RX (.I_ref_clk(CLKR__L12_N0), 
	.I_rst_n(SYNC_RST22), 
	.I_clk_en(1'b1), 
	.I_div_ratio({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		ratio[3],
		ratio[2],
		ratio[1],
		ratio[0] }), 
	.o_div_clk(RX_CLK), 
	.test_si(n14), 
	.test_so(n13), 
	.test_se(n37), 
	.SYNC_RST22__Exclude_0_NET(SYNC_RST22__Exclude_0_NET), 
	.CLKR__L14_N0(CLKR__L14_N0), 
	.CLKR__L7_N0(CLKR__L7_N0), 
	.FE_OFN4_SYNC_RST22__Exclude_0_NET(FE_OFN4_SYNC_RST22__Exclude_0_NET));
   RST_SYNC_NUM_STAGES2_test_0 RSTSYNC1 (.RST(RST_M), 
	.CLK(CLK_M__L4_N2), 
	.SYNC_RST(SYNC_RST1), 
	.test_si(n19), 
	.test_se(n32));
   RST_SYNC_NUM_STAGES2_test_1 RSTSYNC2 (.RST(RST_M), 
	.CLK(CLKR__L14_N0), 
	.SYNC_RST(SYNC_RST2), 
	.test_si(SYNC_RST1), 
	.test_se(n36), 
	.CLKR__L1_N0(CLKR__L1_N0));
   CLK_GATE CLK_GATE (.CLK_EN(_1_net_), 
	.CLK(CLK_M__L1_N0), 
	.GATED_CLK(ALU_CLK));
   ALU_16B_test_1 ALU (.CLK(ALU_CLK__L1_N0), 
	.RST(FE_OFN1_SYNC_RST11), 
	.A({ REG0internal[7],
		REG0internal[6],
		REG0internal[5],
		REG0internal[4],
		REG0internal[3],
		REG0internal[2],
		REG0internal[1],
		REG0internal[0] }), 
	.B({ REG1internal[7],
		REG1internal[6],
		REG1internal[5],
		REG1internal[4],
		REG1internal[3],
		REG1internal[2],
		REG1internal[1],
		REG1internal[0] }), 
	.EN(EN), 
	.ALU_FUN({ ALU_FUN[3],
		ALU_FUN[2],
		ALU_FUN[1],
		ALU_FUN[0] }), 
	.ALU_OUT({ ALU_OUT[15],
		ALU_OUT[14],
		ALU_OUT[13],
		ALU_OUT[12],
		ALU_OUT[11],
		ALU_OUT[10],
		ALU_OUT[9],
		ALU_OUT[8],
		ALU_OUT[7],
		ALU_OUT[6],
		ALU_OUT[5],
		ALU_OUT[4],
		ALU_OUT[3],
		ALU_OUT[2],
		ALU_OUT[1],
		ALU_OUT[0] }), 
	.OUT_VALID(OUT_Valid), 
	.test_si(SI[3]), 
	.test_se(n40));
   ASYNC_FIFO_DATA_WIDTH8_DEPTH8_ADDR_SIZE3_test_1 FIFO (.W_CLK(CLK_M__L4_N0), 
	.W_RST(SYNC_RST11), 
	.W_INC(TX_D_VLD), 
	.R_CLK(TX_CLK1__L2_N0), 
	.R_RST(FE_OFN4_SYNC_RST22__Exclude_0_NET), 
	.R_INC(RD_INC), 
	.WR_DATA({ TX_P_DATA[7],
		TX_P_DATA[6],
		TX_P_DATA[5],
		TX_P_DATA[4],
		TX_P_DATA[3],
		TX_P_DATA[2],
		TX_P_DATA[1],
		TX_P_DATA[0] }), 
	.FULL(FIFO_Full), 
	.EMPTY(F_EMPTY), 
	.RD_DATA({ RD_DATA[7],
		RD_DATA[6],
		RD_DATA[5],
		RD_DATA[4],
		RD_DATA[3],
		RD_DATA[2],
		RD_DATA[1],
		RD_DATA[0] }), 
	.test_si2(SI[2]), 
	.test_si1(n25), 
	.test_so2(n22), 
	.test_so1(SO[3]), 
	.test_se(FE_OFN3_SE), 
	.FE_OFN1_SYNC_RST11(FE_OFN1_SYNC_RST11), 
	.FE_OFN2_SYNC_RST11(FE_OFN2_SYNC_RST11), 
	.CLK_M__L4_N1(CLK_M__L4_N1), 
	.CLK_M__L4_N2(CLK_M__L4_N2));
   UART_TX_test_1 TX (.CLK(TX_CLK1__L2_N0), 
	.RST(FE_OFN4_SYNC_RST22__Exclude_0_NET), 
	.P_DATA({ RD_DATA[7],
		RD_DATA[6],
		RD_DATA[5],
		RD_DATA[4],
		RD_DATA[3],
		RD_DATA[2],
		RD_DATA[1],
		RD_DATA[0] }), 
	.Data_Valid(n1), 
	.PAR_EN(REG2internal[0]), 
	.PAR_TYP(REG2internal[1]), 
	.TX_OUT(UART_TX_O), 
	.busy(Busy), 
	.test_si(n16), 
	.test_so(n15), 
	.test_se(n32));
   ClkDiv_test_1 clock_divider_TX (.I_ref_clk(CLKR__L12_N0), 
	.I_rst_n(SYNC_RST22), 
	.I_clk_en(1'b1), 
	.I_div_ratio({ REG3internal[7],
		REG3internal[6],
		REG3internal[5],
		REG3internal[4],
		REG3internal[3],
		REG3internal[2],
		REG3internal[1],
		REG3internal[0] }), 
	.o_div_clk(TX_CLK), 
	.test_si(n13), 
	.test_so(n12), 
	.test_se(n31), 
	.SYNC_RST22__Exclude_0_NET(SYNC_RST22__Exclude_0_NET), 
	.CLKR__L14_N0(CLKR__L14_N0), 
	.CLKR__L7_N0(CLKR__L7_N0));
   pulse_gen_test_1 pulse_gen (.CLK(TX_CLK1__L2_N0), 
	.RST(FE_OFN4_SYNC_RST22__Exclude_0_NET), 
	.LVL_SIG(Busy), 
	.PULSE_SIG(RD_INC), 
	.test_si(n12), 
	.test_so(n11), 
	.test_se(n31));
   BUFX2M U18 (.Y(framing_error), 
	.A(SO[0]));
endmodule

