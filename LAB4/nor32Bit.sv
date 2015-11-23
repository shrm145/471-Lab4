// Michaela Bartz
// EE 471 Lab 2
// Produces 32 bit output of noring each bit of two 32 bit inputs 


`timescale 1 ps / 100 fs

module nor32Bit #(parameter WIDTH=32) (out, in0, in1);
	input [31:0] in0, in1;
	output [31:0] out;
	
	initial assert(WIDTH>0);
 
	genvar i;
	
	generate
		for(i=0; i<WIDTH; i++) begin : eachBit
			nor #50 (out[i], in0[i], in1[i]);
		end
	endgenerate
	
endmodule 


module nor32Bit_testbench();
	reg [31:0] in0, in1;
	wire [31:0] out;
	
	nor32Bit dut (.out, .in0, .in1);
	
	initial begin
		in0 = 0; in1 = 0; #1000;
		in0 = 2; in1 = 2; #1000;
		in0 = 32; in1 = 15; #1000;
	end 
	
endmodule 