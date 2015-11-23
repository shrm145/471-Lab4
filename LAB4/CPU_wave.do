onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_testbench/clk
add wave -noupdate /CPU_testbench/dut/getinstr/instruction
add wave -noupdate -radix decimal -childformat {{{/CPU_testbench/dut/data/rf/regValues[31]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[30]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[29]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[28]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[27]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[26]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[25]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[24]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[23]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[22]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[21]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[20]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[19]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[18]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[17]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[16]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[15]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[14]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[13]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[12]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[11]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[10]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[9]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[8]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[7]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[6]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[5]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[4]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[3]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[2]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[1]} -radix decimal} {{/CPU_testbench/dut/data/rf/regValues[0]} -radix decimal}} -expand -subitemconfig {{/CPU_testbench/dut/data/rf/regValues[31]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[30]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[29]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[28]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[27]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[26]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[25]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[24]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[23]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[22]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[21]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[20]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[19]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/rf/regValues[18]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/rf/regValues[17]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/rf/regValues[16]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/rf/regValues[15]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[14]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[13]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[12]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[11]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[10]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[9]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/rf/regValues[8]} {-height 15 -radix decimal} {/CPU_testbench/dut/data/rf/regValues[7]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[6]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[5]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[4]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[3]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[2]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[1]} {-radix decimal} {/CPU_testbench/dut/data/rf/regValues[0]} {-radix decimal}} /CPU_testbench/dut/data/rf/regValues
add wave -noupdate /CPU_testbench/dut/data/rf/ReadRegister1
add wave -noupdate /CPU_testbench/dut/getinstr/JR
add wave -noupdate -radix decimal /CPU_testbench/dut/getinstr/PCin
add wave -noupdate -radix decimal /CPU_testbench/dut/getinstr/PCout
add wave -noupdate /CPU_testbench/dut/data/regRS
add wave -noupdate /CPU_testbench/dut/data/rf/ReadRegister2
add wave -noupdate /CPU_testbench/dut/data/rf/WriteRegister
add wave -noupdate /CPU_testbench/dut/data/rf/WriteData
add wave -noupdate /CPU_testbench/dut/data/rf/ReadData1
add wave -noupdate /CPU_testbench/dut/data/rf/ReadData2
add wave -noupdate /CPU_testbench/dut/data/rf/regEnable
add wave -noupdate /CPU_testbench/dut/getinstr/Jump
add wave -noupdate /CPU_testbench/dut/getinstr/PC
add wave -noupdate /CPU_testbench/dut/getinstr/Branch
add wave -noupdate /CPU_testbench/dut/getinstr/negative
add wave -noupdate /CPU_testbench/dut/getinstr/PCnoJump
add wave -noupdate -radix decimal /CPU_testbench/dut/data/datMem/address
add wave -noupdate /CPU_testbench/dut/data/datMem/writedata
add wave -noupdate /CPU_testbench/dut/data/datMem/writeenable
add wave -noupdate /CPU_testbench/dut/data/datMem/clk
add wave -noupdate /CPU_testbench/dut/data/datMem/data
add wave -noupdate /CPU_testbench/dut/data/datMem/temp
add wave -noupdate /CPU_testbench/dut/data/ALUSourceMux/out
add wave -noupdate /CPU_testbench/dut/data/aluComp/BussB
add wave -noupdate /CPU_testbench/dut/data/aluComp/Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {69039685420 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 332
configure wave -valuecolwidth 404
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
WaveRestoreZoom {0 ps} {143183472097 ps}
