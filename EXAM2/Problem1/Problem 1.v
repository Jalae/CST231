// kehnin dyer
// Exam 2 Problem 1
// 2012/3/7


module exam1 (
	input wire sensor,
	input wire clk,
	input wire rst,
	output reg valve
	);
reg [2:0] state;

always@(posedge clk or posedge rst)
begin
	if(rst)
		state = 0;
	else
	case(state)
		0:
		begin
			if(sensor)
				state = 1;
			else
				state = state;
		end
		1:
		begin
			state = 2;
		end
		2:
		begin
			if(sensor)
				state = 1;
			else
				state = 3;
		end
		3:
		begin
			if(sensor)
				state = 2;
			else
				state = 4;
		end
		4:
		begin
			state = 0;
		end
		default:
		begin
			state = 0;
		end
	endcase
end
always@ (state)
begin
	case(state)
	0:
		valve = 0;
	1:
		valve = 1;
	2:
		valve = 0;
	3:
		valve = 1;
	4:
		valve = 0;
	default:
	endcase
end


endmodule
