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
//
//-----------------------------------------------------------------------------


module KP_ShiftRegister(
input				clk,
input				shift,
input		[3:0]	d,
output	reg	[3:0]	q0,
output	reg	[3:0]	q1,
output	reg	[3:0]	q2
//i want system verilog... ;-;
);
always@ (posedge clk)
begin
	if(shift)
		begin
			if(d == 0)	//all our hard work pays off
						//that is to say, this is why the decoder goes backwards
			begin
				//clear stuff
				{q0,q1,q2} = 0;
			end
			else
			begin
				{q0,q1,q2} = {d,q0,q1};
			end
		end
	else
		begin
			{q0,q1,q2} = {q0,q1,q2};
		end
end

endmodule

