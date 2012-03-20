

module Elevator_Moving(
	input		[3:0]	button,
	input		[1:0]	curFlr,
	output				dir,//1 up, 0 dn
	output				moving,
	output		[1:0]	nxtFlr
);
wire [1:0] tempFlr;

Elevator_SetDestination sd(curFlr,button,tempFlr);

assign dir = tempFlr > curFlr;
assign nxtFlr = tempFlr;
assign moving = (curFlr != tempFlr);

endmodule

