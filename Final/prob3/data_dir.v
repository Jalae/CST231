//kehnin
//problem 3
module data_dir(
	input		[7:0]	DATA,
	input				data_sb,
	input				clk,
	output	reg	[7:0]	a_data,
	output	reg [7:0]	b_data,
	output				data_sb_a,
	output				data_sb_b
);
wire a_en = data_sb&DATA[7];
wire b_en = data_sb~DATA[7];

dLatch a(a_en, DATA, a_data);
dLatch b(b_en, DATA, b_data);

ff fa(clk,a_en,data_sb_a);
ff fb(clk,b_en,data_sb_b);

endmodule


module ff(
input	clk,
input	d,
output q
);
reg cnt;
always@ (posedge d)
cnt = 1;

always@ (posedge clk)
begin
	q = cnt
	cnt = 0;
end
endmodule



module dLatch(
input en,
input [7:0] d,
output [7:0] q
);
always@(posedge en)
begin
	q=d;
end
endmodule
