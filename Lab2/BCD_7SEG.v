//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Author: Kehnin Dyer
//Date: 2012 02 08
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
always@ (BCD)
case (BCD)
	4'b0000:SEG_7=7'b1111110; 
	4'b0001:SEG_7=7'b0110000;
	4'b0010:SEG_7=7'b1101101;
	4'b0011:SEG_7=7'b1111001;
	4'b0100:SEG_7=7'b0110011;
	4'b0101:SEG_7=7'b1011011;
	4'b0110:SEG_7=7'b1011111;
	4'b0111:SEG_7=7'b1110000;
	4'b1000:SEG_7=7'b1111111;
	4'b1001:SEG_7=7'b1111101;
	default:SEG_7=7'b0000000;
	endcase
endmodule

