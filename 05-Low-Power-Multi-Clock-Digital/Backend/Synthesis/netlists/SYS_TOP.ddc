/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Oct  1 21:01:25 2025
/////////////////////////////////////////////////////////////


module FSM ( CLK, RST, RX_IN, PAR_EN, bit_cnt, edge_cnt, Prescale, par_err, 
        strt_glitch, stp_err, par_chk_en, strt_chk_en, stp_chk_en, enable, 
        dat_samp_en, deser_en, data_valid );
  input [3:0] bit_cnt;
  input [4:0] edge_cnt;
  input [5:0] Prescale;
  input CLK, RST, RX_IN, PAR_EN, par_err, strt_glitch, stp_err;
  output par_chk_en, strt_chk_en, stp_chk_en, enable, dat_samp_en, deser_en,
         data_valid;
  wire   N38, N39, N40, N41, N42, N43, N44, N45, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n30, n31, n32, n34, n35, n36, n37;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  INVX2M U3 ( .A(n22), .Y(deser_en) );
  INVX2M U4 ( .A(n17), .Y(stp_chk_en) );
  NOR3X2M U5 ( .A(n36), .B(n34), .C(n35), .Y(data_valid) );
  NOR2BX2M U6 ( .AN(n25), .B(n14), .Y(n16) );
  AOI2B1X1M U7 ( .A1N(n21), .A0(n32), .B0(n22), .Y(n29) );
  INVX2M U8 ( .A(n19), .Y(n31) );
  OAI211X2M U9 ( .A0(RX_IN), .A1(n26), .B0(n27), .C0(n28), .Y(next_state[0])
         );
  AOI31X2M U10 ( .A0(n36), .A1(n35), .A2(n34), .B0(data_valid), .Y(n26) );
  AOI31X2M U11 ( .A0(n25), .A1(n14), .A2(stp_chk_en), .B0(n29), .Y(n28) );
  OAI2BB1X2M U12 ( .A0N(N45), .A1N(strt_glitch), .B0(strt_chk_en), .Y(n27) );
  NOR3X2M U13 ( .A(current_state[0]), .B(current_state[2]), .C(n36), .Y(
        par_chk_en) );
  NOR3X2M U14 ( .A(current_state[1]), .B(current_state[2]), .C(n34), .Y(
        strt_chk_en) );
  NAND3X2M U15 ( .A(current_state[0]), .B(n35), .C(current_state[1]), .Y(n22)
         );
  NAND3X2M U16 ( .A(current_state[1]), .B(n34), .C(current_state[2]), .Y(n17)
         );
  INVX2M U17 ( .A(current_state[0]), .Y(n34) );
  INVX2M U18 ( .A(current_state[1]), .Y(n36) );
  INVX2M U19 ( .A(current_state[2]), .Y(n35) );
  OAI32X1M U20 ( .A0(n37), .A1(n21), .A2(n32), .B0(PAR_EN), .B1(n31), .Y(n25)
         );
  INVX2M U21 ( .A(PAR_EN), .Y(n37) );
  NOR4BX1M U22 ( .AN(bit_cnt[3]), .B(n32), .C(bit_cnt[0]), .D(bit_cnt[2]), .Y(
        n19) );
  NAND3BX2M U23 ( .AN(bit_cnt[2]), .B(bit_cnt[0]), .C(bit_cnt[3]), .Y(n21) );
  OAI211X2M U24 ( .A0(n16), .A1(n17), .B0(n23), .C0(n24), .Y(next_state[1]) );
  OAI21X2M U25 ( .A0(n31), .A1(n30), .B0(par_chk_en), .Y(n23) );
  AOI31X2M U26 ( .A0(strt_chk_en), .A1(n15), .A2(N45), .B0(deser_en), .Y(n24)
         );
  INVX2M U27 ( .A(strt_glitch), .Y(n15) );
  OAI21X2M U28 ( .A0(n16), .A1(n17), .B0(n18), .Y(next_state[2]) );
  AOI31X2M U29 ( .A0(n19), .A1(n30), .A2(par_chk_en), .B0(n20), .Y(n18) );
  NOR4X1M U30 ( .A(bit_cnt[1]), .B(PAR_EN), .C(n21), .D(n22), .Y(n20) );
  INVX2M U31 ( .A(stp_err), .Y(n14) );
  INVX2M U32 ( .A(bit_cnt[1]), .Y(n32) );
  INVX2M U33 ( .A(par_err), .Y(n30) );
  OR2X2M U34 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  BUFX2M U35 ( .A(enable), .Y(dat_samp_en) );
  OR4X1M U36 ( .A(deser_en), .B(par_chk_en), .C(stp_chk_en), .D(strt_chk_en), 
        .Y(enable) );
  CLKINVX1M U37 ( .A(Prescale[0]), .Y(N38) );
  OAI2BB1X1M U38 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N39) );
  OR2X1M U39 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  OAI2BB1X1M U40 ( .A0N(n2), .A1N(Prescale[2]), .B0(n3), .Y(N40) );
  OR2X1M U41 ( .A(n3), .B(Prescale[3]), .Y(n4) );
  OAI2BB1X1M U42 ( .A0N(n3), .A1N(Prescale[3]), .B0(n4), .Y(N41) );
  OR2X1M U43 ( .A(n4), .B(Prescale[4]), .Y(n5) );
  OAI2BB1X1M U44 ( .A0N(n4), .A1N(Prescale[4]), .B0(n5), .Y(N42) );
  NOR2X1M U45 ( .A(n5), .B(Prescale[5]), .Y(N44) );
  AO21XLM U46 ( .A0(n5), .A1(Prescale[5]), .B0(N44), .Y(N43) );
  NOR2BX1M U47 ( .AN(edge_cnt[0]), .B(N38), .Y(n6) );
  OAI2B2X1M U48 ( .A1N(N39), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n9) );
  NOR2BX1M U49 ( .AN(N38), .B(edge_cnt[0]), .Y(n7) );
  OAI2B2X1M U50 ( .A1N(edge_cnt[1]), .A0(n7), .B0(N39), .B1(n7), .Y(n8) );
  NAND4BBX1M U51 ( .AN(N44), .BN(N43), .C(n9), .D(n8), .Y(n13) );
  CLKXOR2X2M U52 ( .A(N42), .B(edge_cnt[4]), .Y(n12) );
  CLKXOR2X2M U53 ( .A(N40), .B(edge_cnt[2]), .Y(n11) );
  CLKXOR2X2M U54 ( .A(N41), .B(edge_cnt[3]), .Y(n10) );
  NOR4X1M U55 ( .A(n13), .B(n12), .C(n11), .D(n10), .Y(N45) );
endmodule


module edge_bit_counter ( CLK, RST, enable, Prescale, bit_cnt, edge_cnt );
  input [5:0] Prescale;
  output [3:0] bit_cnt;
  output [4:0] edge_cnt;
  input CLK, RST, enable;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N21, N22, N23, N35, N36, N37,
         N38, N39, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         \add_30/carry[4] , \add_30/carry[3] , \add_30/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n19, n20, n21, n22, n23, n24, n25, n26, n27;

  DFFRQX2M \bit_cnt_reg[3]  ( .D(n18), .CK(CLK), .RN(RST), .Q(bit_cnt[3]) );
  DFFRQX2M \bit_cnt_reg[2]  ( .D(n15), .CK(CLK), .RN(RST), .Q(bit_cnt[2]) );
  DFFRQX2M \bit_cnt_reg[0]  ( .D(n17), .CK(CLK), .RN(RST), .Q(bit_cnt[0]) );
  DFFRQX2M \bit_cnt_reg[1]  ( .D(n16), .CK(CLK), .RN(RST), .Q(bit_cnt[1]) );
  DFFRQX2M \edge_cnt_reg[4]  ( .D(N39), .CK(CLK), .RN(RST), .Q(edge_cnt[4]) );
  DFFRQX2M \edge_cnt_reg[1]  ( .D(N36), .CK(CLK), .RN(RST), .Q(edge_cnt[1]) );
  DFFRQX2M \edge_cnt_reg[3]  ( .D(N38), .CK(CLK), .RN(RST), .Q(edge_cnt[3]) );
  DFFRQX2M \edge_cnt_reg[2]  ( .D(N37), .CK(CLK), .RN(RST), .Q(edge_cnt[2]) );
  DFFRQX2M \edge_cnt_reg[0]  ( .D(N35), .CK(CLK), .RN(RST), .Q(edge_cnt[0]) );
  INVX2M U3 ( .A(n12), .Y(n24) );
  INVX2M U4 ( .A(enable), .Y(n27) );
  NOR2X2M U5 ( .A(n27), .B(N14), .Y(n12) );
  NOR2BX2M U6 ( .AN(N21), .B(n24), .Y(N36) );
  NOR2BX2M U7 ( .AN(N22), .B(n24), .Y(N37) );
  NOR2BX2M U8 ( .AN(N23), .B(n24), .Y(N38) );
  OAI32X1M U9 ( .A0(n27), .A1(bit_cnt[0]), .A2(n12), .B0(n25), .B1(n24), .Y(
        n17) );
  OAI22X1M U10 ( .A0(n26), .A1(n24), .B0(n11), .B1(n27), .Y(n16) );
  AOI32X1M U11 ( .A0(n24), .A1(n26), .A2(bit_cnt[0]), .B0(bit_cnt[1]), .B1(n25), .Y(n11) );
  INVX2M U12 ( .A(bit_cnt[1]), .Y(n26) );
  AND3X2M U13 ( .A(N14), .B(bit_cnt[1]), .C(bit_cnt[0]), .Y(n10) );
  NOR2X2M U14 ( .A(n1), .B(n24), .Y(N39) );
  XNOR2X2M U15 ( .A(\add_30/carry[4] ), .B(edge_cnt[4]), .Y(n1) );
  NOR2X2M U16 ( .A(edge_cnt[0]), .B(n24), .Y(N35) );
  NOR2X2M U17 ( .A(n13), .B(n27), .Y(n18) );
  CLKXOR2X2M U18 ( .A(n14), .B(bit_cnt[3]), .Y(n13) );
  NAND2X2M U19 ( .A(n10), .B(bit_cnt[2]), .Y(n14) );
  NOR2X2M U20 ( .A(n9), .B(n27), .Y(n15) );
  XNOR2X2M U21 ( .A(n10), .B(bit_cnt[2]), .Y(n9) );
  ADDHX1M U22 ( .A(edge_cnt[2]), .B(\add_30/carry[2] ), .CO(\add_30/carry[3] ), 
        .S(N22) );
  ADDHX1M U23 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_30/carry[2] ), .S(
        N21) );
  ADDHX1M U24 ( .A(edge_cnt[3]), .B(\add_30/carry[3] ), .CO(\add_30/carry[4] ), 
        .S(N23) );
  INVX2M U25 ( .A(bit_cnt[0]), .Y(n25) );
  OR2X2M U26 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  CLKINVX1M U27 ( .A(Prescale[0]), .Y(N7) );
  OAI2BB1X1M U28 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N8) );
  OR2X1M U29 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  OAI2BB1X1M U30 ( .A0N(n2), .A1N(Prescale[2]), .B0(n3), .Y(N9) );
  OR2X1M U31 ( .A(n3), .B(Prescale[3]), .Y(n4) );
  OAI2BB1X1M U32 ( .A0N(n3), .A1N(Prescale[3]), .B0(n4), .Y(N10) );
  OR2X1M U33 ( .A(n4), .B(Prescale[4]), .Y(n5) );
  OAI2BB1X1M U34 ( .A0N(n4), .A1N(Prescale[4]), .B0(n5), .Y(N11) );
  NOR2X1M U35 ( .A(n5), .B(Prescale[5]), .Y(N13) );
  AO21XLM U36 ( .A0(n5), .A1(Prescale[5]), .B0(N13), .Y(N12) );
  NOR2BX1M U37 ( .AN(edge_cnt[0]), .B(N7), .Y(n6) );
  OAI2B2X1M U38 ( .A1N(N8), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n19) );
  NOR2BX1M U39 ( .AN(N7), .B(edge_cnt[0]), .Y(n7) );
  OAI2B2X1M U40 ( .A1N(edge_cnt[1]), .A0(n7), .B0(N8), .B1(n7), .Y(n8) );
  NAND4BBX1M U41 ( .AN(N13), .BN(N12), .C(n19), .D(n8), .Y(n23) );
  CLKXOR2X2M U42 ( .A(N11), .B(edge_cnt[4]), .Y(n22) );
  CLKXOR2X2M U43 ( .A(N9), .B(edge_cnt[2]), .Y(n21) );
  CLKXOR2X2M U44 ( .A(N10), .B(edge_cnt[3]), .Y(n20) );
  NOR4X1M U45 ( .A(n23), .B(n22), .C(n21), .D(n20), .Y(N14) );
endmodule


module data_sampling ( CLK, RST, RX_IN, dat_samp_en, Prescale, edge_cnt, 
        sampled_bit );
  input [5:0] Prescale;
  input [4:0] edge_cnt;
  input CLK, RST, RX_IN, dat_samp_en;
  output sampled_bit;
  wire   n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n1, n2, n3, n4, n5, n6, n7, n8, n9
;
  wire   [1:0] majority;

  DFFRQX2M \majority_reg[1]  ( .D(n43), .CK(CLK), .RN(RST), .Q(majority[1]) );
  DFFRQX2M \majority_reg[0]  ( .D(n42), .CK(CLK), .RN(RST), .Q(majority[0]) );
  DFFRQX2M sampled_bit_reg ( .D(n41), .CK(CLK), .RN(RST), .Q(sampled_bit) );
  INVX2M U3 ( .A(dat_samp_en), .Y(n6) );
  INVX2M U4 ( .A(RX_IN), .Y(n9) );
  OAI31X1M U5 ( .A0(n6), .A1(n23), .A2(n24), .B0(n25), .Y(n41) );
  NAND2X2M U6 ( .A(sampled_bit), .B(n24), .Y(n25) );
  NOR2BX2M U7 ( .AN(n26), .B(n6), .Y(n24) );
  AOI21X2M U8 ( .A0(majority[0]), .A1(RX_IN), .B0(n34), .Y(n23) );
  OAI2BB2X1M U9 ( .B0(n9), .B1(n35), .A0N(n35), .A1N(majority[0]), .Y(n42) );
  NAND2X2M U10 ( .A(n36), .B(n1), .Y(n35) );
  OAI2BB2X1M U11 ( .B0(n9), .B1(n37), .A0N(n37), .A1N(majority[1]), .Y(n43) );
  NAND2X2M U12 ( .A(edge_cnt[0]), .B(n36), .Y(n37) );
  OA21X2M U13 ( .A0(majority[0]), .A1(RX_IN), .B0(majority[1]), .Y(n34) );
  AND4X2M U14 ( .A(n38), .B(n2), .C(n27), .D(n39), .Y(n36) );
  OAI32X1M U15 ( .A0(n4), .A1(n30), .A2(n3), .B0(edge_cnt[3]), .B1(n40), .Y(
        n38) );
  NOR2X2M U16 ( .A(n6), .B(n5), .Y(n39) );
  AOI22X1M U17 ( .A0(edge_cnt[2]), .A1(n32), .B0(n33), .B1(n4), .Y(n40) );
  NAND4X2M U18 ( .A(n27), .B(n28), .C(n1), .D(n5), .Y(n26) );
  OAI32X1M U19 ( .A0(n29), .A1(n30), .A2(n2), .B0(edge_cnt[4]), .B1(n31), .Y(
        n28) );
  AOI33X2M U20 ( .A0(n32), .A1(n4), .A2(edge_cnt[3]), .B0(n33), .B1(n3), .B2(
        edge_cnt[2]), .Y(n31) );
  NAND2X2M U21 ( .A(n4), .B(n3), .Y(n29) );
  INVX2M U22 ( .A(edge_cnt[2]), .Y(n4) );
  INVX2M U23 ( .A(edge_cnt[0]), .Y(n1) );
  INVX2M U24 ( .A(edge_cnt[3]), .Y(n3) );
  INVX2M U25 ( .A(edge_cnt[1]), .Y(n5) );
  INVX2M U26 ( .A(edge_cnt[4]), .Y(n2) );
  NOR3X2M U27 ( .A(Prescale[2]), .B(Prescale[1]), .C(Prescale[0]), .Y(n27) );
  NOR3X2M U28 ( .A(Prescale[4]), .B(Prescale[5]), .C(n8), .Y(n33) );
  NOR3X2M U29 ( .A(Prescale[3]), .B(Prescale[5]), .C(n7), .Y(n32) );
  INVX2M U30 ( .A(Prescale[3]), .Y(n8) );
  INVX2M U31 ( .A(Prescale[4]), .Y(n7) );
  NAND3X2M U32 ( .A(n8), .B(n7), .C(Prescale[5]), .Y(n30) );
endmodule


module parity_check ( CLK, RST, par_chk_en, PAR_TYP, edge_cnt, Prescale, 
        P_DATA, sampled_bit, par_err );
  input [4:0] edge_cnt;
  input [5:0] Prescale;
  input [7:0] P_DATA;
  input CLK, RST, par_chk_en, PAR_TYP, sampled_bit;
  output par_err;
  wire   expected_parity, N11, N12, N13, N14, N15, N16, N18, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, \sub_25/carry[5] , \sub_25/carry[4] ,
         \sub_25/carry[3] , n1, n2, n3, n4, n5, n15, n16, n17, n18, n19;
  assign N11 = Prescale[0];

  DFFRQX2M expected_parity_reg ( .D(n13), .CK(CLK), .RN(RST), .Q(
        expected_parity) );
  DFFRQX2M par_err_reg ( .D(n14), .CK(CLK), .RN(RST), .Q(par_err) );
  NOR2X2M U3 ( .A(Prescale[5]), .B(\sub_25/carry[5] ), .Y(n1) );
  OAI2BB2X1M U4 ( .B0(n11), .B1(n12), .A0N(par_err), .A1N(n12), .Y(n14) );
  XNOR2X2M U5 ( .A(expected_parity), .B(sampled_bit), .Y(n11) );
  NAND2X2M U6 ( .A(N18), .B(par_chk_en), .Y(n12) );
  XNOR2X2M U7 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n9) );
  XOR3XLM U8 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n10), .Y(n7) );
  CLKXOR2X2M U9 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n10) );
  OAI2BB2X1M U10 ( .B0(n19), .B1(n6), .A0N(n19), .A1N(expected_parity), .Y(n13) );
  INVX2M U11 ( .A(par_chk_en), .Y(n19) );
  XOR3XLM U12 ( .A(n7), .B(PAR_TYP), .C(n8), .Y(n6) );
  XOR3XLM U13 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n9), .Y(n8) );
  INVX2M U14 ( .A(Prescale[1]), .Y(N12) );
  XNOR2X1M U15 ( .A(\sub_25/carry[5] ), .B(Prescale[5]), .Y(N16) );
  OR2X1M U16 ( .A(Prescale[4]), .B(\sub_25/carry[4] ), .Y(\sub_25/carry[5] )
         );
  XNOR2X1M U17 ( .A(\sub_25/carry[4] ), .B(Prescale[4]), .Y(N15) );
  OR2X1M U18 ( .A(Prescale[3]), .B(\sub_25/carry[3] ), .Y(\sub_25/carry[4] )
         );
  XNOR2X1M U19 ( .A(\sub_25/carry[3] ), .B(Prescale[3]), .Y(N14) );
  OR2X1M U20 ( .A(Prescale[2]), .B(Prescale[1]), .Y(\sub_25/carry[3] ) );
  XNOR2X1M U21 ( .A(Prescale[1]), .B(Prescale[2]), .Y(N13) );
  NOR2BX1M U22 ( .AN(edge_cnt[0]), .B(N11), .Y(n2) );
  OAI2B2X1M U23 ( .A1N(N12), .A0(n2), .B0(edge_cnt[1]), .B1(n2), .Y(n5) );
  NOR2BX1M U24 ( .AN(N11), .B(edge_cnt[0]), .Y(n3) );
  OAI2B2X1M U25 ( .A1N(edge_cnt[1]), .A0(n3), .B0(N12), .B1(n3), .Y(n4) );
  NAND4BBX1M U26 ( .AN(n1), .BN(N16), .C(n5), .D(n4), .Y(n18) );
  CLKXOR2X2M U27 ( .A(N15), .B(edge_cnt[4]), .Y(n17) );
  CLKXOR2X2M U28 ( .A(N13), .B(edge_cnt[2]), .Y(n16) );
  CLKXOR2X2M U29 ( .A(N14), .B(edge_cnt[3]), .Y(n15) );
  NOR4X1M U30 ( .A(n18), .B(n17), .C(n16), .D(n15), .Y(N18) );
endmodule


module deserializer ( CLK, RST, sampled_bit, deser_en, edge_cnt, Prescale, 
        P_DATA );
  input [4:0] edge_cnt;
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, sampled_bit, deser_en;
  wire   N19, N20, N21, N22, N23, N24, N25, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n42, n43, n44, n45, n46, n47, n48, n49;
  wire   [2:0] i;

  DFFRQX2M \P_DATA_reg[5]  ( .D(n36), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n32), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n35), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[0]  ( .D(n31), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n34), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n33), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(n37), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n38), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M \i_reg[2]  ( .D(n39), .CK(CLK), .RN(RST), .Q(i[2]) );
  DFFRQX2M \i_reg[0]  ( .D(n41), .CK(CLK), .RN(RST), .Q(i[0]) );
  DFFRQX2M \i_reg[1]  ( .D(n40), .CK(CLK), .RN(RST), .Q(i[1]) );
  NAND2X2M U3 ( .A(deser_en), .B(n30), .Y(n27) );
  INVX2M U4 ( .A(deser_en), .Y(n49) );
  NOR2X2M U5 ( .A(n49), .B(n1), .Y(n14) );
  OAI32X1M U6 ( .A0(n27), .A1(n44), .A2(n20), .B0(n28), .B1(n47), .Y(n39) );
  AOI21X2M U7 ( .A0(deser_en), .A1(n45), .B0(n29), .Y(n28) );
  NAND2X2M U8 ( .A(deser_en), .B(n1), .Y(n30) );
  OAI22X1M U9 ( .A0(n45), .A1(n44), .B0(n26), .B1(n47), .Y(n13) );
  INVX2M U10 ( .A(n20), .Y(n46) );
  NOR3BX2M U11 ( .AN(n14), .B(n47), .C(i[0]), .Y(n22) );
  OR4X1M U12 ( .A(n43), .B(n42), .C(n11), .D(n10), .Y(n1) );
  OAI2BB2X1M U13 ( .B0(n48), .B1(n21), .A0N(P_DATA[4]), .A1N(n21), .Y(n35) );
  NAND2X2M U14 ( .A(n22), .B(n45), .Y(n21) );
  OAI2BB2X1M U15 ( .B0(n48), .B1(n24), .A0N(P_DATA[6]), .A1N(n24), .Y(n37) );
  NAND2X2M U16 ( .A(n22), .B(i[1]), .Y(n24) );
  OAI22X1M U17 ( .A0(n44), .A1(n30), .B0(i[0]), .B1(n27), .Y(n41) );
  OAI21X2M U18 ( .A0(i[0]), .A1(n49), .B0(n30), .Y(n29) );
  OAI2BB2X1M U19 ( .B0(n12), .B1(n48), .A0N(P_DATA[0]), .A1N(n12), .Y(n31) );
  NAND3BX2M U20 ( .AN(n13), .B(n14), .C(n15), .Y(n12) );
  OAI2BB2X1M U21 ( .B0(n48), .B1(n25), .A0N(P_DATA[7]), .A1N(n25), .Y(n38) );
  NAND3BX2M U22 ( .AN(n15), .B(n14), .C(n13), .Y(n25) );
  OAI2BB2X1M U23 ( .B0(n48), .B1(n16), .A0N(P_DATA[1]), .A1N(n16), .Y(n32) );
  NAND3X2M U24 ( .A(n14), .B(n47), .C(n17), .Y(n16) );
  OAI2BB2X1M U25 ( .B0(n48), .B1(n18), .A0N(P_DATA[2]), .A1N(n18), .Y(n33) );
  NAND3X2M U26 ( .A(n14), .B(n44), .C(n46), .Y(n18) );
  OAI2BB2X1M U27 ( .B0(n48), .B1(n19), .A0N(P_DATA[3]), .A1N(n19), .Y(n34) );
  NAND3X2M U28 ( .A(n14), .B(i[0]), .C(n46), .Y(n19) );
  OAI2BB2X1M U29 ( .B0(n48), .B1(n23), .A0N(P_DATA[5]), .A1N(n23), .Y(n36) );
  NAND3X2M U30 ( .A(n14), .B(i[2]), .C(n17), .Y(n23) );
  AO2B2X2M U31 ( .B0(n29), .B1(i[1]), .A0(n17), .A1N(n27), .Y(n40) );
  AOI21X2M U32 ( .A0(n44), .A1(i[1]), .B0(n17), .Y(n26) );
  NOR2X2M U33 ( .A(n44), .B(i[1]), .Y(n17) );
  INVX2M U34 ( .A(i[0]), .Y(n44) );
  NAND2X2M U35 ( .A(i[1]), .B(n47), .Y(n20) );
  INVX2M U36 ( .A(i[1]), .Y(n45) );
  INVX2M U37 ( .A(i[2]), .Y(n47) );
  CLKXOR2X2M U38 ( .A(n26), .B(i[2]), .Y(n15) );
  INVX2M U39 ( .A(sampled_bit), .Y(n48) );
  OR2X2M U40 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  CLKINVX1M U41 ( .A(Prescale[0]), .Y(N19) );
  OAI2BB1X1M U42 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N20) );
  OR2X1M U43 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  OAI2BB1X1M U44 ( .A0N(n2), .A1N(Prescale[2]), .B0(n3), .Y(N21) );
  OR2X1M U45 ( .A(n3), .B(Prescale[3]), .Y(n4) );
  OAI2BB1X1M U46 ( .A0N(n3), .A1N(Prescale[3]), .B0(n4), .Y(N22) );
  OR2X1M U47 ( .A(n4), .B(Prescale[4]), .Y(n5) );
  OAI2BB1X1M U48 ( .A0N(n4), .A1N(Prescale[4]), .B0(n5), .Y(N23) );
  NOR2X1M U49 ( .A(n5), .B(Prescale[5]), .Y(N25) );
  AO21XLM U50 ( .A0(n5), .A1(Prescale[5]), .B0(N25), .Y(N24) );
  NOR2BX1M U51 ( .AN(edge_cnt[0]), .B(N19), .Y(n6) );
  OAI2B2X1M U52 ( .A1N(N20), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n9) );
  NOR2BX1M U53 ( .AN(N19), .B(edge_cnt[0]), .Y(n7) );
  OAI2B2X1M U54 ( .A1N(edge_cnt[1]), .A0(n7), .B0(N20), .B1(n7), .Y(n8) );
  NAND4BBX1M U55 ( .AN(N25), .BN(N24), .C(n9), .D(n8), .Y(n43) );
  CLKXOR2X2M U56 ( .A(N23), .B(edge_cnt[4]), .Y(n42) );
  CLKXOR2X2M U57 ( .A(N21), .B(edge_cnt[2]), .Y(n11) );
  CLKXOR2X2M U58 ( .A(N22), .B(edge_cnt[3]), .Y(n10) );
