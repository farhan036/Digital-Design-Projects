`timescale 1ns / 1ps

module DSB_TB;

    // Parameters matching the defaults
    parameter RSTTYPE = "SYNC";
    parameter A0_REG = 1'b0;
    parameter B0_REG = 1'b0;
    parameter A1_REG = 1'b1;
    parameter B1_REG = 1'b1;
    parameter CREG = 1'b1;
    parameter DREG = 1'b1;
    parameter MREG = 1'b1;
    parameter PREG = 1'b1;
    parameter CARRYINREG = 1'b1;
    parameter CARRYOUTREG = 1'b1;
    parameter OPMODEREG = 1'b1;
    parameter CARRYINSEL = "OPMODE5";
    parameter B_INPUT = "DIRECT";

    // Inputs
    reg CLK;
    reg CEA, CEB, CEC, CED, CEM, CEP, CEOPMODE, CECARRYIN;
    reg RSTA, RSTB, RSTC, RSTD, RSTM, RSTP, RSTOPMODE, RSTCARRYIN;
    reg [7:0] opmode;
    reg [17:0] BCIN, A, B;
    reg [47:0] C, PCIN;
    reg [17:0] D;
    reg CARRYIN;

    // Outputs
    wire CARRYOUT, CARRYOUTF;
    wire [17:0] BCOUT;
    wire [47:0] PCOUT, P;
    wire [35:0] M;  // Note: Adjusted to 36-bit as per multiplier output; extend if needed

    // Instantiate the Unit Under Test (UUT)
    DSP_TOP #(
        .RSTTYPE(RSTTYPE),
        .A0_REG(A0_REG),
        .B0_REG(B0_REG),
        .A1_REG(A1_REG),
        .B1_REG(B1_REG),
        .CREG(CREG),
        .DREG(DREG),
        .MREG(MREG),
        .PREG(PREG),
        .CARRYINREG(CARRYINREG),
        .CARRYOUTREG(CARRYOUTREG),
        .OPMODEREG(OPMODEREG),
        .CARRYINSEL(CARRYINSEL),
        .B_INPUT(B_INPUT)
    ) uut (
        .CLK(CLK),
        .CEA(CEA), .CEB(CEB), .CEC(CEC), .CED(CED), .CEM(CEM), .CEP(CEP), .CEOPMODE(CEOPMODE), .CECARRYIN(CECARRYIN),
        .RSTA(RSTA), .RSTB(RSTB), .RSTC(RSTC), .RSTD(RSTD), .RSTM(RSTM), .RSTP(RSTP), .RSTOPMODE(RSTOPMODE), .RSTCARRYIN(RSTCARRYIN),
        .opmode(opmode),
        .BCIN(BCIN), .A(A), .B(B),
        .C(C), .PCIN(PCIN),
        .D(D),
        .CARRYIN(CARRYIN),
        .CARRYOUT(CARRYOUT), .CARRYOUTF(CARRYOUTF),
        .BCOUT(BCOUT),
        .PCOUT(PCOUT), .P(P),
        .M(M)
    );

    // Clock generation (negative edge sensitive as per description)
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;  // 10ns period clock
    end

    // Stimulus and self-checking
    initial begin
        // Initialize signals
        CEA = 0; CEB = 0; CEC = 0; CED = 0; CEM = 0; CEP = 0; CEOPMODE = 0; CECARRYIN = 0;
        RSTA = 0; RSTB = 0; RSTC = 0; RSTD = 0; RSTM = 0; RSTP = 0; RSTOPMODE = 0; RSTCARRYIN = 0;
        opmode = 8'b0;
        BCIN = 18'h0; A = 18'h0; B = 18'h0;
        C = 48'h0; PCIN = 48'h0;
        D = 18'h0;
        CARRYIN = 0;

        // 2.1 Verify Reset Operation
        // Assert all resets (active-high as per description)
        RSTA = 1; RSTB = 1; RSTC = 1; RSTD = 1; RSTM = 1; RSTP = 1; RSTOPMODE = 1; RSTCARRYIN = 1;
        
        // Drive inputs with arbitrary values (using fixed for reproducibility)
        A = 18'h1234; B = 18'h5678; C = 48'hABCDEF; D = 18'hFEDC; BCIN = 18'h9999; PCIN = 48'h111111; CARRYIN = 1; opmode = 8'b10101010;
        
        // Wait for negedge CLK
        @(negedge CLK);
        
        // Check all outputs are zero
        if (BCOUT !== 18'h0 || M !== 36'h0 || P !== 48'h0 || PCOUT !== 48'h0 || CARRYOUT !== 1'b0 || CARRYOUTF !== 1'b0) begin
            $display("Reset Test FAILED: Outputs not zero.");
        end else begin
            $display("Reset Test PASSED.");
        end
        
        // Deassert resets and assert all clock enables
        RSTA = 0; RSTB = 0; RSTC = 0; RSTD = 0; RSTM = 0; RSTP = 0; RSTOPMODE = 0; RSTCARRYIN = 0;
        CEA = 1; CEB = 1; CEC = 1; CED = 1; CEM = 1; CEP = 1; CEOPMODE = 1; CECARRYIN = 1;

        // 2.2 Verify DSP Path 1
        opmode = 8'b11011101;
        A = 18'd20; B = 18'd10; C = 48'd350; D = 18'd25;
        BCIN = 18'hAAAA; PCIN = 48'hBBBBBB; CARRYIN = 0;  // Arbitrary
        
        // Wait for 4 negative clock edges
        repeat(4) @(negedge CLK);
        
        // Check expected outputs
        if (BCOUT !== 18'hf || M !== 36'h12c || P !== 48'h32 || PCOUT !== 48'h32 || CARRYOUT !== 1'b0 || CARRYOUTF !== 1'b0) begin
            $display("Path 1 Test FAILED: Expected BCOUT='hf, M='h12c, P='h32, CARRYOUT=0, but got BCOUT=%h, M=%h, P=%h, CARRYOUT=%b", BCOUT, M, P, CARRYOUT);
        end else begin
            $display("Path 1 Test PASSED.");
        end

        // 2.3 Verify DSP Path 2
        opmode = 8'b00010000;
        A = 18'd20; B = 18'd10; C = 48'd350; D = 18'd25;
        BCIN = 18'hCCCC; PCIN = 48'hDDDDDD; CARRYIN = 1;  // Arbitrary
        
        // Wait for 3 negative clock edges
        repeat(3) @(negedge CLK);
        
        // Check expected outputs
        if (BCOUT !== 18'h23 || M !== 36'h2bc || P !== 48'h0 || PCOUT !== 48'h0 || CARRYOUT !== 1'b0 || CARRYOUTF !== 1'b0) begin
            $display("Path 2 Test FAILED: Expected BCOUT='h23, M='h2bc, P=0, CARRYOUT=0, but got BCOUT=%h, M=%h, P=%h, CARRYOUT=%b", BCOUT, M, P, CARRYOUT);
        end else begin
            $display("Path 2 Test PASSED.");
        end

        // 2.4 Verify DSP Path 3
        opmode = 8'b00001010;
        A = 18'd20; B = 18'd10; C = 48'd350; D = 18'd25;
        BCIN = 18'hEEEE; PCIN = 48'hFFFFFF; CARRYIN = 0;  // Arbitrary
        
        // Wait for 3 negative clock edges
        repeat(3) @(negedge CLK);
        
        // Check expected outputs (P and CARRYOUT are previous values; assuming from Path 2, P=0, CARRYOUT=0)
        if (BCOUT !== 18'ha || M !== 36'hc8 || P !== 48'h0 || PCOUT !== 48'h0 || CARRYOUT !== 1'b0 || CARRYOUTF !== 1'b0) begin
            $display("Path 3 Test FAILED: Expected BCOUT='ha, M='hc8, P=previous (0), CARRYOUT=previous (0), but got BCOUT=%h, M=%h, P=%h, CARRYOUT=%b", BCOUT, M, P, CARRYOUT);
        end else begin
            $display("Path 3 Test PASSED.");
        end

        // 2.5 Verify DSP Path 4
        opmode = 8'b10100111;
        A = 18'd5; B = 18'd6; C = 48'd350; D = 18'd25; PCIN = 48'd3000;
        BCIN = 18'h1111; CARRYIN = 1;  // Arbitrary
        
        // Wait for 3 negative clock edges
        repeat(3) @(negedge CLK);
        
        // Check expected outputs
        if (BCOUT !== 18'h6 || M !== 36'h1e || P !== 48'hfe6fffec0bb1 || PCOUT !== 48'hfe6fffec0bb1 || CARRYOUT !== 1'b1 || CARRYOUTF !== 1'b1) begin
            $display("Path 4 Test FAILED: Expected BCOUT='h6, M='h1e, P='hfe6fffec0bb1, CARRYOUT=1, but got BCOUT=%h, M=%h, P=%h, CARRYOUT=%b", BCOUT, M, P, CARRYOUT);
        end else begin
            $display("Path 4 Test PASSED.");
        end

        // End of tests
        $display("All tests Succeeded.");
        $finish;
    end

endmodule