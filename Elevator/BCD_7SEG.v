//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Author: Kehnin Dyer
//Date: 2012 01 28
//Dependancies: None
//-----------------------------------------------------------------------------
//Takes a number in BCD and converts it to the proper format for a 7 seg
//display. If the number is outside the bounds of BCD (for example, 10) it will
//display nothing.
//-----------------------------------------------------------------------------
module BCD_7SEG
(
	input		[3:0]	BCD,
	output	reg	[6:0]	SEG_7
);
	always@(*)
	case(BCD)
		4'h0:SEG_7 = 7'b0110000;
		4'h1:SEG_7 = 7'b1101101; 
		4'h2:SEG_7 = 7'b1111001; //Help
		4'h3:SEG_7 = 7'b0110011; //Enter
				
		default: SEG_7 = 0; //whatever.
	endcase
endmodule
