module DSP_TOP #(parameter RSTTYPE = "SYNC",
 A0_REG = 1'b0,
 B0_REG = 1'b0,
 A1_REG = 1'b1,
 B1_REG = 1'b1,
 CREG = 1'b1,
 DREG = 1'b1,
 MREG = 1'b1,
 PREG = 1'b1,
 CARRYINREG = 1'b1,
 CARRYOUTREG = 1'b1,
 OPMODEREG = 1'b1,
 CARRYINSEL = "OPMODE5",
 B_INPUT = "DIRECT"
)(
    input wire CLK,
    input wire CEA,
    input wire CEB,
    input wire CEC,
    input wire CED, 
    input wire CEM, 
    input wire CEP, 
    input wire CEOPMODE, 
    input wire CECARRYIN, 
    input wire RSTA,
    input wire RSTB,
    input wire RSTC,
    input wire RSTD,
    input wire RSTM,
    input wire RSTP,
    input wire RSTOPMODE,
    input wire RSTCARRYIN,
    input wire [7:0] opmode,
    input wire [17:0] BCIN,
    input wire [17:0] A,
    input wire [17:0] B,
    input wire [47:0] C,
    input wire [17:0] D,
    input wire [47:0] PCIN,
    input wire  CARRYIN,
    output wire CARRYOUT,
    output wire CARRYOUTF,
    output wire [17:0] BCOUT,
    output wire [47:0] PCOUT,
    output wire [47:0] P,
    output wire [35:0] M
    
);
    wire [17:0] b0_out; //
    wire [17:0] D0_REG_out;
    wire [17:0] B0_REG_out;
    wire [17:0] B1_REG_out;
    wire [17:0] A0_REG_out;
    wire [17:0] A1_REG_out;
    wire [47:0] P_REG_out;
    wire [47:0] C0_REG_out;
    wire [17:0] B0;
    wire [17:0] A1;
    wire [35:0] mul1;
    wire [35:0] M_REG_out;
    wire [17:0] B1_in;
    wire [17:0] A0;
    wire [17:0] D0;
    wire [47:0] C0;
    wire [47:0] MX1;
    wire [47:0] CZ1;
    wire car0;
    wire CYI0;
    wire CIN;
    wire COUT;
    wire CYO_REG_out;
    wire [17:0] adder_out0;
    wire [47:0] adder_out1;
    ////////////////////////
bcin_mux #(.DATA(B_INPUT)) mux0(
    .mux_in(B),
    .BCIN(BCIN),
    .mux_out(b0_out)
    );
/////////////////////////////////////
REG0  #(.RSTTYPE("SYNC"),.Width(18),.regenable(1)) regb0
(
    .CLK(CLK),
    .RSTA(RSTB),
    .A_in(b0_out),
    .CEA(CEB),
    .A_out(B0_REG_out)
);
 mux_0 #(.Width(18)) MUXB0 (
        .mux_reg_in(B0_REG_out),
        .mux_in(b0_out),
        .regenable(B0_REG),
        .mux_out(B0)
    ); 
/////////////////////////////////////
REG0  #(.RSTTYPE("SYNC"),.Width(18),.regenable(1)) regd0
(
    .CLK(CLK),
    .RSTA(RSTD),
    .A_in(D),
    .CEA(CED),
    .A_out(D0_REG_out)
);
 mux_0 #(.Width(18)) MUXD0 (
        .mux_reg_in(D0_REG_out),
        .mux_in(D),
        .regenable(DREG),
        .mux_out(D0)
    );
/////////////////////////////////////    
ADDR_SUB #(.Width(18)) Addr1(
    .IN1(D0),
    .IN2(B0),
    .opmode6(opmode[6]),
    .cin(1'b0),
    .out(adder_out0),
    .cout()
);
/////////////////////////////////////
REG0  #(.RSTTYPE("SYNC"),.Width(18),.regenable(1)) regA0
(
    .CLK(CLK),
    .RSTA(RSTA),
    .A_in(A),
    .CEA(CEA),
    .A_out(A0_REG_out)
);
 mux_0 #(.Width(18)) MUXA0 (
        .mux_reg_in(A0_REG_out),
        .mux_in(A),
        .regenable(A0_REG),
        .mux_out(A0)
    );
///////////////////////////////////// 
REG0  #(.RSTTYPE("SYNC"),.Width(48),.regenable(1)) regC0
(
    .CLK(CLK),
    .RSTA(RSTC),
    .A_in(C),
    .CEA(CEC),
    .A_out(C0_REG_out)
);
 mux_0 #(.Width(48)) MUXC0 (
        .mux_reg_in(C0_REG_out),
        .mux_in(C),
        .regenable(CREG),
        .mux_out(C0)
    );
