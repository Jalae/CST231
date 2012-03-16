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
	input	[3:0]	BCD,
	output	[6:0]	SEG_7
);
	always@(BCD)
	case(BCD)
		0:SEG_7 = 0;//blarg
		1:SEG_7 = 7'b1111110; //0
		2:SEG_7 = 7'b0110111; //Help
		3:SEG_7 = 7'b1001111; //Enter

		4:SEG_7 = 7'b1110000; //7
		5:SEG_7 = 7'b1111111; //8
		6:SEG_7 = 7'b1111011; //9
		7:SEG_7 = 7'b0000001; //-

		8:SEG_7 = 7'b0110011; //4
		9:SEG_7 = 7'b1011011; //5
		10:SEG_7 = 7'b1011111;//6
		11:SEG_7 = 7'b0001001;//Down'Arrow'

		12:SEG_7 = 7'b0110000;//1
		13:SEG_7 = 7'b1101101;//2
		14:SEG_7 = 7'b1111001;//3
		15:SEG_7 = 7'b1000001;//Up'Arrow'

		default: SEG_7 = 0; //whatever.
	endcase
endmodule
