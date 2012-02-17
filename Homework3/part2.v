//Author: kehnin dyer
//Homework 3
//

module BCD12HourCounter
(
input				CLK, //why?
input				c_hr,
input				clear,
output	reg	[3:0]	rhbcd,
output		[3:0]	lhbcd,
output	reg			am
);
reg c_lh;
always@(posedge c_hr or posedge ~clear)
begin
	if(~clear)
		{c_lh,rhbcd}=5'b00000;
	else
	case({{lhbcd[0]},rhbcd})
	5'b00000:{c_lh, rhbcd} = 5'b00001;
	5'b00001:{c_lh, rhbcd} = 5'b00010;
	5'b00010:{c_lh, rhbcd} = 5'b00011;
	5'b00011:{c_lh, rhbcd} = 5'b00100;
	5'b00100:{c_lh, rhbcd} = 5'b00101;
	5'b00101:{c_lh, rhbcd} = 5'b00110;
	5'b00110:{c_lh, rhbcd} = 5'b00111;
	5'b00111:{c_lh, rhbcd} = 5'b01000;
	5'b01000:{c_lh, rhbcd} = 5'b01001;
	5'b01001:{c_lh, rhbcd} = 5'b10000;
	5'b10000:{c_lh, rhbcd} = 5'b10001;
	5'b10001:{c_lh, rhbcd} = 5'b10010;
	5'b10010:{c_lh, rhbcd} = 5'b00000;
	default:{c_lh, rhbcd} = 5'b00000;
	endcase
end
assign lhbcd = (clear)?{3'b000, c_lh}:{4'b0000};
always@(posedge ~c_lh or posedge ~clear)
begin
	if(~clear)
		{am}=1'b0;
	else
	case(am)
	1'b0:am = 1'b1;
	1'b1:am = 1'b0;
	default:am = 1'b0;
	endcase
end
endmodule


