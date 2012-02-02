//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Lab:Lab 1
//Project: Multiplexed Display
//
//Author: Kehnin Dyer
//Date: 2012 01 28
//Dependancies: BCD_7SEG.v, MUX4_1x4.v
//-----------------------------------------------------------------------------
//DISCRIPTION:
//-----------------------------------------------------------------------------
module lab1
(
(* chip_pin = "43" *)					input			CLK,
(* chip_pin = "8,6,5,4" *)				input	[3:0]	A,
(* chip_pin = "14,12,11,9" *)			input	[3:0]	B,
(* chip_pin = "19,18,17,16" *)			input	[3:0]	C,
(* chip_pin = "25,26,27,28,29,31,33" *)	output	[6:0]	SEG, //[a:g]
(* chip_pin = "24,21,20" *)				output	[2:0]	COM
);
//define pins

//define internal signals
	wire [1:0] Count;
	wire LatchControl;
	wire [2:0] com_n;
	wire [3:0] L_A, L_B, L_C, Muxd, test;
	
//body
assign COM = ~com_n;
assign test = Muxd;
	PRIORITY_N_COUNTER pc(CLK, Count, {LatchControl, com_n});
	DATA_LATCH l(CLK, LatchControl, {A,B,C}, {L_A, L_B, L_C});
	MUX4_1x4 m(Count, 4'h7, L_A, L_B, L_C, Muxd);
	BCD_7SEG b(Muxd, SEG);
endmodule
