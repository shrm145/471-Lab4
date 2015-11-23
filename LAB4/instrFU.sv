// Michaela Bartz and Shruti Misra
`timescale 1 ps / 100 fs

module instrFU(instruction, Jump, JR, Branch, negative, imm16, jumpTarget, regRS, reset, clk);
	output [31:0] instruction;
	
	input Jump, JR, Branch, negative;
	input [15:0] imm16;
	input [25:0] jumpTarget;
	input [29:0] regRS; // not including last 2 bits of regRS
   input clk, reset;
	
	wire valToAdderCtrl; 
	wire [29:0] PCin, PCout, constCtrl, PCnoJump, PC;
	wire [31:0] signExImm16;
	
	PC programCounter (.outPC(PCout), .inPC(PCin), .reset, .clk);

	// determines value of PC. If JR set equal to ALUoutput, otherwise keep previous PC value
	mux2_1_30Bit detPCMux (.out(PCin), .in0(PC), .in1(regRS), .sel(JR));
	
	// determines control for valToAdderMux. Positive if branching and Reg[rs] is negative 
	and #50 (valToAdderCtrl, Branch, negative);
	
	// NEED SIGN EXTEND HERE (output inputs to in1 of valToAdderMux below)
	signExtnd extImm16 (.outExtnd(signExImm16), .inExtnd(imm16));
	
	// determines value sent to added to PC. 
	mux2_1_30Bit valToAdderMux (.out(constCtrl), .in0(30'b0), .in1(signExImm16[29:0]), .sel(valToAdderCtrl));
	
	
	// 30 bit adder that updates program counter
	adder30Bit adder30 (.out(PCnoJump), .cin(1'b1), .in0(PCout), .in1(constCtrl));
	
	// determines PC based on whether the instruction is a jump
	mux2_1_30Bit jumpMux (.out(PC), .in0(PCnoJump), .in1({PCout[29:26], jumpTarget}), .sel(Jump));
	
	//Instruction memory, gets instruction at PC
	InstructionMem getInstr (.instruction, .address({PCout, 2'b00}));
	endmodule 
	
module instrFU_testbench();
	wire [31:0] instruction;
	reg Jump, JR, Branch, negative;
	reg [15:0] imm16;
	reg [25:0] jumpTarget;
	reg [29:0] regRS; // not including last 2 bits of regRS
	reg clk, reset;
	
	parameter ClockDelay = 2147483647;
	
	initial clk = 1;
	always begin
		#(ClockDelay/2); 
		clk = ~clk;
	end

	instrFU dut(.instruction, .Jump, .JR, .Branch, .negative, .imm16, .jumpTarget, .regRS, .reset, .clk);
	 
	 	initial begin
		reset<= 1'b1; @(posedge clk);
		reset<=1'b0;
		Jump <= 1'b0; JR <= 1'b0; Branch <= 1'b1; negative <= 1'b1; imm16 <= 16'b01; jumpTarget <= 26'b01111; regRS <= 30'b0;	@(posedge clk); @(posedge clk);
			@(posedge clk); @(posedge clk);	@(posedge clk); @(posedge clk);	
		Jump <= 1'b1; JR <= 1'b1; Branch <= 1'b0; negative <= 1'b0; imm16 <= 16'b0; jumpTarget <= 26'b10; regRS <= 30'b11;	@(posedge clk); @(posedge clk);
		
		$stop;
	end
	
	
endmodule
	 
	 