endmodule


module strt_check ( CLK, RST, strt_chk_en, sampled_bit, strt_glitch );
  input CLK, RST, strt_chk_en, sampled_bit;
  output strt_glitch;
  wire   n1;

  DFFRQX2M strt_glitch_reg ( .D(n1), .CK(CLK), .RN(RST), .Q(strt_glitch) );
  AO2B2X2M U2 ( .B0(strt_chk_en), .B1(sampled_bit), .A0(strt_glitch), .A1N(
        strt_chk_en), .Y(n1) );
endmodule


module stop_check ( CLK, RST, stp_chk_en, sampled_bit, stp_err );
  input CLK, RST, stp_chk_en, sampled_bit;
  output stp_err;
  wire   n2, n1;

  DFFRQX2M stp_err_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(stp_err) );
  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n1), .A0N(stp_err), .A1N(n1), .Y(n2)
         );
  INVX2M U3 ( .A(stp_chk_en), .Y(n1) );
endmodule


module UART_RX_TOP ( CLK, RST, RX_IN, Prescale, PAR_EN, PAR_TYP, P_DATA, 
        Parity_Error, Stop_Error, data_valid );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, PAR_EN, PAR_TYP;
  output Parity_Error, Stop_Error, data_valid;
  wire   strt_glitch, par_chk_en, strt_chk_en, stp_chk_en, enable, dat_samp_en,
         deser_en, sampled_bit, n1, n2;
  wire   [3:0] bit_cnt;
  wire   [4:0] edge_cnt;

  FSM DUT1 ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), .PAR_EN(PAR_EN), .bit_cnt(
        bit_cnt), .edge_cnt(edge_cnt), .Prescale(Prescale), .par_err(
        Parity_Error), .strt_glitch(strt_glitch), .stp_err(Stop_Error), 
        .par_chk_en(par_chk_en), .strt_chk_en(strt_chk_en), .stp_chk_en(
        stp_chk_en), .enable(enable), .dat_samp_en(dat_samp_en), .deser_en(
        deser_en), .data_valid(data_valid) );
  edge_bit_counter DUT2 ( .CLK(CLK), .RST(n1), .enable(enable), .Prescale(
        Prescale), .bit_cnt(bit_cnt), .edge_cnt(edge_cnt) );
  data_sampling DUT3 ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), .dat_samp_en(
        dat_samp_en), .Prescale(Prescale), .edge_cnt(edge_cnt), .sampled_bit(
        sampled_bit) );
  parity_check DUT4 ( .CLK(CLK), .RST(n1), .par_chk_en(par_chk_en), .PAR_TYP(
        PAR_TYP), .edge_cnt(edge_cnt), .Prescale(Prescale), .P_DATA(P_DATA), 
        .sampled_bit(sampled_bit), .par_err(Parity_Error) );
  deserializer DUT5 ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .deser_en(deser_en), .edge_cnt(edge_cnt), .Prescale(Prescale), 
        .P_DATA(P_DATA) );
  strt_check DUT6 ( .CLK(CLK), .RST(n1), .strt_chk_en(strt_chk_en), 
        .sampled_bit(sampled_bit), .strt_glitch(strt_glitch) );
  stop_check DUT7 ( .CLK(CLK), .RST(n1), .stp_chk_en(stp_chk_en), 
        .sampled_bit(sampled_bit), .stp_err(Stop_Error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module DATA_SYNC_NUM_STAGES2 ( CLK, RST, Unsync_bus, bus_enable, sync_bus, 
        enable_pulse );
  input [7:0] Unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse;
  wire   enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_reg;

  DFFRQX2M enable_flop_reg ( .D(sync_reg[1]), .CK(CLK), .RN(RST), .Q(
        enable_flop) );
  DFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[0]), .CK(CLK), .RN(RST), .Q(
        sync_reg[1]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        sync_reg[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(enable_flop), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(Unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(Unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(Unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(Unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(Unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(Unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(Unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(Unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module Register_file_ADDR_WIDTH4_WIDTH8_DEPTH16 ( WrData, Address, WrEn, RdEn, 
        CLK, RST, RdData, RdData_Valid, REG0, REG1, REG2, REG3 );
  input [7:0] WrData;
  input [3:0] Address;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input WrEn, RdEn, CLK, RST;
  output RdData_Valid;
  wire   N11, N12, N13, N14, \Reg_File[15][7] , \Reg_File[15][6] ,
         \Reg_File[15][5] , \Reg_File[15][4] , \Reg_File[15][3] ,
         \Reg_File[15][2] , \Reg_File[15][1] , \Reg_File[15][0] ,
         \Reg_File[14][7] , \Reg_File[14][6] , \Reg_File[14][5] ,
         \Reg_File[14][4] , \Reg_File[14][3] , \Reg_File[14][2] ,
         \Reg_File[14][1] , \Reg_File[14][0] , \Reg_File[13][7] ,
         \Reg_File[13][6] , \Reg_File[13][5] , \Reg_File[13][4] ,
         \Reg_File[13][3] , \Reg_File[13][2] , \Reg_File[13][1] ,
         \Reg_File[13][0] , \Reg_File[12][7] , \Reg_File[12][6] ,
         \Reg_File[12][5] , \Reg_File[12][4] , \Reg_File[12][3] ,
         \Reg_File[12][2] , \Reg_File[12][1] , \Reg_File[12][0] ,
         \Reg_File[11][7] , \Reg_File[11][6] , \Reg_File[11][5] ,
         \Reg_File[11][4] , \Reg_File[11][3] , \Reg_File[11][2] ,
         \Reg_File[11][1] , \Reg_File[11][0] , \Reg_File[10][7] ,
         \Reg_File[10][6] , \Reg_File[10][5] , \Reg_File[10][4] ,
         \Reg_File[10][3] , \Reg_File[10][2] , \Reg_File[10][1] ,
         \Reg_File[10][0] , \Reg_File[9][7] , \Reg_File[9][6] ,
         \Reg_File[9][5] , \Reg_File[9][4] , \Reg_File[9][3] ,
         \Reg_File[9][2] , \Reg_File[9][1] , \Reg_File[9][0] ,
         \Reg_File[8][7] , \Reg_File[8][6] , \Reg_File[8][5] ,
         \Reg_File[8][4] , \Reg_File[8][3] , \Reg_File[8][2] ,
         \Reg_File[8][1] , \Reg_File[8][0] , \Reg_File[7][7] ,
         \Reg_File[7][6] , \Reg_File[7][5] , \Reg_File[7][4] ,
         \Reg_File[7][3] , \Reg_File[7][2] , \Reg_File[7][1] ,
         \Reg_File[7][0] , \Reg_File[6][7] , \Reg_File[6][6] ,
         \Reg_File[6][5] , \Reg_File[6][4] , \Reg_File[6][3] ,
         \Reg_File[6][2] , \Reg_File[6][1] , \Reg_File[6][0] ,
         \Reg_File[5][7] , \Reg_File[5][6] , \Reg_File[5][5] ,
         \Reg_File[5][4] , \Reg_File[5][3] , \Reg_File[5][2] ,
         \Reg_File[5][1] , \Reg_File[5][0] , \Reg_File[4][7] ,
         \Reg_File[4][6] , \Reg_File[4][5] , \Reg_File[4][4] ,
         \Reg_File[4][3] , \Reg_File[4][2] , \Reg_File[4][1] ,
         \Reg_File[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFSQX2M \Reg_File_reg[3][5]  ( .D(n77), .CK(CLK), .SN(n204), .Q(REG3[5]) );
  DFFRQX2M \Reg_File_reg[13][7]  ( .D(n159), .CK(CLK), .RN(n212), .Q(
        \Reg_File[13][7] ) );
  DFFRQX2M \Reg_File_reg[13][6]  ( .D(n158), .CK(CLK), .RN(n212), .Q(
        \Reg_File[13][6] ) );
  DFFRQX2M \Reg_File_reg[13][5]  ( .D(n157), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][5] ) );
  DFFRQX2M \Reg_File_reg[13][4]  ( .D(n156), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][4] ) );
  DFFRQX2M \Reg_File_reg[13][3]  ( .D(n155), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][3] ) );
  DFFRQX2M \Reg_File_reg[13][2]  ( .D(n154), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][2] ) );
  DFFRQX2M \Reg_File_reg[13][1]  ( .D(n153), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][1] ) );
  DFFRQX2M \Reg_File_reg[13][0]  ( .D(n152), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][0] ) );
  DFFRQX2M \Reg_File_reg[9][7]  ( .D(n127), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][7] ) );
  DFFRQX2M \Reg_File_reg[9][6]  ( .D(n126), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][6] ) );
  DFFRQX2M \Reg_File_reg[9][5]  ( .D(n125), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][5] ) );
  DFFRQX2M \Reg_File_reg[9][4]  ( .D(n124), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][4] ) );
  DFFRQX2M \Reg_File_reg[9][3]  ( .D(n123), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][3] ) );
  DFFRQX2M \Reg_File_reg[9][2]  ( .D(n122), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][2] ) );
  DFFRQX2M \Reg_File_reg[9][1]  ( .D(n121), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][1] ) );
  DFFRQX2M \Reg_File_reg[9][0]  ( .D(n120), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][0] ) );
  DFFRQX2M \Reg_File_reg[5][7]  ( .D(n95), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][7] ) );
  DFFRQX2M \Reg_File_reg[5][6]  ( .D(n94), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][6] ) );
  DFFRQX2M \Reg_File_reg[5][5]  ( .D(n93), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][5] ) );
  DFFRQX2M \Reg_File_reg[5][4]  ( .D(n92), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][4] ) );
  DFFRQX2M \Reg_File_reg[5][3]  ( .D(n91), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][3] ) );
  DFFRQX2M \Reg_File_reg[5][2]  ( .D(n90), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][2] ) );
  DFFRQX2M \Reg_File_reg[5][1]  ( .D(n89), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][1] ) );
  DFFRQX2M \Reg_File_reg[5][0]  ( .D(n88), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][0] ) );
  DFFRQX2M \Reg_File_reg[15][7]  ( .D(n175), .CK(CLK), .RN(n204), .Q(
        \Reg_File[15][7] ) );
  DFFRQX2M \Reg_File_reg[15][6]  ( .D(n174), .CK(CLK), .RN(n213), .Q(
        \Reg_File[15][6] ) );
  DFFRQX2M \Reg_File_reg[15][5]  ( .D(n173), .CK(CLK), .RN(n213), .Q(
        \Reg_File[15][5] ) );
  DFFRQX2M \Reg_File_reg[15][4]  ( .D(n172), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][4] ) );
  DFFRQX2M \Reg_File_reg[15][3]  ( .D(n171), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][3] ) );
  DFFRQX2M \Reg_File_reg[15][2]  ( .D(n170), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][2] ) );
  DFFRQX2M \Reg_File_reg[15][1]  ( .D(n169), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][1] ) );
  DFFRQX2M \Reg_File_reg[15][0]  ( .D(n168), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][0] ) );
  DFFRQX2M \Reg_File_reg[11][7]  ( .D(n143), .CK(CLK), .RN(n211), .Q(
        \Reg_File[11][7] ) );
  DFFRQX2M \Reg_File_reg[11][6]  ( .D(n142), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][6] ) );
  DFFRQX2M \Reg_File_reg[11][5]  ( .D(n141), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][5] ) );
  DFFRQX2M \Reg_File_reg[11][4]  ( .D(n140), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][4] ) );
  DFFRQX2M \Reg_File_reg[11][3]  ( .D(n139), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][3] ) );
  DFFRQX2M \Reg_File_reg[11][2]  ( .D(n138), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][2] ) );
  DFFRQX2M \Reg_File_reg[11][1]  ( .D(n137), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][1] ) );
  DFFRQX2M \Reg_File_reg[11][0]  ( .D(n136), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][0] ) );
  DFFRQX2M \Reg_File_reg[7][7]  ( .D(n111), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][7] ) );
  DFFRQX2M \Reg_File_reg[7][6]  ( .D(n110), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][6] ) );
  DFFRQX2M \Reg_File_reg[7][5]  ( .D(n109), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][5] ) );
  DFFRQX2M \Reg_File_reg[7][4]  ( .D(n108), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][4] ) );
  DFFRQX2M \Reg_File_reg[7][3]  ( .D(n107), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][3] ) );
  DFFRQX2M \Reg_File_reg[7][2]  ( .D(n106), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][2] ) );
  DFFRQX2M \Reg_File_reg[7][1]  ( .D(n105), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][1] ) );
  DFFRQX2M \Reg_File_reg[7][0]  ( .D(n104), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][0] ) );
  DFFRQX2M \Reg_File_reg[14][7]  ( .D(n167), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][7] ) );
  DFFRQX2M \Reg_File_reg[14][6]  ( .D(n166), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][6] ) );
  DFFRQX2M \Reg_File_reg[14][5]  ( .D(n165), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][5] ) );
  DFFRQX2M \Reg_File_reg[14][4]  ( .D(n164), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][4] ) );
  DFFRQX2M \Reg_File_reg[14][3]  ( .D(n163), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][3] ) );
  DFFRQX2M \Reg_File_reg[14][2]  ( .D(n162), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][2] ) );
  DFFRQX2M \Reg_File_reg[14][1]  ( .D(n161), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][1] ) );
  DFFRQX2M \Reg_File_reg[14][0]  ( .D(n160), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][0] ) );
  DFFRQX2M \Reg_File_reg[10][7]  ( .D(n135), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][7] ) );
  DFFRQX2M \Reg_File_reg[10][6]  ( .D(n134), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][6] ) );
  DFFRQX2M \Reg_File_reg[10][5]  ( .D(n133), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][5] ) );
  DFFRQX2M \Reg_File_reg[10][4]  ( .D(n132), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][4] ) );
  DFFRQX2M \Reg_File_reg[10][3]  ( .D(n131), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][3] ) );
  DFFRQX2M \Reg_File_reg[10][2]  ( .D(n130), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][2] ) );
  DFFRQX2M \Reg_File_reg[10][1]  ( .D(n129), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][1] ) );
  DFFRQX2M \Reg_File_reg[10][0]  ( .D(n128), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][0] ) );
  DFFRQX2M \Reg_File_reg[6][7]  ( .D(n103), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][7] ) );
  DFFRQX2M \Reg_File_reg[6][6]  ( .D(n102), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][6] ) );
  DFFRQX2M \Reg_File_reg[6][5]  ( .D(n101), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][5] ) );
  DFFRQX2M \Reg_File_reg[6][4]  ( .D(n100), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][4] ) );
  DFFRQX2M \Reg_File_reg[6][3]  ( .D(n99), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][3] ) );
  DFFRQX2M \Reg_File_reg[6][2]  ( .D(n98), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][2] ) );
  DFFRQX2M \Reg_File_reg[6][1]  ( .D(n97), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][1] ) );
  DFFRQX2M \Reg_File_reg[6][0]  ( .D(n96), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][0] ) );
  DFFRQX2M \Reg_File_reg[12][7]  ( .D(n151), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][7] ) );
  DFFRQX2M \Reg_File_reg[12][6]  ( .D(n150), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][6] ) );
  DFFRQX2M \Reg_File_reg[12][5]  ( .D(n149), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][5] ) );
  DFFRQX2M \Reg_File_reg[12][4]  ( .D(n148), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][4] ) );
  DFFRQX2M \Reg_File_reg[12][3]  ( .D(n147), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][3] ) );
  DFFRQX2M \Reg_File_reg[12][2]  ( .D(n146), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][2] ) );
  DFFRQX2M \Reg_File_reg[12][1]  ( .D(n145), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][1] ) );
  DFFRQX2M \Reg_File_reg[12][0]  ( .D(n144), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][0] ) );
  DFFRQX2M \Reg_File_reg[8][7]  ( .D(n119), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][7] ) );
  DFFRQX2M \Reg_File_reg[8][6]  ( .D(n118), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][6] ) );
  DFFRQX2M \Reg_File_reg[8][5]  ( .D(n117), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][5] ) );
  DFFRQX2M \Reg_File_reg[8][4]  ( .D(n116), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][4] ) );
  DFFRQX2M \Reg_File_reg[8][3]  ( .D(n115), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][3] ) );
  DFFRQX2M \Reg_File_reg[8][2]  ( .D(n114), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][2] ) );
  DFFRQX2M \Reg_File_reg[8][1]  ( .D(n113), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][1] ) );
  DFFRQX2M \Reg_File_reg[8][0]  ( .D(n112), .CK(CLK), .RN(n208), .Q(
        \Reg_File[8][0] ) );
  DFFRQX2M \Reg_File_reg[4][7]  ( .D(n87), .CK(CLK), .RN(n207), .Q(
        \Reg_File[4][7] ) );
  DFFRQX2M \Reg_File_reg[4][6]  ( .D(n86), .CK(CLK), .RN(n207), .Q(
        \Reg_File[4][6] ) );
  DFFRQX2M \Reg_File_reg[4][5]  ( .D(n85), .CK(CLK), .RN(n207), .Q(
        \Reg_File[4][5] ) );
  DFFRQX2M \Reg_File_reg[4][4]  ( .D(n84), .CK(CLK), .RN(n207), .Q(
        \Reg_File[4][4] ) );
  DFFRQX2M \Reg_File_reg[4][3]  ( .D(n83), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][3] ) );
  DFFRQX2M \Reg_File_reg[4][2]  ( .D(n82), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][2] ) );
  DFFRQX2M \Reg_File_reg[4][1]  ( .D(n81), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][1] ) );
  DFFRQX2M \Reg_File_reg[4][0]  ( .D(n80), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][0] ) );
  DFFRQX2M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n204), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n204), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n204), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n204), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n204), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n204), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n204), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n204), .Q(RdData[0]) );
  DFFRQX2M \Reg_File_reg[3][2]  ( .D(n74), .CK(CLK), .RN(n206), .Q(REG3[2]) );
  DFFRQX2M \Reg_File_reg[3][3]  ( .D(n75), .CK(CLK), .RN(n206), .Q(REG3[3]) );
  DFFRQX2M \Reg_File_reg[3][4]  ( .D(n76), .CK(CLK), .RN(n206), .Q(REG3[4]) );
  DFFRQX2M \Reg_File_reg[3][0]  ( .D(n72), .CK(CLK), .RN(n206), .Q(REG3[0]) );
  DFFRQX2M \Reg_File_reg[3][7]  ( .D(n79), .CK(CLK), .RN(n206), .Q(REG3[7]) );
  DFFRQX2M \Reg_File_reg[2][1]  ( .D(n65), .CK(CLK), .RN(n205), .Q(REG2[1]) );
  DFFRQX2M \Reg_File_reg[3][6]  ( .D(n78), .CK(CLK), .RN(n206), .Q(REG3[6]) );
  DFFRQX2M \Reg_File_reg[3][1]  ( .D(n73), .CK(CLK), .RN(n206), .Q(REG3[1]) );
  DFFSQX2M \Reg_File_reg[2][0]  ( .D(n64), .CK(CLK), .SN(n204), .Q(REG2[0]) );
  DFFRQX2M \Reg_File_reg[2][4]  ( .D(n68), .CK(CLK), .RN(n206), .Q(REG2[4]) );
  DFFRQX2M \Reg_File_reg[2][3]  ( .D(n67), .CK(CLK), .RN(n205), .Q(REG2[3]) );
  DFFRQX2M \Reg_File_reg[2][6]  ( .D(n70), .CK(CLK), .RN(n206), .Q(REG2[6]) );
  DFFRQX2M \Reg_File_reg[2][5]  ( .D(n69), .CK(CLK), .RN(n206), .Q(REG2[5]) );
  DFFRQX2M RdData_Valid_reg ( .D(n227), .CK(CLK), .RN(n208), .Q(RdData_Valid)
         );
  DFFRQX2M \Reg_File_reg[0][1]  ( .D(n49), .CK(CLK), .RN(n204), .Q(REG0[1]) );
  DFFRQX2M \Reg_File_reg[0][0]  ( .D(n48), .CK(CLK), .RN(n204), .Q(REG0[0]) );
  DFFRQX2M \Reg_File_reg[0][2]  ( .D(n50), .CK(CLK), .RN(n204), .Q(REG0[2]) );
  DFFRQX2M \Reg_File_reg[0][3]  ( .D(n51), .CK(CLK), .RN(n205), .Q(REG0[3]) );
  DFFRQX2M \Reg_File_reg[0][4]  ( .D(n52), .CK(CLK), .RN(n205), .Q(REG0[4]) );
  DFFRQX2M \Reg_File_reg[0][5]  ( .D(n53), .CK(CLK), .RN(n205), .Q(REG0[5]) );
  DFFRQX2M \Reg_File_reg[0][7]  ( .D(n55), .CK(CLK), .RN(n205), .Q(REG0[7]) );
  DFFRQX2M \Reg_File_reg[0][6]  ( .D(n54), .CK(CLK), .RN(n205), .Q(REG0[6]) );
  DFFRQX2M \Reg_File_reg[1][5]  ( .D(n61), .CK(CLK), .RN(n205), .Q(REG1[5]) );
  DFFRQX2M \Reg_File_reg[1][4]  ( .D(n60), .CK(CLK), .RN(n205), .Q(REG1[4]) );
  DFFRQX2M \Reg_File_reg[1][7]  ( .D(n63), .CK(CLK), .RN(n205), .Q(REG1[7]) );
  DFFRQX2M \Reg_File_reg[1][1]  ( .D(n57), .CK(CLK), .RN(n205), .Q(REG1[1]) );
  DFFRQX2M \Reg_File_reg[1][3]  ( .D(n59), .CK(CLK), .RN(n205), .Q(REG1[3]) );
  DFFRQX2M \Reg_File_reg[1][2]  ( .D(n58), .CK(CLK), .RN(n205), .Q(REG1[2]) );
  DFFRQX2M \Reg_File_reg[1][6]  ( .D(n62), .CK(CLK), .RN(n205), .Q(REG1[6]) );
  DFFRQX2M \Reg_File_reg[1][0]  ( .D(n56), .CK(CLK), .RN(n205), .Q(REG1[0]) );
  DFFSQX2M \Reg_File_reg[2][7]  ( .D(n71), .CK(CLK), .SN(n204), .Q(REG2[7]) );
  DFFRQX2M \Reg_File_reg[2][2]  ( .D(n66), .CK(CLK), .RN(n206), .Q(REG2[2]) );
  NOR2X2M U3 ( .A(n203), .B(N13), .Y(n19) );
  NOR2X2M U4 ( .A(n198), .B(N13), .Y(n14) );
  NOR2BX2M U5 ( .AN(n38), .B(n202), .Y(n32) );
  NOR2BX2M U6 ( .AN(N13), .B(n198), .Y(n22) );
  NOR2BX2M U7 ( .AN(N13), .B(n203), .Y(n25) );
  NOR2BX2M U8 ( .AN(n26), .B(n202), .Y(n17) );
  INVX2M U9 ( .A(WrData[6]), .Y(n225) );
  INVX2M U10 ( .A(n199), .Y(n200) );
  INVX2M U11 ( .A(n197), .Y(n198) );
  INVX2M U12 ( .A(n199), .Y(n201) );
  BUFX2M U13 ( .A(n202), .Y(n199) );
  BUFX2M U14 ( .A(n203), .Y(n197) );
  INVX2M U15 ( .A(n12), .Y(n227) );
  NOR2BX2M U16 ( .AN(n26), .B(N11), .Y(n15) );
  NOR2BX2M U17 ( .AN(n38), .B(N11), .Y(n30) );
  NAND2X2M U18 ( .A(n17), .B(n14), .Y(n16) );
  NAND2X2M U19 ( .A(n30), .B(n14), .Y(n29) );
  NAND2X2M U20 ( .A(n32), .B(n14), .Y(n31) );
  NAND2X2M U21 ( .A(n30), .B(n19), .Y(n33) );
  NAND2X2M U22 ( .A(n32), .B(n19), .Y(n34) );
  NAND2X2M U23 ( .A(n19), .B(n15), .Y(n18) );
  NAND2X2M U24 ( .A(n19), .B(n17), .Y(n20) );
  NAND2X2M U25 ( .A(n22), .B(n15), .Y(n21) );
  NAND2X2M U26 ( .A(n22), .B(n17), .Y(n23) );
  NAND2X2M U27 ( .A(n25), .B(n15), .Y(n24) );
  NAND2X2M U28 ( .A(n25), .B(n17), .Y(n27) );
  NAND2X2M U29 ( .A(n30), .B(n22), .Y(n35) );
  NAND2X2M U30 ( .A(n32), .B(n22), .Y(n36) );
  NAND2X2M U31 ( .A(n30), .B(n25), .Y(n37) );
  NAND2X2M U32 ( .A(n32), .B(n25), .Y(n39) );
  NAND2X2M U33 ( .A(n14), .B(n15), .Y(n13) );
  NOR2BX2M U34 ( .AN(WrEn), .B(RdEn), .Y(n28) );
  NAND2BX2M U35 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  BUFX2M U36 ( .A(n218), .Y(n204) );
  BUFX2M U37 ( .A(n218), .Y(n205) );
  BUFX2M U38 ( .A(n217), .Y(n206) );
  BUFX2M U39 ( .A(n217), .Y(n207) );
  BUFX2M U40 ( .A(n216), .Y(n208) );
  BUFX2M U41 ( .A(n216), .Y(n209) );
  BUFX2M U42 ( .A(n215), .Y(n210) );
  BUFX2M U43 ( .A(n215), .Y(n211) );
  BUFX2M U44 ( .A(n214), .Y(n212) );
  BUFX2M U45 ( .A(n214), .Y(n213) );
  NOR2BX2M U46 ( .AN(n28), .B(N14), .Y(n26) );
  AND2X2M U47 ( .A(N14), .B(n28), .Y(n38) );
  INVX2M U48 ( .A(WrData[1]), .Y(n220) );
  INVX2M U49 ( .A(WrData[2]), .Y(n221) );
  INVX2M U50 ( .A(WrData[3]), .Y(n222) );
  INVX2M U51 ( .A(WrData[4]), .Y(n223) );
  INVX2M U52 ( .A(WrData[5]), .Y(n224) );
  INVX2M U53 ( .A(WrData[7]), .Y(n226) );
  INVX2M U54 ( .A(WrData[0]), .Y(n219) );
  BUFX2M U55 ( .A(RST), .Y(n217) );
  BUFX2M U56 ( .A(RST), .Y(n216) );
  BUFX2M U57 ( .A(RST), .Y(n215) );
  BUFX2M U58 ( .A(RST), .Y(n214) );
  BUFX2M U59 ( .A(RST), .Y(n218) );
  OAI2BB2X1M U60 ( .B0(n13), .B1(n219), .A0N(REG0[0]), .A1N(n13), .Y(n48) );
  OAI2BB2X1M U61 ( .B0(n13), .B1(n220), .A0N(REG0[1]), .A1N(n13), .Y(n49) );
  OAI2BB2X1M U62 ( .B0(n13), .B1(n221), .A0N(REG0[2]), .A1N(n13), .Y(n50) );
  OAI2BB2X1M U63 ( .B0(n13), .B1(n222), .A0N(REG0[3]), .A1N(n13), .Y(n51) );
  OAI2BB2X1M U64 ( .B0(n13), .B1(n223), .A0N(REG0[4]), .A1N(n13), .Y(n52) );
  OAI2BB2X1M U65 ( .B0(n13), .B1(n224), .A0N(REG0[5]), .A1N(n13), .Y(n53) );
  OAI2BB2X1M U66 ( .B0(n13), .B1(n225), .A0N(REG0[6]), .A1N(n13), .Y(n54) );
  OAI2BB2X1M U67 ( .B0(n13), .B1(n226), .A0N(REG0[7]), .A1N(n13), .Y(n55) );
  OAI2BB2X1M U68 ( .B0(n219), .B1(n16), .A0N(REG1[0]), .A1N(n16), .Y(n56) );
  OAI2BB2X1M U69 ( .B0(n220), .B1(n16), .A0N(REG1[1]), .A1N(n16), .Y(n57) );
  OAI2BB2X1M U70 ( .B0(n221), .B1(n16), .A0N(REG1[2]), .A1N(n16), .Y(n58) );
  OAI2BB2X1M U71 ( .B0(n222), .B1(n16), .A0N(REG1[3]), .A1N(n16), .Y(n59) );
  OAI2BB2X1M U72 ( .B0(n223), .B1(n16), .A0N(REG1[4]), .A1N(n16), .Y(n60) );
  OAI2BB2X1M U73 ( .B0(n224), .B1(n16), .A0N(REG1[5]), .A1N(n16), .Y(n61) );
  OAI2BB2X1M U74 ( .B0(n225), .B1(n16), .A0N(REG1[6]), .A1N(n16), .Y(n62) );
  OAI2BB2X1M U75 ( .B0(n226), .B1(n16), .A0N(REG1[7]), .A1N(n16), .Y(n63) );
  OAI2BB2X1M U76 ( .B0(n219), .B1(n21), .A0N(\Reg_File[4][0] ), .A1N(n21), .Y(
        n80) );
  OAI2BB2X1M U77 ( .B0(n220), .B1(n21), .A0N(\Reg_File[4][1] ), .A1N(n21), .Y(
        n81) );
  OAI2BB2X1M U78 ( .B0(n221), .B1(n21), .A0N(\Reg_File[4][2] ), .A1N(n21), .Y(
        n82) );
  OAI2BB2X1M U79 ( .B0(n222), .B1(n21), .A0N(\Reg_File[4][3] ), .A1N(n21), .Y(
        n83) );
  OAI2BB2X1M U80 ( .B0(n223), .B1(n21), .A0N(\Reg_File[4][4] ), .A1N(n21), .Y(
        n84) );
  OAI2BB2X1M U81 ( .B0(n224), .B1(n21), .A0N(\Reg_File[4][5] ), .A1N(n21), .Y(
        n85) );
  OAI2BB2X1M U82 ( .B0(n225), .B1(n21), .A0N(\Reg_File[4][6] ), .A1N(n21), .Y(
        n86) );
  OAI2BB2X1M U83 ( .B0(n226), .B1(n21), .A0N(\Reg_File[4][7] ), .A1N(n21), .Y(
        n87) );
  OAI2BB2X1M U84 ( .B0(n219), .B1(n23), .A0N(\Reg_File[5][0] ), .A1N(n23), .Y(
        n88) );
  OAI2BB2X1M U85 ( .B0(n220), .B1(n23), .A0N(\Reg_File[5][1] ), .A1N(n23), .Y(
        n89) );
  OAI2BB2X1M U86 ( .B0(n221), .B1(n23), .A0N(\Reg_File[5][2] ), .A1N(n23), .Y(
        n90) );
  OAI2BB2X1M U87 ( .B0(n222), .B1(n23), .A0N(\Reg_File[5][3] ), .A1N(n23), .Y(
        n91) );
  OAI2BB2X1M U88 ( .B0(n223), .B1(n23), .A0N(\Reg_File[5][4] ), .A1N(n23), .Y(
        n92) );
  OAI2BB2X1M U89 ( .B0(n224), .B1(n23), .A0N(\Reg_File[5][5] ), .A1N(n23), .Y(
        n93) );
  OAI2BB2X1M U90 ( .B0(n225), .B1(n23), .A0N(\Reg_File[5][6] ), .A1N(n23), .Y(
        n94) );
  OAI2BB2X1M U91 ( .B0(n226), .B1(n23), .A0N(\Reg_File[5][7] ), .A1N(n23), .Y(
        n95) );
  OAI2BB2X1M U92 ( .B0(n219), .B1(n24), .A0N(\Reg_File[6][0] ), .A1N(n24), .Y(
        n96) );
  OAI2BB2X1M U93 ( .B0(n220), .B1(n24), .A0N(\Reg_File[6][1] ), .A1N(n24), .Y(
        n97) );
  OAI2BB2X1M U94 ( .B0(n221), .B1(n24), .A0N(\Reg_File[6][2] ), .A1N(n24), .Y(
        n98) );
  OAI2BB2X1M U95 ( .B0(n222), .B1(n24), .A0N(\Reg_File[6][3] ), .A1N(n24), .Y(
        n99) );
  OAI2BB2X1M U96 ( .B0(n223), .B1(n24), .A0N(\Reg_File[6][4] ), .A1N(n24), .Y(
        n100) );
  OAI2BB2X1M U97 ( .B0(n224), .B1(n24), .A0N(\Reg_File[6][5] ), .A1N(n24), .Y(
        n101) );
  OAI2BB2X1M U98 ( .B0(n225), .B1(n24), .A0N(\Reg_File[6][6] ), .A1N(n24), .Y(
        n102) );
  OAI2BB2X1M U99 ( .B0(n226), .B1(n24), .A0N(\Reg_File[6][7] ), .A1N(n24), .Y(
        n103) );
  OAI2BB2X1M U100 ( .B0(n219), .B1(n27), .A0N(\Reg_File[7][0] ), .A1N(n27), 
        .Y(n104) );
  OAI2BB2X1M U101 ( .B0(n220), .B1(n27), .A0N(\Reg_File[7][1] ), .A1N(n27), 
        .Y(n105) );
  OAI2BB2X1M U102 ( .B0(n221), .B1(n27), .A0N(\Reg_File[7][2] ), .A1N(n27), 
        .Y(n106) );
  OAI2BB2X1M U103 ( .B0(n222), .B1(n27), .A0N(\Reg_File[7][3] ), .A1N(n27), 
        .Y(n107) );
  OAI2BB2X1M U104 ( .B0(n223), .B1(n27), .A0N(\Reg_File[7][4] ), .A1N(n27), 
        .Y(n108) );
  OAI2BB2X1M U105 ( .B0(n224), .B1(n27), .A0N(\Reg_File[7][5] ), .A1N(n27), 
        .Y(n109) );
  OAI2BB2X1M U106 ( .B0(n225), .B1(n27), .A0N(\Reg_File[7][6] ), .A1N(n27), 
        .Y(n110) );
  OAI2BB2X1M U107 ( .B0(n226), .B1(n27), .A0N(\Reg_File[7][7] ), .A1N(n27), 
        .Y(n111) );
  OAI2BB2X1M U108 ( .B0(n220), .B1(n18), .A0N(REG2[1]), .A1N(n18), .Y(n65) );
  OAI2BB2X1M U109 ( .B0(n221), .B1(n18), .A0N(REG2[2]), .A1N(n18), .Y(n66) );
  OAI2BB2X1M U110 ( .B0(n222), .B1(n18), .A0N(REG2[3]), .A1N(n18), .Y(n67) );
  OAI2BB2X1M U111 ( .B0(n223), .B1(n18), .A0N(REG2[4]), .A1N(n18), .Y(n68) );
  OAI2BB2X1M U112 ( .B0(n224), .B1(n18), .A0N(REG2[5]), .A1N(n18), .Y(n69) );
  OAI2BB2X1M U113 ( .B0(n225), .B1(n18), .A0N(REG2[6]), .A1N(n18), .Y(n70) );
  OAI2BB2X1M U114 ( .B0(n219), .B1(n20), .A0N(REG3[0]), .A1N(n20), .Y(n72) );
  OAI2BB2X1M U115 ( .B0(n220), .B1(n20), .A0N(REG3[1]), .A1N(n20), .Y(n73) );
  OAI2BB2X1M U116 ( .B0(n221), .B1(n20), .A0N(REG3[2]), .A1N(n20), .Y(n74) );
  OAI2BB2X1M U117 ( .B0(n222), .B1(n20), .A0N(REG3[3]), .A1N(n20), .Y(n75) );
  OAI2BB2X1M U118 ( .B0(n223), .B1(n20), .A0N(REG3[4]), .A1N(n20), .Y(n76) );
  OAI2BB2X1M U119 ( .B0(n225), .B1(n20), .A0N(REG3[6]), .A1N(n20), .Y(n78) );
  OAI2BB2X1M U120 ( .B0(n226), .B1(n20), .A0N(REG3[7]), .A1N(n20), .Y(n79) );
  OAI2BB2X1M U121 ( .B0(n219), .B1(n29), .A0N(\Reg_File[8][0] ), .A1N(n29), 
        .Y(n112) );
  OAI2BB2X1M U122 ( .B0(n220), .B1(n29), .A0N(\Reg_File[8][1] ), .A1N(n29), 
        .Y(n113) );
  OAI2BB2X1M U123 ( .B0(n221), .B1(n29), .A0N(\Reg_File[8][2] ), .A1N(n29), 
        .Y(n114) );
  OAI2BB2X1M U124 ( .B0(n222), .B1(n29), .A0N(\Reg_File[8][3] ), .A1N(n29), 
        .Y(n115) );
  OAI2BB2X1M U125 ( .B0(n223), .B1(n29), .A0N(\Reg_File[8][4] ), .A1N(n29), 
        .Y(n116) );
  OAI2BB2X1M U126 ( .B0(n224), .B1(n29), .A0N(\Reg_File[8][5] ), .A1N(n29), 
        .Y(n117) );
  OAI2BB2X1M U127 ( .B0(n225), .B1(n29), .A0N(\Reg_File[8][6] ), .A1N(n29), 
        .Y(n118) );
  OAI2BB2X1M U128 ( .B0(n226), .B1(n29), .A0N(\Reg_File[8][7] ), .A1N(n29), 
        .Y(n119) );
  OAI2BB2X1M U129 ( .B0(n219), .B1(n31), .A0N(\Reg_File[9][0] ), .A1N(n31), 
        .Y(n120) );
  OAI2BB2X1M U130 ( .B0(n220), .B1(n31), .A0N(\Reg_File[9][1] ), .A1N(n31), 
        .Y(n121) );
  OAI2BB2X1M U131 ( .B0(n221), .B1(n31), .A0N(\Reg_File[9][2] ), .A1N(n31), 
        .Y(n122) );
  OAI2BB2X1M U132 ( .B0(n222), .B1(n31), .A0N(\Reg_File[9][3] ), .A1N(n31), 
        .Y(n123) );
  OAI2BB2X1M U133 ( .B0(n223), .B1(n31), .A0N(\Reg_File[9][4] ), .A1N(n31), 
        .Y(n124) );
  OAI2BB2X1M U134 ( .B0(n224), .B1(n31), .A0N(\Reg_File[9][5] ), .A1N(n31), 
        .Y(n125) );
  OAI2BB2X1M U135 ( .B0(n225), .B1(n31), .A0N(\Reg_File[9][6] ), .A1N(n31), 
        .Y(n126) );
  OAI2BB2X1M U136 ( .B0(n226), .B1(n31), .A0N(\Reg_File[9][7] ), .A1N(n31), 
        .Y(n127) );
  OAI2BB2X1M U137 ( .B0(n219), .B1(n33), .A0N(\Reg_File[10][0] ), .A1N(n33), 
        .Y(n128) );
  OAI2BB2X1M U138 ( .B0(n220), .B1(n33), .A0N(\Reg_File[10][1] ), .A1N(n33), 
        .Y(n129) );
  OAI2BB2X1M U139 ( .B0(n221), .B1(n33), .A0N(\Reg_File[10][2] ), .A1N(n33), 
        .Y(n130) );
  OAI2BB2X1M U140 ( .B0(n222), .B1(n33), .A0N(\Reg_File[10][3] ), .A1N(n33), 
        .Y(n131) );
  OAI2BB2X1M U141 ( .B0(n223), .B1(n33), .A0N(\Reg_File[10][4] ), .A1N(n33), 
        .Y(n132) );
  OAI2BB2X1M U142 ( .B0(n224), .B1(n33), .A0N(\Reg_File[10][5] ), .A1N(n33), 
        .Y(n133) );
  OAI2BB2X1M U143 ( .B0(n225), .B1(n33), .A0N(\Reg_File[10][6] ), .A1N(n33), 
        .Y(n134) );
  OAI2BB2X1M U144 ( .B0(n226), .B1(n33), .A0N(\Reg_File[10][7] ), .A1N(n33), 
        .Y(n135) );
  OAI2BB2X1M U145 ( .B0(n219), .B1(n34), .A0N(\Reg_File[11][0] ), .A1N(n34), 
        .Y(n136) );
  OAI2BB2X1M U146 ( .B0(n220), .B1(n34), .A0N(\Reg_File[11][1] ), .A1N(n34), 
        .Y(n137) );
  OAI2BB2X1M U147 ( .B0(n221), .B1(n34), .A0N(\Reg_File[11][2] ), .A1N(n34), 
        .Y(n138) );
  OAI2BB2X1M U148 ( .B0(n222), .B1(n34), .A0N(\Reg_File[11][3] ), .A1N(n34), 
        .Y(n139) );
  OAI2BB2X1M U149 ( .B0(n223), .B1(n34), .A0N(\Reg_File[11][4] ), .A1N(n34), 
        .Y(n140) );
  OAI2BB2X1M U150 ( .B0(n224), .B1(n34), .A0N(\Reg_File[11][5] ), .A1N(n34), 
        .Y(n141) );
  OAI2BB2X1M U151 ( .B0(n225), .B1(n34), .A0N(\Reg_File[11][6] ), .A1N(n34), 
        .Y(n142) );
  OAI2BB2X1M U152 ( .B0(n226), .B1(n34), .A0N(\Reg_File[11][7] ), .A1N(n34), 
        .Y(n143) );
  OAI2BB2X1M U153 ( .B0(n219), .B1(n35), .A0N(\Reg_File[12][0] ), .A1N(n35), 
        .Y(n144) );
  OAI2BB2X1M U154 ( .B0(n220), .B1(n35), .A0N(\Reg_File[12][1] ), .A1N(n35), 
        .Y(n145) );
  OAI2BB2X1M U155 ( .B0(n221), .B1(n35), .A0N(\Reg_File[12][2] ), .A1N(n35), 
        .Y(n146) );
  OAI2BB2X1M U156 ( .B0(n222), .B1(n35), .A0N(\Reg_File[12][3] ), .A1N(n35), 
        .Y(n147) );
  OAI2BB2X1M U157 ( .B0(n223), .B1(n35), .A0N(\Reg_File[12][4] ), .A1N(n35), 
        .Y(n148) );
  OAI2BB2X1M U158 ( .B0(n224), .B1(n35), .A0N(\Reg_File[12][5] ), .A1N(n35), 
        .Y(n149) );
  OAI2BB2X1M U159 ( .B0(n225), .B1(n35), .A0N(\Reg_File[12][6] ), .A1N(n35), 
        .Y(n150) );
  OAI2BB2X1M U160 ( .B0(n226), .B1(n35), .A0N(\Reg_File[12][7] ), .A1N(n35), 
        .Y(n151) );
  OAI2BB2X1M U161 ( .B0(n219), .B1(n36), .A0N(\Reg_File[13][0] ), .A1N(n36), 
        .Y(n152) );
  OAI2BB2X1M U162 ( .B0(n220), .B1(n36), .A0N(\Reg_File[13][1] ), .A1N(n36), 
        .Y(n153) );
  OAI2BB2X1M U163 ( .B0(n221), .B1(n36), .A0N(\Reg_File[13][2] ), .A1N(n36), 
        .Y(n154) );
  OAI2BB2X1M U164 ( .B0(n222), .B1(n36), .A0N(\Reg_File[13][3] ), .A1N(n36), 
        .Y(n155) );
  OAI2BB2X1M U165 ( .B0(n223), .B1(n36), .A0N(\Reg_File[13][4] ), .A1N(n36), 
        .Y(n156) );
  OAI2BB2X1M U166 ( .B0(n224), .B1(n36), .A0N(\Reg_File[13][5] ), .A1N(n36), 
        .Y(n157) );
  OAI2BB2X1M U167 ( .B0(n225), .B1(n36), .A0N(\Reg_File[13][6] ), .A1N(n36), 
        .Y(n158) );
  OAI2BB2X1M U168 ( .B0(n226), .B1(n36), .A0N(\Reg_File[13][7] ), .A1N(n36), 
        .Y(n159) );
  OAI2BB2X1M U169 ( .B0(n219), .B1(n37), .A0N(\Reg_File[14][0] ), .A1N(n37), 
        .Y(n160) );
  OAI2BB2X1M U170 ( .B0(n220), .B1(n37), .A0N(\Reg_File[14][1] ), .A1N(n37), 
        .Y(n161) );
  OAI2BB2X1M U171 ( .B0(n221), .B1(n37), .A0N(\Reg_File[14][2] ), .A1N(n37), 
        .Y(n162) );
  OAI2BB2X1M U172 ( .B0(n222), .B1(n37), .A0N(\Reg_File[14][3] ), .A1N(n37), 
        .Y(n163) );
  OAI2BB2X1M U173 ( .B0(n223), .B1(n37), .A0N(\Reg_File[14][4] ), .A1N(n37), 
        .Y(n164) );
  OAI2BB2X1M U174 ( .B0(n224), .B1(n37), .A0N(\Reg_File[14][5] ), .A1N(n37), 
        .Y(n165) );
  OAI2BB2X1M U175 ( .B0(n225), .B1(n37), .A0N(\Reg_File[14][6] ), .A1N(n37), 
        .Y(n166) );
  OAI2BB2X1M U176 ( .B0(n226), .B1(n37), .A0N(\Reg_File[14][7] ), .A1N(n37), 
        .Y(n167) );
  OAI2BB2X1M U177 ( .B0(n219), .B1(n39), .A0N(\Reg_File[15][0] ), .A1N(n39), 
        .Y(n168) );
  OAI2BB2X1M U178 ( .B0(n220), .B1(n39), .A0N(\Reg_File[15][1] ), .A1N(n39), 
        .Y(n169) );
  OAI2BB2X1M U179 ( .B0(n221), .B1(n39), .A0N(\Reg_File[15][2] ), .A1N(n39), 
        .Y(n170) );
  OAI2BB2X1M U180 ( .B0(n222), .B1(n39), .A0N(\Reg_File[15][3] ), .A1N(n39), 
        .Y(n171) );
  OAI2BB2X1M U181 ( .B0(n223), .B1(n39), .A0N(\Reg_File[15][4] ), .A1N(n39), 
        .Y(n172) );
  OAI2BB2X1M U182 ( .B0(n224), .B1(n39), .A0N(\Reg_File[15][5] ), .A1N(n39), 
        .Y(n173) );
  OAI2BB2X1M U183 ( .B0(n225), .B1(n39), .A0N(\Reg_File[15][6] ), .A1N(n39), 
        .Y(n174) );
  OAI2BB2X1M U184 ( .B0(n226), .B1(n39), .A0N(\Reg_File[15][7] ), .A1N(n39), 
        .Y(n175) );
  OAI2BB2X1M U185 ( .B0(n219), .B1(n18), .A0N(REG2[0]), .A1N(n18), .Y(n64) );
  OAI2BB2X1M U186 ( .B0(n226), .B1(n18), .A0N(REG2[7]), .A1N(n18), .Y(n71) );
  OAI2BB2X1M U187 ( .B0(n224), .B1(n20), .A0N(REG3[5]), .A1N(n20), .Y(n77) );
  AO22X1M U188 ( .A0(N43), .A1(n227), .B0(RdData[0]), .B1(n12), .Y(n40) );
  MX4X1M U189 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U190 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(n198), .Y(n4) );
  MX4X1M U191 ( .A(\Reg_File[8][0] ), .B(\Reg_File[9][0] ), .C(
        \Reg_File[10][0] ), .D(\Reg_File[11][0] ), .S0(N11), .S1(n198), .Y(n2)
         );
  AO22X1M U192 ( .A0(N42), .A1(n227), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4X1M U193 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U194 ( .A(\Reg_File[8][1] ), .B(\Reg_File[9][1] ), .C(
        \Reg_File[10][1] ), .D(\Reg_File[11][1] ), .S0(N11), .S1(n198), .Y(n6)
         );
  MX4X1M U195 ( .A(\Reg_File[12][1] ), .B(\Reg_File[13][1] ), .C(
        \Reg_File[14][1] ), .D(\Reg_File[15][1] ), .S0(n201), .S1(n198), .Y(n5) );
  AO22X1M U196 ( .A0(N41), .A1(n227), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4X1M U197 ( .A(n176), .B(n10), .C(n11), .D(n9), .S0(N14), .S1(N13), .Y(N41) );
  MX4X1M U198 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n200), 
        .S1(N12), .Y(n176) );
  MX4X1M U199 ( .A(\Reg_File[8][2] ), .B(\Reg_File[9][2] ), .C(
        \Reg_File[10][2] ), .D(\Reg_File[11][2] ), .S0(n200), .S1(N12), .Y(n10) );
  AO22X1M U200 ( .A0(N40), .A1(n227), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4X1M U201 ( .A(n180), .B(n178), .C(n179), .D(n177), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U202 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n200), 
        .S1(N12), .Y(n180) );
  MX4X1M U203 ( .A(\Reg_File[8][3] ), .B(\Reg_File[9][3] ), .C(
        \Reg_File[10][3] ), .D(\Reg_File[11][3] ), .S0(n200), .S1(N12), .Y(
        n178) );
  AO22X1M U204 ( .A0(N39), .A1(n227), .B0(RdData[4]), .B1(n12), .Y(n44) );
  MX4X1M U205 ( .A(n184), .B(n182), .C(n183), .D(n181), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U206 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n201), 
        .S1(N12), .Y(n184) );
  MX4X1M U207 ( .A(\Reg_File[8][4] ), .B(\Reg_File[9][4] ), .C(
        \Reg_File[10][4] ), .D(\Reg_File[11][4] ), .S0(n200), .S1(N12), .Y(
        n182) );
  AO22X1M U208 ( .A0(N38), .A1(n227), .B0(RdData[5]), .B1(n12), .Y(n45) );
  MX4X1M U209 ( .A(n188), .B(n186), .C(n187), .D(n185), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U210 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n201), 
        .S1(N12), .Y(n188) );
  MX4X1M U211 ( .A(\Reg_File[8][5] ), .B(\Reg_File[9][5] ), .C(
        \Reg_File[10][5] ), .D(\Reg_File[11][5] ), .S0(n201), .S1(N12), .Y(
        n186) );
  AO22X1M U212 ( .A0(N37), .A1(n227), .B0(RdData[6]), .B1(n12), .Y(n46) );
  MX4X1M U213 ( .A(n192), .B(n190), .C(n191), .D(n189), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U214 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n201), 
        .S1(N12), .Y(n192) );
  MX4X1M U215 ( .A(\Reg_File[8][6] ), .B(\Reg_File[9][6] ), .C(
        \Reg_File[10][6] ), .D(\Reg_File[11][6] ), .S0(n201), .S1(N12), .Y(
        n190) );
  AO22X1M U216 ( .A0(N36), .A1(n227), .B0(RdData[7]), .B1(n12), .Y(n47) );
  MX4X1M U217 ( .A(n196), .B(n194), .C(n195), .D(n193), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U218 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n201), 
        .S1(N12), .Y(n196) );
  MX4X1M U219 ( .A(\Reg_File[8][7] ), .B(\Reg_File[9][7] ), .C(
        \Reg_File[10][7] ), .D(\Reg_File[11][7] ), .S0(n201), .S1(N12), .Y(
        n194) );
  MX4X1M U220 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n200), 
        .S1(n198), .Y(n8) );
  MX4X1M U221 ( .A(\Reg_File[4][0] ), .B(\Reg_File[5][0] ), .C(
        \Reg_File[6][0] ), .D(\Reg_File[7][0] ), .S0(N11), .S1(n198), .Y(n3)
         );
  MX4X1M U222 ( .A(\Reg_File[4][1] ), .B(\Reg_File[5][1] ), .C(
        \Reg_File[6][1] ), .D(\Reg_File[7][1] ), .S0(n200), .S1(n198), .Y(n7)
         );
  MX4X1M U223 ( .A(\Reg_File[4][2] ), .B(\Reg_File[5][2] ), .C(
        \Reg_File[6][2] ), .D(\Reg_File[7][2] ), .S0(n200), .S1(N12), .Y(n11)
         );
  MX4X1M U224 ( .A(\Reg_File[4][3] ), .B(\Reg_File[5][3] ), .C(
        \Reg_File[6][3] ), .D(\Reg_File[7][3] ), .S0(n200), .S1(N12), .Y(n179)
         );
  MX4X1M U225 ( .A(\Reg_File[4][4] ), .B(\Reg_File[5][4] ), .C(
        \Reg_File[6][4] ), .D(\Reg_File[7][4] ), .S0(n200), .S1(N12), .Y(n183)
         );
  MX4X1M U226 ( .A(\Reg_File[4][5] ), .B(\Reg_File[5][5] ), .C(
        \Reg_File[6][5] ), .D(\Reg_File[7][5] ), .S0(n201), .S1(N12), .Y(n187)
         );
  MX4X1M U227 ( .A(\Reg_File[4][6] ), .B(\Reg_File[5][6] ), .C(
        \Reg_File[6][6] ), .D(\Reg_File[7][6] ), .S0(n201), .S1(n198), .Y(n191) );
  MX4X1M U228 ( .A(\Reg_File[4][7] ), .B(\Reg_File[5][7] ), .C(
        \Reg_File[6][7] ), .D(\Reg_File[7][7] ), .S0(n201), .S1(N12), .Y(n195)
         );
  MX4X1M U229 ( .A(\Reg_File[12][0] ), .B(\Reg_File[13][0] ), .C(
        \Reg_File[14][0] ), .D(\Reg_File[15][0] ), .S0(n200), .S1(n198), .Y(n1) );
  MX4X1M U230 ( .A(\Reg_File[12][2] ), .B(\Reg_File[13][2] ), .C(
        \Reg_File[14][2] ), .D(\Reg_File[15][2] ), .S0(n200), .S1(n198), .Y(n9) );
  MX4X1M U231 ( .A(\Reg_File[12][3] ), .B(\Reg_File[13][3] ), .C(
        \Reg_File[14][3] ), .D(\Reg_File[15][3] ), .S0(n200), .S1(N12), .Y(
        n177) );
  MX4X1M U232 ( .A(\Reg_File[12][4] ), .B(\Reg_File[13][4] ), .C(
        \Reg_File[14][4] ), .D(\Reg_File[15][4] ), .S0(n200), .S1(N12), .Y(
        n181) );
  MX4X1M U233 ( .A(\Reg_File[12][5] ), .B(\Reg_File[13][5] ), .C(
        \Reg_File[14][5] ), .D(\Reg_File[15][5] ), .S0(n201), .S1(n198), .Y(
        n185) );
  MX4X1M U234 ( .A(\Reg_File[12][6] ), .B(\Reg_File[13][6] ), .C(
        \Reg_File[14][6] ), .D(\Reg_File[15][6] ), .S0(n201), .S1(n198), .Y(
        n189) );
  MX4X1M U235 ( .A(\Reg_File[12][7] ), .B(\Reg_File[13][7] ), .C(
        \Reg_File[14][7] ), .D(\Reg_File[15][7] ), .S0(n201), .S1(n198), .Y(
        n193) );
  INVX2M U236 ( .A(N11), .Y(n202) );
  INVX2M U237 ( .A(N12), .Y(n203) );
