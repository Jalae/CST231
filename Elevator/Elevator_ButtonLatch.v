

module Elevator_ButtonLatch(
	input				clk,
	input				clr,
	input		[1:0]	curFlr,
	input		[3:0]	a,
						b,
	output	reg	[3:0]	c
);

wire [3:0] buttons;
reg [3:0] mask;
assign buttons = a | b;

always@ (posedge ~clk)
begin
	if(clr)
		mask = (~( 4'd1 << curFlr));
		//mask = clr?(~( 4'd1 << curFlr)):(4'hF);
	else
		mask = (4'hF);
	c = buttons & mask;
end

endmodule

