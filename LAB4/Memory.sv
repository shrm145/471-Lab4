module Memory (writeToReg, MemWrite, MemToReg, memAddr, storedRt2, clk, reset);
	output [31:0] writeToReg;
	input [31:0] memAddr, storedRt2;
	input MemWrite, MemToReg; // ctrls
	input clk, reset;
	
	wire [31:0] memData, WriteData;

	// data memory for CPU
	dataMem datMem(.data(memData), .address(memAddr), .writedata(storedRt2), .writeenable(MemWrite), .clk);
	
	// determines whether the memory output or ALUoutput is sent to be written to the regfile
	mux2_1_32Bit memToRegMux (.out(WriteData), .in0(memAddr), .in1(memData), .sel(MemToReg));
	
	// Pipelining registers
	register32Bit memoryData (.q(writeToReg), .d(WriteData), .reset, .clk);

endmodule 