endmodule


module system_control ( CLK, RST, FIFO_Full, ALU_OUT, OUT_Valid, Rd_D, 
        Rd_D_Vld, RX_P_DATA, RX_D_VLD, ALU_FUN, EN, CLK_EN, Address, WrEn, 
        RdEn, WrData, TX_P_DATA, TX_D_VLD, clk_div_en );
  input [15:0] ALU_OUT;
  input [7:0] Rd_D;
  input [7:0] RX_P_DATA;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  output [7:0] TX_P_DATA;
  input CLK, RST, FIFO_Full, OUT_Valid, Rd_D_Vld, RX_D_VLD;
  output EN, CLK_EN, WrEn, RdEn, TX_D_VLD, clk_div_en;
  wire   RX_D_VLD_delayed, N119, N120, N121, N122, N123, N135, N136, N137,
         N138, N150, N151, N152, N153, N154, N155, N156, N157, N159, N160,
         N161, N162, N163, N164, N165, N166, N179, N180, N181, N182, N183,
         N184, N185, N186, n3, n4, n5, n6, n7, n8, n9, n10, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94;
  wire   [3:0] storeadd;
  wire   [15:8] store_ALU_OUT;
  wire   [7:0] TX_P_DATA_store;
  wire   [3:0] current_state;
  wire   [3:0] next_state;

  DFFRQX2M \store_ALU_OUT_reg[15]  ( .D(ALU_OUT[15]), .CK(CLK), .RN(RST), .Q(
        store_ALU_OUT[15]) );
  DFFRQX2M \store_ALU_OUT_reg[14]  ( .D(ALU_OUT[14]), .CK(CLK), .RN(RST), .Q(
        store_ALU_OUT[14]) );
  DFFRQX2M \store_ALU_OUT_reg[13]  ( .D(ALU_OUT[13]), .CK(CLK), .RN(RST), .Q(
        store_ALU_OUT[13]) );
  DFFRQX2M \store_ALU_OUT_reg[12]  ( .D(ALU_OUT[12]), .CK(CLK), .RN(RST), .Q(
        store_ALU_OUT[12]) );
  DFFRQX2M \store_ALU_OUT_reg[11]  ( .D(ALU_OUT[11]), .CK(CLK), .RN(RST), .Q(
        store_ALU_OUT[11]) );
  DFFRQX2M \store_ALU_OUT_reg[10]  ( .D(ALU_OUT[10]), .CK(CLK), .RN(RST), .Q(
        store_ALU_OUT[10]) );
  DFFRQX2M \store_ALU_OUT_reg[9]  ( .D(ALU_OUT[9]), .CK(CLK), .RN(RST), .Q(
        store_ALU_OUT[9]) );
  DFFRQX2M \store_ALU_OUT_reg[8]  ( .D(ALU_OUT[8]), .CK(CLK), .RN(RST), .Q(
        store_ALU_OUT[8]) );
  DFFRX1M \TX_P_DATA_store_reg[7]  ( .D(TX_P_DATA[7]), .CK(CLK), .RN(RST), .Q(
        TX_P_DATA_store[7]), .QN(n3) );
  DFFRX1M \TX_P_DATA_store_reg[6]  ( .D(TX_P_DATA[6]), .CK(CLK), .RN(RST), .Q(
        TX_P_DATA_store[6]), .QN(n4) );
  DFFRX1M \TX_P_DATA_store_reg[5]  ( .D(TX_P_DATA[5]), .CK(CLK), .RN(RST), .Q(
        TX_P_DATA_store[5]), .QN(n5) );
  DFFRX1M \TX_P_DATA_store_reg[4]  ( .D(TX_P_DATA[4]), .CK(CLK), .RN(RST), .Q(
        TX_P_DATA_store[4]), .QN(n6) );
  DFFRX1M \TX_P_DATA_store_reg[3]  ( .D(TX_P_DATA[3]), .CK(CLK), .RN(RST), .Q(
        TX_P_DATA_store[3]), .QN(n7) );
  DFFRX1M \TX_P_DATA_store_reg[2]  ( .D(TX_P_DATA[2]), .CK(CLK), .RN(RST), .Q(
        TX_P_DATA_store[2]), .QN(n8) );
  DFFRX1M \TX_P_DATA_store_reg[1]  ( .D(TX_P_DATA[1]), .CK(CLK), .RN(RST), .Q(
        TX_P_DATA_store[1]), .QN(n9) );
  DFFRX1M \TX_P_DATA_store_reg[0]  ( .D(TX_P_DATA[0]), .CK(CLK), .RN(RST), .Q(
        TX_P_DATA_store[0]), .QN(n10) );
  DFFRQX2M RX_D_VLD_delayed_reg ( .D(RX_D_VLD), .CK(CLK), .RN(RST), .Q(
        RX_D_VLD_delayed) );
  DFFRQX2M \storeadd_reg[3]  ( .D(RX_P_DATA[3]), .CK(CLK), .RN(RST), .Q(
        storeadd[3]) );
  DFFRQX2M \storeadd_reg[2]  ( .D(RX_P_DATA[2]), .CK(CLK), .RN(RST), .Q(
        storeadd[2]) );
  DFFRQX2M \storeadd_reg[1]  ( .D(RX_P_DATA[1]), .CK(CLK), .RN(RST), .Q(
        storeadd[1]) );
  DFFRQX2M \storeadd_reg[0]  ( .D(RX_P_DATA[0]), .CK(CLK), .RN(RST), .Q(
        storeadd[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .CK(CLK), .RN(RST), .Q(
        current_state[3]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  INVX2M U3 ( .A(1'b1), .Y(clk_div_en) );
  AOI221XLM U5 ( .A0(n40), .A1(n81), .B0(n84), .B1(FIFO_Full), .C0(RdEn), .Y(
        n31) );
  NOR2X2M U6 ( .A(current_state[2]), .B(n30), .Y(n11) );
  NOR2X2M U7 ( .A(current_state[1]), .B(n29), .Y(n12) );
  NOR2X2M U8 ( .A(n93), .B(n83), .Y(ALU_FUN[1]) );
  NOR2X2M U9 ( .A(n92), .B(n83), .Y(ALU_FUN[2]) );
  NOR2X2M U10 ( .A(n91), .B(n83), .Y(ALU_FUN[3]) );
  MX3X1M U11 ( .A(n28), .B(n27), .C(storeadd[3]), .S0(current_state[1]), .S1(
        current_state[3]), .Y(Address[3]) );
  MX3X1M U12 ( .A(n26), .B(n25), .C(storeadd[2]), .S0(current_state[1]), .S1(
        current_state[3]), .Y(Address[2]) );
  BUFX2M U13 ( .A(n61), .Y(n73) );
  INVX2M U14 ( .A(EN), .Y(n83) );
  NAND2X2M U15 ( .A(n82), .B(n71), .Y(n32) );
  INVX2M U16 ( .A(n65), .Y(n82) );
  NOR2X2M U17 ( .A(n35), .B(n86), .Y(EN) );
  OAI21X2M U18 ( .A0(n86), .A1(n94), .B0(n70), .Y(N119) );
  OAI21X2M U19 ( .A0(n86), .A1(n93), .B0(n69), .Y(N120) );
  NAND3X2M U20 ( .A(n30), .B(n85), .C(n62), .Y(n65) );
  NOR2X2M U21 ( .A(n94), .B(n83), .Y(ALU_FUN[0]) );
  INVX2M U22 ( .A(n73), .Y(WrEn) );
  INVX2M U23 ( .A(n69), .Y(N136) );
  INVX2M U24 ( .A(n70), .Y(N123) );
  NOR2X2M U25 ( .A(n93), .B(n73), .Y(WrData[1]) );
  NOR2X2M U26 ( .A(n92), .B(n73), .Y(WrData[2]) );
  NOR2X2M U27 ( .A(n91), .B(n73), .Y(WrData[3]) );
  NOR2X2M U28 ( .A(n90), .B(n73), .Y(WrData[4]) );
  NOR2X2M U29 ( .A(n89), .B(n73), .Y(WrData[5]) );
  NOR2X2M U30 ( .A(n87), .B(n73), .Y(WrData[7]) );
  NOR2X2M U31 ( .A(n94), .B(n73), .Y(WrData[0]) );
  NOR3X2M U32 ( .A(n93), .B(n47), .C(n89), .Y(n51) );
  NOR2X2M U33 ( .A(n86), .B(n54), .Y(RdEn) );
  NAND2X2M U34 ( .A(n31), .B(n32), .Y(next_state[3]) );
  NAND2X2M U35 ( .A(n63), .B(n30), .Y(n37) );
  OAI21X2M U36 ( .A0(n86), .A1(n91), .B0(n67), .Y(N122) );
  OAI21X2M U37 ( .A0(n86), .A1(n92), .B0(n68), .Y(N121) );
  INVX2M U38 ( .A(n31), .Y(n75) );
  NAND2X2M U39 ( .A(n33), .B(n34), .Y(next_state[2]) );
  NOR4BX1M U40 ( .AN(n35), .B(n82), .C(n79), .D(n36), .Y(n34) );
  AOI221XLM U41 ( .A0(n77), .A1(n88), .B0(n39), .B1(n86), .C0(n75), .Y(n33) );
  AOI21X2M U42 ( .A0(n37), .A1(n38), .B0(n86), .Y(n36) );
  INVX2M U43 ( .A(n40), .Y(n74) );
  NAND2X2M U44 ( .A(n66), .B(n30), .Y(n41) );
  NAND2X2M U45 ( .A(n37), .B(n56), .Y(n46) );
  BUFX2M U46 ( .A(n64), .Y(n72) );
  BUFX2M U47 ( .A(n64), .Y(n71) );
  INVX2M U48 ( .A(n47), .Y(n77) );
  INVX2M U49 ( .A(n45), .Y(n78) );
  INVX2M U50 ( .A(n58), .Y(n84) );
  INVX2M U51 ( .A(n56), .Y(n79) );
  NAND3X2M U52 ( .A(n65), .B(n58), .C(n35), .Y(CLK_EN) );
  INVX2M U53 ( .A(n42), .Y(n88) );
  MX4X1M U54 ( .A(N138), .B(N122), .C(N138), .D(storeadd[3]), .S0(
        current_state[0]), .S1(current_state[2]), .Y(n27) );
  MX2X2M U55 ( .A(storeadd[3]), .B(N122), .S0(n11), .Y(n28) );
  INVX2M U56 ( .A(n67), .Y(N138) );
  NOR3BX2M U57 ( .AN(n62), .B(current_state[1]), .C(n30), .Y(n39) );
  OAI221X1M U58 ( .A0(n41), .A1(n40), .B0(FIFO_Full), .B1(n58), .C0(n32), .Y(
        TX_D_VLD) );
  NOR2BX2M U59 ( .AN(current_state[2]), .B(current_state[3]), .Y(n62) );
  NAND3X2M U60 ( .A(current_state[1]), .B(n62), .C(current_state[0]), .Y(n35)
         );
  NAND2X2M U61 ( .A(n66), .B(current_state[0]), .Y(n58) );
  INVX2M U62 ( .A(RX_D_VLD), .Y(n86) );
  OAI21X2M U63 ( .A0(n39), .A1(n46), .B0(RX_D_VLD), .Y(n61) );
  INVX2M U64 ( .A(RX_P_DATA[2]), .Y(n92) );
  NAND2X2M U65 ( .A(storeadd[0]), .B(n86), .Y(n70) );
  NAND2X2M U66 ( .A(storeadd[1]), .B(n86), .Y(n69) );
  MX2X2M U67 ( .A(storeadd[1]), .B(N120), .S0(n11), .Y(n24) );
  MX2X2M U68 ( .A(storeadd[0]), .B(N119), .S0(n11), .Y(n22) );
  MX3X1M U69 ( .A(n22), .B(n21), .C(storeadd[0]), .S0(current_state[1]), .S1(
        current_state[3]), .Y(Address[0]) );
  MX4X1M U70 ( .A(N123), .B(N119), .C(N135), .D(storeadd[0]), .S0(
        current_state[0]), .S1(current_state[2]), .Y(n21) );
  MX3X1M U71 ( .A(n24), .B(n23), .C(storeadd[1]), .S0(current_state[1]), .S1(
        current_state[3]), .Y(Address[1]) );
  MX4X1M U72 ( .A(N136), .B(N120), .C(N136), .D(storeadd[1]), .S0(
        current_state[0]), .S1(current_state[2]), .Y(n23) );
  INVX2M U73 ( .A(current_state[0]), .Y(n30) );
  OR2X2M U74 ( .A(storeadd[0]), .B(RX_D_VLD), .Y(N135) );
  MX4X1M U75 ( .A(N137), .B(N121), .C(N137), .D(storeadd[2]), .S0(
        current_state[0]), .S1(current_state[2]), .Y(n25) );
  MX2X2M U76 ( .A(storeadd[2]), .B(N121), .S0(n11), .Y(n26) );
  INVX2M U77 ( .A(n68), .Y(N137) );
  NOR3X2M U78 ( .A(current_state[2]), .B(current_state[3]), .C(n85), .Y(n63)
         );
  NOR3X2M U79 ( .A(current_state[2]), .B(current_state[3]), .C(
        current_state[1]), .Y(n59) );
  OAI21X2M U80 ( .A0(n42), .A1(n47), .B0(n50), .Y(n45) );
  AOI31X2M U81 ( .A0(n51), .A1(RX_P_DATA[4]), .A2(n52), .B0(n53), .Y(n50) );
  NOR3X2M U82 ( .A(n94), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n52) );
  AOI21X2M U83 ( .A0(n54), .A1(n35), .B0(RX_D_VLD), .Y(n53) );
  NOR2BX2M U84 ( .AN(RX_P_DATA[6]), .B(n73), .Y(WrData[6]) );
  NAND4X2M U85 ( .A(RX_D_VLD), .B(n30), .C(n59), .D(n60), .Y(n47) );
  NOR2X2M U86 ( .A(n91), .B(n87), .Y(n60) );
  NAND2X2M U87 ( .A(current_state[0]), .B(n63), .Y(n54) );
  INVX2M U88 ( .A(FIFO_Full), .Y(n76) );
  OAI211X2M U89 ( .A0(n43), .A1(n44), .B0(n80), .C0(n78), .Y(next_state[1]) );
  NAND4X2M U90 ( .A(n94), .B(n93), .C(n90), .D(n89), .Y(n43) );
  INVX2M U91 ( .A(n46), .Y(n80) );
  NAND3X2M U92 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[2]), .C(n77), .Y(n44) );
  AND3X2M U93 ( .A(current_state[2]), .B(n85), .C(current_state[3]), .Y(n66)
         );
  INVX2M U94 ( .A(RX_P_DATA[0]), .Y(n94) );
  NAND3X2M U95 ( .A(RX_D_VLD_delayed), .B(n76), .C(Rd_D_Vld), .Y(n40) );
  NAND3X2M U96 ( .A(n62), .B(n30), .C(current_state[1]), .Y(n56) );
  OAI2BB2X1M U97 ( .B0(n71), .B1(n10), .A0N(ALU_OUT[0]), .A1N(n72), .Y(N150)
         );
  OAI2BB2X1M U98 ( .B0(n71), .B1(n9), .A0N(ALU_OUT[1]), .A1N(n72), .Y(N151) );
  OAI2BB2X1M U99 ( .B0(n71), .B1(n8), .A0N(ALU_OUT[2]), .A1N(n72), .Y(N152) );
  OAI2BB2X1M U100 ( .B0(n71), .B1(n7), .A0N(ALU_OUT[3]), .A1N(n72), .Y(N153)
         );
  OAI2BB2X1M U101 ( .B0(n71), .B1(n6), .A0N(ALU_OUT[4]), .A1N(n72), .Y(N154)
         );
  OAI2BB2X1M U102 ( .B0(n72), .B1(n5), .A0N(ALU_OUT[5]), .A1N(n72), .Y(N155)
         );
  OAI2BB2X1M U103 ( .B0(n72), .B1(n4), .A0N(ALU_OUT[6]), .A1N(n72), .Y(N156)
         );
  OAI2BB2X1M U104 ( .B0(n72), .B1(n3), .A0N(ALU_OUT[7]), .A1N(n72), .Y(N157)
         );
  INVX2M U105 ( .A(RX_P_DATA[1]), .Y(n93) );
  INVX2M U106 ( .A(current_state[1]), .Y(n85) );
  MX2X2M U107 ( .A(TX_P_DATA_store[0]), .B(n13), .S0(n12), .Y(TX_P_DATA[0]) );
  MX4X1M U108 ( .A(N150), .B(TX_P_DATA_store[0]), .C(N179), .D(N159), .S0(
        current_state[0]), .S1(current_state[3]), .Y(n13) );
  OAI2BB2X1M U109 ( .B0(n76), .B1(n10), .A0N(store_ALU_OUT[8]), .A1N(n76), .Y(
        N159) );
  OAI2BB2X1M U110 ( .B0(n74), .B1(n10), .A0N(Rd_D[0]), .A1N(n74), .Y(N179) );
  MX2X2M U111 ( .A(TX_P_DATA_store[1]), .B(n14), .S0(n12), .Y(TX_P_DATA[1]) );
  MX4X1M U112 ( .A(N151), .B(TX_P_DATA_store[1]), .C(N180), .D(N160), .S0(
        current_state[0]), .S1(current_state[3]), .Y(n14) );
  OAI2BB2X1M U113 ( .B0(n76), .B1(n9), .A0N(store_ALU_OUT[9]), .A1N(n76), .Y(
        N160) );
  OAI2BB2X1M U114 ( .B0(n74), .B1(n9), .A0N(Rd_D[1]), .A1N(n74), .Y(N180) );
  MX2X2M U115 ( .A(TX_P_DATA_store[2]), .B(n15), .S0(n12), .Y(TX_P_DATA[2]) );
  MX4X1M U116 ( .A(N152), .B(TX_P_DATA_store[2]), .C(N181), .D(N161), .S0(
        current_state[0]), .S1(current_state[3]), .Y(n15) );
  OAI2BB2X1M U117 ( .B0(n76), .B1(n8), .A0N(store_ALU_OUT[10]), .A1N(n76), .Y(
        N161) );
  OAI2BB2X1M U118 ( .B0(n74), .B1(n8), .A0N(Rd_D[2]), .A1N(n74), .Y(N181) );
  MX2X2M U119 ( .A(TX_P_DATA_store[3]), .B(n16), .S0(n12), .Y(TX_P_DATA[3]) );
  MX4X1M U120 ( .A(N153), .B(TX_P_DATA_store[3]), .C(N182), .D(N162), .S0(
        current_state[0]), .S1(current_state[3]), .Y(n16) );
  OAI2BB2X1M U121 ( .B0(n76), .B1(n7), .A0N(store_ALU_OUT[11]), .A1N(n76), .Y(
        N162) );
  OAI2BB2X1M U122 ( .B0(n74), .B1(n7), .A0N(Rd_D[3]), .A1N(n74), .Y(N182) );
  MX2X2M U123 ( .A(TX_P_DATA_store[4]), .B(n17), .S0(n12), .Y(TX_P_DATA[4]) );
  MX4X1M U124 ( .A(N154), .B(TX_P_DATA_store[4]), .C(N183), .D(N163), .S0(
        current_state[0]), .S1(current_state[3]), .Y(n17) );
  OAI2BB2X1M U125 ( .B0(n76), .B1(n6), .A0N(store_ALU_OUT[12]), .A1N(n76), .Y(
        N163) );
  OAI2BB2X1M U126 ( .B0(n74), .B1(n6), .A0N(Rd_D[4]), .A1N(n74), .Y(N183) );
  MX2X2M U127 ( .A(TX_P_DATA_store[5]), .B(n18), .S0(n12), .Y(TX_P_DATA[5]) );
  MX4X1M U128 ( .A(N155), .B(TX_P_DATA_store[5]), .C(N184), .D(N164), .S0(
        current_state[0]), .S1(current_state[3]), .Y(n18) );
  OAI2BB2X1M U129 ( .B0(n76), .B1(n5), .A0N(store_ALU_OUT[13]), .A1N(n76), .Y(
        N164) );
  OAI2BB2X1M U130 ( .B0(n74), .B1(n5), .A0N(Rd_D[5]), .A1N(n74), .Y(N184) );
  MX2X2M U131 ( .A(TX_P_DATA_store[6]), .B(n19), .S0(n12), .Y(TX_P_DATA[6]) );
  MX4X1M U132 ( .A(N156), .B(TX_P_DATA_store[6]), .C(N185), .D(N165), .S0(
        current_state[0]), .S1(current_state[3]), .Y(n19) );
  OAI2BB2X1M U133 ( .B0(n76), .B1(n4), .A0N(store_ALU_OUT[14]), .A1N(n76), .Y(
        N165) );
  OAI2BB2X1M U134 ( .B0(n74), .B1(n4), .A0N(Rd_D[6]), .A1N(n74), .Y(N185) );
  MX2X2M U135 ( .A(TX_P_DATA_store[7]), .B(n20), .S0(n12), .Y(TX_P_DATA[7]) );
  MX4X1M U136 ( .A(N157), .B(TX_P_DATA_store[7]), .C(N186), .D(N166), .S0(
        current_state[0]), .S1(current_state[3]), .Y(n20) );
  OAI2BB2X1M U137 ( .B0(n76), .B1(n3), .A0N(store_ALU_OUT[15]), .A1N(n76), .Y(
        N166) );
  OAI2BB2X1M U138 ( .B0(n74), .B1(n3), .A0N(Rd_D[7]), .A1N(n74), .Y(N186) );
  NAND4X2M U139 ( .A(n32), .B(n38), .C(n48), .D(n49), .Y(next_state[0]) );
  AOI32X1M U140 ( .A0(n51), .A1(n94), .A2(n57), .B0(FIFO_Full), .B1(n84), .Y(
        n48) );
  AOI221XLM U141 ( .A0(n79), .A1(RX_D_VLD), .B0(n39), .B1(n86), .C0(n45), .Y(
        n49) );
  NOR3X2M U142 ( .A(RX_P_DATA[2]), .B(RX_P_DATA[6]), .C(RX_P_DATA[4]), .Y(n57)
         );
  NAND2X2M U143 ( .A(storeadd[3]), .B(n86), .Y(n67) );
  NAND2X2M U144 ( .A(storeadd[2]), .B(n86), .Y(n68) );
  INVX2M U145 ( .A(RX_P_DATA[3]), .Y(n91) );
  AND3X2M U146 ( .A(OUT_Valid), .B(n76), .C(RX_D_VLD_delayed), .Y(n64) );
  INVX2M U147 ( .A(n41), .Y(n81) );
  NAND4X2M U148 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[2]), .C(RX_P_DATA[6]), .D(n55), .Y(n42) );
  NOR3X2M U149 ( .A(n94), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n55) );
  NAND2X2M U150 ( .A(n59), .B(current_state[0]), .Y(n38) );
  INVX2M U151 ( .A(RX_P_DATA[5]), .Y(n89) );
  INVX2M U152 ( .A(RX_P_DATA[4]), .Y(n90) );
  INVX2M U153 ( .A(RX_P_DATA[7]), .Y(n87) );
  INVX2M U154 ( .A(current_state[2]), .Y(n29) );
