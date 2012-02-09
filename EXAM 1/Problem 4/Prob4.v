//Kehnin Dyer
//Exam 1

module mod_12_cnt
(
input	wire		clk,
input	wire		reset,
output	reg	[3:0]	one_cnt
);
always@(posedge clk, posedge reset)
begin
	if(reset)
		one_cnt = 4'd1;
	else if(clk)
		case(one_cnt)
			4'd1:one_cnt = 4'd2;
			4'd2:one_cnt = 4'd3;
			4'd3:one_cnt = 4'd4;
			4'd4:one_cnt = 4'd5;
			4'd5:one_cnt = 4'd6;
			4'd6:one_cnt = 4'd7;
			4'd7:one_cnt = 4'd8;
			4'd8:one_cnt = 4'd9;
			4'd9:one_cnt = 4'd10;
			4'd10:one_cnt = 4'd11;
			4'd11:one_cnt = 4'd12;
			4'd12:one_cnt = 4'd1;
			default: one_cnt = 4'd1;
end

endmodule

