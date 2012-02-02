//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Lab:Lab 1
//Project: Multiplexed Display
//
//Author: Kehnin Dyer
//Date: 2012 01 28
//Dependancies:
//-----------------------------------------------------------------------------
//DISCRIPTION:
//-----------------------------------------------------------------------------
module MUX4_1x4
	(
		input		[1:0]	SEL,
		input		[3:0]	InputA,
							InputB,
							InputC,
							InputD,
		output	reg	[3:0]	OUTPUT
	);

always@(*)
	case(SEL)
		2'd0: OUTPUT = InputA;
		2'd1: OUTPUT = InputB;
		2'd2: OUTPUT = InputC;
		2'd3: OUTPUT = InputD;
	endcase
endmodule

