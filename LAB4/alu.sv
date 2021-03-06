// Michaela Bartz and Shruti Misra
// Top Level ALU Module. Preforms 32 bit addition, subtraction, nor and sltu based on the ALU controls inputted

`timescale 1 ps / 100 fs

module alu #(parameter WIDTH = 32)(Output, zero, overflow, CarryOut, negative, BussA, BussB, ALUControl);

	input [WIDTH-1:0] BussA, BussB;
	input [1:0] ALUControl;
	output [WIDTH-1:0] Output;
	output zero, overflow, CarryOut, negative;

	wire [WIDTH-1:0] sum, norOutput;
	wire sltu;
	
	adder32Bit adder (.out(sum), .cout(CarryOut), .overflow, .in0(BussA), .in1(BussB), .ctrl(ALUControl[0]));
	nor32Bit norCalc (.out(norOutput), .in0(BussA), .in1(BussB));
	
	// sltu determines last bit of output for set less than unsigned
	calcSltu calculateSltu(.sltu, .overflow, .negative(sum[31]), .a(BussA[31]), .b(BussB[31]));
	
	// 4 to  1 mux determines output of ALU based on the ALU Controls
	mux4_1_32Bit outputCtrl (.out(Output), .in0(sum), .in1(sum), .in2(norOutput), .in3({31'b0, sltu}), .sel(ALUControl));
	
	// zero flag is determined by noring the output 
	zeroFlag calcZero (.out(zero), .in(Output));
	
	// output is negative if last bit = 1
	assign negative = Output[WIDTH-1];
	
endmodule


module ALUStimulus();

	parameter ClockDelay = 100000;

	reg [31:0] BussA, BussB;
	reg [1:0] ALUControl;

	wire [31:0] Output;
	wire zero, overflow, CarryOut, negative;

	integer i;

	// If your register file module is not named "alu" then you will
	// have to change the following line in order to create an instance of
	// your register file.  Also you must make sure that the port declarations
	// match up with the module instance in this stimulus file.
	alu alu1(.Output, .CarryOut, .zero, .overflow, .negative, .BussA, .BussB, .ALUControl);

	initial begin

		/* Addition unit testing: CarryOut, Overflow, Zero, Negative */
		ALUControl=00; 
		BussA=32'h00000DEF; BussB=32'h00000ABC; #(ClockDelay); // Should output 000018AB, ~carryout
		BussA=32'h00001234; BussB=32'h00000105; #(ClockDelay); // Should output 00001339, ~carryout
		BussA=32'h7FFFFFFF; BussB=32'h00000001; #(ClockDelay); // Should output 80000000, ~carryout, overflow, negative, ~zero
		BussA=32'h7FFFFFFF; BussB=32'h7FFFFFFF; #(ClockDelay); // Should output FFFFFFFE, ~carryout, overflow, negative, ~zero
		BussA=32'hFFFFFFFF; BussB=32'h00000001; #(ClockDelay); // Should output 00000000, carryout, ~overflow, negative, ~zero	
		
		/* Subtraction unit testing: CarryOut, Overflow, Zero, Negative */
		ALUControl=01; 
		BussA=32'h00000DEF; BussB=32'h00000ABC; #(ClockDelay); // Should output 00000333
		BussA=32'h00001234; BussB=32'h00000105; #(ClockDelay); // Should output 0000112F
		BussA=32'hF0000000; BussB=32'hF0000000; #(ClockDelay); // Should output 00000000, carryout, ~overflow, ~negative, zero 		
		BussA=32'h80000000; BussB=32'h00000001; #(ClockDelay); // Should output 7FFFFFFF, carryout, overflow, ~negative, ~zero
		BussA=32'hCABCABCA; BussB=32'hCABCABCA; #(ClockDelay); // Should output 00000000, carryout, ~overflow, ~negative, zero 
		BussA=32'h00000001; BussB=32'h80000000; #(ClockDelay); // Should output 80000001, ~carryout, ~overflow, ~egative, ~zero
			
		/* NOR unit testing: Zero, Negative */
		ALUControl=10;
		BussA=32'h00000000; BussB=32'h00000000; #(ClockDelay); // Should output FFFFFFFF, negative, ~zero
		BussA=32'hA5A5A5A5; BussB=32'h5A5A5A5A; #(ClockDelay); // Should output 00000000, ~negative, zero		
		BussA=32'hFFFFFFFF; BussB=32'hFFFFFFFF; #(ClockDelay); // Should output 00000000, ~negative, zero 
		BussA=32'h66666666; BussB=32'h66666666; #(ClockDelay); // Should output 99999999, negative, ~zero	
		
		/* SLTU unit testing*/
		ALUControl=11;
		BussA=32'hA5A5A5A5; BussB=32'h5A5A5A5A; #(ClockDelay); // Should output 00000000
		BussA=32'h00001234; BussB=32'h01003105; #(ClockDelay); // Should output 00000001
		BussA=32'h7FFFFFFF; BussB=32'h00000001; #(ClockDelay); // Should output 00000000
		BussA=32'h00000001; BussB=32'h44444444; #(ClockDelay); // Should output 00000001
		
	$stop;

	end 
endmodule 