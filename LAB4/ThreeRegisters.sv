module ThreeRegisters (out0, out1, out2, in0, in1, in2, clk, reset);
	input [31:0] in0, in1, in2;
	output [31:0] out0, out1, out2;
	input clk, reset;
	
	OneRegister (.q(out0), .d(in0), .reset, .clk);
	OneRegister (.q(out1), .d(in1), .reset, .clk);
	OneRegister (.q(out2), .d(in2), .reset, .clk);
	
endmodule 