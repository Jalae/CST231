


//get
module Elevator_SetDestination(
	input		[1:0]	curFlr,
	input		[3:0]	button,
	output	[1:0]	nxtFlr
);

reg	[3:0]	lower;
reg	[3:0]	toenc;

always@ (curFlr or button)
	lower = button & ~(4'hF << curFlr);

always@ (lower or button)
begin
	if(|lower)
		toenc = lower;
	else
		toenc = button;
end

Elevator_ButtonDecode BD(toenc, nxtFlr);

endmodule

