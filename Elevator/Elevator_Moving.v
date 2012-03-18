

module Elevator_Moving(
	input			clk,
	input	reg	[3:0]	button,
	input		[1:0]	curFlr,
	output	reg			dir,//1 up, 0 dn
	output	reg			moving,
	output	reg	[3:0]	nxtFlr
);

always@ (posedge ~clk)//or a race condition
begin
	
	moving = (curFlr != nxtFlr);
end

endmodule

