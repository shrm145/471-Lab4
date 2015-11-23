// Michaela Bartz and Shruti Misra
// EE 471 Lab 2
// Creates 32 bit 4 input to 1 output mux


`timescale 1 ps / 100 fs

module mux4_1_32Bit (out, in0, in1, in2, in3, sel);
	output [31:0] out;
	input [31:0] in0, in1, in2, in3;
	input [1:0] sel;
		
	wire [31:0] temp0, temp1;
	
	mux2_1_32Bit mux0 (.out(temp0), .in0, .in1, .sel(sel[0]));
	mux2_1_32Bit mux1 (.out(temp1), .in0(in2), .in1(in3), .sel(sel[0]));
	
	mux2_1_32Bit master (.out, .in0(temp0), .in1(temp1), .sel(sel[1]));	
	
endmodule 