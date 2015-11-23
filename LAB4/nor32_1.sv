//Michaela Bartz and Shruti Misra
//EE 471 Lab 2

// Test bench for Register file
`timescale 1 ps / 100 fs

module nor32_1 (out, in);
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
	
	and #50 (andOut[0], norOut[0], norOut[1], norOut[2], norOut[3]);
	and #50 (andOut[1], norOut[4], norOut[5], norOut[6], norOut[7]);
	and #50 (out, andOut[0], andOut[1]);
	
endmodule
	
module nor32_1_testbench();
	wire out;
	reg [31:0] in;

	nor32_1 dut (.out, .in);
	
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
