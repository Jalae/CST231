

module Elevator_ChangeFlr(
	input				clk,
						m_up,
						m_dn,
	inout	reg	[1:0]	curFlr
);
always@ (negedge clk)
begin
	if(m_up)
		curFlr = curFlr + 1;
	else if(m_dn)
		curFlr = curFlr - 1;
	else
		curFlr = curFlr;
end

endmodule

