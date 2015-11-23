`timescale 1 ps / 100 fs
module signExtnd(outExtnd, inExtnd);
	input [15:0] inExtnd;
	output [31:0] outExtnd;
	wire topBit;

	buf #50 newTopBit (topBit, inExtnd[15]); //Grab the top bit of the input
	genvar i;
	generate
		for (i = 0; i < 16; i++) begin: eachBit
			buf #50 setBit (outExtnd[i], inExtnd[i]);
		end
	endgenerate

	genvar j;
	generate 
		for (j = 16; j < 32; j++) begin: eachTopBit
			buf #50 setTopBit (outExtnd[j], topBit);
		end
	endgenerate
endmodule



