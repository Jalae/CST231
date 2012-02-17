//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Author: Kehnin Dyer
//Date: 2012 02 08
//Dependancies: Shift_and_add_Multiplier.v, binary_to_BCD.v, Multiplexed_Display.v
//				(BCD_7SEG.v, MUX4_1x4.v DATA_LATCH.v PRIORITY_N_COUNTER.v)
//-----------------------------------------------------------------------------
//Takes in 2 3-bit wide numbers then multiplies them via a shiftand add method
//it then displays them on the 7 segment display.
//-----------------------------------------------------------------------------


module Lab2
(

(* chip_pin = "43" *)					input			CLK,
(* chip_pin = "6,5,4" *)				input	[2:0]	A,
(* chip_pin = "12,11,9" *)				input	[2:0]	B,
(* chip_pin = "16" *)					input			clear,
(* chip_pin = "33,31,29,28,27,26,25" *)	output	[6:0]	seg,//[g->a]
(* chip_pin = "24,21,20" *)				output	[2:0]	COM
);
wire [7:0] c;
wire [3:0] ones, tens, hundreds;
Shift_and_add_Multiplier u1(A, B, clear, c);
binary_to_BCD u2(c, ones, tens, hundreds);
Multiplexed_Display u3(CLK, ones, tens, hundreds, seg, COM);


endmodule

