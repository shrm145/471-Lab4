// Michaela Bartz and Shruti Misra
`timescale 1 ps / 100 fs

module adder30Bit #(parameter WIDTH = 30)(out, cin, in0, in1);
	output [WIDTH-1:0] out;
	//output cout, overflow;
	input [WIDTH-1:0] in0, in1;
	input cin;
	
	wire[WIDTH:0] carryValues; // contains carry in and carry out values
	
	assign carryValues[0] = cin;
	
	// compute sum of each bit to calculate 32 bit sum
	genvar i;	
	generate
		for(i=0; i<WIDTH; i++) begin : eachBit
			
			adder addrBit (.sum(out[i]), .cout(carryValues[i+1]), .a(in0[i]), .b(in1[i]), .cin(carryValues[i]));
		end
	endgenerate
	
	//assign out = tempOut;	
	
endmodule 

module adder30Bit_testbench();
	parameter WIDTH = 30;
	wire [WIDTH-1:0] out;
	//output cout, overflow;
	reg [WIDTH-1:0] in0, in1;
	reg cin;
	
	
	adder30Bit dut (.out, .cin, .in0, .in1);

	initial begin
		
		cin = 1;
		in0 = 0; in1 = 0; #100000;
		in0 = 2; in1 = 8; #100000;
		in0 = 10; in1 = 0; #100000;
		in0 = 40; in1 = 12; #100000;
		in0 = 54; in1 = 100; #100000;
		
	end
endmodule 