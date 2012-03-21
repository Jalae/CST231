

module E_StateMachine(
input			clk,
input	[3:0]	bts,
input	[3:0]	curFlr,
output			mEn,
output			DoorOpen,
output			DoorClose,
output			clearFlr,
output			ShiftFlr
);

reg	[2:0]	state;
reg	[3:0]	counter;

parameter	s_Move = 4'd3,
			s_Arrived = 4'd4,
			s_DoorOpen = 4'd0,
			s_Idle = 4'd1,
			s_DoorClose = 4'd2;

assign DoorOpen = (state == s_DoorOpen);
assign DoorClose = (state == s_DoorClose);
assign ShiftFlr = (state == s_Arrived);//(state == s_Move)&&(counter == 4'd1);
assign clearFlr = (state == s_Idle);
assign mEn = (state == s_Arrived) || (state == s_Move);

always@ (posedge clk)
begin
	case(state)
		s_DoorOpen:
		begin
			if(counter < 4'd4)
			begin
				counter = counter + 4'd1;
				state = state;
			end
			else
			begin
				counter = 4'd0;
				state = s_Idle;
			end
		end
		s_Idle:
		begin
			if(bts & ~curFlr)
				state = s_DoorClose;
			else
				state = state;
		end
		s_DoorClose:
		begin
			if(counter < 4'd4)
			begin
				state = state;
				counter = counter + 4'd1;
			end
			else
			begin
				state = s_Move;
				counter = 4'd0;
			end
		end
		s_Move:
		begin
			if(counter < 1)
			begin
				counter = counter + 4'd1;
				state = state;
			end
			else
			begin
				counter = 4'd0;
				state = s_Arrived;
			end
		end
		s_Arrived:
		begin
			if(bts&curFlr)
				state = s_DoorOpen;
			else
				state = s_Move;
		end
		default:
		begin
			state = s_Idle;
			counter = 4'd0;
		end
	endcase
end



endmodule

