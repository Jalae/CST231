

module Elevator_Moving(
	input			clk,
	input	reg	[3:0]	button,
	input		[1:0]	curFlr,
	output	reg			dir,//1 up, 0 dn
	output	reg	[3:0]	moving
);

always@ (posedge ~clk)//or a race condition
begin
	
end

endmodule

