//Kehnin Dyer
//Exam 1
/*
sequence
000
100
110
111
011
101
010
001
000
*/

module prob3
(
input	wire	rst,
input	wire	clk,
output	[2:0] Q
);
wire D;

assign D = Q[2]^(~(Q[2]|Q[1]))^Q[0];
always@ (posedge clk, posedge rst)
begin
	if(rst)
		Q = 3'd0;
	else if(clk)
		Q = {{D},{Q[2]},{Q[1]}};
end

endmodule