/////////////////////////////////////
mux_sel muxsel (
    .mux_in1(adder_out0),
    .mux_in2(B0),
    .opmode(opmode[4]),
    .mux_out(B1_in)
    );
/////////////////////////////////////
REG0  #(.RSTTYPE("SYNC"),.Width(18),.regenable(1)) regB1
(
    .CLK(CLK),
    .RSTA(RSTB),
    .A_in(B1_in),
    .CEA(CEB),
    .A_out(B1_REG_out)
);
 mux_0 #(.Width(18)) MUXB1 (
        .mux_reg_in(B1_REG_out),
        .mux_in(B1_in),
        .regenable(B1_REG),
        .mux_out(BCOUT)
    );
/////////////////////////////////////   
REG0  #(.RSTTYPE("SYNC"),.Width(18),.regenable(1)) regA1
(
    .CLK(CLK),
    .RSTA(RSTA),
    .A_in(A0),
    .CEA(CEA),
    .A_out(A1_REG_out)
);
 mux_0 #(.Width(18)) MUXA1 (
        .mux_reg_in(A1_REG_out),
        .mux_in(A0),
        .regenable(A1_REG),
        .mux_out(A1)
    );
/////////////////////////////////////
mul #(.Width(18)) Dmul1(
    .IN1(BCOUT),
    .IN2(A1),
    .out(mul1)
);    
/////////////////////////////////////
REG0  #(.RSTTYPE("SYNC"),.Width(36),.regenable(1)) regM1
(
    .CLK(CLK),
    .RSTA(RSTM),
    .A_in(mul1),
    .CEA(CEM),
    .A_out(M_REG_out)
);
 mux_0 #(.Width(36)) MUXM1 (
        .mux_reg_in(M_REG_out),
        .mux_in(mul1),
        .regenable(MREG),
        .mux_out(M)
    );  
/////////////////////////////////////  
carry_mux #(.CARRYINSEL(CARRYINSEL)) carrymux0(
    .mux_in(opmode[5]),
    .CARRYIN(CARRYIN),
    .mux_out(car0)
    );
/////////////////////////////////////
REG0  #(.RSTTYPE("SYNC"),.Width(1),.regenable(1)) CYI
(
    .CLK(CLK),
    .RSTA(RSTCARRYIN),
    .A_in(car0),
    .CEA(CECARRYIN),
    .A_out(CYI0)
);
/////////////////////////////////////
 mux_0 #(.Width(1)) MUXCI1 (
        .mux_reg_in(CYI0),
        .mux_in(car0),
        .regenable(CARRYINREG),
        .mux_out(CIN)
    );  
/////////////////////////////////////
 mux4_1 mux41(
    .opmode(opmode[1:0]),
    .IN1({12'b0,M}),
    .IN2(PCOUT),
    .IN3({D0[11:0],A1,BCOUT}),
    .out(MX1)
 ); 
/////////////////////////////////////
 mux4_1 mux42(
    .opmode(opmode[3:2]),
    .IN1(PCIN),
    .IN2(P),
    .IN3(C0),
    .out(CZ1)
 ); 
/////////////////////////////////////
ADDR_SUB1 #(.Width(48))Addr2(
    .IN1(MX1),
    .IN2(CZ1),
    .opmode7(opmode[7]),
    .cin(CIN),
    .out(adder_out1),
    .cout(COUT)
);
/////////////////////////////////////
REG0  #(.RSTTYPE("SYNC"),.Width(1),.regenable(1)) regcout
(
    .CLK(CLK),
    .RSTA(RSTOPMODE),
    .A_in(COUT),
    .CEA(CEOPMODE),
    .A_out(CYO_REG_out)
);
/////////////////////////////////////
 mux_0 #(.Width(1)) MUXCOUT (
        .mux_reg_in(CYO_REG_out),
        .mux_in(COUT),
        .regenable(CARRYOUTREG),
        .mux_out(CARRYOUT)
    );  
/////////////////////////////////////
REG0  #(.RSTTYPE("SYNC"),.Width(48),.regenable(1)) regP
(
    .CLK(CLK),
    .RSTA(RSTP),
    .A_in(adder_out1),
    .CEA(CEP),
    .A_out(P_REG_out)
);
/////////////////////////////////////
 mux_0 #(.Width(48)) MUXP (
        .mux_reg_in(P_REG_out),
        .mux_in(adder_out1),
        .regenable(PREG),
        .mux_out(P)
    );  
/////////////////////////////////////
assign CARRYOUTF = CARRYOUT;
assign PCOUT = P;
endmodule
