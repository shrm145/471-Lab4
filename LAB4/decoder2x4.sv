// Michaela Bartz and Shruti Misra
// Lab 3

`timescale 1 ps / 100 fs

module decoder2x4 (out, in, enable);
	input [1:0] in;
	input enable;
	output [3:0] out;
	
	wire [1:0] inBar;
	
	not #50(inBar[0], in[0]);
	not #50(inBar[1], in[1]);
	and #50(out[0], inBar[0], inBar[1], enable);
	and #50(out[1], in[0], inBar[1], enable);
	and #50(out[2], inBar[0], in[1], enable);
	and #50(out[3], in[0], in[1], enable);
	
endmodule
