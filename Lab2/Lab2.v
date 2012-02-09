

module Lab2
(

(* chip_pin = "43" *)					input			CLK,
(* chip_pin = "6,5,4" *)				input	[2:0]	A,
(* chip_pin = "12,11,9" *)				input	[2:0]	B,
(* chip_pin = "16" *)					input			clear,
(* chip_pin = "25,26,27,28,29,31,33" *)	output	[6:0]	seg,
(* chip_pin = "24,21,20" *)				output	[2:0]	COM
);
wire [7:0] c;
wire [3:0] ones, tens, hundreds;
Shift_and_add_Multiplier u1(A, B, clear, c);
binary_to_BCD u2(c, ones, tens, hundreds);
Multiplexed_Display u3(CLK, ones, tens, hundreds, seg, COM);


endmodule

