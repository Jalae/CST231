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
assign SEG_7[6] = BCD[1]&&!BCD[3] || BCD[0]&&BCD[2]&&!BCD[3] || !BCD[0]&&!BCD[2]&&!BCD[3] || !BCD[1]&&!BCD[2]&&BCD[3];
assign SEG_7[5] = !BCD[3]&&!BCD[2] || !BCD[1]&&!BCD[2] || !BCD[3]&&!BCD[1]&&!BCD[0] || !BCD[3]&&BCD[1]&&BCD[0];
assign SEG_7[4] = !BCD[3]&&BCD[2] || !BCD[2]&&!BCD[1] || BCD[0]&&!BCD[3];
assign SEG_7[3] = BCD[3]&&!BCD[2]&&!BCD[1] || !BCD[2]&&!BCD[1]&&!BCD[0] || BCD[1]&&!BCD[2]&&!BCD[3] || !BCD[3]&&BCD[1]&&!BCD[0] || !BCD[3]&&BCD[2]&&!BCD[1]&&BCD[0];
assign SEG_7[2] = !BCD[3]&&BCD[1]&&!BCD[0] || !BCD[2]&&!BCD[1]&&!BCD[0];
assign SEG_7[1] = !BCD[1]&&BCD[3]&&!BCD[2] || !BCD[1]&&BCD[2]&&!BCD[3] || !BCD[3]&&!BCD[1]&&!BCD[0] || !BCD[0]&&BCD[2]&&!BCD[3];
assign SEG_7[0] = !BCD[1]&&!BCD[2]&&BCD[3] || !BCD[1]&&BCD[2]&&!BCD[3] || BCD[1]&&!BCD[3]&&!BCD[2] || !BCD[3]&&BCD[1]&&!BCD[0];

endmodule
