onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /instrFU_testbench/instruction
add wave -noupdate /instrFU_testbench/Jump
add wave -noupdate /instrFU_testbench/JR
add wave -noupdate /instrFU_testbench/Branch
add wave -noupdate /instrFU_testbench/negative
add wave -noupdate /instrFU_testbench/imm16
add wave -noupdate /instrFU_testbench/jumpTarget
add wave -noupdate /instrFU_testbench/regRS
add wave -noupdate /instrFU_testbench/clk
add wave -noupdate /instrFU_testbench/reset
add wave -noupdate /instrFU_testbench/dut/programCounter/inPC
add wave -noupdate /instrFU_testbench/dut/programCounter/outPC
add wave -noupdate /instrFU_testbench/dut/adder30/out
add wave -noupdate /instrFU_testbench/dut/jumpMux/out
add wave -noupdate /instrFU_testbench/dut/valToAdderMux/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {123778338 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 342
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {1307408690 ps}
