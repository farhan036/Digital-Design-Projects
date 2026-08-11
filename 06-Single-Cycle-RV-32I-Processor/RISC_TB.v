module RISC_tb;
    reg CLK, RST;

    RISC dut (
        .CLK(CLK),
        .RST(RST)
    );

    always #5 CLK = ~CLK; // 100 MHz clock

    initial begin
        // Initialize clock/reset
        CLK = 0;
        RST = 0;

        // Load program into instruction memory
        $readmemh("program.mem", dut.DUT2.ROM);

        #20 RST = 1;  // release reset

        // Run long enough
        #2000 $stop;
    end
endmodule
