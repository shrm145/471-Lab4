onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {dataPath Outputs} /dataPathTEST_testbench/regRS
add wave -noupdate -expand -group {dataPath Outputs} /dataPathTEST_testbench/negative
add wave -noupdate -expand -group {DEBUG: Wires} /dataPathTEST_testbench/readRs_out
add wave -noupdate -expand -group {DEBUG: Wires} /dataPathTEST_testbench/readRt_out
add wave -noupdate -expand -group {DEBUG: Wires} /dataPathTEST_testbench/WriteRegAddr_out
add wave -noupdate -expand -group {DEBUG: Wires} /dataPathTEST_testbench/WriteData_out
add wave -noupdate -expand -group {DEBUG: Wires} /dataPathTEST_testbench/ALUoutput_out
add wave -noupdate -expand -group {Input Controls} /dataPathTEST_testbench/RegDest
add wave -noupdate -expand -group {Input Controls} /dataPathTEST_testbench/ALUSource
add wave -noupdate -expand -group {Input Controls} /dataPathTEST_testbench/RegWrite
add wave -noupdate -expand -group {Input Controls} /dataPathTEST_testbench/ALUControl
add wave -noupdate -expand -group {Input Controls} /dataPathTEST_testbench/MemWrite
add wave -noupdate -expand -group {Input Controls} /dataPathTEST_testbench/MemToReg
add wave -noupdate -expand -group {Input Controls} /dataPathTEST_testbench/Branch
add wave -noupdate -expand -group {Input Controls} /dataPathTEST_testbench/Jump
add wave -noupdate -expand -group {Input Controls} /dataPathTEST_testbench/JR
add wave -noupdate -expand -group Instruction /dataPathTEST_testbench/instruction
add wave -noupdate -expand -group Instruction /dataPathTEST_testbench/Rs
add wave -noupdate -expand -group Instruction /dataPathTEST_testbench/Rt
add wave -noupdate -expand -group Instruction /dataPathTEST_testbench/Rd
add wave -noupdate -expand -group Instruction /dataPathTEST_testbench/imm16
add wave -noupdate -expand -group CLOCK /dataPathTEST_testbench/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {24757311 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 311
configure wave -valuecolwidth 204
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
WaveRestoreZoom {0 ps} {68859870 ps}
