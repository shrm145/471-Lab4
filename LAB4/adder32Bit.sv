// Michaela Bartz and Shruti Misra
// Implements 32 bit full adder/subtractor that outputs a sum, carry out and overflow


`timescale 1 ps / 100 fs

module adder32Bit #(parameter WIDTH = 32)(out, cout, overflow, in0, in1, ctrl);
	output [WIDTH-1:0] out;
	output cout, overflow;
	input [WIDTH-1:0] in0, in1;
	input ctrl;
	
	wire[WIDTH:0] carryValues; // contains carry in and carry out values
	wire [WIDTH-1:0] in1ToAdder, notIn1, tempOut;
	
	assign carryValues[0] = ctrl;
	
	// compute sum of each bit to calculate 32 bit sum
	genvar i;	
	generate
		for(i=0; i<WIDTH; i++) begin : eachBit
		
			// flip in1[i] bit if subtracting (ie ctrl = 1)
			not #50 (notIn1[i], in1[i]);
			mux2_1Bit muxToSubtract (.out(in1ToAdder[i]), .in0(in1[i]), .in1(notIn1[i]), .sel(ctrl));
			
			adder addrBit (.sum(tempOut[i]), .cout(carryValues[i+1]), .a(in0[i]), .b(in1ToAdder[i]), .cin(carryValues[i]));
		end
	endgenerate
	
	// overflow is xor of last two carry out values 
	xor #50(overflow, carryValues[WIDTH-1], carryValues[WIDTH]);
	
	// Carry Out = carry out of last bit (ie CarryValues[31+1])
	assign cout = carryValues[WIDTH];
	assign out = tempOut;	
	
endmodule 

module adder32Bit_testbench();
	parameter WIDTH = 32;
	wire [WIDTH-1:0] out;
	wire cout, overflow;
	reg [WIDTH-1:0] in0, in1;
	reg ctrl;
	
	adder32Bit dut (.out, .cout, .overflow, .in0, .in1, .ctrl);

	initial begin
		ctrl = 0;
		in0 = 0; in1 = 0; #100000;
		in0 = 2; in1 = 8; #100000;
		in0 = 10; in1 = 0; #100000;
		ctrl = 1; 
		in0 = 40; in1 = 12; #100000;
		in0 = 54; in1 = 100; #100000;
		
	end
endmodule 