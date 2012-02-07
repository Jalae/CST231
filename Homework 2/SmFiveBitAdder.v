
module SmFiveBitAdder
(
	input	[4:0]	A,
	input	[4:0]	B,
	output	[4:0]	C,
	output		Overflow
);
wire	[4:0]	A_2s,
				B_2s,
				C_2s,
				C_temp;
wire			neg;

TWOsConvert u1(A, A_2s);
TWOsConvert u2(B, B_2s);

FiveBitAdder u3(A_2s, B_2s, C_temp, Overflow);
TWOsConvert u4(C_temp, C_2s);
assign C = ({C_temp[4]}?C_2s:C_temp);

endmodule

