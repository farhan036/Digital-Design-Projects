vlib work
vlog *.*v
vsim -voptargs="+acc" work.RISC_tb
do wave.do 
run -all