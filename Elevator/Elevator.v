

module Elevator(
	input		clk,
	input	[3:0]	FB,
	input	[3:0]	Call,
	output	[3:0]	Door,
	output 	[1:0]	curFlr,
	output	[1:0]	nxtFlr
);

wire	[3:0]	button;
//wire	[1:0]	curFlr;
//wire	[1:0]	nxtFlr;
wire			clr;
wire			dir;
wire			motorEn;
wire			moving;
wire			M_UP, M_DN;

wire [1:0] number; // this is used for theoretical animations i might do

Elevator_ButtonLatch bl(clk, clr, curFlr, FB, Call, button);
Elevator_Moving m(button, curFlr, dir, moving, nxtFlr);
Elevator_SetMotor sm(motorEn, dir, M_UP, M_DN);
Elevator_ChangeFlr cf(clk, M_UP, M_DN, curFlr);
Elevator_sMachine smach(clk, moving, number, motorEn, Door, clr);

endmodule

