####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

set REF_CLK_NAME REF_CLK
set REF_CLK_PER 20
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1
set CLK_LAT 0
set CLK_RISE 0.1
set CLK_FALL 0.1

set UART_CLK_NAME UART_CLK
set UART_CLK_PER 271.2967987

#3. SCAN_CLK (10 MHZ)
set CLK3_NAME SCAN_CLK
set CLK3_PER 100


create_clock -name $REF_CLK_NAME -period $REF_CLK_PER -waveform "0 [expr $REF_CLK_PER/2]" [get_ports REF_CLK]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $REF_CLK_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW [get_clocks $REF_CLK_NAME]

set_clock_transition -rise $CLK_RISE [get_clocks $REF_CLK_NAME]
set_clock_transition -fall $CLK_FALL [get_clocks $REF_CLK_NAME]

set_clock_latency $CLK_LAT [get_clocks $REF_CLK_NAME]

set_dont_touch_network [get_clocks $REF_CLK_NAME]

########################################################################
create_clock -name $UART_CLK_NAME -period $UART_CLK_PER -waveform "0 [expr $UART_CLK_PER/2]" [get_ports UART_CLK]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $UART_CLK_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW [get_clocks $UART_CLK_NAME]

set_clock_transition -rise $CLK_RISE [get_clocks $UART_CLK_NAME]
set_clock_transition -fall $CLK_FALL [get_clocks $UART_CLK_NAME]

set_clock_latency $CLK_LAT [get_clocks $UART_CLK_NAME]

set_dont_touch_network [get_clocks $UART_CLK_NAME]

########################################################################
create_generated_clock -master_clock "$REF_CLK_NAME"  -source [get_port REF_CLK] -name "ALU_CLK" -divide_by 1 [get_ports CLK_GATE/GATED_CLK]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks ALU_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW [get_clocks ALU_CLK]

set_clock_transition -rise $CLK_RISE [get_clocks ALU_CLK]
set_clock_transition -fall $CLK_FALL [get_clocks ALU_CLK]

set_clock_latency $CLK_LAT [get_clocks ALU_CLK]

set_dont_touch_network [get_clocks ALU_CLK]
########################################################################

create_generated_clock -master_clock "$UART_CLK_NAME" -source [get_port UART_CLK] -name "RX_CLK" -divide_by 1 [get_ports clock_divider_RX/o_div_clk]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks RX_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW [get_clocks RX_CLK]

set_clock_transition -rise $CLK_RISE [get_clocks RX_CLK]
set_clock_transition -fall $CLK_FALL [get_clocks RX_CLK]

set_clock_latency $CLK_LAT [get_clocks RX_CLK]

set_dont_touch_network [get_clocks RX_CLK]
########################################################################

create_generated_clock -master_clock "$UART_CLK_NAME" -source [get_port UART_CLK] -name "TX_CLK" -divide_by 32 [get_ports clock_divider_TX/o_div_clk]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks TX_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW [get_clocks TX_CLK]

set_clock_transition -rise $CLK_RISE [get_clocks TX_CLK]
set_clock_transition -fall $CLK_FALL [get_clocks TX_CLK]

set_clock_latency $CLK_LAT [get_clocks TX_CLK]

set_dont_touch_network [get_clocks TX_CLK]

########################################################################
create_clock -name $CLK3_NAME -period $CLK3_PER -waveform "0 [expr $CLK3_PER/2]" [get_ports scan_clk]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK3_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks $CLK3_NAME]

set_clock_transition -rise $CLK_RISE [get_clocks $CLK3_NAME]
set_clock_transition -fall $CLK_FALL [get_clocks $CLK3_NAME]

set_dont_touch_network [get_clocks $CLK3_NAME]
####################################################################################
           #########################################################
                  #### Section 2 : Clocks Relationships ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous -group [get_clocks "REF_CLK ALU_CLK"]  \
                               -group [get_clocks "UART_CLK TX_CLK RX_CLK"] \
                               -group [get_clocks "SCAN_CLK"] 

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################


set in1_delay  [expr 0.2*$UART_CLK_PER]
set out_delay_uart_rx [expr 0.2 * $UART_CLK_PER]        
set out_delay_uart_tx [expr 0.2 * $UART_CLK_PER * 32]    

set in2_delay  [expr 0.2*$CLK3_PER]
set out2_delay [expr 0.2*$CLK3_PER]

#Constrain Input Paths
set_input_delay $in1_delay -clock RX_CLK [get_ports UART_RX_IN]

#Constrain Scan Input Paths
set_input_delay $in2_delay -clock $CLK3_NAME [get_port test_mode]
set_input_delay $in2_delay -clock $CLK3_NAME [get_port SI]
set_input_delay $in2_delay -clock $CLK3_NAME [get_port SE]

#Constrain Output Paths
set_output_delay $out_delay_uart_tx -clock TX_CLK [get_ports UART_TX_O]
set_output_delay $out_delay_uart_rx -clock RX_CLK [get_ports parity_error]
set_output_delay $out_delay_uart_rx -clock RX_CLK [get_ports framing_error]

#Constrain Scan Output Paths
set_output_delay $out2_delay -clock $CLK3_NAME [get_port SO]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port UART_RX_IN]

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port test_mode]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SI]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SE]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################
set_load 0.1 [get_port UART_TX_O]
set_load 0.1 [get_port parity_error]
set_load 0.1 [get_port framing_error]

set_load 0.1 [get_port SO]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis
set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
			 -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" \
			 -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################
#set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

####################################################################################
           #########################################################
                  #### Section 8 : set_case_analysis ####
           #########################################################
####################################################################################
set_case_analysis 0 [get_port test_mode]

####################################################################################
           #########################################################
                  #### Section 8 : premapped cells ####
           #########################################################
####################################################################################


####################################################################################

