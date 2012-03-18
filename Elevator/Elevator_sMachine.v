



module Elevator_sMachine(
	input				CLK,		//1hz
	input				Moving,		//external logic lets us know we have somewhere to go
	output	reg	[1:0]	Number,
	output	reg			MotorEn,
	output	reg [3:0]	DoorAnim
);

parameter	s_dOpen		= 3'h0,
			s_dClose	= 3'h3,
			s_Idle		= 3'h1,
			s_Depart	= 3'h7,//the upper bit is if we are in a moving state
			s_Moving	= 3'h5,
			s_Arrived	= 3'h4;

reg	[3:0]	state;
reg [3:0]	counter;

always@(posedge CLK)
begin
	Number = {state[2]&state[1],state[2]&state[0]};
	MotorEn = state[2];

	case(Moving)
		s_dOpen:
		begin
			if(|DoorAnim)
			begin
				count = count + 1;
				state = state;
			end
			else
			begin
				if(Moving)
				begin
					count = count;
					state = s_dClose;
				end
				else
				begin
					count = count;
					state = s_Idle;
				end
			end
		end
		s_dClose:
		begin
			if(~&DoorAnim)
			begin
				count = count - 1;
				state = state;
			end
			else
			begin
				count = count;
				state = s_Depart;
			end
		end
		s_Idle:
			if(Moving)
			begin
				count = count;
				state = s_dClose;
			end
			else
			begin
				count = count;
				state = state;
			end
		s_Depart:
		begin
			count = count;
			state = s_Moving;
		end
		s_Moving:
		begin
			count = count;
			state = s_Arrived;
		end
		s_Arrived:
		begin
			if(Moving)
			begin
				state = s_Depart;
				count = count;
			end
			else
			begin
				state = s_dOpen;
				count = count;
			end
		end
		default:
		begin
			count = 4;
			state = s_Idle;
		end
	endcase
end


always@(counter)
begin
	0:
		DoorAnim = 4'b1111;
	1:
		DoorAnim = 4'b1110;
	2:
		DoorAnim = 4'b1100;
	3:
		DoorAnim = 4'b1000;
	4:
		DoorAnim = 4'b0000;
	default:
		DOorAnim = 4'b0000;
end


endmodule


