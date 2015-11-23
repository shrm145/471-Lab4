// Michaela Bartz and Shruti Misra
// Determines value of sltu bit 


`timescale 1 ps / 100 fs

module calcSltu (sltu, overflow, negative, a, b);
	output sltu;
	input overflow, negative, a, b;
	
	wire sameSign, xnorValue, xorValue;
	
	// sameSign is true if a and b are same sign 
	xnor #50 gate0(sameSign, a, b);
	xnor #50 gate1(xnorValue, negative, overflow);
	xor #50 gate2(xorValue, negative, overflow);
	
	// if a and b are same sign, sltu = xor of neg and overflow
	// if a and b are opposite sign, sltu = xnor of neg and overlfow
	mux2_1Bit mux0 (.out(sltu), .in0(xnorValue), .in1(xorValue), .sel(sameSign)); 

endmodule 	

module calcSltu_testbench();
	wire sltu;
	reg overflow, negative, a, b;

	calcSltu dut (.sltu, .overflow, .negative, .a, .b);
	
	integer i;
	
	initial begin
		a = 1'b0; b = 1'b0;
		overflow = 1'b0; negative = 1'b0; #1000; //0
		overflow = 1'b1; negative = 1'b0; #1000; //1
		overflow = 1'b0; negative = 1'b1; #1000; //1
		overflow = 1'b1; negative = 1'b1; #1000; //0
	
		a = 1'b0; b = 1'b1;
		overflow = 1'b0; negative = 1'b0; #1000; //1
		overflow = 1'b1; negative = 1'b0; #1000; //0
		overflow = 1'b0; negative = 1'b1; #1000; //0
		overflow = 1'b1; negative = 1'b1; #1000; //1
		
		a = 1'b1; b = 1'b0;
		overflow = 1'b0; negative = 1'b0; #1000; //1
		overflow = 1'b1; negative = 1'b0; #1000; //0
		overflow = 1'b0; negative = 1'b1; #1000; //0
		overflow = 1'b1; negative = 1'b1; #1000; //1
		
		a = 1'b1; b = 1'b1;
		overflow = 1'b0; negative = 1'b0; #1000; //0
		overflow = 1'b1; negative = 1'b0; #1000; //1
		overflow = 1'b0; negative = 1'b1; #1000; //1
		overflow = 1'b1; negative = 1'b1; #1000; //0

	end

endmodule 