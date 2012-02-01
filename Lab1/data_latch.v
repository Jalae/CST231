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
module data_latch
(
	input 				CLK, 
	input 				ENA,
	input 		[11:0]	INPUT,
	output reg	[11:0]	OUTPUT
);

always@(posedge clk)
	if(en)
		out = in;

endmodule