
module E_DoorAnim(
input				clk,
input				dO,
input				dC,
output	reg [3:0]	Door
);

reg	[2:0]	cnt = 0;

always@ (posedge clk)
begin
	if(dO)
		if(|Door)
			cnt = cnt - 3'd1;
		else
			cnt = cnt;
	else if(dC)
		if(~&Door)
			cnt = cnt + 3'd1;
		else
			cnt = cnt;
end

always@ (cnt)
begin
	case(cnt)
		0: Door = 4'b0000;
		1: Door = 4'b1000;
		2: Door = 4'b1100;
		3: Door = 4'b1110;
		4: Door = 4'b1111;
		default:Door = 4'b0000;
	endcase
end

endmodule


