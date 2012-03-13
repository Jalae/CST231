//kehnin dyer
//problem 2
//2012/03/07

module state_pattern(
	input wire clk,
	input wire reset,
	input wire X,
	output reg Z
	);
reg [2:0] state;
always@ (posedge clk or posedge ~reset)
begin
	if(~reset)
		state = 0;
	else
	case(state)
		0:
		begin
			if(X)
				state = 1;
			else
				state = 0;
		end
		1:
		begin
			if(X)
				state = 2;
			else
				state = 0;
		end
		2:
		begin
			if(X)
				state = state;
			else
				state = 3;
		end
		3:
		begin
			if(X)
				state = 4;
			else
				state = 0;
		end
		4:
		begin
			if(X)
				state = 2;
			else
				state = 0;
		end
		default:
			state = 0;
		end
	endcase
end
always@(state)
begin
	if (state == 4)
		Z = 1;
	else
		Z = 0;
end

endmodule
