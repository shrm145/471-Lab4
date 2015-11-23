onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /controls_testbench/RegDest
add wave -noupdate /controls_testbench/ALUSource
add wave -noupdate /controls_testbench/RegWrite
add wave -noupdate /controls_testbench/MemWrite
add wave -noupdate /controls_testbench/MemToReg
add wave -noupdate /controls_testbench/Branch
add wave -noupdate /controls_testbench/Jump
add wave -noupdate /controls_testbench/JR
add wave -noupdate /controls_testbench/ALUControl
add wave -noupdate /controls_testbench/instruction
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {125 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 252
configure wave -valuecolwidth 241
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
WaveRestoreZoom {0 ps} {148 ps}
