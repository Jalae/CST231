

module Elevator_ButtonLatch(
	input				clk,
	input				clr,
	input		[3:0]	a,
						b,
	output	reg	[3:0]	c
);

always@ (posedge clk or posedge clr)
begin
	if(clr)
	c = 0;
	else
	c = a | b | c;
end

endmodule

