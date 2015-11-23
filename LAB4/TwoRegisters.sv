module TwoRegisters (out0, out1, in0, in1, clk, reset);
	input [31:0] in0, in1;
	output [31:0] out1, out0;
	input clk, reset;
	
	OneRegister (.q(out0), .d(in0), .reset, .clk);
	OneRegister (.q(out1), .d(in1), .reset, .clk);
	
endmodule 