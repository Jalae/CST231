//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Lab:Lab 1
//Project: Multiplexed Display
//
//Author: Kehnin Dyer
//Date: 2012 02 01
//Dependancies:
//-----------------------------------------------------------------------------
//DISCRIPTION:
//-----------------------------------------------------------------------------

module PRIORITY_N_COUNTER
(
	input				CLK,
	output	reg	[1:0]	COUNT,
	output	reg	[3:0]	OUTPUT,
);

always@(CLK)
	COUNT = COUNT + 1;

always@(COUNT)	
	case(COUNT)
		2'b00: OUTPUT = 4'b0111;
		2'b01: OUTPUT = 4'b1011;
		2'b10: OUTPUT = 4'b1101;
		2'b11: OUTPUT = 4'b1110;
	endcase

endmodule 
