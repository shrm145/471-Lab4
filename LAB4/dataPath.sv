// Michaela Bartz and Shruti Misra
`timescale 1 ps / 100 fs

module dataPath(regRS, negative, zero, CarryOut, overflow, Rs, Rt, Rd, imm16, Branch, ALUSource, RegWrite, MemWrite, MemToReg, RegDest, ALUControl, clk);
	output [29:0] regRS;
	output negative, zero, CarryOut, overflow;
		
	input Branch, ALUSource, RegWrite, MemWrite, MemToReg, RegDest;
	input clk;
	input [1:0] ALUControl;
	input [4:0] Rs, Rt, Rd;
	input [15:0] imm16;
	
	// RegFile wires
	wire [31:0] WriteData;
	wire [31:0] readRs, readRt;
	wire [4:0] WriteRegAddr;
	wire [31:0] signExImm16;
	
	// ALU wires
	wire [31:0] ALUoutput, constCPU, BussB;

	// Memory wires
	wire [31:0] memData;
	
	// Pipelining wires
	wire [31:0] toALU1, toALU2, storedRt1, storedRt2, dataIn, dataOut, memAddr, memAddr1, writeVal, memData1;
	
	assign regRS = readRs[31:2];	
	
	
	// ------ REG DECODE / WRITEBACK STAGE ------

	// determines which register address is writen to in regfile
	mux2_1_5Bit regDestMux (.out(WriteRegAddr), .in0(Rt), .in1(Rd), .sel(RegDest));
	
	// register file of CPU. Can read 2 values
	regfile rf (.ReadData1(readRs), .ReadData2(readRt), .WriteData, 
			  .ReadRegister1(Rs), .ReadRegister2(Rt), .WriteRegister(WriteRegAddr),
			  .RegWrite, .clk(~clk);

	// Sign extends imm16 value to 32 bit value
	signExtnd extImm16 (.outExtnd(signExImm16), .inExtnd(imm16));
			  
	// Determines if sign extended 16 bit or 32 bit 0 is sent as parameter		  
	mux2_1_32Bit signImmMux (.out(constCPU), .in0(signExImm16), .in1(32'b0), .sel(Branch));
	
	// Determines if the constant from signImmMux or the 2nd reg value is sent into ALU on BussB
	mux2_1_32Bit ALUSourceMux (.out(BussB), .in0(readRt), .in1(constCPU), .sel(ALUSource));
	
	// Pipelining registers
	register32Bit ALUin1 (.q(toALU1), .d(readRs), .reset, .clk);
	register32Bit ALUin2 (.q(toALU2), .d(BussB), .reset, .clk);
	register32Bit RT1 (.q(storedRt1), .d(readRt), .reset, .clk);
	
	
	// ------ EXECUTE STAGE ------
	
	// ALU for CPU		  
	alu aluComp (.Output(ALUoutput), .zero, .overflow, .CarryOut, .negative, .BussA(toALU1), .BussB(toALU2), .ALUControl);
	
	// Pipelining registers
	register32Bit ALUtoMem (.q(memAddr), .d(ALUoutput), .reset, .clk);
	register32Bit RT2 (.q(storedRt2), .d(storedRt1), .reset, .clk);
	
	
	// ------ MEMORY STAGE ------
	
	// data memory for CPU
	dataMem datMem(.data(memData), .address(memAddr), .writedata(storedRt2), .writeenable(MemWrite), .clk);
	
	// Pipelining registers
	register32Bit memoryData (.q(memData1), .d(memData), .reset, .clk);
	register32Bit memoryAddr (.q(memAddr1), .d(memAddr), .reset, .clk);
	
	
	// ------ WRITEBACK STAGE ------
	
	// determines whether the memory output or ALUoutput is sent to be written to the regfile
	mux2_1_32Bit memToRegMux (.out(WriteData), .in0(memAddr1), .in1(memData1), .sel(MemToReg));
	
endmodule 

module dataPath_testbench();
	wire [29:0] regRS;
	wire negative;
	reg Branch, ALUSource, RegWrite, MemWrite, MemToReg, RegDest, clk;
	reg [1:0] ALUControl;
	reg [4:0] Rs, Rt, Rd;
	reg [15:0] imm16;
	
	parameter ClockDelay = 5000;
	
	dataPath dut(.regRS, .negative, .Rs, .Rt, .Rd, .imm16, .Branch, .ALUSource, 
					 .RegWrite, .MemWrite, .MemToReg, .RegDest, .ALUControl, .clk);
					 
	initial begin
		// EXPECTED CASES
			
			// ADDI set reg[1] = reg[0] + 4 = 4
			// output: reg[rs] = X; negative = 0;
			Rs <= 5'b00000;
			Rt <= 5'b00001; 
			Rd <= 5'b00010; // dont czre
			imm16 <= 16'b0100; // 4
			RegDest <= 1'b1; // dont care
			ALUSource <= 1'b1;
			RegWrite <= 1'b0;
			MemWrite <= 1'b0; 
			MemToReg <= 1'b0; // dont care
			Branch <= 1'b0;
			ALUControl <= 2'b00; //add 	
			@(posedge clk)
			
			// STORE set Mem [1 + reg[0]] = reg[1] = 4
			// output: reg[rs] = 0; negative = dont care
			Rs <= 5'b00000;
			Rt <= 5'b00001; 
			Rd <= 5'b00010; // dont care
			imm16 <= 16'b01; // 4
			RegDest <= 1'b1; // dont care
			ALUSource <= 1'b1; //dont care
			RegWrite <= 1'b0;
			MemWrite <= 1'b1; 
			MemToReg <= 1'b0; // dont care
			Branch <= 1'b0; // dont care
			ALUControl <= 2'b00; //add 	
			@(posedge clk)
			
			
			// ADDI set reg[2] = reg[1] + 3 = 7
			// output: reg[rs] = 4; negative = 0;
			Rs <= 5'b00001;
			Rt <= 5'b00010; 
			Rd <= 5'b00010; // dont care
			imm16 <= 16'b0011; // 3
			RegDest <= 1'b1; // dont care
			ALUSource <= 1'b1;
			RegWrite <= 1'b0;
			MemWrite <= 1'b0; 
			MemToReg <= 1'b0; // dont care
			Branch <= 1'b0;
			ALUControl <= 2'b00; //add 	
			@(posedge clk)
			
			
		// ERROR HANDLING
	
	
	$stop;
	end

	initial clk = 0;
	always begin
		#(ClockDelay/2); 
		clk = ~clk;
	end	
	
endmodule 