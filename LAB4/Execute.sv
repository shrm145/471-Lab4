// Michaela Bartz and Shruti Misra
`timescale 1 ps / 100 fs

module Execute (ALUoutput_fwd, memAddr, storedRt2, Rt_mem, Rd_mem, negative, zero, CarryOut, overflow, ALUControl, toALU1, toALU2, storedRt1, Rt_ex, Rd_ex, reset, clk);
	output [31:0] memAddr, storedRt2, ALUoutput_fwd;
	output negative, zero, CarryOut, overflow;
	output [4:0] Rt_mem, Rd_mem;
	input [31:0] toALU1, toALU2, storedRt1;
	input [1:0] ALUControl;
	input reset, clk;
	input [4:0] Rt_ex, Rd_ex;
	
	wire [31:0] ALUoutput, constCPU, BussB;
	
	assign ALUoutput_fwd = ALUoutput;

	
	// ALU for CPU		  
	alu aluComp (.Output(ALUoutput), .zero, .overflow, .CarryOut, .negative, .BussA(toALU1), .BussB(toALU2), .ALUControl);
	
	// Pipelining registers
	register32Bit ALUtoMem (.q(memAddr), .d(ALUoutput), .reset, .clk);
	register32Bit ReadRt2 (.q(storedRt2), .d(storedRt1), .reset, .clk);
	register32Bit RT1 (.q(Rt_mem), .d(Rt_ex), .reset, .clk);
	register32Bit RD1 (.q(Rd_mem), .d(Rd_ex), .reset, .clk);
	

endmodule 