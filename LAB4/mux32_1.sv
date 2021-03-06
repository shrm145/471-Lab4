// Michaela Bartz and Shruti Misra
// Lab 3

`timescale 1 ps / 100 fs

module mux32_1 (out, in, sel);

	input [31:0] in;
	input [4:0] sel;
	output out;
	
	wire [1:0] tempIn;
	
	mux2_1 master (.out, .in(tempIn), .sel(sel[4]));
	
	mux16_1 mux0 (.out(tempIn[0]), .in(in[15:0]), .sel(sel[3:0]));
	mux16_1 mux1 (.out(tempIn[1]), .in(in[31:16]), .sel(sel[3:0]));
			
endmodule
	
module mux32_1_testbench();

	reg [31:0] in;
	reg [4:0] sel;
	wire out;
	
	mux32_1 dut (.out, .in, .sel); 

	initial begin // Stimulus
		sel = 0; in = 0; #10;
		sel = 2; in = 4; #10;
		sel = 2; in = 8; #10;
		sel = 4; in = 16; #10;
		sel = 4; in = 0; #10;
		sel = 20; in = 1048576; #10;
		sel = 20; in = 0; #10;
	end 
 
endmodule 