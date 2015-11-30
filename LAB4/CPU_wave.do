onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_testbench/clk
add wave -noupdate /CPU_testbench/dut/getinstr/instruction
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/ALUSrc_ex
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/Branch_ex
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/ALUControl0_ex
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/ALUControl1_ex
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/MemWrite_ex
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/MemToReg_ex
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/RegDest_ex
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/RegWrite_ex
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/ALUSrc_dec
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/Branch_dec
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/ALUControl0_dec
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/ALUControl1_dec
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/MemWrite_dec
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/MemToReg_dec
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/RegDest_dec
add wave -noupdate -expand -group DecCtrls /CPU_testbench/dut/data/decCtrls/RegWrite_dec
add wave -noupdate -expand -group DecCtrls /CPU_testbench/reset
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/MemWrite_mem
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/MemToReg_mem
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/RegDest_mem
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/RegWrite_mem
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/MemWrite_ex
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/MemToReg_ex
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/RegDest_ex
add wave -noupdate /CPU_testbench/dut/data/decStage/toALU1
add wave -noupdate -expand -group MemCtrls /CPU_testbench/dut/data/memCtrls/RegDest_wr
add wave -noupdate -expand -group MemCtrls /CPU_testbench/dut/data/memCtrls/RegWrite_wr
add wave -noupdate -expand -group MemCtrls /CPU_testbench/dut/data/memCtrls/RegDest_mem
add wave -noupdate -expand -group MemCtrls /CPU_testbench/dut/data/memCtrls/RegWrite_mem
add wave -noupdate -expand -group DecodeOuts /CPU_testbench/dut/data/decStage/toALU2
add wave -noupdate -expand -group DecodeOuts /CPU_testbench/dut/data/decStage/storedRt1
add wave -noupdate /CPU_testbench/dut/data/decStage/Rs
add wave -noupdate /CPU_testbench/dut/data/decStage/Rt
add wave -noupdate /CPU_testbench/dut/data/decStage/Rd
add wave -noupdate /CPU_testbench/dut/data/decStage/rf/WriteRegister
add wave -noupdate /CPU_testbench/dut/data/decStage/rf/WriteData
add wave -noupdate /CPU_testbench/dut/data/decStage/rf/RegWrite
add wave -noupdate -expand -group ExOuts /CPU_testbench/dut/data/exStage/memAddr
add wave -noupdate -expand -group ExOuts /CPU_testbench/dut/data/exStage/storedRt2
add wave -noupdate -expand -group MemOuts /CPU_testbench/dut/data/memStage/writeToReg
add wave -noupdate -expand /CPU_testbench/dut/data/decStage/rf/regVal
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3195920980 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 351
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
WaveRestoreZoom {0 ps} {56421814832 ps}
