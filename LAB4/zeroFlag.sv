// Michaela Bartz and Shruti Misra
// EE 471 Lab 2
// Determines if 32 bit input is equal to 0


`timescale 1 ps / 100 fs

module zeroFlag (out, in);
	output out;
	input [31:0] in;
	
	wire [7:0] norOut;
	wire [1:0] andOut;
	
	genvar i;
	
	generate
		for(i=0; i<8; i++) begin : eachNor
			nor #50 (norOut[i], in[i*4], in[i*4+1], in[i*4+2], in[i*4+3]);	
		end 
	endgenerate 
	
	// Anding the outputs of the nors will determine if input is all 0's
	and #50 (andOut[0], norOut[0], norOut[1], norOut[2], norOut[3]);
	and #50 (andOut[1], norOut[4], norOut[5], norOut[6], norOut[7]);
	and #50 (out, andOut[0], andOut[1]);
	
endmodule
	
module zeroFlag_testbench();
	wire out;
	reg [31:0] in;

	zeroFlag dut (.out, .in);
	
	integer i;
	
	initial begin
		in = 0; 
		for(i=0; i<200; i++) begin
			in = i; #1000;
		end
		in=32'h7FFFFFFF; #1000;
		in=32'h00000001; #1000;
		in=32'hFFFFFFFF; #1000;
	end

endmodule 
