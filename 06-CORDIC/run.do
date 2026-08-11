cd "F:/Courses/Digital Courses/ADI Internship/CORDIC/RTL"
vlog -f files.txt
vsim -voptargs=+acc work.cordic_tb
do wave.do
run -all
