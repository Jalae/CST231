

module Elevator_Moving(
	input		[3:0]	button,
	input		[1:0]	curFlr,
	output				dir,//1 up, 0 dn
	output				moving//,
//	output		[1:0]	nxtFlr
);
wire [1:0] nxtFlr;

Elevator_SetDestination sd(curFlr,button,nxtFlr);

assign dir = nxtFlr > curFlr;
assign moving = (curFlr != nxtFlr);

endmodule