endmodule


module P_MUX ( sel, ratio );
  input [5:0] sel;
  output [7:0] ratio;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U3 ( .A(1'b1), .Y(ratio[4]) );
  INVX2M U5 ( .A(1'b1), .Y(ratio[5]) );
  INVX2M U7 ( .A(1'b1), .Y(ratio[6]) );
  INVX2M U9 ( .A(1'b1), .Y(ratio[7]) );
  NAND4BX1M U11 ( .AN(sel[4]), .B(sel[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX1M U12 ( .AN(sel[3]), .B(sel[4]), .C(n15), .D(n14), .Y(n7) );
  NOR3X2M U13 ( .A(n7), .B(sel[1]), .C(sel[0]), .Y(ratio[1]) );
  NOR4X1M U14 ( .A(n5), .B(sel[3]), .C(sel[5]), .D(sel[4]), .Y(ratio[3]) );
  NAND3X2M U15 ( .A(n17), .B(n16), .C(sel[2]), .Y(n5) );
  NOR3X2M U16 ( .A(n6), .B(sel[1]), .C(sel[0]), .Y(ratio[2]) );
  OAI211X2M U17 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(ratio[0]) );
  NAND2X2M U18 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U19 ( .A(sel[5]), .B(sel[4]), .C(sel[3]), .D(n15), .Y(n8) );
  INVX2M U20 ( .A(sel[0]), .Y(n17) );
  INVX2M U21 ( .A(sel[1]), .Y(n16) );
  INVX2M U22 ( .A(sel[2]), .Y(n15) );
  INVX2M U23 ( .A(sel[5]), .Y(n14) );
endmodule


module ClkDiv_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_0_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_0 ( I_ref_clk, I_rst_n, I_clk_en, I_div_ratio, o_div_clk );
  input [7:0] I_div_ratio;
  input I_ref_clk, I_rst_n, I_clk_en;
  output o_div_clk;
  wire   div_clk, flag, N7, N18, N19, N20, N21, N22, N23, N24, N25, N40, N41,
         N42, N43, N44, N45, N46, N47, n26, n27, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50;
  wire   [7:0] half_toggle;
  wire   [7:0] half_toggle_p;
  wire   [7:0] counter;

  ClkDiv_0_DW01_inc_0 add_49 ( .A(counter), .SUM({N25, N24, N23, N22, N21, N20, 
        N19, N18}) );
  ClkDiv_0_DW01_inc_1 add_20 ( .A(half_toggle), .SUM(half_toggle_p) );
  DFFRX1M \counter_reg[7]  ( .D(N47), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[7]), .QN(n18) );
  DFFRX1M \counter_reg[6]  ( .D(N46), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[6]), .QN(n19) );
  DFFRX1M \counter_reg[5]  ( .D(N45), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[5]) );
  DFFRX1M \counter_reg[4]  ( .D(N44), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[4]), .QN(n29) );
  DFFRX1M \counter_reg[3]  ( .D(N43), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[3]), .QN(n28) );
  DFFRX1M \counter_reg[2]  ( .D(N42), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[2]), .QN(n37) );
  DFFRX1M \counter_reg[1]  ( .D(N41), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[1]), .QN(n35) );
  DFFRX1M \counter_reg[0]  ( .D(N40), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[0]), .QN(n36) );
  DFFRX1M flag_reg ( .D(n27), .CK(I_ref_clk), .RN(I_rst_n), .Q(flag) );
  DFFRX1M div_clk_reg ( .D(n26), .CK(I_ref_clk), .RN(I_rst_n), .Q(div_clk) );
  OR2X2M U3 ( .A(I_div_ratio[2]), .B(I_div_ratio[1]), .Y(n1) );
  OAI211X2M U4 ( .A0(I_div_ratio[0]), .A1(n14), .B0(n10), .C0(n13), .Y(n12) );
  CLKINVX1M U5 ( .A(I_div_ratio[1]), .Y(half_toggle[0]) );
  OAI2BB1X1M U6 ( .A0N(I_div_ratio[1]), .A1N(I_div_ratio[2]), .B0(n1), .Y(
        half_toggle[1]) );
  OR2X1M U7 ( .A(n1), .B(I_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U8 ( .A0N(n1), .A1N(I_div_ratio[3]), .B0(n2), .Y(half_toggle[2])
         );
  OR2X1M U9 ( .A(n2), .B(I_div_ratio[4]), .Y(n3) );
  OAI2BB1X1M U10 ( .A0N(n2), .A1N(I_div_ratio[4]), .B0(n3), .Y(half_toggle[3])
         );
  OR2X1M U11 ( .A(n3), .B(I_div_ratio[5]), .Y(n4) );
  OAI2BB1X1M U12 ( .A0N(n3), .A1N(I_div_ratio[5]), .B0(n4), .Y(half_toggle[4])
         );
  XNOR2X1M U13 ( .A(I_div_ratio[6]), .B(n4), .Y(half_toggle[5]) );
  NOR3X1M U14 ( .A(I_div_ratio[6]), .B(I_div_ratio[7]), .C(n4), .Y(
        half_toggle[7]) );
  OAI21X1M U15 ( .A0(I_div_ratio[6]), .A1(n4), .B0(I_div_ratio[7]), .Y(n5) );
  NAND2BX1M U16 ( .AN(half_toggle[7]), .B(n5), .Y(half_toggle[6]) );
  OR4X1M U17 ( .A(I_div_ratio[5]), .B(I_div_ratio[4]), .C(I_div_ratio[7]), .D(
        I_div_ratio[6]), .Y(n6) );
  OR4X1M U18 ( .A(I_div_ratio[3]), .B(I_div_ratio[2]), .C(I_div_ratio[1]), .D(
        n6), .Y(N7) );
  CLKMX2X2M U19 ( .A(I_ref_clk), .B(div_clk), .S0(n7), .Y(o_div_clk) );
  NOR2BX1M U20 ( .AN(I_rst_n), .B(n8), .Y(n7) );
  NOR2X1M U21 ( .A(n9), .B(n8), .Y(n27) );
  CLKXOR2X2M U22 ( .A(flag), .B(n10), .Y(n9) );
  MXI2X1M U23 ( .A(n11), .B(n12), .S0(div_clk), .Y(n26) );
  CLKNAND2X2M U24 ( .A(n13), .B(n12), .Y(n11) );
  NOR2BX1M U25 ( .AN(N25), .B(n12), .Y(N47) );
  NOR2BX1M U26 ( .AN(N24), .B(n12), .Y(N46) );
  NOR2BX1M U27 ( .AN(N23), .B(n12), .Y(N45) );
  NOR2BX1M U28 ( .AN(N22), .B(n12), .Y(N44) );
  NOR2BX1M U29 ( .AN(N21), .B(n12), .Y(N43) );
  NOR2BX1M U30 ( .AN(N20), .B(n12), .Y(N42) );
  NOR2BX1M U31 ( .AN(N19), .B(n12), .Y(N41) );
  NOR2BX1M U32 ( .AN(N18), .B(n12), .Y(N40) );
  CLKINVX1M U33 ( .A(n8), .Y(n13) );
  CLKNAND2X2M U34 ( .A(N7), .B(I_clk_en), .Y(n8) );
  CLKNAND2X2M U35 ( .A(n15), .B(I_div_ratio[0]), .Y(n10) );
  MXI2X1M U36 ( .A(n14), .B(n16), .S0(flag), .Y(n15) );
  AOI2B1X1M U37 ( .A1N(half_toggle_p[7]), .A0(counter[7]), .B0(n17), .Y(n16)
         );
  AOI221XLM U38 ( .A0(half_toggle_p[7]), .A1(n18), .B0(half_toggle_p[6]), .B1(
        n19), .C0(n20), .Y(n17) );
  AOI2B1X1M U39 ( .A1N(half_toggle_p[6]), .A0(counter[6]), .B0(n21), .Y(n20)
         );
  AOI2B1X1M U40 ( .A1N(counter[5]), .A0(half_toggle_p[5]), .B0(n22), .Y(n21)
         );
  AOI221XLM U41 ( .A0(counter[4]), .A1(n23), .B0(counter[5]), .B1(n24), .C0(
        n25), .Y(n22) );
  AOI221XLM U42 ( .A0(half_toggle_p[3]), .A1(n28), .B0(half_toggle_p[4]), .B1(
        n29), .C0(n30), .Y(n25) );
  AOI222X1M U43 ( .A0(counter[2]), .A1(n31), .B0(n32), .B1(n33), .C0(
        counter[3]), .C1(n34), .Y(n30) );
  CLKINVX1M U44 ( .A(half_toggle_p[3]), .Y(n34) );
  OAI211X1M U45 ( .A0(half_toggle_p[1]), .A1(n35), .B0(n36), .C0(
        half_toggle_p[0]), .Y(n33) );
  AOI22X1M U46 ( .A0(half_toggle_p[2]), .A1(n37), .B0(half_toggle_p[1]), .B1(
        n35), .Y(n32) );
  CLKINVX1M U47 ( .A(half_toggle_p[2]), .Y(n31) );
  CLKINVX1M U48 ( .A(half_toggle_p[5]), .Y(n24) );
  CLKINVX1M U49 ( .A(half_toggle_p[4]), .Y(n23) );
  NOR2X1M U50 ( .A(n38), .B(n39), .Y(n14) );
  AOI221XLM U51 ( .A0(n19), .A1(half_toggle[6]), .B0(n18), .B1(half_toggle[7]), 
        .C0(n40), .Y(n39) );
  OA22X1M U52 ( .A0(n41), .A1(n42), .B0(half_toggle[6]), .B1(n19), .Y(n40) );
  NOR2X1M U53 ( .A(counter[5]), .B(n43), .Y(n42) );
  AOI221XLM U54 ( .A0(counter[4]), .A1(n44), .B0(counter[5]), .B1(n43), .C0(
        n45), .Y(n41) );
  AOI221XLM U55 ( .A0(half_toggle[3]), .A1(n28), .B0(half_toggle[4]), .B1(n29), 
        .C0(n46), .Y(n45) );
  AOI222X1M U56 ( .A0(counter[2]), .A1(n47), .B0(n48), .B1(n49), .C0(
        counter[3]), .C1(n50), .Y(n46) );
  CLKINVX1M U57 ( .A(half_toggle[3]), .Y(n50) );
  OAI211X1M U58 ( .A0(half_toggle[1]), .A1(n35), .B0(n36), .C0(half_toggle[0]), 
        .Y(n49) );
  AOI22X1M U59 ( .A0(half_toggle[2]), .A1(n37), .B0(half_toggle[1]), .B1(n35), 
        .Y(n48) );
  CLKINVX1M U60 ( .A(half_toggle[2]), .Y(n47) );
  CLKINVX1M U61 ( .A(half_toggle[5]), .Y(n43) );
  CLKINVX1M U62 ( .A(half_toggle[4]), .Y(n44) );
  NOR2X1M U63 ( .A(n18), .B(half_toggle[7]), .Y(n38) );
endmodule


module RST_SYNC_NUM_STAGES2_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module ALU_16B_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n13), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n14), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n16), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n17), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n18), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n15), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n12), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n18), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n18), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n18), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n18), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n18), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n18), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n13), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n14), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n17), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n15), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n16), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n16), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n17), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n17), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n17), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  INVX2M U1 ( .A(b[0]), .Y(n19) );
  XNOR2X2M U2 ( .A(n19), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n19), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n19), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n19), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n19), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n19), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X2M U8 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  OR2X2M U9 ( .A(n19), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U10 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U11 ( .A(a[5]), .Y(n4) );
  INVX2M U12 ( .A(n19), .Y(n3) );
  NAND2X2M U13 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U14 ( .A(a[4]), .Y(n6) );
  INVX2M U15 ( .A(n19), .Y(n5) );
  NAND2X2M U16 ( .A(n7), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U17 ( .A(a[3]), .Y(n8) );
  INVX2M U18 ( .A(n19), .Y(n7) );
  NAND2X2M U19 ( .A(n7), .B(n9), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n9) );
  NAND2X2M U21 ( .A(n7), .B(n10), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U22 ( .A(a[1]), .Y(n10) );
  NAND2X2M U23 ( .A(n7), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  NAND2X2M U24 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U25 ( .A(a[6]), .Y(n2) );
  INVX2M U26 ( .A(n19), .Y(n1) );
  INVX2M U27 ( .A(a[0]), .Y(n11) );
  INVX2M U28 ( .A(b[1]), .Y(n18) );
  INVX2M U29 ( .A(b[2]), .Y(n17) );
  INVX2M U30 ( .A(b[3]), .Y(n16) );
  INVX2M U31 ( .A(b[4]), .Y(n15) );
  INVX2M U32 ( .A(b[5]), .Y(n14) );
  INVX2M U33 ( .A(b[6]), .Y(n13) );
  INVX2M U34 ( .A(b[7]), .Y(n12) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U40 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U41 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U47 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U56 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U58 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U59 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U60 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U61 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U62 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U63 ( .A(\u_div/CryTmp[7][1] ), .B(n20), .C(n18), .D(n17), .Y(
        quotient[7]) );
  AND3X1M U64 ( .A(n20), .B(n17), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U65 ( .A(\u_div/CryTmp[5][3] ), .B(n20), .Y(quotient[5]) );
  AND2X1M U66 ( .A(n21), .B(n16), .Y(n20) );
  AND2X1M U67 ( .A(\u_div/CryTmp[4][4] ), .B(n21), .Y(quotient[4]) );
  AND3X1M U68 ( .A(n22), .B(n15), .C(n14), .Y(n21) );
  AND3X1M U69 ( .A(n22), .B(n14), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U70 ( .A(\u_div/CryTmp[2][6] ), .B(n22), .Y(quotient[2]) );
  NOR2X1M U71 ( .A(b[6]), .B(b[7]), .Y(n22) );
  AND2X1M U72 ( .A(\u_div/CryTmp[1][7] ), .B(n12), .Y(quotient[1]) );
endmodule


module ALU_16B_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(B[0]), .Y(n9) );
  INVX2M U3 ( .A(B[2]), .Y(n7) );
  INVX2M U4 ( .A(B[3]), .Y(n6) );
  INVX2M U5 ( .A(B[4]), .Y(n5) );
  INVX2M U6 ( .A(B[5]), .Y(n4) );
  INVX2M U7 ( .A(B[6]), .Y(n3) );
  INVX2M U8 ( .A(B[1]), .Y(n8) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_16B_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_16B_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_16B_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_16B_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n11, n12, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n6), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n5), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n7), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n3), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  CLKXOR2X2M U10 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U12 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U13 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U14 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U15 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U16 ( .A(\ab[0][7] ), .Y(n23) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U21 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U22 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  AND2X2M U23 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U24 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U25 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  XNOR2X2M U27 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U28 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U29 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U30 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U31 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U32 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U33 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U34 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U35 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  INVX2M U37 ( .A(A[0]), .Y(n39) );
  XNOR2X2M U38 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U39 ( .A(A[2]), .Y(n37) );
  INVX2M U40 ( .A(A[3]), .Y(n36) );
  INVX2M U41 ( .A(A[4]), .Y(n35) );
  INVX2M U42 ( .A(A[6]), .Y(n33) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[5]), .Y(n34) );
  INVX2M U45 ( .A(B[6]), .Y(n25) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU_16B ( CLK, RST, A, B, EN, ALU_FUN, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, EN;
  output OUT_VALID;
  wire   OUT_VALID_COMP, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101,
         N102, N103, N104, N105, N106, N107, N108, N109, N110, N111, N112,
         N113, N114, N115, N116, N117, N118, N119, N120, N121, N122, N123,
         N124, N125, N128, N129, N130, N131, N132, N133, N134, N135, N168,
         N169, N170, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151;
  wire   [15:0] ALU_OUT_COMP;

  ALU_16B_DW_div_uns_0 div_56 ( .a({n11, n10, n9, n8, n7, n6, n5, n4}), .b(B), 
        .quotient({N135, N134, N133, N132, N131, N130, N129, N128}) );
  ALU_16B_DW01_sub_0 sub_44 ( .A({1'b0, n11, n10, n9, n8, n7, n6, n5, n4}), 
        .B({1'b0, B}), .CI(1'b0), .DIFF({N109, N108, N107, N106, N105, N104, 
        N103, N102, N101}) );
  ALU_16B_DW01_add_0 add_39 ( .A({1'b0, n11, n10, n9, n8, n7, n6, n5, n4}), 
        .B({1'b0, B}), .CI(1'b0), .SUM({N100, N99, N98, N97, N96, N95, N94, 
        N93, N92}) );
  ALU_16B_DW02_mult_0 mult_49 ( .A({n11, n10, n9, n8, n7, n6, n5, n4}), .B(B), 
        .TC(1'b0), .PRODUCT({N125, N124, N123, N122, N121, N120, N119, N118, 
        N117, N116, N115, N114, N113, N112, N111, N110}) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_COMP[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_COMP[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_COMP[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_COMP[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_COMP[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_COMP[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_COMP[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_COMP[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M OUT_VALID_reg ( .D(OUT_VALID_COMP), .CK(CLK), .RN(RST), .Q(
        OUT_VALID) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_COMP[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_COMP[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_COMP[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_COMP[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_COMP[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_COMP[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_COMP[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_COMP[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  NOR4X1M U3 ( .A(n129), .B(n3), .C(ALU_FUN[1]), .D(ALU_FUN[2]), .Y(n56) );
  BUFX2M U4 ( .A(ALU_FUN[0]), .Y(n3) );
  INVX2M U5 ( .A(n94), .Y(n131) );
  INVX2M U8 ( .A(n52), .Y(n134) );
  OAI2BB1X2M U9 ( .A0N(N124), .A1N(n39), .B0(n40), .Y(ALU_OUT_COMP[14]) );
  OAI2BB1X2M U10 ( .A0N(N125), .A1N(n39), .B0(n40), .Y(ALU_OUT_COMP[15]) );
  OAI2BB1X2M U11 ( .A0N(N122), .A1N(n39), .B0(n40), .Y(ALU_OUT_COMP[12]) );
  OAI2BB1X2M U12 ( .A0N(N123), .A1N(n39), .B0(n40), .Y(ALU_OUT_COMP[13]) );
  OAI2BB1X2M U13 ( .A0N(N119), .A1N(n39), .B0(n40), .Y(ALU_OUT_COMP[9]) );
  OAI2BB1X2M U14 ( .A0N(N120), .A1N(n39), .B0(n40), .Y(ALU_OUT_COMP[10]) );
  OAI2BB1X2M U15 ( .A0N(N121), .A1N(n39), .B0(n40), .Y(ALU_OUT_COMP[11]) );
  OAI21X2M U16 ( .A0(n136), .A1(n133), .B0(n112), .Y(n94) );
  NOR3X2M U17 ( .A(n135), .B(n136), .C(n129), .Y(n38) );
  INVX2M U18 ( .A(n57), .Y(n132) );
  AND3X2M U19 ( .A(n113), .B(n135), .C(n129), .Y(n50) );
  INVX2M U20 ( .A(n56), .Y(n127) );
  NAND2X2M U21 ( .A(n113), .B(n121), .Y(n52) );
  AND2X2M U22 ( .A(n120), .B(n137), .Y(n45) );
  AND2X2M U23 ( .A(n38), .B(n137), .Y(n44) );
  INVX2M U24 ( .A(n121), .Y(n133) );
  OAI2BB2X1M U25 ( .B0(n145), .B1(n52), .A0N(N117), .A1N(n45), .Y(n51) );
  NOR3X2M U26 ( .A(n136), .B(n3), .C(n133), .Y(n57) );
  OAI21X2M U27 ( .A0(ALU_FUN[1]), .A1(n133), .B0(n112), .Y(n55) );
  NOR3X2M U28 ( .A(ALU_FUN[2]), .B(ALU_FUN[3]), .C(n136), .Y(n120) );
  NOR2X2M U29 ( .A(n137), .B(ALU_FUN[1]), .Y(n113) );
  INVX2M U30 ( .A(ALU_FUN[1]), .Y(n136) );
  NOR2X2M U31 ( .A(n135), .B(ALU_FUN[3]), .Y(n121) );
  INVX2M U32 ( .A(ALU_FUN[2]), .Y(n135) );
  INVX2M U33 ( .A(ALU_FUN[3]), .Y(n129) );
  NAND3X2M U34 ( .A(ALU_FUN[3]), .B(n135), .C(n113), .Y(n112) );
  NAND2BX2M U35 ( .AN(n41), .B(EN), .Y(n40) );
  INVX2M U36 ( .A(n3), .Y(n137) );
  AND2X2M U37 ( .A(n45), .B(EN), .Y(n39) );
  NOR4X1M U38 ( .A(n3), .B(ALU_FUN[1]), .C(ALU_FUN[2]), .D(ALU_FUN[3]), .Y(n46) );
  AND3X2M U39 ( .A(n113), .B(ALU_FUN[3]), .C(ALU_FUN[2]), .Y(n61) );
  AOI21X2M U40 ( .A0(n3), .A1(n38), .B0(n126), .Y(OUT_VALID_COMP) );
  INVX2M U41 ( .A(EN), .Y(n126) );
  AOI31X2M U42 ( .A0(n105), .A1(n106), .A2(n107), .B0(n126), .Y(
        ALU_OUT_COMP[0]) );
  AOI22X1M U43 ( .A0(N101), .A1(n50), .B0(N92), .B1(n46), .Y(n105) );
  AOI222X1M U44 ( .A0(N110), .A1(n45), .B0(n57), .B1(n151), .C0(n4), .C1(n134), 
        .Y(n106) );
  AOI211X2M U45 ( .A0(n5), .A1(n61), .B0(n108), .C0(n109), .Y(n107) );
  OAI2BB1X2M U46 ( .A0N(N128), .A1N(n130), .B0(n114), .Y(n108) );
  AOI31X2M U47 ( .A0(N168), .A1(ALU_FUN[3]), .A2(n115), .B0(n104), .Y(n114) );
  NOR3X2M U48 ( .A(n136), .B(ALU_FUN[2]), .C(n3), .Y(n115) );
  AOI31X2M U49 ( .A0(n95), .A1(n96), .A2(n97), .B0(n126), .Y(ALU_OUT_COMP[1])
         );
  AOI222X1M U50 ( .A0(N93), .A1(n46), .B0(N111), .B1(n45), .C0(N102), .C1(n50), 
        .Y(n95) );
  AOI222X1M U51 ( .A0(n5), .A1(n134), .B0(n6), .B1(n61), .C0(n57), .C1(n122), 
        .Y(n96) );
  AOI211X2M U52 ( .A0(n4), .A1(n44), .B0(n98), .C0(n99), .Y(n97) );
  OAI2BB1X2M U53 ( .A0N(N129), .A1N(n130), .B0(n102), .Y(n98) );
  AOI31X2M U54 ( .A0(N169), .A1(n3), .A2(n103), .B0(n104), .Y(n102) );
  NOR3X2M U55 ( .A(n129), .B(ALU_FUN[2]), .C(n136), .Y(n103) );
  AOI31X2M U56 ( .A0(n87), .A1(n88), .A2(n89), .B0(n126), .Y(ALU_OUT_COMP[2])
         );
  AOI22X1M U57 ( .A0(N103), .A1(n50), .B0(N94), .B1(n46), .Y(n87) );
  AOI222X1M U58 ( .A0(N112), .A1(n45), .B0(n57), .B1(n150), .C0(n6), .C1(n134), 
        .Y(n88) );
  AOI221XLM U59 ( .A0(n5), .A1(n44), .B0(n7), .B1(n61), .C0(n90), .Y(n89) );
  OAI21X2M U60 ( .A0(n91), .A1(n143), .B0(n92), .Y(n90) );
  AOI221XLM U61 ( .A0(n56), .A1(n150), .B0(n6), .B1(n55), .C0(n134), .Y(n91)
         );
  AOI22X1M U62 ( .A0(N130), .A1(n130), .B0(n93), .B1(n143), .Y(n92) );
  OAI221X1M U63 ( .A0(n6), .A1(n131), .B0(n127), .B1(n150), .C0(n132), .Y(n93)
         );
  AOI31X2M U64 ( .A0(n80), .A1(n81), .A2(n82), .B0(n126), .Y(ALU_OUT_COMP[3])
         );
  AOI22X1M U65 ( .A0(N104), .A1(n50), .B0(N95), .B1(n46), .Y(n80) );
  AOI222X1M U66 ( .A0(N113), .A1(n45), .B0(n57), .B1(n149), .C0(n7), .C1(n134), 
        .Y(n81) );
  AOI221XLM U67 ( .A0(n6), .A1(n44), .B0(n8), .B1(n61), .C0(n83), .Y(n82) );
  OAI21X2M U68 ( .A0(n84), .A1(n142), .B0(n85), .Y(n83) );
  AOI221XLM U69 ( .A0(n56), .A1(n149), .B0(n7), .B1(n55), .C0(n134), .Y(n84)
         );
  AOI22X1M U70 ( .A0(N131), .A1(n130), .B0(n86), .B1(n142), .Y(n85) );
  OAI221X1M U71 ( .A0(n7), .A1(n131), .B0(n127), .B1(n149), .C0(n132), .Y(n86)
         );
  OAI21X2M U72 ( .A0(n77), .A1(n141), .B0(n78), .Y(n76) );
  AOI221XLM U73 ( .A0(n56), .A1(n148), .B0(n8), .B1(n55), .C0(n134), .Y(n77)
         );
  AOI22X1M U74 ( .A0(N132), .A1(n130), .B0(n79), .B1(n141), .Y(n78) );
  OAI221X1M U75 ( .A0(n8), .A1(n131), .B0(n127), .B1(n148), .C0(n132), .Y(n79)
         );
  AOI31X2M U76 ( .A0(n73), .A1(n74), .A2(n75), .B0(n126), .Y(ALU_OUT_COMP[4])
         );
  AOI22X1M U77 ( .A0(N105), .A1(n50), .B0(N96), .B1(n46), .Y(n73) );
  AOI222X1M U78 ( .A0(N114), .A1(n45), .B0(n57), .B1(n148), .C0(n8), .C1(n134), 
        .Y(n74) );
  AOI221XLM U79 ( .A0(n7), .A1(n44), .B0(n61), .B1(n9), .C0(n76), .Y(n75) );
  AOI31X2M U80 ( .A0(n66), .A1(n67), .A2(n68), .B0(n126), .Y(ALU_OUT_COMP[5])
         );
  AOI22X1M U81 ( .A0(N106), .A1(n50), .B0(N97), .B1(n46), .Y(n66) );
  AOI222X1M U82 ( .A0(N115), .A1(n45), .B0(n57), .B1(n147), .C0(n9), .C1(n134), 
        .Y(n67) );
  AOI221XLM U83 ( .A0(n8), .A1(n44), .B0(n61), .B1(n10), .C0(n69), .Y(n68) );
  AOI31X2M U84 ( .A0(n58), .A1(n59), .A2(n60), .B0(n126), .Y(ALU_OUT_COMP[6])
         );
  AOI22X1M U85 ( .A0(N107), .A1(n50), .B0(N98), .B1(n46), .Y(n58) );
  AOI221XLM U86 ( .A0(n9), .A1(n44), .B0(n61), .B1(n11), .C0(n62), .Y(n60) );
  AOI222X1M U87 ( .A0(N116), .A1(n45), .B0(n57), .B1(n146), .C0(n134), .C1(n10), .Y(n59) );
  AOI31X2M U88 ( .A0(n41), .A1(n42), .A2(n43), .B0(n126), .Y(ALU_OUT_COMP[8])
         );
  NAND2X2M U89 ( .A(N100), .B(n46), .Y(n42) );
  AOI22X1M U90 ( .A0(n11), .A1(n44), .B0(N118), .B1(n45), .Y(n43) );
  OAI21X2M U91 ( .A0(n70), .A1(n140), .B0(n71), .Y(n69) );
  AOI221XLM U92 ( .A0(n56), .A1(n147), .B0(n9), .B1(n55), .C0(n134), .Y(n70)
         );
  AOI22X1M U93 ( .A0(N133), .A1(n130), .B0(n72), .B1(n140), .Y(n71) );
  OAI221X1M U94 ( .A0(n9), .A1(n131), .B0(n127), .B1(n147), .C0(n132), .Y(n72)
         );
  INVX2M U95 ( .A(n54), .Y(n128) );
  AOI221XLM U96 ( .A0(n55), .A1(n11), .B0(n145), .B1(n56), .C0(n134), .Y(n54)
         );
  OAI221X1M U97 ( .A0(n11), .A1(n131), .B0(n145), .B1(n127), .C0(n132), .Y(n53) );
  OAI21X2M U98 ( .A0(n63), .A1(n139), .B0(n64), .Y(n62) );
  AOI221XLM U99 ( .A0(n56), .A1(n146), .B0(n10), .B1(n55), .C0(n134), .Y(n63)
         );
  AOI22X1M U100 ( .A0(N134), .A1(n130), .B0(n65), .B1(n139), .Y(n64) );
  OAI221X1M U101 ( .A0(n10), .A1(n131), .B0(n127), .B1(n146), .C0(n132), .Y(
        n65) );
  AOI21X2M U102 ( .A0(N109), .A1(n50), .B0(n94), .Y(n41) );
  INVX2M U103 ( .A(n117), .Y(n130) );
  OAI211X2M U104 ( .A0(n118), .A1(n119), .B0(n3), .C0(n120), .Y(n117) );
  NAND4X2M U105 ( .A(n141), .B(n140), .C(n139), .D(n138), .Y(n118) );
  NAND4X2M U106 ( .A(n123), .B(n144), .C(n143), .D(n142), .Y(n119) );
  AND4X2M U107 ( .A(N170), .B(ALU_FUN[3]), .C(n116), .D(ALU_FUN[2]), .Y(n104)
         );
  NOR2X2M U108 ( .A(ALU_FUN[1]), .B(n3), .Y(n116) );
  INVX2M U109 ( .A(n5), .Y(n122) );
  INVX2M U110 ( .A(n11), .Y(n145) );
  INVX2M U111 ( .A(n10), .Y(n146) );
  INVX2M U112 ( .A(n4), .Y(n151) );
  INVX2M U113 ( .A(n6), .Y(n150) );
  INVX2M U114 ( .A(n7), .Y(n149) );
  INVX2M U115 ( .A(n9), .Y(n147) );
  INVX2M U116 ( .A(n8), .Y(n148) );
  BUFX2M U117 ( .A(A[6]), .Y(n10) );
  BUFX2M U118 ( .A(A[7]), .Y(n11) );
  BUFX2M U119 ( .A(A[5]), .Y(n9) );
  BUFX2M U120 ( .A(A[4]), .Y(n8) );
  BUFX2M U121 ( .A(A[3]), .Y(n7) );
  BUFX2M U122 ( .A(A[2]), .Y(n6) );
  BUFX2M U123 ( .A(A[1]), .Y(n5) );
  BUFX2M U124 ( .A(A[0]), .Y(n4) );
  AOI31X2M U125 ( .A0(n47), .A1(n48), .A2(n49), .B0(n126), .Y(ALU_OUT_COMP[7])
         );
  AOI22X1M U126 ( .A0(n10), .A1(n44), .B0(n57), .B1(n145), .Y(n47) );
  AOI222X1M U127 ( .A0(B[7]), .A1(n128), .B0(N135), .B1(n130), .C0(n53), .C1(
        n138), .Y(n48) );
  AOI221XLM U128 ( .A0(N108), .A1(n50), .B0(N99), .B1(n46), .C0(n51), .Y(n49)
         );
  INVX2M U129 ( .A(n12), .Y(n124) );
  OAI22X1M U130 ( .A0(n110), .A1(n123), .B0(B[0]), .B1(n111), .Y(n109) );
  AOI221XLM U131 ( .A0(n56), .A1(n151), .B0(n4), .B1(n55), .C0(n134), .Y(n110)
         );
  AOI221XLM U132 ( .A0(n4), .A1(n56), .B0(n94), .B1(n151), .C0(n57), .Y(n111)
         );
  OAI22X1M U133 ( .A0(n100), .A1(n144), .B0(B[1]), .B1(n101), .Y(n99) );
  AOI221XLM U134 ( .A0(n56), .A1(n122), .B0(n5), .B1(n55), .C0(n134), .Y(n100)
         );
  AOI221XLM U135 ( .A0(n5), .A1(n56), .B0(n94), .B1(n122), .C0(n57), .Y(n101)
         );
  INVX2M U136 ( .A(n23), .Y(n125) );
  INVX2M U137 ( .A(B[0]), .Y(n123) );
  INVX2M U138 ( .A(B[6]), .Y(n139) );
  INVX2M U139 ( .A(B[3]), .Y(n142) );
  INVX2M U140 ( .A(B[2]), .Y(n143) );
  INVX2M U141 ( .A(B[4]), .Y(n141) );
  INVX2M U142 ( .A(B[5]), .Y(n140) );
  INVX2M U143 ( .A(B[1]), .Y(n144) );
  INVX2M U144 ( .A(B[7]), .Y(n138) );
  NOR2X1M U145 ( .A(n145), .B(B[7]), .Y(n34) );
  NAND2BX1M U146 ( .AN(B[4]), .B(n8), .Y(n27) );
  NAND2BX1M U147 ( .AN(n8), .B(B[4]), .Y(n16) );
  CLKNAND2X2M U148 ( .A(n27), .B(n16), .Y(n29) );
  NOR2X1M U149 ( .A(n142), .B(n7), .Y(n24) );
  NOR2X1M U150 ( .A(n143), .B(n6), .Y(n15) );
  NOR2X1M U151 ( .A(n123), .B(n4), .Y(n12) );
  CLKNAND2X2M U152 ( .A(n6), .B(n143), .Y(n26) );
  NAND2BX1M U153 ( .AN(n15), .B(n26), .Y(n21) );
  AOI21X1M U154 ( .A0(n12), .A1(n122), .B0(B[1]), .Y(n13) );
  AOI211X1M U155 ( .A0(n5), .A1(n124), .B0(n21), .C0(n13), .Y(n14) );
  CLKNAND2X2M U156 ( .A(n7), .B(n142), .Y(n25) );
  OAI31X1M U157 ( .A0(n24), .A1(n15), .A2(n14), .B0(n25), .Y(n17) );
  NAND2BX1M U158 ( .AN(n9), .B(B[5]), .Y(n32) );
  OAI211X1M U159 ( .A0(n29), .A1(n17), .B0(n16), .C0(n32), .Y(n18) );
  NAND2BX1M U160 ( .AN(B[5]), .B(n9), .Y(n28) );
  XNOR2X1M U161 ( .A(n10), .B(B[6]), .Y(n31) );
  AOI32X1M U162 ( .A0(n18), .A1(n28), .A2(n31), .B0(B[6]), .B1(n146), .Y(n19)
         );
  CLKNAND2X2M U163 ( .A(B[7]), .B(n145), .Y(n35) );
  OAI21X1M U164 ( .A0(n34), .A1(n19), .B0(n35), .Y(N170) );
  CLKNAND2X2M U165 ( .A(n4), .B(n123), .Y(n22) );
  OA21X1M U166 ( .A0(n22), .A1(n122), .B0(B[1]), .Y(n20) );
  AOI211X1M U167 ( .A0(n22), .A1(n122), .B0(n21), .C0(n20), .Y(n23) );
  AOI31X1M U168 ( .A0(n125), .A1(n26), .A2(n25), .B0(n24), .Y(n30) );
  OAI2B11X1M U169 ( .A1N(n30), .A0(n29), .B0(n28), .C0(n27), .Y(n33) );
  AOI32X1M U170 ( .A0(n33), .A1(n32), .A2(n31), .B0(n10), .B1(n139), .Y(n36)
         );
  AOI2B1X1M U171 ( .A1N(n36), .A0(n35), .B0(n34), .Y(n37) );
  CLKINVX1M U172 ( .A(n37), .Y(N169) );
  NOR2X1M U173 ( .A(N170), .B(N169), .Y(N168) );
endmodule


module FIFO_MEM_CNTRL_DATA_WIDTH8_DEPTH8_ADDR_SIZE3 ( wdata, waddr, raddr, 
        wfull, winc, wclk, RST, rdata );
  input [7:0] wdata;
  input [2:0] waddr;
  input [2:0] raddr;
  output [7:0] rdata;
  input wfull, winc, wclk, RST;
  wire   N10, N11, N12, \Reg_File[7][7] , \Reg_File[7][6] , \Reg_File[7][5] ,
         \Reg_File[7][4] , \Reg_File[7][3] , \Reg_File[7][2] ,
         \Reg_File[7][1] , \Reg_File[7][0] , \Reg_File[6][7] ,
         \Reg_File[6][6] , \Reg_File[6][5] , \Reg_File[6][4] ,
         \Reg_File[6][3] , \Reg_File[6][2] , \Reg_File[6][1] ,
         \Reg_File[6][0] , \Reg_File[5][7] , \Reg_File[5][6] ,
         \Reg_File[5][5] , \Reg_File[5][4] , \Reg_File[5][3] ,
         \Reg_File[5][2] , \Reg_File[5][1] , \Reg_File[5][0] ,
         \Reg_File[4][7] , \Reg_File[4][6] , \Reg_File[4][5] ,
         \Reg_File[4][4] , \Reg_File[4][3] , \Reg_File[4][2] ,
         \Reg_File[4][1] , \Reg_File[4][0] , \Reg_File[3][7] ,
         \Reg_File[3][6] , \Reg_File[3][5] , \Reg_File[3][4] ,
         \Reg_File[3][3] , \Reg_File[3][2] , \Reg_File[3][1] ,
         \Reg_File[3][0] , \Reg_File[2][7] , \Reg_File[2][6] ,
         \Reg_File[2][5] , \Reg_File[2][4] , \Reg_File[2][3] ,
         \Reg_File[2][2] , \Reg_File[2][1] , \Reg_File[2][0] ,
         \Reg_File[1][7] , \Reg_File[1][6] , \Reg_File[1][5] ,
         \Reg_File[1][4] , \Reg_File[1][3] , \Reg_File[1][2] ,
         \Reg_File[1][1] , \Reg_File[1][0] , \Reg_File[0][7] ,
         \Reg_File[0][6] , \Reg_File[0][5] , \Reg_File[0][4] ,
         \Reg_File[0][3] , \Reg_File[0][2] , \Reg_File[0][1] ,
         \Reg_File[0][0] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];

  DFFRQX2M \Reg_File_reg[5][7]  ( .D(n69), .CK(wclk), .RN(n100), .Q(
        \Reg_File[5][7] ) );
  DFFRQX2M \Reg_File_reg[5][6]  ( .D(n68), .CK(wclk), .RN(n100), .Q(
        \Reg_File[5][6] ) );
  DFFRQX2M \Reg_File_reg[5][5]  ( .D(n67), .CK(wclk), .RN(n100), .Q(
        \Reg_File[5][5] ) );
  DFFRQX2M \Reg_File_reg[5][4]  ( .D(n66), .CK(wclk), .RN(n100), .Q(
        \Reg_File[5][4] ) );
  DFFRQX2M \Reg_File_reg[5][3]  ( .D(n65), .CK(wclk), .RN(n100), .Q(
        \Reg_File[5][3] ) );
  DFFRQX2M \Reg_File_reg[5][2]  ( .D(n64), .CK(wclk), .RN(n100), .Q(
        \Reg_File[5][2] ) );
  DFFRQX2M \Reg_File_reg[5][1]  ( .D(n63), .CK(wclk), .RN(n100), .Q(
        \Reg_File[5][1] ) );
  DFFRQX2M \Reg_File_reg[5][0]  ( .D(n62), .CK(wclk), .RN(n100), .Q(
        \Reg_File[5][0] ) );
  DFFRQX2M \Reg_File_reg[1][7]  ( .D(n37), .CK(wclk), .RN(n102), .Q(
        \Reg_File[1][7] ) );
  DFFRQX2M \Reg_File_reg[1][6]  ( .D(n36), .CK(wclk), .RN(n102), .Q(
        \Reg_File[1][6] ) );
  DFFRQX2M \Reg_File_reg[1][5]  ( .D(n35), .CK(wclk), .RN(n102), .Q(
        \Reg_File[1][5] ) );
  DFFRQX2M \Reg_File_reg[1][4]  ( .D(n34), .CK(wclk), .RN(n102), .Q(
        \Reg_File[1][4] ) );
  DFFRQX2M \Reg_File_reg[1][3]  ( .D(n33), .CK(wclk), .RN(n103), .Q(
        \Reg_File[1][3] ) );
  DFFRQX2M \Reg_File_reg[1][2]  ( .D(n32), .CK(wclk), .RN(n103), .Q(
        \Reg_File[1][2] ) );
  DFFRQX2M \Reg_File_reg[1][1]  ( .D(n31), .CK(wclk), .RN(n103), .Q(
        \Reg_File[1][1] ) );
  DFFRQX2M \Reg_File_reg[1][0]  ( .D(n30), .CK(wclk), .RN(n103), .Q(
        \Reg_File[1][0] ) );
  DFFRQX2M \Reg_File_reg[7][7]  ( .D(n85), .CK(wclk), .RN(n99), .Q(
        \Reg_File[7][7] ) );
  DFFRQX2M \Reg_File_reg[7][6]  ( .D(n84), .CK(wclk), .RN(n99), .Q(
        \Reg_File[7][6] ) );
  DFFRQX2M \Reg_File_reg[7][5]  ( .D(n83), .CK(wclk), .RN(n99), .Q(
        \Reg_File[7][5] ) );
  DFFRQX2M \Reg_File_reg[7][4]  ( .D(n82), .CK(wclk), .RN(n99), .Q(
        \Reg_File[7][4] ) );
  DFFRQX2M \Reg_File_reg[7][3]  ( .D(n81), .CK(wclk), .RN(n99), .Q(
        \Reg_File[7][3] ) );
  DFFRQX2M \Reg_File_reg[7][2]  ( .D(n80), .CK(wclk), .RN(n99), .Q(
        \Reg_File[7][2] ) );
  DFFRQX2M \Reg_File_reg[7][1]  ( .D(n79), .CK(wclk), .RN(n99), .Q(
        \Reg_File[7][1] ) );
  DFFRQX2M \Reg_File_reg[7][0]  ( .D(n78), .CK(wclk), .RN(n99), .Q(
        \Reg_File[7][0] ) );
  DFFRQX2M \Reg_File_reg[3][7]  ( .D(n53), .CK(wclk), .RN(n101), .Q(
        \Reg_File[3][7] ) );
  DFFRQX2M \Reg_File_reg[3][6]  ( .D(n52), .CK(wclk), .RN(n101), .Q(
        \Reg_File[3][6] ) );
  DFFRQX2M \Reg_File_reg[3][5]  ( .D(n51), .CK(wclk), .RN(n101), .Q(
        \Reg_File[3][5] ) );
  DFFRQX2M \Reg_File_reg[3][4]  ( .D(n50), .CK(wclk), .RN(n101), .Q(
        \Reg_File[3][4] ) );
  DFFRQX2M \Reg_File_reg[3][3]  ( .D(n49), .CK(wclk), .RN(n101), .Q(
        \Reg_File[3][3] ) );
  DFFRQX2M \Reg_File_reg[3][2]  ( .D(n48), .CK(wclk), .RN(n101), .Q(
        \Reg_File[3][2] ) );
  DFFRQX2M \Reg_File_reg[3][1]  ( .D(n47), .CK(wclk), .RN(n101), .Q(
        \Reg_File[3][1] ) );
  DFFRQX2M \Reg_File_reg[3][0]  ( .D(n46), .CK(wclk), .RN(n102), .Q(
        \Reg_File[3][0] ) );
  DFFRQX2M \Reg_File_reg[6][7]  ( .D(n77), .CK(wclk), .RN(n99), .Q(
        \Reg_File[6][7] ) );
  DFFRQX2M \Reg_File_reg[6][6]  ( .D(n76), .CK(wclk), .RN(n99), .Q(
        \Reg_File[6][6] ) );
  DFFRQX2M \Reg_File_reg[6][5]  ( .D(n75), .CK(wclk), .RN(n99), .Q(
        \Reg_File[6][5] ) );
  DFFRQX2M \Reg_File_reg[6][4]  ( .D(n74), .CK(wclk), .RN(n99), .Q(
        \Reg_File[6][4] ) );
  DFFRQX2M \Reg_File_reg[6][3]  ( .D(n73), .CK(wclk), .RN(n99), .Q(
        \Reg_File[6][3] ) );
  DFFRQX2M \Reg_File_reg[6][2]  ( .D(n72), .CK(wclk), .RN(n100), .Q(
        \Reg_File[6][2] ) );
  DFFRQX2M \Reg_File_reg[6][1]  ( .D(n71), .CK(wclk), .RN(n100), .Q(
        \Reg_File[6][1] ) );
  DFFRQX2M \Reg_File_reg[6][0]  ( .D(n70), .CK(wclk), .RN(n100), .Q(
        \Reg_File[6][0] ) );
  DFFRQX2M \Reg_File_reg[2][7]  ( .D(n45), .CK(wclk), .RN(n102), .Q(
        \Reg_File[2][7] ) );
  DFFRQX2M \Reg_File_reg[2][6]  ( .D(n44), .CK(wclk), .RN(n102), .Q(
        \Reg_File[2][6] ) );
  DFFRQX2M \Reg_File_reg[2][5]  ( .D(n43), .CK(wclk), .RN(n102), .Q(
        \Reg_File[2][5] ) );
  DFFRQX2M \Reg_File_reg[2][4]  ( .D(n42), .CK(wclk), .RN(n102), .Q(
        \Reg_File[2][4] ) );
  DFFRQX2M \Reg_File_reg[2][3]  ( .D(n41), .CK(wclk), .RN(n102), .Q(
        \Reg_File[2][3] ) );
  DFFRQX2M \Reg_File_reg[2][2]  ( .D(n40), .CK(wclk), .RN(n102), .Q(
        \Reg_File[2][2] ) );
  DFFRQX2M \Reg_File_reg[2][1]  ( .D(n39), .CK(wclk), .RN(n102), .Q(
        \Reg_File[2][1] ) );
  DFFRQX2M \Reg_File_reg[2][0]  ( .D(n38), .CK(wclk), .RN(n102), .Q(
        \Reg_File[2][0] ) );
  DFFRQX2M \Reg_File_reg[4][7]  ( .D(n61), .CK(wclk), .RN(n100), .Q(
        \Reg_File[4][7] ) );
  DFFRQX2M \Reg_File_reg[4][6]  ( .D(n60), .CK(wclk), .RN(n100), .Q(
        \Reg_File[4][6] ) );
  DFFRQX2M \Reg_File_reg[4][5]  ( .D(n59), .CK(wclk), .RN(n101), .Q(
        \Reg_File[4][5] ) );
  DFFRQX2M \Reg_File_reg[4][4]  ( .D(n58), .CK(wclk), .RN(n101), .Q(
        \Reg_File[4][4] ) );
  DFFRQX2M \Reg_File_reg[4][3]  ( .D(n57), .CK(wclk), .RN(n101), .Q(
        \Reg_File[4][3] ) );
  DFFRQX2M \Reg_File_reg[4][2]  ( .D(n56), .CK(wclk), .RN(n101), .Q(
        \Reg_File[4][2] ) );
  DFFRQX2M \Reg_File_reg[4][1]  ( .D(n55), .CK(wclk), .RN(n101), .Q(
        \Reg_File[4][1] ) );
  DFFRQX2M \Reg_File_reg[4][0]  ( .D(n54), .CK(wclk), .RN(n101), .Q(
        \Reg_File[4][0] ) );
  DFFRQX2M \Reg_File_reg[0][7]  ( .D(n29), .CK(wclk), .RN(n103), .Q(
        \Reg_File[0][7] ) );
  DFFRQX2M \Reg_File_reg[0][6]  ( .D(n28), .CK(wclk), .RN(n103), .Q(
        \Reg_File[0][6] ) );
  DFFRQX2M \Reg_File_reg[0][5]  ( .D(n27), .CK(wclk), .RN(n103), .Q(
        \Reg_File[0][5] ) );
  DFFRQX2M \Reg_File_reg[0][4]  ( .D(n26), .CK(wclk), .RN(n103), .Q(
        \Reg_File[0][4] ) );
  DFFRQX2M \Reg_File_reg[0][3]  ( .D(n25), .CK(wclk), .RN(n103), .Q(
        \Reg_File[0][3] ) );
  DFFRQX2M \Reg_File_reg[0][2]  ( .D(n24), .CK(wclk), .RN(n103), .Q(
        \Reg_File[0][2] ) );
  DFFRQX2M \Reg_File_reg[0][1]  ( .D(n23), .CK(wclk), .RN(n103), .Q(
        \Reg_File[0][1] ) );
  DFFRQX2M \Reg_File_reg[0][0]  ( .D(n22), .CK(wclk), .RN(n103), .Q(
        \Reg_File[0][0] ) );
  NOR2BX2M U2 ( .AN(n16), .B(waddr[2]), .Y(n12) );
  BUFX2M U3 ( .A(n19), .Y(n96) );
  BUFX2M U4 ( .A(n20), .Y(n95) );
  BUFX2M U5 ( .A(n21), .Y(n94) );
  BUFX2M U6 ( .A(n97), .Y(n101) );
  BUFX2M U7 ( .A(n97), .Y(n100) );
  BUFX2M U8 ( .A(n97), .Y(n99) );
  BUFX2M U9 ( .A(n98), .Y(n102) );
  BUFX2M U10 ( .A(n98), .Y(n103) );
  BUFX2M U11 ( .A(RST), .Y(n97) );
  BUFX2M U12 ( .A(RST), .Y(n98) );
  NAND3X2M U13 ( .A(n104), .B(n113), .C(n18), .Y(n17) );
  NAND3X2M U14 ( .A(n104), .B(n113), .C(n12), .Y(n11) );
  INVX2M U15 ( .A(wdata[0]), .Y(n112) );
  INVX2M U16 ( .A(wdata[1]), .Y(n111) );
  INVX2M U17 ( .A(wdata[2]), .Y(n110) );
  INVX2M U18 ( .A(wdata[3]), .Y(n109) );
  INVX2M U19 ( .A(wdata[4]), .Y(n108) );
  INVX2M U20 ( .A(wdata[5]), .Y(n107) );
  INVX2M U21 ( .A(wdata[6]), .Y(n106) );
  INVX2M U22 ( .A(wdata[7]), .Y(n105) );
  NAND3X2M U23 ( .A(n12), .B(n104), .C(waddr[1]), .Y(n14) );
  NAND3X2M U24 ( .A(waddr[0]), .B(n12), .C(waddr[1]), .Y(n15) );
  NAND3X2M U25 ( .A(n12), .B(n113), .C(waddr[0]), .Y(n13) );
  OAI2BB2X1M U26 ( .B0(n11), .B1(n112), .A0N(\Reg_File[0][0] ), .A1N(n11), .Y(
        n22) );
  OAI2BB2X1M U27 ( .B0(n11), .B1(n111), .A0N(\Reg_File[0][1] ), .A1N(n11), .Y(
        n23) );
  OAI2BB2X1M U28 ( .B0(n11), .B1(n110), .A0N(\Reg_File[0][2] ), .A1N(n11), .Y(
        n24) );
  OAI2BB2X1M U29 ( .B0(n11), .B1(n109), .A0N(\Reg_File[0][3] ), .A1N(n11), .Y(
        n25) );
  OAI2BB2X1M U30 ( .B0(n11), .B1(n108), .A0N(\Reg_File[0][4] ), .A1N(n11), .Y(
        n26) );
  OAI2BB2X1M U31 ( .B0(n11), .B1(n107), .A0N(\Reg_File[0][5] ), .A1N(n11), .Y(
        n27) );
  OAI2BB2X1M U32 ( .B0(n11), .B1(n106), .A0N(\Reg_File[0][6] ), .A1N(n11), .Y(
        n28) );
  OAI2BB2X1M U33 ( .B0(n11), .B1(n105), .A0N(\Reg_File[0][7] ), .A1N(n11), .Y(
        n29) );
  OAI2BB2X1M U34 ( .B0(n112), .B1(n14), .A0N(\Reg_File[2][0] ), .A1N(n14), .Y(
        n38) );
  OAI2BB2X1M U35 ( .B0(n111), .B1(n14), .A0N(\Reg_File[2][1] ), .A1N(n14), .Y(
        n39) );
  OAI2BB2X1M U36 ( .B0(n110), .B1(n14), .A0N(\Reg_File[2][2] ), .A1N(n14), .Y(
        n40) );
  OAI2BB2X1M U37 ( .B0(n109), .B1(n14), .A0N(\Reg_File[2][3] ), .A1N(n14), .Y(
        n41) );
  OAI2BB2X1M U38 ( .B0(n108), .B1(n14), .A0N(\Reg_File[2][4] ), .A1N(n14), .Y(
        n42) );
  OAI2BB2X1M U39 ( .B0(n107), .B1(n14), .A0N(\Reg_File[2][5] ), .A1N(n14), .Y(
        n43) );
  OAI2BB2X1M U40 ( .B0(n106), .B1(n14), .A0N(\Reg_File[2][6] ), .A1N(n14), .Y(
        n44) );
  OAI2BB2X1M U41 ( .B0(n105), .B1(n14), .A0N(\Reg_File[2][7] ), .A1N(n14), .Y(
        n45) );
  OAI2BB2X1M U42 ( .B0(n112), .B1(n15), .A0N(\Reg_File[3][0] ), .A1N(n15), .Y(
        n46) );
  OAI2BB2X1M U43 ( .B0(n111), .B1(n15), .A0N(\Reg_File[3][1] ), .A1N(n15), .Y(
        n47) );
  OAI2BB2X1M U44 ( .B0(n110), .B1(n15), .A0N(\Reg_File[3][2] ), .A1N(n15), .Y(
        n48) );
  OAI2BB2X1M U45 ( .B0(n109), .B1(n15), .A0N(\Reg_File[3][3] ), .A1N(n15), .Y(
        n49) );
  OAI2BB2X1M U46 ( .B0(n108), .B1(n15), .A0N(\Reg_File[3][4] ), .A1N(n15), .Y(
        n50) );
  OAI2BB2X1M U47 ( .B0(n107), .B1(n15), .A0N(\Reg_File[3][5] ), .A1N(n15), .Y(
        n51) );
  OAI2BB2X1M U48 ( .B0(n106), .B1(n15), .A0N(\Reg_File[3][6] ), .A1N(n15), .Y(
        n52) );
  OAI2BB2X1M U49 ( .B0(n105), .B1(n15), .A0N(\Reg_File[3][7] ), .A1N(n15), .Y(
        n53) );
  OAI2BB2X1M U50 ( .B0(n112), .B1(n13), .A0N(\Reg_File[1][0] ), .A1N(n13), .Y(
        n30) );
  OAI2BB2X1M U51 ( .B0(n111), .B1(n13), .A0N(\Reg_File[1][1] ), .A1N(n13), .Y(
        n31) );
  OAI2BB2X1M U52 ( .B0(n110), .B1(n13), .A0N(\Reg_File[1][2] ), .A1N(n13), .Y(
        n32) );
  OAI2BB2X1M U53 ( .B0(n109), .B1(n13), .A0N(\Reg_File[1][3] ), .A1N(n13), .Y(
        n33) );
  OAI2BB2X1M U54 ( .B0(n108), .B1(n13), .A0N(\Reg_File[1][4] ), .A1N(n13), .Y(
        n34) );
  OAI2BB2X1M U55 ( .B0(n107), .B1(n13), .A0N(\Reg_File[1][5] ), .A1N(n13), .Y(
        n35) );
  OAI2BB2X1M U56 ( .B0(n106), .B1(n13), .A0N(\Reg_File[1][6] ), .A1N(n13), .Y(
        n36) );
  OAI2BB2X1M U57 ( .B0(n105), .B1(n13), .A0N(\Reg_File[1][7] ), .A1N(n13), .Y(
        n37) );
  OAI2BB2X1M U58 ( .B0(n112), .B1(n17), .A0N(\Reg_File[4][0] ), .A1N(n17), .Y(
        n54) );
  OAI2BB2X1M U59 ( .B0(n111), .B1(n17), .A0N(\Reg_File[4][1] ), .A1N(n17), .Y(
        n55) );
  OAI2BB2X1M U60 ( .B0(n110), .B1(n17), .A0N(\Reg_File[4][2] ), .A1N(n17), .Y(
        n56) );
  OAI2BB2X1M U61 ( .B0(n109), .B1(n17), .A0N(\Reg_File[4][3] ), .A1N(n17), .Y(
        n57) );
  OAI2BB2X1M U62 ( .B0(n108), .B1(n17), .A0N(\Reg_File[4][4] ), .A1N(n17), .Y(
        n58) );
  OAI2BB2X1M U63 ( .B0(n107), .B1(n17), .A0N(\Reg_File[4][5] ), .A1N(n17), .Y(
        n59) );
  OAI2BB2X1M U64 ( .B0(n106), .B1(n17), .A0N(\Reg_File[4][6] ), .A1N(n17), .Y(
        n60) );
  OAI2BB2X1M U65 ( .B0(n105), .B1(n17), .A0N(\Reg_File[4][7] ), .A1N(n17), .Y(
        n61) );
  OAI2BB2X1M U66 ( .B0(n112), .B1(n96), .A0N(\Reg_File[5][0] ), .A1N(n96), .Y(
        n62) );
  OAI2BB2X1M U67 ( .B0(n111), .B1(n96), .A0N(\Reg_File[5][1] ), .A1N(n96), .Y(
        n63) );
  OAI2BB2X1M U68 ( .B0(n110), .B1(n96), .A0N(\Reg_File[5][2] ), .A1N(n96), .Y(
        n64) );
  OAI2BB2X1M U69 ( .B0(n109), .B1(n96), .A0N(\Reg_File[5][3] ), .A1N(n96), .Y(
        n65) );
  OAI2BB2X1M U70 ( .B0(n108), .B1(n96), .A0N(\Reg_File[5][4] ), .A1N(n96), .Y(
        n66) );
  OAI2BB2X1M U71 ( .B0(n107), .B1(n96), .A0N(\Reg_File[5][5] ), .A1N(n96), .Y(
        n67) );
  OAI2BB2X1M U72 ( .B0(n106), .B1(n96), .A0N(\Reg_File[5][6] ), .A1N(n96), .Y(
        n68) );
  OAI2BB2X1M U73 ( .B0(n105), .B1(n96), .A0N(\Reg_File[5][7] ), .A1N(n96), .Y(
        n69) );
  OAI2BB2X1M U74 ( .B0(n112), .B1(n95), .A0N(\Reg_File[6][0] ), .A1N(n95), .Y(
        n70) );
  OAI2BB2X1M U75 ( .B0(n111), .B1(n95), .A0N(\Reg_File[6][1] ), .A1N(n95), .Y(
        n71) );
  OAI2BB2X1M U76 ( .B0(n110), .B1(n95), .A0N(\Reg_File[6][2] ), .A1N(n95), .Y(
        n72) );
  OAI2BB2X1M U77 ( .B0(n109), .B1(n95), .A0N(\Reg_File[6][3] ), .A1N(n95), .Y(
        n73) );
  OAI2BB2X1M U78 ( .B0(n108), .B1(n95), .A0N(\Reg_File[6][4] ), .A1N(n95), .Y(
        n74) );
  OAI2BB2X1M U79 ( .B0(n107), .B1(n95), .A0N(\Reg_File[6][5] ), .A1N(n95), .Y(
        n75) );
  OAI2BB2X1M U80 ( .B0(n106), .B1(n95), .A0N(\Reg_File[6][6] ), .A1N(n95), .Y(
        n76) );
  OAI2BB2X1M U81 ( .B0(n105), .B1(n95), .A0N(\Reg_File[6][7] ), .A1N(n95), .Y(
        n77) );
  OAI2BB2X1M U82 ( .B0(n112), .B1(n94), .A0N(\Reg_File[7][0] ), .A1N(n94), .Y(
        n78) );
  OAI2BB2X1M U83 ( .B0(n111), .B1(n94), .A0N(\Reg_File[7][1] ), .A1N(n94), .Y(
        n79) );
  OAI2BB2X1M U84 ( .B0(n110), .B1(n94), .A0N(\Reg_File[7][2] ), .A1N(n94), .Y(
        n80) );
  OAI2BB2X1M U85 ( .B0(n109), .B1(n94), .A0N(\Reg_File[7][3] ), .A1N(n94), .Y(
        n81) );
  OAI2BB2X1M U86 ( .B0(n108), .B1(n94), .A0N(\Reg_File[7][4] ), .A1N(n94), .Y(
        n82) );
  OAI2BB2X1M U87 ( .B0(n107), .B1(n94), .A0N(\Reg_File[7][5] ), .A1N(n94), .Y(
        n83) );
  OAI2BB2X1M U88 ( .B0(n106), .B1(n94), .A0N(\Reg_File[7][6] ), .A1N(n94), .Y(
        n84) );
  OAI2BB2X1M U89 ( .B0(n105), .B1(n94), .A0N(\Reg_File[7][7] ), .A1N(n94), .Y(
        n85) );
  NOR2BX2M U90 ( .AN(winc), .B(wfull), .Y(n16) );
  AND2X2M U91 ( .A(waddr[2]), .B(n16), .Y(n18) );
  NAND3X2M U92 ( .A(waddr[0]), .B(n113), .C(n18), .Y(n19) );
  NAND3X2M U93 ( .A(waddr[1]), .B(n104), .C(n18), .Y(n20) );
  NAND3X2M U94 ( .A(waddr[1]), .B(waddr[0]), .C(n18), .Y(n21) );
  INVX2M U95 ( .A(waddr[1]), .Y(n113) );
  INVX2M U96 ( .A(waddr[0]), .Y(n104) );
  MX2X2M U97 ( .A(n91), .B(n90), .S0(N12), .Y(rdata[7]) );
  MX4X1M U98 ( .A(\Reg_File[4][7] ), .B(\Reg_File[5][7] ), .C(\Reg_File[6][7] ), .D(\Reg_File[7][7] ), .S0(n92), .S1(N11), .Y(n90) );
  MX4X1M U99 ( .A(\Reg_File[0][7] ), .B(\Reg_File[1][7] ), .C(\Reg_File[2][7] ), .D(\Reg_File[3][7] ), .S0(n93), .S1(N11), .Y(n91) );
  MX2X2M U100 ( .A(n89), .B(n88), .S0(N12), .Y(rdata[6]) );
  MX4X1M U101 ( .A(\Reg_File[4][6] ), .B(\Reg_File[5][6] ), .C(
        \Reg_File[6][6] ), .D(\Reg_File[7][6] ), .S0(n92), .S1(N11), .Y(n88)
         );
  MX4X1M U102 ( .A(\Reg_File[0][6] ), .B(\Reg_File[1][6] ), .C(
        \Reg_File[2][6] ), .D(\Reg_File[3][6] ), .S0(n93), .S1(N11), .Y(n89)
         );
  MX2X2M U103 ( .A(n10), .B(n9), .S0(N12), .Y(rdata[4]) );
  MX4X1M U104 ( .A(\Reg_File[4][4] ), .B(\Reg_File[5][4] ), .C(
        \Reg_File[6][4] ), .D(\Reg_File[7][4] ), .S0(n92), .S1(N11), .Y(n9) );
  MX4X1M U105 ( .A(\Reg_File[0][4] ), .B(\Reg_File[1][4] ), .C(
        \Reg_File[2][4] ), .D(\Reg_File[3][4] ), .S0(n93), .S1(N11), .Y(n10)
         );
  MX2X2M U106 ( .A(n87), .B(n86), .S0(N12), .Y(rdata[5]) );
  MX4X1M U107 ( .A(\Reg_File[4][5] ), .B(\Reg_File[5][5] ), .C(
        \Reg_File[6][5] ), .D(\Reg_File[7][5] ), .S0(n92), .S1(N11), .Y(n86)
         );
  MX4X1M U108 ( .A(\Reg_File[0][5] ), .B(\Reg_File[1][5] ), .C(
        \Reg_File[2][5] ), .D(\Reg_File[3][5] ), .S0(n93), .S1(N11), .Y(n87)
         );
  BUFX2M U109 ( .A(N10), .Y(n93) );
  BUFX2M U110 ( .A(N10), .Y(n92) );
  MX2X2M U111 ( .A(n6), .B(n5), .S0(N12), .Y(rdata[2]) );
  MX4X1M U112 ( .A(\Reg_File[4][2] ), .B(\Reg_File[5][2] ), .C(
        \Reg_File[6][2] ), .D(\Reg_File[7][2] ), .S0(n92), .S1(N11), .Y(n5) );
  MX4X1M U113 ( .A(\Reg_File[0][2] ), .B(\Reg_File[1][2] ), .C(
        \Reg_File[2][2] ), .D(\Reg_File[3][2] ), .S0(n93), .S1(N11), .Y(n6) );
  MX2X2M U114 ( .A(n8), .B(n7), .S0(N12), .Y(rdata[3]) );
  MX4X1M U115 ( .A(\Reg_File[4][3] ), .B(\Reg_File[5][3] ), .C(
        \Reg_File[6][3] ), .D(\Reg_File[7][3] ), .S0(n92), .S1(N11), .Y(n7) );
  MX4X1M U116 ( .A(\Reg_File[0][3] ), .B(\Reg_File[1][3] ), .C(
        \Reg_File[2][3] ), .D(\Reg_File[3][3] ), .S0(n93), .S1(N11), .Y(n8) );
  MX2X2M U117 ( .A(n2), .B(n1), .S0(N12), .Y(rdata[0]) );
  MX4X1M U118 ( .A(\Reg_File[4][0] ), .B(\Reg_File[5][0] ), .C(
        \Reg_File[6][0] ), .D(\Reg_File[7][0] ), .S0(n92), .S1(N11), .Y(n1) );
  MX4X1M U119 ( .A(\Reg_File[0][0] ), .B(\Reg_File[1][0] ), .C(
        \Reg_File[2][0] ), .D(\Reg_File[3][0] ), .S0(n93), .S1(N11), .Y(n2) );
  MX2X2M U120 ( .A(n4), .B(n3), .S0(N12), .Y(rdata[1]) );
  MX4X1M U121 ( .A(\Reg_File[4][1] ), .B(\Reg_File[5][1] ), .C(
        \Reg_File[6][1] ), .D(\Reg_File[7][1] ), .S0(n92), .S1(N11), .Y(n3) );
  MX4X1M U122 ( .A(\Reg_File[0][1] ), .B(\Reg_File[1][1] ), .C(
        \Reg_File[2][1] ), .D(\Reg_File[3][1] ), .S0(n93), .S1(N11), .Y(n4) );
endmodule


module FIFO_WR_ADDR_SIZE3 ( wclk, wrst_n, winc, wq2_rptr, wptr, waddr, wfull
 );
  input [3:0] wq2_rptr;
  output [3:0] wptr;
  output [2:0] waddr;
  input wclk, wrst_n, winc;
  output wfull;
  wire   \w_binary[3] , wfull_assign, n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [3:0] w_binarynext;
  wire   [2:0] w_gray_next;

  DFFRQX2M \w_binary_reg[3]  ( .D(w_binarynext[3]), .CK(wclk), .RN(wrst_n), 
        .Q(\w_binary[3] ) );
  DFFRQX2M \w_binary_reg[2]  ( .D(w_binarynext[2]), .CK(wclk), .RN(wrst_n), 
        .Q(waddr[2]) );
  DFFRQX2M \w_binary_reg[1]  ( .D(w_binarynext[1]), .CK(wclk), .RN(wrst_n), 
        .Q(waddr[1]) );
  DFFRQX2M wfull_reg ( .D(wfull_assign), .CK(wclk), .RN(wrst_n), .Q(wfull) );
  DFFRQX2M \w_binary_reg[0]  ( .D(w_binarynext[0]), .CK(wclk), .RN(wrst_n), 
        .Q(waddr[0]) );
  DFFRQX2M \wptr_reg[3]  ( .D(w_binarynext[3]), .CK(wclk), .RN(wrst_n), .Q(
        wptr[3]) );
  DFFRQX2M \wptr_reg[2]  ( .D(w_gray_next[2]), .CK(wclk), .RN(wrst_n), .Q(
        wptr[2]) );
  DFFRQX2M \wptr_reg[1]  ( .D(w_gray_next[1]), .CK(wclk), .RN(wrst_n), .Q(
        wptr[1]) );
  DFFRQX2M \wptr_reg[0]  ( .D(w_gray_next[0]), .CK(wclk), .RN(wrst_n), .Q(
        wptr[0]) );
  CLKXOR2X2M U3 ( .A(w_binarynext[2]), .B(w_binarynext[1]), .Y(w_gray_next[1])
         );
  CLKXOR2X2M U4 ( .A(w_binarynext[1]), .B(w_binarynext[0]), .Y(w_gray_next[0])
         );
  CLKXOR2X2M U5 ( .A(w_binarynext[3]), .B(w_binarynext[2]), .Y(w_gray_next[2])
         );
  NOR4X1M U6 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(wfull_assign) );
  XNOR2X2M U7 ( .A(w_binarynext[3]), .B(wq2_rptr[3]), .Y(n1) );
  XNOR2X2M U8 ( .A(w_gray_next[2]), .B(wq2_rptr[2]), .Y(n2) );
  CLKXOR2X2M U9 ( .A(wq2_rptr[0]), .B(w_gray_next[0]), .Y(n3) );
  NOR2BX2M U10 ( .AN(winc), .B(wfull), .Y(n8) );
  XNOR2X2M U11 ( .A(n7), .B(waddr[2]), .Y(w_binarynext[2]) );
  NAND2X2M U12 ( .A(waddr[1]), .B(n6), .Y(n7) );
  AND2X2M U13 ( .A(waddr[0]), .B(n8), .Y(n6) );
  CLKXOR2X2M U14 ( .A(n6), .B(waddr[1]), .Y(w_binarynext[1]) );
  CLKXOR2X2M U15 ( .A(wq2_rptr[1]), .B(w_gray_next[1]), .Y(n4) );
  XNOR2X2M U16 ( .A(n5), .B(\w_binary[3] ), .Y(w_binarynext[3]) );
  NAND3X2M U17 ( .A(waddr[1]), .B(n6), .C(waddr[2]), .Y(n5) );
  CLKXOR2X2M U18 ( .A(n8), .B(waddr[0]), .Y(w_binarynext[0]) );
endmodule


module FIFO_RD_ADDR_SIZE3 ( rclk, rrst_n, rinc, rq2_wptr, rptr, raddr, rempty
 );
  input [3:0] rq2_wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input rclk, rrst_n, rinc;
  output rempty;
  wire   \r_binary[3] , rempty_assign, n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [2:0] r_gray_next;
  wire   [3:0] r_binarynext;

  DFFRQX2M \r_binary_reg[3]  ( .D(r_binarynext[3]), .CK(rclk), .RN(rrst_n), 
        .Q(\r_binary[3] ) );
  DFFSQX2M rempty_reg ( .D(rempty_assign), .CK(rclk), .SN(rrst_n), .Q(rempty)
         );
  DFFRQX2M \r_binary_reg[2]  ( .D(r_binarynext[2]), .CK(rclk), .RN(rrst_n), 
        .Q(raddr[2]) );
  DFFRQX2M \r_binary_reg[0]  ( .D(r_binarynext[0]), .CK(rclk), .RN(rrst_n), 
        .Q(raddr[0]) );
  DFFRQX2M \r_binary_reg[1]  ( .D(r_binarynext[1]), .CK(rclk), .RN(rrst_n), 
        .Q(raddr[1]) );
  DFFRQX2M \rptr_reg[3]  ( .D(r_binarynext[3]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[3]) );
  DFFRQX2M \rptr_reg[2]  ( .D(r_gray_next[2]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[2]) );
  DFFRQX2M \rptr_reg[1]  ( .D(r_gray_next[1]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[1]) );
  DFFRQX2M \rptr_reg[0]  ( .D(r_gray_next[0]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[0]) );
  CLKXOR2X2M U3 ( .A(r_binarynext[3]), .B(r_binarynext[2]), .Y(r_gray_next[2])
         );
  CLKXOR2X2M U4 ( .A(r_binarynext[1]), .B(r_binarynext[0]), .Y(r_gray_next[0])
         );
  CLKXOR2X2M U5 ( .A(r_binarynext[2]), .B(r_binarynext[1]), .Y(r_gray_next[1])
         );
  XNOR2X2M U6 ( .A(n7), .B(raddr[2]), .Y(r_binarynext[2]) );
  NAND2X2M U7 ( .A(raddr[1]), .B(n6), .Y(n7) );
  NOR4X1M U8 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(rempty_assign) );
  CLKXOR2X2M U9 ( .A(rq2_wptr[3]), .B(r_binarynext[3]), .Y(n2) );
  CLKXOR2X2M U10 ( .A(rq2_wptr[2]), .B(r_gray_next[2]), .Y(n1) );
  CLKXOR2X2M U11 ( .A(rq2_wptr[1]), .B(r_gray_next[1]), .Y(n4) );
  NOR2BX2M U12 ( .AN(rinc), .B(rempty), .Y(n8) );
  XNOR2X2M U13 ( .A(n5), .B(\r_binary[3] ), .Y(r_binarynext[3]) );
  NAND3X2M U14 ( .A(raddr[1]), .B(n6), .C(raddr[2]), .Y(n5) );
  AND2X2M U15 ( .A(raddr[0]), .B(n8), .Y(n6) );
  CLKXOR2X2M U16 ( .A(rq2_wptr[0]), .B(r_gray_next[0]), .Y(n3) );
  CLKXOR2X2M U17 ( .A(n6), .B(raddr[1]), .Y(r_binarynext[1]) );
  CLKXOR2X2M U18 ( .A(n8), .B(raddr[0]), .Y(r_binarynext[0]) );
endmodule


module DF_SYNC_BUS_WIDTH4_0 ( CLK, RST, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] ;

  DFFRQX2M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[3]) );
  DFFRQX2M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[2]) );
  DFFRQX2M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[1]) );
  DFFRQX2M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[0]) );
  DFFRQX2M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[3][0] ) );
  DFFRQX2M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[2][0] ) );
  DFFRQX2M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[1][0] ) );
  DFFRQX2M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[0][0] ) );
endmodule


module DF_SYNC_BUS_WIDTH4_1 ( CLK, RST, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] ;

  DFFRQX2M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[3]) );
  DFFRQX2M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[2]) );
  DFFRQX2M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[1]) );
  DFFRQX2M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[0]) );
  DFFRQX2M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[3][0] ) );
  DFFRQX2M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[2][0] ) );
  DFFRQX2M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[1][0] ) );
  DFFRQX2M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[0][0] ) );
