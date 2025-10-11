onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DSB_TB/uut/RSTTYPE
add wave -noupdate /DSB_TB/uut/A0_REG
add wave -noupdate /DSB_TB/uut/B0_REG
add wave -noupdate /DSB_TB/uut/A1_REG
add wave -noupdate /DSB_TB/uut/B1_REG
add wave -noupdate /DSB_TB/uut/CREG
add wave -noupdate /DSB_TB/uut/DREG
add wave -noupdate /DSB_TB/uut/MREG
add wave -noupdate /DSB_TB/uut/PREG
add wave -noupdate /DSB_TB/uut/CARRYINREG
add wave -noupdate /DSB_TB/uut/CARRYOUTREG
add wave -noupdate /DSB_TB/uut/OPMODEREG
add wave -noupdate /DSB_TB/uut/CARRYINSEL
add wave -noupdate /DSB_TB/uut/B_INPUT
add wave -noupdate /DSB_TB/uut/CLK
add wave -noupdate /DSB_TB/uut/CEA
add wave -noupdate /DSB_TB/uut/CEB
add wave -noupdate /DSB_TB/uut/CEC
add wave -noupdate /DSB_TB/uut/CED
add wave -noupdate /DSB_TB/uut/CEM
add wave -noupdate /DSB_TB/uut/CEP
add wave -noupdate /DSB_TB/uut/CEOPMODE
add wave -noupdate /DSB_TB/uut/CECARRYIN
add wave -noupdate /DSB_TB/uut/RSTA
add wave -noupdate /DSB_TB/uut/RSTB
add wave -noupdate /DSB_TB/uut/RSTC
add wave -noupdate /DSB_TB/uut/RSTD
add wave -noupdate /DSB_TB/uut/RSTM
add wave -noupdate /DSB_TB/uut/RSTP
add wave -noupdate /DSB_TB/uut/RSTOPMODE
add wave -noupdate /DSB_TB/uut/RSTCARRYIN
add wave -noupdate /DSB_TB/uut/opmode
add wave -noupdate /DSB_TB/uut/BCIN
add wave -noupdate /DSB_TB/uut/A
add wave -noupdate /DSB_TB/uut/B
add wave -noupdate /DSB_TB/uut/C
add wave -noupdate /DSB_TB/uut/D
add wave -noupdate /DSB_TB/uut/PCIN
add wave -noupdate /DSB_TB/uut/CARRYIN
add wave -noupdate /DSB_TB/uut/CARRYOUT
add wave -noupdate /DSB_TB/uut/CARRYOUTF
add wave -noupdate -radix unsigned /DSB_TB/uut/BCOUT
add wave -noupdate /DSB_TB/uut/PCOUT
add wave -noupdate /DSB_TB/uut/P
add wave -noupdate /DSB_TB/uut/M
add wave -noupdate /DSB_TB/uut/b0_out
add wave -noupdate /DSB_TB/uut/D0_REG_out
add wave -noupdate /DSB_TB/uut/B0_REG_out
add wave -noupdate /DSB_TB/uut/B1_REG_out
add wave -noupdate /DSB_TB/uut/A0_REG_out
add wave -noupdate /DSB_TB/uut/A1_REG_out
add wave -noupdate /DSB_TB/uut/P_REG_out
add wave -noupdate /DSB_TB/uut/C0_REG_out
add wave -noupdate /DSB_TB/uut/B0
add wave -noupdate /DSB_TB/uut/A1
add wave -noupdate /DSB_TB/uut/mul1
add wave -noupdate /DSB_TB/uut/M_REG_out
add wave -noupdate /DSB_TB/uut/B1_in
add wave -noupdate /DSB_TB/uut/A0
add wave -noupdate /DSB_TB/uut/D0
add wave -noupdate /DSB_TB/uut/C0
add wave -noupdate /DSB_TB/uut/MX1
add wave -noupdate /DSB_TB/uut/CZ1
add wave -noupdate /DSB_TB/uut/car0
add wave -noupdate /DSB_TB/uut/CYI0
add wave -noupdate /DSB_TB/uut/CIN
add wave -noupdate /DSB_TB/uut/COUT
add wave -noupdate /DSB_TB/uut/CYO_REG_out
add wave -noupdate -radix unsigned /DSB_TB/uut/adder_out0
add wave -noupdate -radix unsigned /DSB_TB/uut/adder_out1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {67244 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {18236 ps} {136045 ps}
