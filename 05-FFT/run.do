cd "F:/Courses/Digital Courses/ADI Internship/FFT/RTL"
vlog -f files.txt
vsim -voptargs=+acc work.tb_FFT_16Point
do wave.do
run -all
