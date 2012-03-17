//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Lab:Lab 5
//Project: keypad controller
//
//Author: Kehnin Dyer
//Date: 2012 03 14
//Dependancies: none
//-----------------------------------------------------------------------------
//DISCRIPTION:
//
//-----------------------------------------------------------------------------

module KP_Latch(
	input				ena,
	input		[3:0]	d,
	output	reg	[3:0]	d_l
);
always@(negedge ena) //when it goes high latch that crap
	d_l = d;
	//because there is a delay assosiated with logic the value latched here
	//is actually the previous value (ie before ena drops

endmodule

