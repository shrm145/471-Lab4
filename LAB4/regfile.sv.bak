// Michaela Bartz and Shruti Misra
// Lab 3

`timescale 1 ps / 100 fs

module regfile (regValues, ReadData1, ReadData2, WriteData, 
			  ReadRegister1, ReadRegister2, WriteRegister,
			  RegWrite, clk);
			  
	input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input [31:0] WriteData;
	input RegWrite, clk;
	output [31:0] ReadData1, ReadData2;
	output [31:0][31:0] regValues;	
	
	wire [31:0] regEnable;  			// determines which register is being written to
	wire [31:0][31:0] regVal;			// 32 registers with 32 bits
	
	parameter WIDTH = 32;
	
	assign regValues = regVal;

	decoder5x32 dec1 (.out(regEnable), .in(WriteRegister), .enable(RegWrite));
	
	// zero register, always reset to 0 and never enabled to write values to
	DFF_32 zeroReg (.q(regVal[0]), .d(WriteData), .enable(1'b0), .reset(1'b1), .clk);
	
	// forloop connecting registers 1-31
	genvar i;
	
	generate
		for(i=1; i<WIDTH; i++) begin : eachReg
			DFF_32 dff (.q(regVal[i]), .d(WriteData), .enable(regEnable[i]), .reset(1'b0), .clk);
		end
	endgenerate
	
	mux32_32 mux1(.out(ReadData1), .in(regVal), .sel(ReadRegister1));
	mux32_32 mux2(.out(ReadData2), .in(regVal), .sel(ReadRegister2));
	
endmodule

/*
// Test bench for Register file
`timescale 1 ps / 100 fs

module regstim(); 		

	parameter ClockDelay = 5000;

	reg [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite, clk;
	wire [31:0] ReadData1, ReadData2;

	integer i;

	// Your register file MUST be named "regfile".
	// Also you must make sure that the port declarations
	// match up with the module instance in this stimulus file.
	regfile reg1(.ReadData1, .ReadData2, .WriteData, 
			  .ReadRegister1, .ReadRegister2, .WriteRegister,
			  .RegWrite, .clk);

	initial clk = 0;
	always begin
		#(ClockDelay/2); 
		clk = ~clk;
	end

	initial begin
		// Try to write the value 0xA0 into register 0.
		// Register 0 should always be at the value of 0.
		RegWrite <= 0;
		ReadRegister1 <= 0;
		ReadRegister2 <= 0;
		WriteRegister <= 0;
		WriteData <= 32'hA0;				@(posedge clk);
		RegWrite <= 1;					@(posedge clk);

		// Write a value into each  register.
		for (i=1; i<32; i=i+1) begin
			RegWrite <= 0;
			ReadRegister1 <= i-1;
			ReadRegister2 <= i-1;
			WriteRegister <= i;
			WriteData <= i;		@(posedge clk);
			RegWrite <= 1;				@(posedge clk);
		end

		// Go back and verify that the registers
		// retained the data.
		for (i=1; i<32; i=i+1) begin
			RegWrite <= 0;
			ReadRegister1 <= i-1;
			ReadRegister2 <= i;
			WriteRegister <= i;
			WriteData <= i;		@(posedge clk);
		end
		$stop;
	end
endmodule
*/

// Test bench for Register file

module regstim(); 		

	parameter ClockDelay = 5000;

	reg [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite, clk;
	wire [31:0] ReadData1, ReadData2;
	wire [31:0][31:0] regValues;

	integer i;

	// Your register file MUST be named "regfile".
	// Also you must make sure that the port declarations
	// match up with the module instance in this stimulus file.
	regfile reg1(.regValues, .ReadData1, .ReadData2, .WriteData, 
			  .ReadRegister1, .ReadRegister2, .WriteRegister,
			  .RegWrite, .clk);

	initial clk = 0;
	always begin
		#(ClockDelay/2); 
		clk = ~clk;
	end

	initial begin
		// Try to write the value 0xA0 into register 0.
		// Register 0 should always be at the value of 0.
		RegWrite <= 0;
		ReadRegister1 <= 0;
		ReadRegister2 <= 0;
		WriteRegister <= 0;
		WriteData <= 32'hA0;				@(posedge clk);
		RegWrite <= 1;					@(posedge clk);

		// Write a value into each  register.
		for (i=1; i<32; i=i+1) begin
			RegWrite <= 0;
			ReadRegister1 <= i-1;
			ReadRegister2 <= i;
			WriteRegister <= i;
			WriteData <= i*32'h01020408;	@(posedge clk);
			RegWrite <= 1;				@(posedge clk);
		end

		// Go back and verify that the registers
		// retained the data.
		for (i=0; i<32; i=i+1) begin
			RegWrite <= 0;
			ReadRegister1 <= i-1;
			ReadRegister2 <= i;
			WriteRegister <= i;
			WriteData <= i*32'h100+i;		@(posedge clk);
		end
		$stop;
	end
endmodule