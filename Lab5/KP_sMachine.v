//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Lab:Lab 5
//Project: keypad controller
//
//Author: Kehnin Dyer
//Date: 2012 03 15
//Dependancies: none
//-----------------------------------------------------------------------------
// 
//-----------------------------------------------------------------------------

module KP_sMachine(
	input	clk,
	input	en,
	output	load
);
parameter	s_SCAN = 0,
			s_PRESSED = 1,
			s_RELEASED = 2;

reg	[1:0] state;

always@ (posedge clk



endmodule

