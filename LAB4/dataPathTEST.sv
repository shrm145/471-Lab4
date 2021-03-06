`timescale 1 ps / 100 fs

// Test for dataPath. outputs connection wires for debugging
module dataPathTEST(regValues, regRS, negative, WriteData_out, readRs_out, readRt_out, WriteRegAddr_out, ALUoutput_out,
							Rs, Rt, Rd, imm16, Branch, ALUSource, RegWrite, MemWrite, MemToReg, RegDest, ALUControl, clk);
	output [29:0] regRS;
	output negative;
	output [31:0][31:0] regValues;
	
	// DEBUGGING OUTPUTS
	output [31:0] WriteData_out;
	output [31:0] readRs_out, readRt_out;
	output [4:0] WriteRegAddr_out;
	output [31:0] ALUoutput_out;
	

	input Branch, ALUSource, RegWrite, MemWrite, MemToReg, RegDest;
	input clk;
	input [1:0] ALUControl;
	
	input [4:0] Rs, Rt, Rd;
	input [15:0] imm16;
	
	// REGFILE
	wire [31:0] WriteData;
	wire [31:0] readRs, readRt;
	wire [4:0] WriteRegAddr;
	wire [31:0] signExImm16;
	
	// ALU
	wire zero, overflow, CarryOut, negative;
	wire [31:0] ALUoutput, constCPU, BussB;

	// MEM
	wire [31:0] memData;
	
	assign regRS = readRs[31:2]; 
	
	// DEBUGGING
	assign WriteData_out = WriteData;
	assign readRs_out = readRs;
	assign readRt_out = readRt;
	assign WriteRegAddr_out = WriteRegAddr;
	assign ALUoutput_out = ALUoutput;

	// determines which register address is writen to in regfile
	mux2_1_5Bit regDestMux (.out(WriteRegAddr), .in0(Rt), .in1(Rd), .sel(RegDest));
	
	// register file of CPU. Can read 2 values
	regfile rf (.regValues, .ReadData1(readRs), .ReadData2(readRt), .WriteData, 
			  .ReadRegister1(Rs), .ReadRegister2(Rt), .WriteRegister(WriteRegAddr),
			  .RegWrite, .clk);
			  
	// NEED SIGN EXTEND HERE (output to in0 ob signImmMux below)
	signExtnd extImm16 (.outExtnd(signExImm16), .inExtnd(imm16));
			  
	// Determines if sign extended 16 bit or 32 bit 0 is sent as parameter		  
	mux2_1_32Bit signImmMux (.out(constCPU), .in0(signExImm16), .in1(32'b0), .sel(Branch));
	
	// Determines if the constant from signImmMux or the 2nd reg value is sent into ALU on BussB
	mux2_1_32Bit ALUSourceMux (.out(BussB), .in0(readRt), .in1(constCPU), .sel(ALUSource));
	
	// ALU for CPU		  
	alu aluComp (.Output(ALUoutput), .zero, .overflow, .CarryOut, .negative, .BussA(readRs), .BussB, .ALUControl);
	
	// data memory for CPU
	dataMem datMem(.data(memData), .address(ALUoutput), .writedata(readRt), .writeenable(MemWrite), .clk);
	
	// determines whether the memory output or ALUoutput is sent to be written to the regfile
	mux2_1_32Bit memToRegMux (.out(WriteData), .in0(ALUoutput), .in1(memData), .sel(MemToReg));
	
endmodule 


module dataPathTEST_testbench();
	wire [29:0] regRS;
	wire negative;
	wire [31:0][31:0] regValues;
	
	wire [31:0] WriteData_out;
	wire [31:0] readRs_out, readRt_out;
	wire [4:0] WriteRegAddr_out;
	wire [31:0] ALUoutput_out;
	
	wire Branch, Jump, JR, ALUSource, RegWrite, MemWrite, MemToReg, RegDest;
	wire [1:0] ALUControl;
	
	wire [4:0] Rs, Rt, Rd;
	wire [15:0] imm16;
	
	reg [31:0] instruction;
	reg clk;
	
	assign Rs = instruction[25:21];
	assign Rt = instruction[20:16];
	assign Rd = instruction[15:11];
	assign imm16 = instruction[15:0];
	
	parameter ClockDelay = 10000000;
	
	controls calcCtrls (.Branch, .Jump, .JR, .ALUSource, .ALUControl, .RegWrite, .MemWrite, .MemToReg, .RegDest, .instruction);
	
	dataPathTEST dut(.regValues, .regRS, .negative, .WriteData_out, .readRs_out, .readRt_out, .WriteRegAddr_out, .ALUoutput_out,
	             .Rs, .Rt, .Rd, .imm16, .Branch, .ALUSource,.RegWrite, .MemWrite, .MemToReg, .RegDest, .ALUControl, .clk);
					 
	initial begin
		// EXPECTED CASES
			// ADDI
			//	addi & j instructions
			// Expected results:
			// $s1 = 1
			// $s2 = 2
			// $s3 = 3
			// $s4 = -2
			instruction <= 32'b00100000000100000000000000000000;	@(posedge clk)@(posedge clk)	//addi $s0, $zero, 0	// $s0 = 0, $8
			instruction <= 32'b00100010000100010000000000000001;	@(posedge clk)@(posedge clk)	//addi $s1, $s0, 1	// $s1 = 1
			instruction <= 32'b00100010001100100000000000000001;	@(posedge clk)@(posedge clk)	//addi $s2, $s1, 1	// $s2 = 2
			instruction <= 32'b00100010001100110000000000000010;	@(posedge clk)@(posedge clk)	//addi $s3, $s1, 2	// $s3 = 3
			instruction <= 32'b00100010001101001111111111111101;	@(posedge clk)@(posedge clk)	//addi $s4, $s1, -3	// $s4 = -2
			instruction <= 32'b00001000000000000000000000000101;  @(posedge clk)@(posedge clk)	//HALT:	j HALT (HALT = 5)
			instruction <= 32'b00100000000000000000000000000000;	@(posedge clk)@(posedge clk)	//addi $zero, $zero, 0		// Bogus instruction � pipelined CPU may need it
						
			
		// ERROR HANDLING
	
	
	$stop;
	end
	
	initial clk = 0;
	always begin
		#(ClockDelay/2); 
		clk = ~clk;
	end	
	
endmodule 