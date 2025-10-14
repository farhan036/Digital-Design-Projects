`timescale 1ns/1ps
module SYS_TOP_TB;

  /////////////////////////////////////////////////////////
  //////////////////// DUT Signals ////////////////////////
  /////////////////////////////////////////////////////////
  reg  REF_CLK;
  reg  UART_CLK;
  reg  RST;
  reg  RX_IN;
  wire TX_OUT;
  wire PAR_ERR;
  wire STP_ERR;

  // Flags I need for testcase
  reg Test; 
  reg Test1;
  reg Test2;
  reg Test3;
  reg Test4;


  integer testcase_num;

  /////////////////////////////////////////////////////////
  ///////////////////// Parameters ////////////////////////
  /////////////////////////////////////////////////////////  
  // Bit period (Prescale=32, Div=1, UART_CLK=3.6864MHz)
  parameter TX_CLOCK = 8680.555556;   // ns
  parameter RX_CLOCK = 271.2673611;   // ns
  parameter UART_CLK_PER = 271.2673611;   // ns
  parameter DATA_WIDTH_TB   = 8 ;
  parameter RegFile_ADDR_TB = 4;
  parameter REF_CLK_PER = 20 ;

  /////////////////////////////////////////////////////////
  ////////////////////// Reset Gen ////////////////////////
  /////////////////////////////////////////////////////////
  initial 
  begin
    Initialization();
    Reset();
  end


  /////////////////////////////////////////////////////////
  ////////////////////// Test Flow ////////////////////////
  /////////////////////////////////////////////////////////
  initial 
  begin
    @(posedge RST);
    #100000; // wait 100us

  $display("// ----------------- Command then Check-------------------------------");
  $display(" ----------------------- Prescale 32 -----------------------");

  send_write_command('d2,'b10000001); // Write Prescale and bit of parity in Reg2
  next_testcase("Write prescale 32 and parity Enable and Even");
  check_in_address('d2, 'b10000001);  

  send_write_command('d3,'d32); // Write Prescale and bit of parity in Reg2
  next_testcase("Write Division Ratio");
  check_in_address('d3, 'd32);  


  // ----------------- Register File Write command (3 frames) -----------------
  send_write_command('d0,'d30);
  next_testcase("Register File Write (Addr=0, Data=30)");
  check_in_address('d0, 'd30);

  // ----------------- Register File Write command (3 frames) -----------------
  send_write_command('d1,'d40);
  next_testcase("Register File Write (Addr=1, Data=40)");
  check_in_address('d1, 'd40);

  // ----------------- ALU Operation command with No operand (2 frames) -----------------
  send_ALU_command('b10);
  next_testcase("ALU Operation MUL with No operand");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_1011_0000_0, 10'b1_1011_0000_0);
  Check_TX(11'b1_1_0000_0100_0, 10'b1_0000_0100_0);

  // ----------------- Register File Read command (2 frames) -----------------
  send_Read_command('d1);
  next_testcase("Register File Read (Addr=1)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_0010_1000_0, 10'b1_0010_1000_0);

  // ----------------- ALU Operation ADD command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d30,'b00);
  next_testcase("ALU ADD (100 + 30)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_10000010_0, 10'b1_10000010_0);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);

  // ----------------- ALU Operation SUB command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d30,'b01);
  next_testcase("ALU SUB (100 - 30)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_01000110_0, 10'b1_01000110_0);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);

  // ----------------- ALU Operation MUL command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d30,'b10);
  next_testcase("ALU MUL (100 * 30)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_10111000_0, 10'b1_10111000_0);
  Check_TX(11'b1_1_00001011_0, 10'b1_00001011_0);

  // ----------------- ALU Operation DIV command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d10,'b11);
  next_testcase("ALU DIV (100 / 10)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_00001010_0, 10'b1_00001010_0);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);

  // ----------------- ALU Operation AND command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d10,'b0100);
  next_testcase("ALU AND (100 & 10)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);

  // ----------------- ALU Operation OR command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d10,'b0101);
  next_testcase("ALU OR (100 | 10)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_01101110_0, 10'b1_01101110_0);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);

  // ----------------- ALU Operation NAND command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d10,'b0110);
  next_testcase("ALU NAND ~(100 & 10)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_11111111_0, 10'b1_11111111_0);
  Check_TX(11'b1_0_11111111_0, 10'b1_11111111_0);

  // ----------------- ALU Operation NOR command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d10,'b0111);
  next_testcase("ALU NOR ~(100 | 10)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_10010001_0, 10'b1_10010001_0); 
  Check_TX(11'b1_0_11111111_0, 10'b1_11111111_0); 

  // ----------------- ALU Operation XOR command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d10,'b1000);
  next_testcase("ALU XOR (100 ^ 10)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_01101110_0, 10'b1_01101110_0); 
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0); 

  // ----------------- ALU Operation XNOR command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d10,'b1001);
  next_testcase("ALU XNOR ~(100 ^ 10)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_10010001_0, 10'b1_10010001_0); 
  Check_TX(11'b1_0_11111111_0, 10'b1_11111111_0); 

  // ----------------- ALU Operation Equal command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d10,'b1010);
  next_testcase("ALU Equal ");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);

  // ----------------- ALU Operation Greater command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d10,'b1011);
  next_testcase("ALU Operation Greater ");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_00000010_0, 10'b1_00000010_0);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);

  // ----------------- ALU Operation Less command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d10,'b1100);
  next_testcase("ALU Operation Less ");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);

  // ----------------- ALU Operation Shift Right command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d1,'b1101);
  next_testcase("ALU Shift Right ");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_00110010_0, 10'b1_00110010_0);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);

  // ----------------- ALU Operation Shift Left command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d1,'b1110);
  next_testcase("ALU Shift Left ");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_11001000_0, 10'b1_11001000_0);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);



  // ----------------- All Commands One after the other -----------------
  send_ALU4_command('d100,'d30,'b10);
  Test = 1;

  send_write_command('d0,'d30);
  Test1 = 1;

  send_write_command('d1,'d40);
  Test2 = 1;

  send_ALU_command('b10);
  Test3 = 1;

  send_Read_command('d1);
  Test4 = 1;
// ----------------------- Prescale 16 -----------------------
  send_write_command('d2,'b01000000); // Write Prescale and bit of parity in Reg2
  $display(" ----------------------- Prescale 16 -----------------------");
  next_testcase("Write prescale 16 and parity disable");
  check_in_address('d2, 'b01000000);
  
  // ----------------- ALU Operation DIV command with operand (4 frames) -----------------
  send_ALU4_command('d120,'d60,'b11);
  next_testcase("ALU DIV (120 / 60)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_00000010_0, 10'b1_00000010_0);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);

  // ----------------- Register File Write command (3 frames) -----------------
  send_write_command('d0,'d40);
  next_testcase("Register File Write (Addr=0, Data=30)");
  check_in_address('d0, 'd40);

  // ----------------- Register File Write command (3 frames) -----------------
  send_write_command('d1,'d40);
  next_testcase("Register File Write (Addr=1, Data=40)");
  check_in_address('d1, 'd40);

  // ----------------- ALU Operation command with No operand (2 frames) -----------------
  send_ALU_command('b10);
  next_testcase("ALU Operation MUL with No operand");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_0100_0000_0, 10'b1_0100_0000_0);
  Check_TX(11'b1_0_0000_0110_0, 10'b1_0000_0110_0);

  // ----------------- Register File Read command (2 frames) -----------------
  send_Read_command('d1);
  next_testcase("Register File Read (Addr=1)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_0010_1000_0, 10'b1_0010_1000_0);

  // ----------------- ALU Operation ADD command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d30,'b00);
  next_testcase("ALU ADD (100 + 30)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_10000010_0, 10'b1_10000010_0);
  Check_TX(11'b1_0_00000000_0, 10'b1_00000000_0);


  // ----------------------- Prescale 8 -----------------------
  $display(" ----------------------- Prescale 8 -----------------------");
  send_write_command('d2,'b00100011); // Write Prescale and bit of parity Enable and odd
  next_testcase("Write prescale 8 and parity Enable and Odd Parity");
  check_in_address('d2, 'b00100011);
  
  // ----------------- ALU Operation MUL command with operand (4 frames) -----------------
  send_ALU4_command('d120,'d60,'b10);
  next_testcase("ALU MUL (120 * 60)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_00100000_0, 10'b1_00100000_0);
  Check_TX(11'b1_0_00011100_0, 10'b1_00011100_0);

  // ----------------- Register File Write command (3 frames) -----------------
  send_write_command('d0,'d40);
  next_testcase("Register File Write (Addr=0, Data=40)");
  check_in_address('d0, 'd40);

  // ----------------- Register File Write command (3 frames) -----------------
  send_write_command('d1,'d40);
  next_testcase("Register File Write (Addr=1, Data=40)");
  check_in_address('d1, 'd40);

  // ----------------- ALU Operation command with No operand (2 frames) -----------------
  send_ALU_command('b10);
  next_testcase("ALU Operation MUL with No operand");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_0100_0000_0, 10'b1_0100_0000_0);
  Check_TX(11'b1_1_0000_0110_0, 10'b1_0000_0110_0);

  // ----------------- Register File Read command (2 frames) -----------------
  send_Read_command('d1);
  next_testcase("Register File Read (Addr=1)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_0010_1000_0, 10'b1_0010_1000_0);

  // ----------------- ALU Operation ADD command with operand (4 frames) -----------------
  send_ALU4_command('d100,'d30,'b00);
  next_testcase("ALU ADD (100 + 30)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_10000010_0, 10'b1_10000010_0);
  Check_TX(11'b1_1_00000000_0, 10'b1_00000000_0);

  // ----------------- Register File Write command (3 frames) -----------------
   send_write_command('d6,'d15);
  next_testcase("Register File Write (Addr=6, Data=15)");
  check_in_address('d6, 'd15);
 
  #(100*TX_CLOCK);

  $stop;
end

initial begin
  @(posedge Test);
  next_testcase("All Commands One after the other  - ALU MUL (100*30)");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_10111000_0, 10'b1_10111000_0);
  Check_TX(11'b1_1_00001011_0, 10'b1_00001011_0);

  @(posedge Test1);
  next_testcase("All Commands One after the other - Write Addr=0, Data=30");
  check_in_address('d0, 'd30);

  @(posedge Test2);
  next_testcase("All Commands One after the other - Write Addr=1, Data=40");
  check_in_address('d1, 'd40);

  @(posedge Test3);
  next_testcase("All Commands One after the other - ALU No operand");
  #(3*TX_CLOCK);
  Check_TX(11'b1_1_1011_0000_0, 10'b1_1011_0000_0);
  Check_TX(11'b1_1_0000_0100_0, 10'b1_0000_0100_0);

  @(posedge Test4);
  next_testcase("All Commands One after the other - Read Addr=1");
  #(3*TX_CLOCK);
  Check_TX(11'b1_0_0010_1000_0, 10'b1_0010_1000_0);

  
end


  /////////////////////////////////////////////////////////
  /////////////////////// Tasks ///////////////////////////
  /////////////////////////////////////////////////////////

  // ----------------- Reset -----------------
  task Reset;
  begin
    RST   = 0;
    RX_IN = 1; // idle
    #100;
    RST   = 1; // release reset
  end
  endtask

  // ----------------- Initialization -----------------
  task Initialization;
  begin
    RX_IN = 1; // idle Initialization
    Test = 0;
    Test1 = 0;
    Test2 = 0;
    Test3 = 0;
    Test4 = 0;
    testcase_num = 0;
  end
  endtask

  // ----------------- Put Frame -----------------
  task put_frame;
    input [7:0] frame;
    integer i;
    begin
      @(posedge DUT.TX.CLK);
      RX_IN <= 0; // Start bit

      // Send 8 data bits
      for (i = 0; i < 8; i = i + 1) begin
        @(posedge DUT.TX.CLK);
        RX_IN <= frame[i];
      end

      // Parity bit (if enabled)
      if (DUT.REGISTER.REG2[0]) begin
        @(posedge DUT.TX.CLK);
        case (DUT.REGISTER.REG2[1])
          1'b0 : RX_IN <= ^frame;   // Even Parity
          1'b1 : RX_IN <= ~^frame;  // Odd Parity
        endcase
      end

      // Stop bit
      @(posedge DUT.TX.CLK);
      RX_IN <= 1;

      @(posedge DUT.TX.CLK);
      #(TX_CLOCK);
    end
  endtask

  // ----------------- Check TX Sequence -----------------
  task Check_TX;
    input [10:0] expected_with_parity;
    input [9:0]  expected_without_parity;
    reg [10:0] txdata_with_parity;
    reg [9:0]  txdata_without_parity;
    integer i;
    begin
      if (DUT.REGISTER.REG2[0]) begin
        // With parity
        for (i = 0; i < 11; i = i + 1) begin
          @(negedge DUT.TX.CLK);
          txdata_with_parity[i] = TX_OUT;  
        end  

        if (txdata_with_parity == expected_with_parity)
          $display(" Test Passed WITH parity | Expected=%b | Got=%b", expected_with_parity, txdata_with_parity);
        else
          $display(" Test Failed with parity | Expected=%b | Got=%b", expected_with_parity, txdata_with_parity);

      end else begin
        // Without parity
        for (i = 0; i < 10; i = i + 1) begin
          @(negedge DUT.TX.CLK);
          txdata_without_parity[i] = TX_OUT;
        end

        if (txdata_without_parity == expected_without_parity)
          $display(" Test Passed without parity | Expected=%b | Got=%b", expected_without_parity, txdata_without_parity);
        else
          $display(" Test Failed without parity | Expected=%b | Got=%b", expected_without_parity, txdata_without_parity);
      end

      @(posedge DUT.TX.CLK);
      @(posedge DUT.TX.CLK);
    end
  endtask

  // ----------------- Check Register Value -----------------
  task check_in_address;
  input [3:0] address ;
  input [7:0] data;
  begin
    @(negedge DUT.TX.CLK);
    if (data == DUT.REGISTER.Reg_File[address]) begin
      $display(" Test Passed | Address=%0d | Expected=%d | Got=%d",
               address, data, DUT.REGISTER.Reg_File[address]);
    end else begin
      $display(" Test Failed | Address=%0d | Expected=%d | Got=%d",
               address, data, DUT.REGISTER.Reg_File[address]);
    end
  end
  endtask


  // ----------------- Send Write Command -----------------
  task send_write_command;
  input [7:0] address;
  input [7:0] data;
  begin
    put_frame('hAA);
    put_frame(address);
    put_frame(data);
  end

  endtask

  // ----------------- Send Read Command -----------------
  task send_Read_command;
  input [7:0] address;
  begin
    put_frame('hBB);
    put_frame(address);
  end

  endtask

  // ----------------- Send Alu operations 4 frames Command -----------------
  task send_ALU4_command;
  input [7:0] op1;
  input [7:0] op2;
  input [7:0] ALUFUN;
  begin
    put_frame('hCC);
    put_frame(op1);
    put_frame(op2);
    put_frame(ALUFUN);
  end

  endtask

  // ----------------- Send Alu operations 2 frames Command -----------------
  task send_ALU_command;
  input [7:0] FUN;
  begin
    put_frame('hDD);
    put_frame(FUN);
  end

  endtask

task next_testcase;
  input [200*8:0] testcase_name;  // string up to 200 chars
  begin
    testcase_num = testcase_num + 1;
    $display("====================================================");
    $display("                 Test Case %0d", testcase_num);
    $display(" Description : %0s", testcase_name);
    $display("====================================================");
  end
endtask
  

  /////////////////////////////////////////////////////////
  /////////////////// Clock Generation ////////////////////
  /////////////////////////////////////////////////////////
  initial begin
    REF_CLK = 0;
    forever #(REF_CLK_PER/2) REF_CLK = ~REF_CLK;   // 50 MHz
  end

  initial begin
    UART_CLK = 0;
    forever #(UART_CLK_PER/2) UART_CLK = ~UART_CLK; // ~3.6864 MHz
  end


  /////////////////////////////////////////////////////////
  /////////////////////// DUT Inst ////////////////////////
  /////////////////////////////////////////////////////////
  SYS_TOP #(.DATA_WIDTH(DATA_WIDTH_TB),.RegFile_ADDR(RegFile_ADDR_TB)) DUT (
    .REF_CLK      (REF_CLK),
    .UART_CLK     (UART_CLK),
    .RST_N        (RST),
    .UART_RX_IN   (RX_IN),
    .UART_TX_O    (TX_OUT),
    .parity_error (PAR_ERR),
    .framing_error(STP_ERR)
  );

endmodule