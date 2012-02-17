//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Lab:Lab 3
//Project: T-bird tail lights
//
//Author: Kehnin Dyer
//Date: 2012 02 16
//Dependancies: counterAnim.v
//-----------------------------------------------------------------------------
//DISCRIPTION:Design a state machine and Verilog Code for the Thunderbird
//Taillights. There are three lights on each side.
//The state machine has two input signals, “LEFT” and “RIGHT”, which indicate the
//driver's request for a left turn or a right turn.
//It also has brake, “BK”, and emergency-flasher input, “HAZ”.
//The “BK” request the lamps on both sides operate just like the in a standard car
//(therefore, the signal lights in a given direction or hazard request
//override the brake lights).
//The “HAZ” requests the tail lights to be operated in hazard mode - all six
//lights flash in the sequence shown in the diagram
//We also assume the existence of a free running clock (clk) input signal whose
//frequency equals the desired flashing rate (1 Hz) for the lights.
//-----------------------------------------------------------------------------
module Lab3
(
(* chip_pin = "43" *)		input			CLK,
(* chip_pin = "19" *)		input			brake,		//switch c 3
(* chip_pin = "18" *)		input			hazard,		//switch c 2
(* chip_pin = "17" *)		input			Left_turn,	//switch c 1
(* chip_pin = "16" *)		input			Right_turn,	//switch c 0

(* chip_pin = "11,12,14" *)	output	[2:0]	L_Light,
(* chip_pin = "8,6,5" *)	output	[2:0]	R_Light
);

//define internal signals
wire	[2:0] pattern;
wire	l, r;
//body
assign l = (hazard /*&& !brake*/) || Left_turn; //the &&!brake would make breaks
												//have higher priority than hazard
												//but apparently that isn't what we want
assign r = (hazard /*&& !brake*/) || Right_turn;

counterAnim u1(CLK, l||r, pattern);

assign L_Light = l?pattern:{3{brake}};// <3
assign R_Light = r?pattern:{3{brake}};

endmodule

