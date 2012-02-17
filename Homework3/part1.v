//Author: kehnin dyer
//Homework 3
//

module BCD60MinuteCounter
(
input				CLK, //why?
input				c_min,
input				clear,
output	reg	[3:0]	rmbcd,
output	reg	[3:0]	lmbcd,
output	reg			c_hr
);
reg c_lm;
always@(posedge c_min or posedge ~clear)
begin
	if(~clear)
		{c_lm,rmbcd}=5'b00000;
	else
	case(rmbcd)
	4'b0000:{c_lm, rmbcd} = 5'b00001;
	4'b0001:{c_lm, rmbcd} = 5'b00010;
	4'b0010:{c_lm, rmbcd} = 5'b00011;
	4'b0011:{c_lm, rmbcd} = 5'b00100;
	4'b0100:{c_lm, rmbcd} = 5'b00101;
	4'b0101:{c_lm, rmbcd} = 5'b00110;
	4'b0110:{c_lm, rmbcd} = 5'b00111;
	4'b0111:{c_lm, rmbcd} = 5'b01000;
	4'b1000:{c_lm, rmbcd} = 5'b01001;
	4'b1001:{c_lm, rmbcd} = 5'b10000;
	default:{c_lm, rmbcd} = 5'b00000;
	endcase
end
always@(posedge c_lm or posedge ~clear)
begin
	if(~clear)
		{c_hr,lmbcd}=5'b00000;
	else
	case(lmbcd)
	4'b0000:{c_hr, lmbcd} = 5'b00001;
	4'b0001:{c_hr, lmbcd} = 5'b00010;
	4'b0010:{c_hr, lmbcd} = 5'b00011;
	4'b0011:{c_hr, lmbcd} = 5'b00100;
	4'b0100:{c_hr, lmbcd} = 5'b00101;
	4'b0101:{c_hr, lmbcd} = 5'b00110;
	4'b0110:{c_hr, lmbcd} = 5'b10000;
	default:{c_hr, lmbcd} = 5'b00000;
	endcase
end
endmodule

