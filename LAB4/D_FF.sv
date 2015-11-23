// Michaela Bartz and Shruti Misra
// Lab 3

`timescale 1 ps / 100 fs
module D_FF(q, d, reset, clk);
	output reg q;
	input d, reset, clk;
	
	always @(posedge clk)
	if (reset)
		q <= 0;
	else	
		q <= d;
endmodule
