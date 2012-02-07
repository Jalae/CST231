module TWOsConvert
(
	input	[4:0]	IN,
	output	[4:0]	OUT
);
always@(*)
begin
	if(IN[4])
	OUT = (~IN) + 1'b1;
	else
	OUT = IN;
end

endmodule

