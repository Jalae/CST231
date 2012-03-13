//kehnin dyer
//problem 3
//2012/03/07

module jawbreak(
	input wire clk,
	input wire rst,
	input wire dime,
	input wire nickel,
	output reg open
	);
reg [2:0] state;
parameter s0 = 0,
		five = 1,
		ten = 2,
		fifteen = 3,
		twenty = 4,
		twentyfive = 5;
always@(posedge clk or posedge rst)
begin
	if(rst)
		state = s0;
	else
	case(state)
	s0:
		case({dime, nickel})
		0: state = state;
		1: state = five;
		2: state = ten;
		default:
			state = state;
		endcase
	five:
		case({dime, nickel})
		0: state = state;
		1:state = ten;
		2:state = fifteen;
		default:
			state = state;
		endcase
	ten:
		case({dime, nickel})
		0: state = state;
		1: state = fifteen;
		2: state = twenty;
		default:
			state = state;
		endcase
	fifteen:
		case({dime, nickel})
		0: state = state;
		1: state = twenty;
		2: state = twentyfive;
		default:
			state = state;
		endcase
	twenty:
		case({dime, nickel})
		0: state = state;
		1: state = twentyfive;
		2: state = twentyfive;
		default:
			state = state;
		endcase
	twentyfive:
		case({dime, nickel})
		0: state = state;
		1: state = five;
		2: state = ten;
		default:
			state = state;
		endcase
	default:
			state = s0;

	endcase
end
always@(state)
case
	if(state == twentyfive)
		open = 1;
	else
		open = 0;
endcase


endmodule
