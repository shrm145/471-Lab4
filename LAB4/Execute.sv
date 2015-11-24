module Execute (memAddr, storedRt2, negative, zero, CarryOut, overflow, ALUControl, toALU1, toALU2, storedRt1, reset, clk);
	output [31:0] memAddr, storedRt2;
	output negative, zero, CarryOut, overflow;
	input [31:0] toALU1, toALU2, storedRt1;
	input [1:0] ALUControl;
	input reset, clk;
	
	wire [31:0] ALUoutput, constCPU, BussB;

	
	// ALU for CPU		  
	alu aluComp (.Output(ALUoutput), .zero, .overflow, .CarryOut, .negative, .BussA(toALU1), .BussB(toALU2), .ALUControl);
	
	// Pipelining registers
	register32Bit ALUtoMem (.q(memAddr), .d(ALUoutput), .reset, .clk);
	register32Bit RT2 (.q(storedRt2), .d(storedRt1), .reset, .clk);
	

endmodule 