//Author: kehnin dyer
//Homework 3
//

module top
(
	input			clk,
	input			clear,
	output	[3:0]	rsbcd,
					lsbcd,
					rmbcd,
					lmbcd,
					rhbcd,
					lhbcd,
	output			ampm
);
wire c_ten, c_min, c_hr;
//why is c_ten output from sec_clk...?
sec_clk u1 (clear, clk, c_ten, c_min, rsbcd, lsbcd);
BCD60MinuteCounter u2(clk, c_min, clear, rmbcd, lmbcd, c_hr);
BCD12HourCounter u3(clk, c_hr, clear, rhbcd, lhbcd, ampm);
endmodule

