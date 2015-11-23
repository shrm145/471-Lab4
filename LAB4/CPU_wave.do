onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_testbench/clk
add wave -noupdate /CPU_testbench/regValues
add wave -noupdate /CPU_testbench/Instructions
add wave -noupdate /CPU_testbench/dut/getinstr/instruction
add wave -noupdate /CPU_testbench/dut/data/rf/regValues
add wave -noupdate /CPU_testbench/dut/data/rf/ReadRegister1
add wave -noupdate /CPU_testbench/dut/data/rf/ReadRegister2
add wave -noupdate /CPU_testbench/dut/data/rf/WriteRegister
add wave -noupdate /CPU_testbench/dut/data/rf/WriteData
add wave -noupdate /CPU_testbench/dut/data/rf/ReadData1
add wave -noupdate /CPU_testbench/dut/data/rf/ReadData2
add wave -noupdate /CPU_testbench/dut/data/rf/regEnable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28191696 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
configure wave -valuecolwidth 115
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {235269876 ps}