endmodule


module ASYNC_FIFO_DATA_WIDTH8_DEPTH8_ADDR_SIZE3 ( W_CLK, W_RST, W_INC, R_CLK, 
        R_RST, R_INC, WR_DATA, FULL, EMPTY, RD_DATA );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC;
  output FULL, EMPTY;
  wire   n1, n2;
  wire   [2:0] waddr;
  wire   [2:0] raddr;
  wire   [3:0] wptr;
  wire   [3:0] wq2_rptr;
  wire   [3:0] rptr;
  wire   [3:0] rq2_wptr;

  FIFO_MEM_CNTRL_DATA_WIDTH8_DEPTH8_ADDR_SIZE3 MEM ( .wdata(WR_DATA), .waddr(
        waddr), .raddr(raddr), .wfull(FULL), .winc(W_INC), .wclk(W_CLK), .RST(
        n1), .rdata(RD_DATA) );
  FIFO_WR_ADDR_SIZE3 WR ( .wclk(W_CLK), .wrst_n(n1), .winc(W_INC), .wq2_rptr(
        wq2_rptr), .wptr(wptr), .waddr(waddr), .wfull(FULL) );
  FIFO_RD_ADDR_SIZE3 RD ( .rclk(R_CLK), .rrst_n(R_RST), .rinc(R_INC), 
        .rq2_wptr(rq2_wptr), .rptr(rptr), .raddr(raddr), .rempty(EMPTY) );
  DF_SYNC_BUS_WIDTH4_0 sync_r2w ( .CLK(W_CLK), .RST(n1), .ASYNC(rptr), .SYNC(
        wq2_rptr) );
  DF_SYNC_BUS_WIDTH4_1 sync_w2r ( .CLK(R_CLK), .RST(R_RST), .ASYNC(wptr), 
        .SYNC(rq2_wptr) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(W_RST), .Y(n2) );
