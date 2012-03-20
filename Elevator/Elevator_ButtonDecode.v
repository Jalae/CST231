

module Elevator_ButtonDecode(
	input		[3:0]	code,
	output	reg	[1:0]	num
	
);
//do i need this? i think so...
always@(code)
	casex(code)
		4'b1XXX:num = 3;
		4'b01XX:num = 2;
		4'b001X:num = 1;
		4'b0001:num = 0;
		default:num = 0;
	endcase

endmodule

