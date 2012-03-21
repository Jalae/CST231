

module Elevator_ButtonLatch(
	input				clk,
	input				clr,
	input		[1:0]	curFlr,
	input		[3:0]	a,
						b,
	output	reg	[3:0]	c
);

wire [3:0] buttons;
assign buttons = a | b ;

always@ (negedge clk)
begin
	if(clr)
		c = (c|buttons) & (~( 4'd1 << curFlr));
	else
		c = (c|buttons) & (4'hF);

end

endmodule

