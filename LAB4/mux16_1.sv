// Michaela Bartz and Shruti Misra
// Lab 3

`timescale 1 ps / 100 fs

module mux16_1 #(parameter WIDTH=4) (out, in, sel);
	input [15:0] in;
	input [3:0] sel;
	output out;
	
	wire [3:0] tempIn;
	
	mux4_1 master (.out, .in(tempIn), .sel(sel[3:2]));
	
	initial assert(WIDTH>0);
 
	genvar i;
	
	generate
		for(i=0; i<WIDTH; i++) begin : eachDec
			mux4_1 mux (.out(tempIn[i]), .in(in[((i*WIDTH)+(WIDTH - 1)):(i*WIDTH)]), .sel(sel[1:0]));
		end
	endgenerate
	
endmodule


module mux16_1_testbench();

	reg [15:0] in;
	reg [3:0] sel;
	wire out;
	
	mux16_1 dut (.out, .in, .sel); 

	integer i;
	initial begin // Stimulus
		for(i=0; i<16; i++) begin
			sel = i; 
			in = 2; #10;
			in = 4; #10;
			in = 256; #10;
			
		end		
	end 
 
endmodule 