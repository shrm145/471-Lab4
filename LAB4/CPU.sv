// Michaela Bartz and Shruti Misra
`timescale 1 ps / 100 fs

module CPU(clk, reset);
	input clk, reset;
	
	// CONTROLS
	wire Branch, Jump, JR, ALUSource, RegWrite, MemWrite, MemToReg, RegDest, negative;
	wire zero, CarryOut, overflow;
	wire [1:0] ALUControl;
	wire [31:0] instruction, nextInstr; 
	wire [29:0] regRS;

	wire [4:0] Rs, Rt, Rd;
	wire [15:0] imm16;
	wire [25:0] jumpTarget;
	
	register32Bit instrFetch(.q(instruction), .d(nextInstr), .reset, .clk);
	
	assign Rs = instruction[25:21];
	assign Rt = instruction[20:16];
	assign Rd = instruction[15:11];
	assign imm16 = instruction[15:0];
	assign jumpTarget = instruction[25:0];
	

	// -------- CONTROLS --------
	controls calcCtrls (.Branch, .Jump, .JR, .ALUSource, .ALUControl, .RegWrite, .MemWrite, .MemToReg, .RegDest, .instruction);
	
	// -------- INSTRUCTION FETCH --------
	instrFU getinstr(.instruction(nextInstr), .Jump, .JR, .Branch, .negative, .imm16, .jumpTarget, .regRS, .reset, .clk);
	
	// -------- DATA PATH --------
	 dataPath data (.regRS, .negative, .zero, .CarryOut, .overflow, .Rs, .Rt, .Rd, .imm16, .Branch, .ALUSource, .RegWrite, .MemWrite, .MemToReg, .RegDest, .ALUControl, .clk);
	
endmodule	


module CPU_testbench();
	reg clk, reset;
	
	parameter ClockDelay = 2147483647;
	
	CPU dut(.clk, .reset);
	
	integer i;
	
	initial begin
	reset <= 1'b1;
	@(posedge clk);
	@(posedge clk);
	reset <= 1'b0;
	@(posedge clk);

	for (i = 0; i< 200; i++) begin
		@(posedge clk);
	end 
	
	$stop;
	end
	
	initial clk = 0;
	always begin
		#(ClockDelay/2); 
		clk = ~clk;
	end
	
endmodule 