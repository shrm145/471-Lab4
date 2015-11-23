# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.

# data Path
vlog "./dataPathTEST.sv"
vlog "./mux2_1_5Bit.sv"
vlog "./mux2_1_32Bit.sv"
vlog "./mux4_1.sv"
vlog "./dataMem.sv"
vlog "./signExtnd.sv"

# reg file
vlog "./mux32_1.sv"
vlog "./mux32_32.sv"
vlog "./mux16_1.sv"
vlog "./decoder5x32.sv"
vlog "./decoder4x16.sv"
vlog "./decoder2x4.sv"
vlog "./D_FF.sv"
vlog "./mux2_1.sv"
vlog "./DFF_32.sv"
vlog "./regfile.sv"

# alu
vlog "./mux2_1Bit.sv"
vlog "./mux2_1_32Bit.sv"
vlog "./mux4_1_32Bit.sv"
vlog "./adder.sv"
vlog "./zeroFlag.sv"
vlog "./adder32Bit.sv"
vlog "./calcSltu.sv"
vlog "./nor32Bit.sv"
vlog "./alu.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work dataPathTEST_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do dataPathTEST_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
