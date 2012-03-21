

module Elevator_ChangeFlr(
	input				clk,
						m_up,
						m_dn,
	output	reg	[1:0]	curFlr
);
always@ (negedge clk)
begin
	case({m_up,m_dn})
	2'b10:curFlr = curFlr + 1;
	2'b01:curFlr = curFlr - 1;
	default:curFlr = curFlr;
	endcase
end

endmodule

