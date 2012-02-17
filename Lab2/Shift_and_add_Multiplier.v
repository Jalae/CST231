//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Author: Kehnin Dyer
//Date: 2012 02 08
//Dependancies: None
//-----------------------------------------------------------------------------
// Multiplies by shifting and adding
//-----------------------------------------------------------------------------

module Shift_and_add_Multiplier
(
input	[2:0]	A,
				B,
input			clear,
output	[7:0]	C
);
reg	[7:0] temp;

assign C = temp;

always@(A or B or clear)
begin
if(clear)
begin
	case(A[0])
		1'b0:temp = 0;
		1'b1:temp = B;
	endcase
	case(A[1])
		1'b0:temp = temp;
		1'b1:temp = temp+(B<<1);
	endcase
	case(A[2])
		1'b0:temp = temp;
		1'b1:temp = temp+(B<<2);
	endcase
end
else
	temp = 0;
end

endmodule
