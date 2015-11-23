// Michaela Bartz and Shruti Misra
// Lab 3

`timescale 1 ps / 100 fs

module mux32_32 #(parameter WIDTH = 32)(out, in, sel);
	input [31:0][31:0] in;
	input [4:0] sel;
	output [31:0] out;
	
	wire [31:0][31:0] temp; 
	
	initial assert(WIDTH>0);
 
	genvar bitNum;
	genvar regNum;
	
	generate
		for(bitNum=0; bitNum<WIDTH; bitNum++) begin : eachBit
			
			// creates 32 bit temp value of each register at specified bitNum
			for(regNum=0; regNum<WIDTH; regNum++) begin : eachRegisterBit
				assign temp[bitNum][regNum]= in[regNum][bitNum];
			end 
			
			// determines value of bitNum, chosen by sel
			mux32_1 mux (.out(out[bitNum]), .in(temp[bitNum]), .sel);
		end
	endgenerate
	
endmodule 
	

module mux32_32_testbench();
	reg [31:0][31:0] in;
	reg [4:0] sel;
	wire [31:0] out;
	
	mux32_32 dut (.out, .in, .sel);
	
	integer i;
	
	initial begin
		in = 0; 
		for(i=0; i<4; i++) begin
			sel = 0; in[i] = 4; #10;
			sel = 1; in[i] = 8; #10;
			sel = 2; in[i] = 16; #10;
			sel = 3; in[i] = 0; #10;
		end
	end

endmodule
