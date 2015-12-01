onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_testbench/clk
add wave -noupdate /CPU_testbench/dut/getinstr/instruction
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/ALUSrc_ex
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/Branch_ex
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/ALUControl0_ex
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/ALUControl1_ex
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/MemWrite_ex
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/MemToReg_ex
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/RegDest_ex
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/RegWrite_ex
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/ALUSrc_dec
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/Branch_dec
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/ALUControl0_dec
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/ALUControl1_dec
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/MemWrite_dec
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/MemToReg_dec
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/RegDest_dec
add wave -noupdate -group DecCtrls /CPU_testbench/dut/data/decCtrls/RegWrite_dec
add wave -noupdate -group DecCtrls /CPU_testbench/reset
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/MemWrite_mem
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/MemToReg_mem
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/RegDest_mem
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/RegWrite_mem
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/MemWrite_ex
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/MemToReg_ex
add wave -noupdate -expand -group ExCtrls /CPU_testbench/dut/data/exCtrls/RegDest_ex
add wave -noupdate /CPU_testbench/dut/data/decStage/toALU1
add wave -noupdate -group MemCtrls /CPU_testbench/dut/data/memCtrls/RegDest_wr
add wave -noupdate -group MemCtrls /CPU_testbench/dut/data/memCtrls/RegWrite_wr
add wave -noupdate -group MemCtrls /CPU_testbench/dut/data/memCtrls/RegDest_mem
add wave -noupdate -group MemCtrls /CPU_testbench/dut/data/memCtrls/RegWrite_mem
add wave -noupdate -expand -group DecodeOuts /CPU_testbench/dut/data/decStage/toALU2
add wave -noupdate /CPU_testbench/dut/data/decStage/Rs
add wave -noupdate /CPU_testbench/dut/data/decStage/Rt
add wave -noupdate /CPU_testbench/dut/data/decStage/Rd
add wave -noupdate /CPU_testbench/dut/data/decStage/rf/WriteRegister
add wave -noupdate /CPU_testbench/dut/data/decStage/rf/WriteData
add wave -noupdate /CPU_testbench/dut/data/decStage/rf/RegWrite
add wave -noupdate -expand -group ExOuts /CPU_testbench/dut/data/exStage/memAddr
add wave -noupdate -expand -group MemOuts /CPU_testbench/dut/data/memStage/writeToReg
add wave -noupdate -childformat {{{/CPU_testbench/dut/data/decStage/rf/regVal[31]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[30]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[29]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[28]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[27]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[26]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[25]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[24]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[23]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[22]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[21]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[20]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[19]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[18]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[17]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[16]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[15]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[14]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[13]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[12]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[11]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[10]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[9]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[8]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[7]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[6]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[5]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[4]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[3]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[2]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[1]} -radix decimal} {{/CPU_testbench/dut/data/decStage/rf/regVal[0]} -radix decimal}} -subitemconfig {{/CPU_testbench/dut/data/decStage/rf/regVal[31]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[30]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[29]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[28]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[27]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[26]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[25]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[24]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[23]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[22]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[21]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[20]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[19]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[18]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[17]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[16]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[15]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[14]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[13]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[12]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[11]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[10]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[9]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[8]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[7]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[6]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[5]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[4]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[3]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[2]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[1]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/decStage/rf/regVal[0]} {-height 15 -radix decimal}} /CPU_testbench/dut/data/decStage/rf/regVal
add wave -noupdate -expand -group forwardRs /CPU_testbench/dut/data/Rs_fwd/forwardCtrl
add wave -noupdate -expand -group forwardRs /CPU_testbench/dut/data/Rs_fwd/Rt_ex
add wave -noupdate -expand -group forwardRs /CPU_testbench/dut/data/Rs_fwd/Rd_ex
add wave -noupdate -expand -group forwardRs /CPU_testbench/dut/data/Rs_fwd/Rt_mem
add wave -noupdate -expand -group forwardRs /CPU_testbench/dut/data/Rs_fwd/Rd_mem
add wave -noupdate -expand -group forwardRs /CPU_testbench/dut/data/Rs_fwd/regDest_Ex
add wave -noupdate -expand -group forwardRs /CPU_testbench/dut/data/Rs_fwd/regDest_Mem
add wave -noupdate -expand -group forwardRs /CPU_testbench/dut/data/Rs_fwd/writeEnable_mem
add wave -noupdate -expand -group forwardRs /CPU_testbench/dut/data/Rs_fwd/Rvalue
add wave -noupdate -expand -group forwardRs /CPU_testbench/dut/data/Rs_fwd/writeAddr_Ex
add wave -noupdate -expand -group forwardRs /CPU_testbench/dut/data/Rs_fwd/writeAddr_Mem
add wave -noupdate -group ForwardRt /CPU_testbench/dut/data/Rt_fwd/forwardCtrl
add wave -noupdate -group ForwardRt /CPU_testbench/dut/data/Rt_fwd/Rt_ex
add wave -noupdate -group ForwardRt /CPU_testbench/dut/data/Rt_fwd/Rd_ex
add wave -noupdate -group ForwardRt /CPU_testbench/dut/data/Rt_fwd/Rt_mem
add wave -noupdate -group ForwardRt /CPU_testbench/dut/data/Rt_fwd/Rd_mem
add wave -noupdate -group ForwardRt /CPU_testbench/dut/data/Rt_fwd/regDest_Ex
add wave -noupdate -group ForwardRt /CPU_testbench/dut/data/Rt_fwd/regDest_Mem
add wave -noupdate -group ForwardRt /CPU_testbench/dut/data/Rt_fwd/writeEnable_mem
add wave -noupdate -group ForwardRt /CPU_testbench/dut/data/Rt_fwd/Rvalue
add wave -noupdate -group ForwardRt /CPU_testbench/dut/data/Rt_fwd/writeAddr_Ex
add wave -noupdate -group ForwardRt /CPU_testbench/dut/data/Rt_fwd/writeAddr_Mem
add wave -noupdate -group ForwardRt /CPU_testbench/dut/data/exStage/storedRt2
add wave -noupdate -radix decimal /CPU_testbench/dut/data/decStage/storedRt1
add wave -noupdate -radix decimal /CPU_testbench/dut/data/memStage/storedRt2
add wave -noupdate -radix decimal /CPU_testbench/dut/data/memStage/datMem/address
add wave -noupdate /CPU_testbench/dut/data/memStage/WriteData
add wave -noupdate /CPU_testbench/dut/data/memStage/memData
add wave -noupdate /CPU_testbench/dut/data/memStage/MemWrite
add wave -noupdate /CPU_testbench/dut/data/decStage/readRs
add wave -noupdate /CPU_testbench/dut/data/decStage/readRt
add wave -noupdate /CPU_testbench/dut/data/decStage/Rs_fwd
add wave -noupdate /CPU_testbench/dut/data/decStage/Rt_fwd
add wave -noupdate /CPU_testbench/dut/data/decStage/BussB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1775167989 ps} 0}
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
WaveRestoreZoom {0 ps} {38412662882 ps}
