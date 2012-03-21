


module Elevator(
(* chip_pin = "43" *)					input			clk,
(* chip_pin = "8,6,5,4" *)				input	[3:0]	btsA,
(* chip_pin = "14,12,11,9" *)			input	[3:0]	btsB,
(* chip_pin = "16,17,18,19" *)			output	[3:0]	Door,
(* chip_pin = "25,26,27,28,29,31,33" *)	output	[6:0]	SEG,
(* chip_pin = "20,21,24" *)				output	[2:0]	COM,
(* chip_pin = "37" *)					output	reg		m_up,
(* chip_pin = "39" *)					output	reg		m_dn
);
wire [3:0]	curFlr,
			bts;
wire	clearFlr,
		motorEna,
		doorOpen,
		doorClose,
		shiftFlr,
		dir;

E_ButtonLatch BL(clk, clearFlr, btsA, btsB, curFlr, bts);
E_StateMachine SM(clk, bts, curFlr, motorEna, doorOpen, doorClose, clearFlr, shiftFlr);
E_DoShift DS(clk, dir, shiftFlr, curFlr);
E_DoorAnim DA(clk, doorOpen, doorClose, Door);
E_GetDirection GD(clk, bts, curFlr, dir);

always@(posedge clk)
begin
	m_up = dir && motorEna;
	m_dn = (~dir) && motorEna;
end

E_SegEnc SE(curFlr, COM, SEG);

endmodule

