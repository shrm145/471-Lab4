// Michaela Bartz and Shruti Misra
`timescale 1 ps / 100 fs


module sub32Bit #(parameter WIDTH = 32)(out, in0, in1, ctrl);
	output [WIDTH-1:0] out;
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
	
	assign out = tempOut;	
	
endmodule 