endmodule


module Serializer ( CLK, RST, P_DATA, SER_EN, SER_DATA, SER_DONE );
  input [7:0] P_DATA;
  input CLK, RST, SER_EN;
  output SER_DATA, SER_DONE;
  wire   N32, n12, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [3:0] COUNT;
  wire   [7:0] S_DATA;

  DFFRQX2M \S_DATA_reg[0]  ( .D(n38), .CK(CLK), .RN(RST), .Q(S_DATA[0]) );
  DFFRQX2M \S_DATA_reg[6]  ( .D(n32), .CK(CLK), .RN(RST), .Q(S_DATA[6]) );
  DFFRQX2M \S_DATA_reg[5]  ( .D(n33), .CK(CLK), .RN(RST), .Q(S_DATA[5]) );
  DFFRQX2M \S_DATA_reg[4]  ( .D(n34), .CK(CLK), .RN(RST), .Q(S_DATA[4]) );
  DFFRQX2M \S_DATA_reg[3]  ( .D(n35), .CK(CLK), .RN(RST), .Q(S_DATA[3]) );
  DFFRQX2M \S_DATA_reg[2]  ( .D(n36), .CK(CLK), .RN(RST), .Q(S_DATA[2]) );
  DFFRQX2M \S_DATA_reg[1]  ( .D(n37), .CK(CLK), .RN(RST), .Q(S_DATA[1]) );
  DFFRQX2M SER_DONE_reg ( .D(n31), .CK(CLK), .RN(RST), .Q(SER_DONE) );
  DFFRQX2M \COUNT_reg[2]  ( .D(n39), .CK(CLK), .RN(RST), .Q(COUNT[2]) );
  DFFRQX2M \COUNT_reg[1]  ( .D(n40), .CK(CLK), .RN(RST), .Q(COUNT[1]) );
  DFFRQX2M \COUNT_reg[0]  ( .D(n41), .CK(CLK), .RN(RST), .Q(COUNT[0]) );
  DFFRQX2M SER_DATA_reg ( .D(n1), .CK(CLK), .RN(RST), .Q(SER_DATA) );
  AO22X1M U3 ( .A0(P_DATA[0]), .A1(n5), .B0(S_DATA[0]), .B1(n14), .Y(n1) );
  NAND2X2M U4 ( .A(n15), .B(n16), .Y(N32) );
  AND2X2M U5 ( .A(n27), .B(N32), .Y(n18) );
  NOR4BX1M U6 ( .AN(n6), .B(n4), .C(n2), .D(n27), .Y(n12) );
  NOR2X2M U7 ( .A(n2), .B(n30), .Y(n27) );
  NAND2X2M U8 ( .A(n27), .B(SER_EN), .Y(n15) );
  NAND2X2M U9 ( .A(n2), .B(SER_EN), .Y(n16) );
  INVX2M U10 ( .A(n30), .Y(n6) );
  AND2X2M U11 ( .A(n2), .B(N32), .Y(n19) );
  INVX2M U12 ( .A(SER_EN), .Y(n4) );
  NOR3X2M U13 ( .A(n8), .B(n7), .C(n9), .Y(n30) );
  OAI32X1M U14 ( .A0(n15), .A1(n7), .A2(n8), .B0(n28), .B1(n9), .Y(n39) );
  AND2X2M U15 ( .A(n29), .B(n15), .Y(n28) );
  AND3X2M U16 ( .A(n8), .B(n7), .C(n9), .Y(n2) );
  OAI32X1M U17 ( .A0(n15), .A1(COUNT[1]), .A2(n7), .B0(n29), .B1(n8), .Y(n40)
         );
  OAI2B1X2M U18 ( .A1N(S_DATA[0]), .A0(N32), .B0(n25), .Y(n38) );
  AOI22X1M U19 ( .A0(S_DATA[1]), .A1(n18), .B0(P_DATA[1]), .B1(n19), .Y(n25)
         );
  OAI2B1X2M U20 ( .A1N(S_DATA[1]), .A0(N32), .B0(n24), .Y(n37) );
  AOI22X1M U21 ( .A0(S_DATA[2]), .A1(n18), .B0(P_DATA[2]), .B1(n19), .Y(n24)
         );
  OAI2B1X2M U22 ( .A1N(S_DATA[2]), .A0(N32), .B0(n23), .Y(n36) );
  AOI22X1M U23 ( .A0(S_DATA[3]), .A1(n18), .B0(P_DATA[3]), .B1(n19), .Y(n23)
         );
  OAI2B1X2M U24 ( .A1N(S_DATA[3]), .A0(N32), .B0(n22), .Y(n35) );
  AOI22X1M U25 ( .A0(S_DATA[4]), .A1(n18), .B0(P_DATA[4]), .B1(n19), .Y(n22)
         );
  OAI2B1X2M U26 ( .A1N(S_DATA[4]), .A0(N32), .B0(n21), .Y(n34) );
  AOI22X1M U27 ( .A0(S_DATA[5]), .A1(n18), .B0(P_DATA[5]), .B1(n19), .Y(n21)
         );
  OAI2B1X2M U28 ( .A1N(S_DATA[5]), .A0(N32), .B0(n20), .Y(n33) );
  AOI22X1M U29 ( .A0(S_DATA[6]), .A1(n18), .B0(P_DATA[6]), .B1(n19), .Y(n20)
         );
  OAI221X1M U30 ( .A0(COUNT[0]), .A1(n15), .B0(n7), .B1(n3), .C0(n16), .Y(n41)
         );
  INVX2M U31 ( .A(n12), .Y(n3) );
  AOI2BB1X2M U32 ( .A0N(n15), .A1N(COUNT[0]), .B0(n12), .Y(n29) );
  OAI2B1X2M U33 ( .A1N(S_DATA[6]), .A0(N32), .B0(n17), .Y(n32) );
  NAND2X2M U34 ( .A(P_DATA[7]), .B(n19), .Y(n17) );
  OAI2BB2X1M U35 ( .B0(n6), .B1(n4), .A0N(SER_DONE), .A1N(n12), .Y(n31) );
  INVX2M U36 ( .A(COUNT[0]), .Y(n7) );
  INVX2M U37 ( .A(COUNT[1]), .Y(n8) );
  INVX2M U38 ( .A(COUNT[2]), .Y(n9) );
  INVX2M U39 ( .A(n16), .Y(n5) );
  OAI21X2M U40 ( .A0(n6), .A1(n4), .B0(n15), .Y(n14) );
