///////////////////////////////////////////////////////////////////////////////
//Kehnin Dyer
//20120208
//Homework 2
//
///////////////////////////////////////////////////////////////////////////////

module SmFiveBitAdder
(
	input	[4:0]	A,
	input	[4:0]	B,
	output	[4:0]	C//,
//	output		Overflow
);
wire	[5:0]	A_2s,
				B_2s,
				C_temp;
wire	[4:0]	C_2s;
wire			neg;

TWOsConvert u1(A, {A_2s[4:0]} );
TWOsConvert u2(B, {B_2s[4:0]} );
assign A_2s[5] = A_2s[4];
assign B_2s[5] = B_2s[4];
Adder u3(A_2s, B_2s, C_temp/*, Overflow*/);
TWOsConvert u4({C_temp[4:0]}, C_2s);
assign C = ({C_temp[5]}?C_2s:{C_temp[4:0]});

endmodule

