//kehnin dyer
//problem 1

module (
	input		clock,
				reset,
				X,
	output	reg	Z
);
parameter	bit1 = 0,
			bit2 = 1,
			bit3 = 2,
			bit4 = 3;
reg	[1:0]	state;

always@ (posedge clk or posedge ~reset)
begin
	if (~reset)
		state = 0;
	else
	begin
		case(state)
			bit1:
				if(X == 1)
					state = bit2;
				else
					state = state;
			bit2:
				if(X == 0)
					state = bit3;
				else
					state = state;
			bit3:
				if(X == 1)
					state = bit4;
				else
					state = state;
				
			default:
				state = bit1;
		endcase
	end
end

always@ (state or X)
begin
	if((state == bit4) && (X == 1))
		Z = 1;
	else
		Z = 0;
end

endmodule
