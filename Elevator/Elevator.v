

module Elevator(
(* chip_pin = "43" *)					input		clk,
(* chip_pin = "8,6,5,4" *)				input	[3:0]	FB,
(* chip_pin = "14,12,11,9" *)			input	[3:0]	Call,
(* chip_pin = "19,18,17,16" *)			output	[3:0]	Door,
(* chip_pin = "25,26,27,28,29,31,33" *)	output	[6:0]	SEG,
(* chip_pin = "24,21,20" *)				output	[2:0]	COM,
(* chip_pin = "34" *)					output	M_UP, //left
(* chip_pin = "39" *)					output	M_DN
);

wire	[3:0]	button;
wire	[1:0]	curFlr;
//wire	[1:0]	nxtFlr;
wire			clr;
wire			dir;
wire			motorEn;
wire			moving;
wire			flrChg;

wire [1:0] number; // this is used for theoretical animations i might do

Elevator_ButtonLatch bl(clk, clr, curFlr, FB, Call, button);
Elevator_Moving m(button, curFlr, dir, moving);
Elevator_SetMotor sm(motorEn, dir, M_UP, M_DN);
Elevator_ChangeFlr cf(flrChg, M_UP, M_DN, curFlr);
Elevator_sMachine smach(clk, moving, motorEn, Door, clr, flrChg);

//assign SEG = button;
//assign COM = 3'b101;
lab1 l(curFlr,SEG,COM);
endmodule

