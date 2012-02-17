//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Lab:Lab 3
//Project: T-bird tail lights
//
//Author: Kehnin Dyer
//Date: 2012 02 16
//-----------------------------------------------------------------------------
//DISCRIPTION: The counter and animation generator for the t-bird tail lights
//
//-----------------------------------------------------------------------------

module counterAnim
(
	input				CLK,
	input				en,
	output	reg	[2:0]	pattern
);
reg [1:0] cnt;
//state
always@ (posedge CLK, posedge ~en)
begin

	if(!en)
		cnt = 2'd0;
	else
		cnt = cnt + 1'b1;
end
//decode
always@(cnt)
	casex(cnt)
		2'd0:pattern = 3'b001;
		2'd1:pattern = 3'b011;
		2'd2:pattern = 3'b111;
		2'd3:pattern = 3'b000;
		default:pattern = 3'b000;
	endcase

endmodule