endmodule


module uart_fsm ( CLK, RST, Data_Valid, PAR_EN, SER_DONE, SER_EN, mux_sel, 
        busy );
  output [1:0] mux_sel;
  input CLK, RST, Data_Valid, PAR_EN, SER_DONE;
  output SER_EN, busy;
  wire   n4, n5, n6, n7, n8, n9, n1, n2, n3;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  OAI2BB1X2M U3 ( .A0N(n1), .A1N(n8), .B0(n9), .Y(mux_sel[0]) );
  NAND2X2M U4 ( .A(n4), .B(n5), .Y(mux_sel[1]) );
  NAND2X2M U5 ( .A(n4), .B(n7), .Y(SER_EN) );
  NAND2BX2M U6 ( .AN(SER_EN), .B(n9), .Y(busy) );
  NOR2X2M U7 ( .A(current_state[1]), .B(current_state[2]), .Y(n8) );
  NAND3X2M U8 ( .A(current_state[0]), .B(n2), .C(current_state[1]), .Y(n4) );
  NAND3X2M U9 ( .A(n1), .B(n2), .C(current_state[1]), .Y(n5) );
  NAND2X2M U10 ( .A(current_state[1]), .B(n1), .Y(n9) );
  INVX2M U11 ( .A(current_state[0]), .Y(n1) );
  INVX2M U12 ( .A(current_state[2]), .Y(n2) );
  NAND2X2M U13 ( .A(n8), .B(current_state[0]), .Y(n7) );
  OAI31X1M U14 ( .A0(n3), .A1(PAR_EN), .A2(n4), .B0(n5), .Y(next_state[2]) );
  INVX2M U15 ( .A(SER_DONE), .Y(n3) );
  OAI211X2M U16 ( .A0(SER_DONE), .A1(n4), .B0(n6), .C0(n7), .Y(next_state[0])
         );
  NAND2X2M U17 ( .A(Data_Valid), .B(n8), .Y(n6) );
  AOI2BB1X2M U18 ( .A0N(current_state[1]), .A1N(current_state[0]), .B0(
        current_state[2]), .Y(next_state[1]) );
