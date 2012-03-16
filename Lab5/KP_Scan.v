//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Lab:Lab 5
//Project: keypad controller
//
//Author: Kehnin Dyer
//Date: 2012 03 14
//Dependancies: none
//-----------------------------------------------------------------------------
//DISCRIPTION:
// if enabled moves to the next scan position.
//-----------------------------------------------------------------------------

module KP_Scan(
	input				CLK,
	input				EN,
	output	reg	[3:0]	SCAN,
	output	reg	[1:0]	count
);


always@(posedge CLK)
begin
	if(EN)
		count = count + 1;
	else
		count = count;
end
always@(count)
	case(count)
		0:SCAN = 4'b1110;
		1:SCAN = 4'b1101;
		2:SCAN = 4'b1011;
		default: 4'b0111;
	endcase
end

endmodule

