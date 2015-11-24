// Michaela Bartz and Shruti Misra
// Lab 3

`timescale 1 ps / 100 fs
module register32Bit #(parameter WIDTH=32) (q, d, reset, clk);
	output [WIDTH-1:0] q;
	input [WIDTH-1:0] d;
	input reset, clk;
	
	initial assert(WIDTH>0);
 
	genvar i;
	
	generate
		for(i=0; i<WIDTH; i++) begin : eachDff
			D_FF dff (.q(q[i]), .d(d[i]), .reset, .clk);
		end
	endgenerate
	
endmodule 


module register32Bit_testbench();
	parameter WIDTH = 32;
	wire [WIDTH-1:0] q;
	reg [WIDTH-1:0] d;
	reg reset, clk;
 
	parameter period = 100;
	
	DFF_32 dut (.q, .d, .reset, .clk);
 
	initial clk = 1;
	
	always begin
		#(period/2);
		clk = ~clk;
	end 
	
	initial begin
		reset <= 1; d <= 0; 						@(posedge clk);@(posedge clk);@(posedge clk);
		reset <= 0; 								@(posedge clk);@(posedge clk);@(posedge clk);
		d <= 2;  									@(posedge clk);@(posedge clk);@(posedge clk);								@(posedge clk);@(posedge clk);@(posedge clk);
		d <= 5; 										@(posedge clk);@(posedge clk);@(posedge clk);
		d <= 1; 										@(posedge clk);@(posedge clk);@(posedge clk);						@(posedge clk);@(posedge clk);@(posedge clk);
		d <= 5; 										@(posedge clk);@(posedge clk);@(posedge clk);
		d <= 1; 										@(posedge clk);@(posedge clk);@(posedge clk);
	end
endmodule
