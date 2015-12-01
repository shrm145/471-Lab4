module Memory (writeData_fwd, writeToReg, Rt_wr, Rd_wr, MemWrite, MemToReg, memAddr, storedRt2, Rt_mem, Rd_mem, clk, reset);
	output [31:0] writeToReg, writeData_fwd;
	output [4:0] Rt_wr, Rd_wr;
	input [31:0] memAddr, storedRt2;
	input MemWrite, MemToReg; // ctrls
	input clk, reset;
	input [4:0] Rt_mem, Rd_mem;
	wire [31:0] memData, WriteData;
	
	assign writeData_fwd = WriteData;

	// data memory for CPU
	dataMem datMem(.data(memData), .address(memAddr), .writedata(storedRt2), .writeenable(MemWrite), .clk);
	
	// determines whether the memory output or ALUoutput is sent to be written to the regfile
	mux2_1_32Bit memToRegMux (.out(WriteData), .in0(memAddr), .in1(memData), .sel(MemToReg));
	
	// Pipelining registers
	register32Bit memoryData (.q(writeToReg), .d(WriteData), .reset, .clk);
	register32Bit RT2 (.q(Rt_wr), .d(Rt_mem), .reset, .clk);
	register32Bit RD2 (.q(Rd_wr), .d(Rd_mem), .reset, .clk);
	

endmodule 