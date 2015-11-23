`timescale 1 ps / 100 fs

module instructionFetch(instruction, PCoutput, PCJumpOut, PCinput, Jump, JR, Branch, negative, imm16, jumpTarget, regRS, reset, clk);
	output [31:0] instruction;
	output [29:0] PCoutput,PCJumpOut;
	
	input Jump, JR, Branch, negative;
	input [29:0] PCinput;
	input [15:0] imm16;
	input [25:0] jumpTarget;
	input [29:0] regRS; // not including last 2 bits of regRS
   input clk, reset;
	
	wire valToAdderCtrl; 
	wire [29:0] PCin, PCout, constCtrl, PCnoJump, PC;
	wire [31:0] signExImm16;
	
	assign PCoutput = PCout;
	
	PC programCounter (.outPC(PCout), .inPC(PCin), .reset, .clk);

	// determines value of PC. If JR set equal to ALUoutput, otherwise keep previous PC value
	mux2_1_30Bit detPCMux (.out(PCin), .in0(PCinput), .in1(regRS), .sel(JR));
	
	// determines control for valToAdderMux. Positive if branching and Reg[rs] is negative 
	and #50 (valToAdderCtrl, Branch, negative);
	
	// NEED SIGN EXTEND HERE (output inputs to in1 of valToAdderMux below)
	signExtnd extImm16 (.outExtnd(signExImm16), .inExtnd(imm16));
	
	// determines value sent to added to PC. 
	mux2_1_30Bit valToAdderMux (.out(constCtrl), .in0(30'b0), .in1(signExImm16[29:0]), .sel(valToAdderCtrl));
	
	
	// 30 bit adder that updates program counter
	adder30Bit adder30 (.out(PCnoJump), .cin(1'b1), .in0(PCout), .in1(constCtrl));
	
	// determines PC based on whether the instruction is a jump
	mux2_1_30Bit jumpMux (.out(PCJumpOut), .in0(PCnoJump), .in1({PCout[29:26], jumpTarget}), .sel(Jump));
	
	//Instruction memory, gets instruction at PC
	InstructionMem getInstr (.instruction, .address({PCout, 2'b00}));
	endmodule 
	
module instructionFetch_testbench();
	wire [31:0] instruction;
	wire [29:0] PCoutput, PCJumpOut;
	reg Jump, JR, Branch, negative;
	reg [29:0] PCinput;
	reg [15:0] imm16;
	reg [25:0] jumpTarget;
	reg [29:0] regRS; // not including last 2 bits of regRS
	reg clk, reset;
	
	parameter ClockDelay = 10000000;
	
	initial clk = 1;
	always begin
		#(ClockDelay/2); 
		clk = ~clk;
	end

	instructionFetch dut(.instruction, .PCoutput, .PCJumpOut, .PCinput, .Jump, .JR, .Branch, .negative, .imm16, .jumpTarget, .regRS, .reset, .clk);
	 
	 	initial begin
		reset<= 1'b1; @(posedge clk);
		reset<=1'b0;
		PCinput <=30'b0;
		Jump <= 1'b1; JR <= 1'b0; Branch <= 1'b0; negative <= 1'b0; imm16 <= 16'b0; jumpTarget <= 26'b01111; regRS <= 30'b0;	@(posedge clk); @(posedge clk);
		PCinput <=30'b11111111;
		Jump <= 1'b0; JR <= 1'b0; Branch <= 1'b0; negative <= 1'b0; imm16 <= 16'b0; jumpTarget <= 26'b0; regRS <= 30'b0;	@(posedge clk); @(posedge clk);
		
		$stop;
	end
	
	
endmodule
	 
	 