// Michaela Bartz and Shruti Misra
`timescale 1 ps / 100 fs

module mux2_1_5Bit #(parameter WIDTH=5) (out, in0, in1, sel);
	input [WIDTH-1:0] in0, in1;
	input sel;
	output [WIDTH-1:0]out;
	
	genvar i;
	
	generate
		for(i=0; i<WIDTH; i++) begin : eachDec
			mux2_1Bit mux0(.out(out[i]), .in0(in0[i]), .in1(in1[i]), .sel); 
		end
	endgenerate
	
endmodule 

module mux2_1_5Bit_testbench();
	reg [4:0] in0, in1;
	reg sel;
	wire [4:0]out;
	
	mux2_1_5Bit dut (.out, .in0, .in1, .sel);
	
	initial begin
		in0=0; in1=3; 
		sel = 0; #1000;
		sel = 1; #1000;
		in0=0; in1=2; 
		sel = 0; #1000;
		sel = 1; #1000;
			
	end
endmodule 
	