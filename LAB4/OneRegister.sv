`timescale 1 ps / 100 fs
module Register #(parameter WIDTH=32) (q, d, reset, clk);
	output [WIDTH-1:0] q;
	input [WIDTH-1:0] d;
	input  reset, clk;
	wire [WIDTH-1:0] in;
	
	initial assert(WIDTH>0);
 
	genvar i;
	
	generate
		for(i=0; i<WIDTH; i++) begin : eachDff
			D_FF dff (.q(q[i]), .d(in[i]), .reset, .clk);
		end
	endgenerate
	
endmodule 