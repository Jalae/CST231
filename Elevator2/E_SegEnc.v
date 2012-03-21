

module E_SegEnc(
input		[3:0]	curFlr,
output		[2:0]	COM,
output	reg	[6:0]	SEG
);
assign COM = 3'b101;
always@ (curFlr)
	case(curFlr)
	4'b0001:SEG = 7'b0110000;
	4'b0010:SEG = 7'b1101101;
	4'b0100:SEG = 7'b1111001;
	4'b1000:SEG = 7'b0110011;
	default:SEG = 7'd0;
	endcase

endmodule

