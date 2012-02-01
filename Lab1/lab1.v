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
module Lab1
(
	input			CLK,
	input	[3:0]	A,
					B,
					C,
	output	[6:0]	SEG,
	output	[2:0]	COM
);

wire [1:0] Count;
wire LatchControl;
wire [3:0] L_A, L_B, L_C, Muxd;

PRIORITY_N_COUNTER pc(CLK, Count, {LatchControl, COM});
DATA_LATCH l(CLK, LatchControl, {A,B,C}, {L_A, L_B, L_C});
MUX4_1x4 m(L_A, L_B, L_C, 0, Count, Muxd);
BCD_7SEG b(Muxs, SEG);