endmodule


module parity_calc ( CLK, RST, P_DATA, Data_Valid, PAR_TYP, busy_par, par_bit
 );
  input [7:0] P_DATA;
  input CLK, RST, Data_Valid, PAR_TYP, busy_par;
  output par_bit;
  wire   n1, n2, n3, n4, n5, n6, n7;

  DFFRQX2M par_bit_reg ( .D(n7), .CK(CLK), .RN(RST), .Q(par_bit) );
  XOR3XLM U2 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U3 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XNOR2X2M U4 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n7) );
  NAND2BX2M U6 ( .AN(busy_par), .B(Data_Valid), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
endmodule


module mux ( CLK, RST, mux_sel, SER_DATA, par_bit, TX_OUT );
  input [1:0] mux_sel;
  input CLK, RST, SER_DATA, par_bit;
  output TX_OUT;
  wire   n2, n3, n1;

  OAI21X4M U3 ( .A0(n2), .A1(n1), .B0(n3), .Y(TX_OUT) );
  NAND3X2M U4 ( .A(SER_DATA), .B(n1), .C(mux_sel[1]), .Y(n3) );
  INVX2M U5 ( .A(mux_sel[0]), .Y(n1) );
  NOR2BX2M U6 ( .AN(mux_sel[1]), .B(par_bit), .Y(n2) );
endmodule


module UART_TX ( CLK, RST, P_DATA, Data_Valid, PAR_EN, PAR_TYP, TX_OUT, busy
 );
  input [7:0] P_DATA;
  input CLK, RST, Data_Valid, PAR_EN, PAR_TYP;
  output TX_OUT, busy;
  wire   SER_EN, SER_DATA, SER_DONE, par_bit;
  wire   [1:0] mux_sel;

  Serializer DUT1 ( .CLK(CLK), .RST(RST), .P_DATA(P_DATA), .SER_EN(SER_EN), 
        .SER_DATA(SER_DATA), .SER_DONE(SER_DONE) );
  uart_fsm DUT2 ( .CLK(CLK), .RST(RST), .Data_Valid(Data_Valid), .PAR_EN(
        PAR_EN), .SER_DONE(SER_DONE), .SER_EN(SER_EN), .mux_sel(mux_sel), 
        .busy(busy) );
  parity_calc DUT3 ( .CLK(CLK), .RST(RST), .P_DATA(P_DATA), .Data_Valid(
        Data_Valid), .PAR_TYP(PAR_TYP), .busy_par(busy), .par_bit(par_bit) );
  mux DUT4 ( .CLK(CLK), .RST(RST), .mux_sel(mux_sel), .SER_DATA(SER_DATA), 
        .par_bit(par_bit), .TX_OUT(TX_OUT) );
endmodule


module ClkDiv_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_1_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_1 ( I_ref_clk, I_rst_n, I_clk_en, I_div_ratio, o_div_clk );
  input [7:0] I_div_ratio;
  input I_ref_clk, I_rst_n, I_clk_en;
  output o_div_clk;
  wire   div_clk, flag, N7, N18, N19, N20, N21, N22, N23, N24, N25, N40, N41,
         N42, N43, N44, N45, N46, N47, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52;
  wire   [7:0] half_toggle;
  wire   [7:0] half_toggle_p;
  wire   [7:0] counter;

  ClkDiv_1_DW01_inc_0 add_49 ( .A(counter), .SUM({N25, N24, N23, N22, N21, N20, 
        N19, N18}) );
  ClkDiv_1_DW01_inc_1 add_20 ( .A(half_toggle), .SUM(half_toggle_p) );
  DFFRQX2M div_clk_reg ( .D(n52), .CK(I_ref_clk), .RN(I_rst_n), .Q(div_clk) );
  DFFRQX2M \counter_reg[7]  ( .D(N47), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[7]) );
  DFFRQX2M flag_reg ( .D(n51), .CK(I_ref_clk), .RN(I_rst_n), .Q(flag) );
  DFFRQX2M \counter_reg[0]  ( .D(N40), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[1]  ( .D(N41), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[1]) );
  DFFRQX2M \counter_reg[6]  ( .D(N46), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[4]  ( .D(N44), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[3]  ( .D(N43), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[2]  ( .D(N42), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[5]  ( .D(N45), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[5]) );
  OR2X2M U3 ( .A(I_div_ratio[2]), .B(I_div_ratio[1]), .Y(n1) );
  OAI211X2M U4 ( .A0(I_div_ratio[0]), .A1(n14), .B0(n10), .C0(n13), .Y(n12) );
  CLKINVX1M U5 ( .A(I_div_ratio[1]), .Y(half_toggle[0]) );
  OAI2BB1X1M U6 ( .A0N(I_div_ratio[1]), .A1N(I_div_ratio[2]), .B0(n1), .Y(
        half_toggle[1]) );
  OR2X1M U7 ( .A(n1), .B(I_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U8 ( .A0N(n1), .A1N(I_div_ratio[3]), .B0(n2), .Y(half_toggle[2])
         );
  OR2X1M U9 ( .A(n2), .B(I_div_ratio[4]), .Y(n3) );
  OAI2BB1X1M U10 ( .A0N(n2), .A1N(I_div_ratio[4]), .B0(n3), .Y(half_toggle[3])
         );
  OR2X1M U11 ( .A(n3), .B(I_div_ratio[5]), .Y(n4) );
  OAI2BB1X1M U12 ( .A0N(n3), .A1N(I_div_ratio[5]), .B0(n4), .Y(half_toggle[4])
         );
  XNOR2X1M U13 ( .A(I_div_ratio[6]), .B(n4), .Y(half_toggle[5]) );
  NOR3X1M U14 ( .A(I_div_ratio[6]), .B(I_div_ratio[7]), .C(n4), .Y(
        half_toggle[7]) );
  OAI21X1M U15 ( .A0(I_div_ratio[6]), .A1(n4), .B0(I_div_ratio[7]), .Y(n5) );
  NAND2BX1M U16 ( .AN(half_toggle[7]), .B(n5), .Y(half_toggle[6]) );
  OR4X1M U17 ( .A(I_div_ratio[5]), .B(I_div_ratio[4]), .C(I_div_ratio[7]), .D(
        I_div_ratio[6]), .Y(n6) );
  OR4X1M U18 ( .A(I_div_ratio[3]), .B(I_div_ratio[2]), .C(I_div_ratio[1]), .D(
        n6), .Y(N7) );
  CLKMX2X2M U19 ( .A(I_ref_clk), .B(div_clk), .S0(n7), .Y(o_div_clk) );
  NOR2BX1M U20 ( .AN(I_rst_n), .B(n8), .Y(n7) );
  NOR2X1M U21 ( .A(n9), .B(n8), .Y(n51) );
  CLKXOR2X2M U22 ( .A(flag), .B(n10), .Y(n9) );
  MXI2X1M U23 ( .A(n11), .B(n12), .S0(div_clk), .Y(n52) );
  CLKNAND2X2M U24 ( .A(n13), .B(n12), .Y(n11) );
  NOR2BX1M U25 ( .AN(N25), .B(n12), .Y(N47) );
  NOR2BX1M U26 ( .AN(N24), .B(n12), .Y(N46) );
  NOR2BX1M U27 ( .AN(N23), .B(n12), .Y(N45) );
  NOR2BX1M U28 ( .AN(N22), .B(n12), .Y(N44) );
  NOR2BX1M U29 ( .AN(N21), .B(n12), .Y(N43) );
  NOR2BX1M U30 ( .AN(N20), .B(n12), .Y(N42) );
  NOR2BX1M U31 ( .AN(N19), .B(n12), .Y(N41) );
  NOR2BX1M U32 ( .AN(N18), .B(n12), .Y(N40) );
  CLKINVX1M U33 ( .A(n8), .Y(n13) );
  CLKNAND2X2M U34 ( .A(N7), .B(I_clk_en), .Y(n8) );
  CLKNAND2X2M U35 ( .A(n15), .B(I_div_ratio[0]), .Y(n10) );
  MXI2X1M U36 ( .A(n14), .B(n16), .S0(flag), .Y(n15) );
  AOI2B1X1M U37 ( .A1N(half_toggle_p[7]), .A0(counter[7]), .B0(n17), .Y(n16)
         );
  AOI221XLM U38 ( .A0(half_toggle_p[7]), .A1(n18), .B0(half_toggle_p[6]), .B1(
        n19), .C0(n20), .Y(n17) );
  AOI2B1X1M U39 ( .A1N(half_toggle_p[6]), .A0(counter[6]), .B0(n21), .Y(n20)
         );
  AOI2B1X1M U40 ( .A1N(counter[5]), .A0(half_toggle_p[5]), .B0(n22), .Y(n21)
         );
  AOI221XLM U41 ( .A0(counter[4]), .A1(n23), .B0(counter[5]), .B1(n24), .C0(
        n25), .Y(n22) );
  AOI221XLM U42 ( .A0(half_toggle_p[3]), .A1(n28), .B0(half_toggle_p[4]), .B1(
        n29), .C0(n30), .Y(n25) );
  AOI222X1M U43 ( .A0(counter[2]), .A1(n31), .B0(n32), .B1(n33), .C0(
        counter[3]), .C1(n34), .Y(n30) );
  CLKINVX1M U44 ( .A(half_toggle_p[3]), .Y(n34) );
  OAI211X1M U45 ( .A0(half_toggle_p[1]), .A1(n35), .B0(n36), .C0(
        half_toggle_p[0]), .Y(n33) );
  AOI22X1M U46 ( .A0(half_toggle_p[2]), .A1(n37), .B0(half_toggle_p[1]), .B1(
        n35), .Y(n32) );
  CLKINVX1M U47 ( .A(half_toggle_p[2]), .Y(n31) );
  CLKINVX1M U48 ( .A(half_toggle_p[5]), .Y(n24) );
  CLKINVX1M U49 ( .A(half_toggle_p[4]), .Y(n23) );
  NOR2X1M U50 ( .A(n38), .B(n39), .Y(n14) );
  AOI221XLM U51 ( .A0(n19), .A1(half_toggle[6]), .B0(n18), .B1(half_toggle[7]), 
        .C0(n40), .Y(n39) );
  OA22X1M U52 ( .A0(n41), .A1(n42), .B0(half_toggle[6]), .B1(n19), .Y(n40) );
  NOR2X1M U53 ( .A(counter[5]), .B(n43), .Y(n42) );
  AOI221XLM U54 ( .A0(counter[4]), .A1(n44), .B0(counter[5]), .B1(n43), .C0(
        n45), .Y(n41) );
  AOI221XLM U55 ( .A0(half_toggle[3]), .A1(n28), .B0(half_toggle[4]), .B1(n29), 
        .C0(n46), .Y(n45) );
  AOI222X1M U56 ( .A0(counter[2]), .A1(n47), .B0(n48), .B1(n49), .C0(
        counter[3]), .C1(n50), .Y(n46) );
  CLKINVX1M U57 ( .A(half_toggle[3]), .Y(n50) );
  OAI211X1M U58 ( .A0(half_toggle[1]), .A1(n35), .B0(n36), .C0(half_toggle[0]), 
        .Y(n49) );
  CLKINVX1M U59 ( .A(counter[0]), .Y(n36) );
  AOI22X1M U60 ( .A0(half_toggle[2]), .A1(n37), .B0(half_toggle[1]), .B1(n35), 
        .Y(n48) );
  CLKINVX1M U61 ( .A(counter[1]), .Y(n35) );
  CLKINVX1M U62 ( .A(counter[2]), .Y(n37) );
  CLKINVX1M U63 ( .A(half_toggle[2]), .Y(n47) );
  CLKINVX1M U64 ( .A(counter[4]), .Y(n29) );
  CLKINVX1M U65 ( .A(counter[3]), .Y(n28) );
  CLKINVX1M U66 ( .A(half_toggle[5]), .Y(n43) );
  CLKINVX1M U67 ( .A(half_toggle[4]), .Y(n44) );
  CLKINVX1M U68 ( .A(counter[6]), .Y(n19) );
  NOR2X1M U69 ( .A(n18), .B(half_toggle[7]), .Y(n38) );
  CLKINVX1M U70 ( .A(counter[7]), .Y(n18) );
endmodule


module pulse_gen ( CLK, RST, LVL_SIG, PULSE_SIG );
  input CLK, RST, LVL_SIG;
  output PULSE_SIG;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(LVL_SIG), .CK(CLK), .RN(RST), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(CLK), .RN(RST), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(PULSE_SIG) );
endmodule


module SYS_TOP ( REF_CLK, UART_CLK, RST_N, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input REF_CLK, UART_CLK, RST_N, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   RX_CLK, SYNC_RST2, data_valid, SYNC_RST1, RX_D_VLD, WrEn, RdEn,
         Rd_D_Vld, OUT_Valid, EN, CLK_EN, TX_D_VLD, FIFO_Full, ALU_CLK, TX_CLK,
         RD_INC, F_EMPTY, Busy, n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [7:0] REG2internal;
  wire   [7:0] P_DATA;
  wire   [7:0] RX_P_DATA;
  wire   [7:0] WrData;
  wire   [3:0] Address;
  wire   [7:0] Rd_D;
  wire   [7:0] REG0internal;
  wire   [7:0] REG1internal;
  wire   [7:0] REG3internal;
  wire   [15:0] ALU_OUT;
  wire   [3:0] ALU_FUN;
  wire   [7:0] TX_P_DATA;
  wire   [7:0] ratio;
  wire   [7:0] RD_DATA;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  UART_RX_TOP RX ( .CLK(RX_CLK), .RST(n7), .RX_IN(n2), .Prescale(
        REG2internal[7:2]), .PAR_EN(REG2internal[0]), .PAR_TYP(REG2internal[1]), .P_DATA(P_DATA), .Parity_Error(parity_error), .Stop_Error(framing_error), 
        .data_valid(data_valid) );
  DATA_SYNC_NUM_STAGES2 Data_sync ( .CLK(REF_CLK), .RST(n5), .Unsync_bus(
        P_DATA), .bus_enable(data_valid), .sync_bus(RX_P_DATA), .enable_pulse(
        RX_D_VLD) );
  Register_file_ADDR_WIDTH4_WIDTH8_DEPTH16 REGISTER ( .WrData(WrData), 
        .Address({Address[3:2], n4, n3}), .WrEn(WrEn), .RdEn(RdEn), .CLK(
        REF_CLK), .RST(n5), .RdData(Rd_D), .RdData_Valid(Rd_D_Vld), .REG0(
        REG0internal), .REG1(REG1internal), .REG2(REG2internal), .REG3(
        REG3internal) );
  system_control U_system_control ( .CLK(REF_CLK), .RST(n5), .FIFO_Full(
        FIFO_Full), .ALU_OUT(ALU_OUT), .OUT_Valid(OUT_Valid), .Rd_D(Rd_D), 
        .Rd_D_Vld(Rd_D_Vld), .RX_P_DATA(RX_P_DATA), .RX_D_VLD(RX_D_VLD), 
        .ALU_FUN(ALU_FUN), .EN(EN), .CLK_EN(CLK_EN), .Address(Address), .WrEn(
        WrEn), .RdEn(RdEn), .WrData(WrData), .TX_P_DATA(TX_P_DATA), .TX_D_VLD(
        TX_D_VLD) );
  P_MUX Prescalemux ( .sel(REG2internal[7:2]), .ratio({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, ratio[3:0]}) );
  ClkDiv_0 clock_divider_RX ( .I_ref_clk(UART_CLK), .I_rst_n(n7), .I_clk_en(
        1'b1), .I_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, ratio[3:0]}), .o_div_clk(
        RX_CLK) );
  RST_SYNC_NUM_STAGES2_0 RSTSYNC1 ( .RST(RST_N), .CLK(REF_CLK), .SYNC_RST(
        SYNC_RST1) );
  RST_SYNC_NUM_STAGES2_1 RSTSYNC2 ( .RST(RST_N), .CLK(UART_CLK), .SYNC_RST(
        SYNC_RST2) );
  CLK_GATE CLK_GATE ( .CLK_EN(CLK_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK) );
  ALU_16B ALU ( .CLK(ALU_CLK), .RST(n5), .A(REG0internal), .B(REG1internal), 
        .EN(EN), .ALU_FUN(ALU_FUN), .ALU_OUT(ALU_OUT), .OUT_VALID(OUT_Valid)
         );
  ASYNC_FIFO_DATA_WIDTH8_DEPTH8_ADDR_SIZE3 FIFO ( .W_CLK(REF_CLK), .W_RST(n5), 
        .W_INC(TX_D_VLD), .R_CLK(TX_CLK), .R_RST(n7), .R_INC(RD_INC), 
        .WR_DATA(TX_P_DATA), .FULL(FIFO_Full), .EMPTY(F_EMPTY), .RD_DATA(
        RD_DATA) );
  UART_TX TX ( .CLK(TX_CLK), .RST(n7), .P_DATA(RD_DATA), .Data_Valid(n1), 
        .PAR_EN(REG2internal[0]), .PAR_TYP(REG2internal[1]), .TX_OUT(UART_TX_O), .busy(Busy) );
  ClkDiv_1 clock_divider_TX ( .I_ref_clk(UART_CLK), .I_rst_n(n7), .I_clk_en(
        1'b1), .I_div_ratio(REG3internal), .o_div_clk(TX_CLK) );
  pulse_gen pulse_gen ( .CLK(TX_CLK), .RST(n7), .LVL_SIG(Busy), .PULSE_SIG(
        RD_INC) );
  INVX4M U3 ( .A(n6), .Y(n5) );
  BUFX2M U4 ( .A(Address[0]), .Y(n3) );
  BUFX2M U5 ( .A(Address[1]), .Y(n4) );
  BUFX2M U6 ( .A(UART_RX_IN), .Y(n2) );
  INVX2M U7 ( .A(F_EMPTY), .Y(n1) );
  INVX2M U8 ( .A(SYNC_RST1), .Y(n6) );
  INVX4M U9 ( .A(n8), .Y(n7) );
  INVX2M U10 ( .A(SYNC_RST2), .Y(n8) );
endmodule

