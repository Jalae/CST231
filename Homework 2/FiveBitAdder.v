module FiveBitAdder
(
	input		[4:0]	A,
						B,
	output	reg	[4:0]	C
);
always@(A, B)
C = A + B;
//the compiler can optimize this far better than i.

endmodule

