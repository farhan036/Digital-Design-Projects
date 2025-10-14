
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true
set verification_verify_directly_undriven_output false

set_svf "/home/IC/Labs/System/Backend/DFT/SYS_TOP.svf"


set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

read_db -container r [list $SSLIB $TTLIB $FFLIB]
###################################################################
###################### Reference Container ########################
###################################################################

# Read Reference Design Verilog Files
# Verilog sources
read_verilog -container r "/home/IC/Labs/System/RTL/ALU/ALU_16B.v"
read_verilog -container r "/home/IC/Labs/System/RTL/UART/UART_RX/edge_bit_counter.v"
read_verilog -container r "/home/IC/Labs/System/RTL/CLKDIV_MUX/Prescale_MUX.v"
read_verilog -container r "/home/IC/Labs/System/RTL/UART/UART_RX/Uart_Rx_Top.v"
read_verilog -container r "/home/IC/Labs/System/RTL/UART/UART_TX/UART_TX_TOP.v"
read_verilog -container r "/home/IC/Labs/System/RTL/PULSE_GEN/Pulse_Gen.v"
read_verilog -container r "/home/IC/Labs/System/RTL/ASYNC_FIFO/FIFO_MEM_CNTRL.v"
read_verilog -container r "/home/IC/Labs/System/RTL/ASYNC_FIFO/ASYNC_FIFO.v"
read_verilog -container r "/home/IC/Labs/System/RTL/RegFile/Register_file8_16.v"
read_verilog -container r "/home/IC/Labs/System/RTL/ASYNC_FIFO/FIFO_RD.v"
read_verilog -container r "/home/IC/Labs/System/RTL/Clock_Divider/ClkDiv.v"
read_verilog -container r "/home/IC/Labs/System/RTL/RST_SYNC/RST_SYNC.v"
read_verilog -container r "/home/IC/Labs/System/RTL/ASYNC_FIFO/FIFO_WR.v"
read_verilog -container r "/home/IC/Labs/System/RTL/Clock_Gating/CLK_GATE.v"
read_verilog -container r "/home/IC/Labs/System/RTL/UART/UART_TX/Serializer.v"
read_verilog -container r "/home/IC/Labs/System/RTL/UART/UART_RX/data_sampling.v"
read_verilog -container r "/home/IC/Labs/System/RTL/UART/UART_RX/stop_check.v"
read_verilog -container r "/home/IC/Labs/System/RTL/DATA_SYNC/DATA_SYNC.v"
read_verilog -container r "/home/IC/Labs/System/RTL/UART/UART_RX/strt_check.v"
read_verilog -container r "/home/IC/Labs/System/RTL/UART/UART_TX/Mux_TX.v"
read_verilog -container r "/home/IC/Labs/System/RTL/UART/UART_RX/deserializer.v"
read_verilog -container r "/home/IC/Labs/System/RTL/ASYNC_FIFO/DF_SYNC.v"
read_verilog -container r "/home/IC/Labs/System/RTL/UART/UART_TX/parity_calc.v"
read_verilog -container r "/home/IC/Labs/System/RTL/UART/UART_RX/parity_check.v"
read_verilog -container r "/home/IC/Labs/System/RTL/SYS_TOP/System_Top_dft.v"
read_verilog -container r "/home/IC/Labs/System/RTL/SYS_TOP/mux2X1.v"

# SystemVerilog sources
read_sverilog -container r "/home/IC/Labs/System/RTL/UART/UART_RX/FSM.sv"
read_sverilog -container r "/home/IC/Labs/System/RTL/UART/UART_TX/FSM_TX.sv"
read_sverilog -container r "/home/IC/Labs/System/RTL/SYS_CTRL/SYS_CTRL.sv"



# Read Reference technology libraries
read_db -container r $TTLIB

# set the top Reference Design 
set_top SYS_TOP


###################################################################
#################### Implementation Container #####################
###################################################################

# Read Implementation Design Files

read_verilog -netlist -container i "/home/IC/Labs/System/Backend/DFT/netlists/SYS_TOP.v"
# Read Implementation technology libraries
read_db -container i $TTLIB

# set the top Implementation Design
set_top SYS_TOP



########################## Don't verify ###########################

# do not verify scan in & scan out ports as a compare point as it is existed only after synthesis and not existed in the RTL

#scan in
set_dont_verify_points -type port r:/WORK/*/SI*
set_dont_verify_points -type port i:/WORK/*/SI*
#scan_out
set_dont_verify_points -type port r:/WORK/*/SO*
set_dont_verify_points -type port i:/WORK/*/SO*

############################### contants #####################################

# all atpg enable (test_mode, scan_enable) are zero during formal compare

#test_mode
set_constant r:/WORK/*/test_mode 0
set_constant i:/WORK/*/test_mode 0


#scan_enable

set_constant r:/WORK/*/SE 0
set_constant i:/WORK/*/SE 0
########################### matching Compare points ##########################

match

################################# verify #####################################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui
