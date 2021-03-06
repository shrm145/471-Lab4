// Michaela Bartz and Shruti Misra

module ALUbit (out, cout, a, b, cin, ctrl);
	output out, cout;
	input a, b, cin;
	input [1:0] ctrl;
	
	wire norAB, notB, bIn, sum;
	
	nor (norAB, a, b);
	
	// flip bit of B if subtracting (ie ctrl[1] = 1)
	not (notB, b);
	mux2_1 subtract (.out(bIn), .in({b, notB}), .sel(ctrl[1]));
	
	// add or subtract A and B
	adder add0 (.sum, .cout, .a, .b(bIn), .cin);
	
	mux4_1 master (.out, .in({sum, sum, norAB, sum}), .sel(ctrl));
	
endmodule 