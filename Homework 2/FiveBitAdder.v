module FiveBitAdder
(
	input		[4:0]	A,
						B,
	output	reg	[4:0]	C,
	output	reg		O
);
wire cout;
always@(*)
begin
C = A[3:0] + B[3:0];
O = ((A[4]&B[4])|(~A[4]&~B[4]))^C[4];
end

endmodule

