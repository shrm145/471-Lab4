// Michaela Bartz and Shruti Misra
// Implements a 1 bit half adder that outputs a sum and carry out


`timescale 1 ps / 100 fs

module adder (sum, cout, a, b, cin);
	output sum, cout;
	input a, b, cin;
	
	wire andAB, andACin, andBCin;
	
	// cout = ab + acin + bcin
	and #50 (andAB, a, b);
	and #50 (andACin, a, cin);
	and #50 (andBCin, b, cin);
	or #50 (cout, andAB, andACin, andBCin);

	// sum = a xor b xor cin
	xor #50 (sum, a, b, cin);

endmodule 

module adder_testbench();
	wire sum, cout;
	reg a, b, cin;
	
	adder dut (.sum, .cout, .a, .b, .cin);
	
	integer i;
	
	initial begin
		a = 0; b = 0; cin = 0; #1000;
		a = 1; b = 0; cin = 0; #1000;
		a = 0; b = 1; cin = 0; #1000;
		a = 1; b = 1; cin = 0; #1000;
		
		a = 0; b = 0; cin = 1; #1000;
		a = 1; b = 0; cin = 1; #1000;
		a = 0; b = 1; cin = 1; #1000;
		a = 1; b = 1; cin = 1; #1000;
	end

endmodule 