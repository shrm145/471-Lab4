module Execute(memAddr, dataIn, zero, overflow, CarryOut, negative, toALU1, toALU2, storedRt, ALUControl, clk, reset);
	output[31:0] memAddr, dataIn;
	output zero, overflow, CarryOut, negative;
	
	input[31:0] toALU1, toALU2, storedRt;
	input [1:0] ALUControl;
	input clk, reset;
	
	wire [31:0] ALUoutput;
	
	// ALU for CPU		  
	alu aluComp (.Output(ALUoutput), .zero, .overflow, .CarryOut, .negative, .BussA(toALU1), .BussB(toALU2), .ALUControl);