

module E_DoShift(
input				clk,
input				dir,
input				en,
output	reg	[3:0]	curFlr
);

always@(negedge clk)
begin
	if(curFlr)
	case({en, dir})
		2'b00:curFlr = curFlr;
		2'b01:curFlr = curFlr;
		2'b10:curFlr = curFlr >> 1;
		2'b11:curFlr = curFlr << 1;
		default:curFlr = curFlr;
	endcase
	else
		curFlr = 4'b0001;
end

endmodule
