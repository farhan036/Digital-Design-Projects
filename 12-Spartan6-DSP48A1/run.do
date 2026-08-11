vlib work
vlog *.*v
vsim -voptargs="+acc" work.DSB_TB
do wave.do 
run -all