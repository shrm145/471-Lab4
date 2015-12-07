// Michaela Bartz and Shruti Misra
// Lab 3

`timescale 1 ps / 100 fs

module decoder4x16 #(parameter WIDTH=4) (out, in, enable);
	input [3:0] in;
	input enable;
	output [15:0] out;
	
	wire [3:0] tempEnable;
	
	decoder2x4 master (.out(tempEnable), .in(in[3:2]), .enable);
	
	initial assert(WIDTH>0);
 
	genvar i;
	
	generate
		for(i=0; i<WIDTH; i++) begin : eachDec
			decoder2x4 dec (.out(out[((i*WIDTH)+(WIDTH - 1)):(i*WIDTH)]), .in(in[1:0]), .enable(tempEnable[i]));
		end
	endgenerate
	
	
endmodule
