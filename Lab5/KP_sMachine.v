//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Lab:Lab 5
//Project: keypad controller
//
//Author: Kehnin Dyer
//Date: 2012 03 15
//Dependancies: none
//-----------------------------------------------------------------------------
// 
//-----------------------------------------------------------------------------

module KP_sMachine(
	input		clk,
	input		en,
	output	reg	load
);
parameter	s_SCAN = 0,
			s_PRESSED = 1,
			s_RELEASED = 2;

reg	[1:0] state;

always@ (posedge clk)
begin
	case(state)
		s_SCAN:
			if(en)
				state = s_SCAN;
			else
				state = s_PRESSED;
		s_PRESSED:
			if(!en)
				state = s_PRESSED;
			else
				state = s_RELEASED;
		s_RELEASED:
//unbouncing isn't a problem because we are waiting atleast 1.5 clocks before checking again
				state = s_SCAN;
		default:
				state = s_SCAN;
		endcase
		load = (state == s_RELEASED);
end
endmodule

