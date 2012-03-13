//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Lab:Lab 4
//Project: Turn signals
//
//Author: Kehnin Dyer
//Date: 2012 03 12
//Dependancies: none
//-----------------------------------------------------------------------------
//DISCRIPTION:
//-----------------------------------------------------------------------------

module Lab4(
	input				RESET,
	input				CLK,
	input				N_SEN,
	input				S_SEN,
	output	reg	[2:0]	N_Light,//{red, yellow, green}
						S_Light,
						NT_Light,
						ST_Light,
						E_Light,
						W_Light,
);
parameter	s_Idle = 18'o444444,//{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}
			Idle = 0,
			s_NS_G = 18'o114444,
			NS_G = 1,
			s_NS_Y = 18'o224444,
			NS_Y = 2,
			s_EW_G = 18'o444411,
			EW_G = 3,
			s_EW_Y = 18'o444422,
			EW_Y = 4,
			s_NT_G = 18'o141444,
			NT_G = 5,
			s_NT_Y = 18'o142444,
			NT_Y = 6,
			s_ST_G = 18'o414144,
			ST_G = 7,
			s_ST_Y = 18'o414244,
			ST_Y = 8,
			s_T_G  = 18'o441144,
			T_G = 9,
			s_T_Y  = 18'o442244,
			T_Y = 10;
wire [3:0] STATE;
wire [2:0] CNT;
always@ (posedge CLK or posedge ~RESET)
begin
	if(~RESET)
	begin
		STATE = 0;
		CNT = 0;
	end
	else
		case(STATE)
			IDLE:
			begin
				if(CNT < 2)
				begin
					CNT = CNT + 1;
					STATE = STATE;
				end
				else
				begin
					CNT = 0;
					STATE = NS_G;
				else
			end
			NS_G:
			begin
				if(CNT < 6)
				begin
					CNT = CNT + 1;
					STATE = STATE;
				end
				else
				begin
					CNT = 0;
					STATE = NS_Y;
				else
			end
			NS_Y:
			begin
				if(CNT < 3)
				begin
					CNT = CNT + 1;
					STATE = STATE;
				end
				else
				begin
					CNT = 0;
					STATE = EW_G;
				else
			end
			EW_G:
			begin
				if(CNT < 3)
				begin
					CNT = CNT + 1;
					STATE = STATE;
				end
				else
				begin
					CNT = 0;
					STATE = EW_Y;
				else
			end
			EW_Y:
			begin
				if(CNT < 2)
				begin
					CNT = CNT + 1;
					STATE = STATE;
				end
				else
				begin
					CNT = 0;
					case({N_SENSOR,S_SENSOR})
						0:	STATE = NS_G;
						1:	STATE = NT_G;
						2:	STATE = ST_G;
						3:	STATE = T_G;
						default:
					endcase
				else
			end
			NT_G:
			begin
				if(CNT < 5)
				begin
					CNT = CNT + 1;
					STATE = STATE;
				end
				else
				begin
					CNT = 0;
					STATE = NT_Y;
				else
			end
			NT_Y:
			begin
				if(CNT < 2)
				begin
					CNT = CNT + 1;
					STATE = STATE;
				end
				else
				begin
					CNT = 0;
					STATE = NS_G;
				else
			end
			ST_G:
			begin
				if(CNT < 5)
				begin
					CNT = CNT + 1;
					STATE = STATE;
				end
				else
				begin
					CNT = 0;
					STATE = ST_Y;
				else
			end
			ST_Y:
			begin
				if(CNT < 2)
				begin
					CNT = CNT + 1;
					STATE = STATE;
				end
				else
				begin
					CNT = 0;
					STATE = NS_G;
				else
			end
			T_G:
			begin
				if(CNT < 5)
				begin
					CNT = CNT + 1;
					STATE = STATE;
				end
				else
				begin
					CNT = 0;
					STATE = T_Y;
				else
			end
			T_Y:
			begin
				if(CNT < 2)
				begin
					CNT = CNT + 1;
					STATE = STATE;
				end
				else
				begin
					CNT = 0;
					STATE = NS_G;
				else
			end
			default:
			begin
				STATE = IDLE;
				CNT = 0;
			end
		endcase
end

always@ (STATE)
begin
	case(STATE)
	IDLE:	{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}=s_IDLE;
	NS_G:	{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}=s_NS_G;
	NS_Y:	{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}=s_NS_Y;
	EW_G:	{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}=s_EW_G;
	EW_Y:	{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}=s_EW_Y;
	NT_G:	{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}=s_NT_G;
	NT_Y:	{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}=s_NT_Y;
	ST_G:	{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}=s_ST_G;
	ST_Y:	{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}=s_ST_Y;
	T_G:	{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}=s_T_G;
	T_Y:	{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}=s_T_Y;
	default:{N_Light,S_Light,NT_Light,ST_Light,E_Light,W_Light}=s_IDLE;

	endcase
end

endmodule

