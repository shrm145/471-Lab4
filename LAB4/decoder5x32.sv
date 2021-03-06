// Michaela Bartz and Shruti Misra
// Lab 3

`timescale 1 ps / 100 fs

module decoder5x32(out, in, enable);
	input enable;
	input [4:0] in;
	output [31:0] out;
	
	wire [1:0] tempEnable;
	wire in4Bar;
	
	// creates a master 1 by 2 decoder to control the two 4 by 16 decoders
	not(in4Bar, in[4]);
	and(tempEnable[0], in4Bar, enable);
	and(tempEnable[1], in[4], enable);
	
	decoder4x16 dec0 (.out(out[15:0]), .in(in[3:0]), .enable(tempEnable[0]));
	decoder4x16 dec1 (.out(out[31:16]), .in(in[3:0]), .enable(tempEnable[1]));
	
endmodule
	
	
module decoder5x32_testbench();

	reg enable;
	reg [4:0] in;
	wire [31:0] out;
	
	decoder5x32 dut (.out, .in, .enable);

	initial begin // Stimulus
		enable = 0; in = 1; #10;
		enable = 1; in = 2; #10;
		enable = 1; in = 8; #10;
		enable = 1; in = 12; #10;
		enable = 1; in = 16; #10;
		enable = 1; in = 20; #10;
		enable = 0; in = 31; #10;
	end 
 
endmodule 