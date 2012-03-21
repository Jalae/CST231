
module E_ButtonLatch(
input				clk,
input				clr,
input		[3:0]	a,
input		[3:0]	b,
input		[3:0]	curFlr,
output	reg	[3:0]	c
);

always@ (negedge clk)
begin
	if(clr)
		c = (c|a|b) & ~curFlr;
	else
		c = (c|a|b);
end

endmodule


