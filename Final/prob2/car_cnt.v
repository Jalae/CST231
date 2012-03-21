//kehnin dyer
//problem 2

module car_cnt(
	input	sens1,
			sens2,
			clk,
			reset,
	output	[6:0]	rbcd,
	output	[6:0]	lbcd
);

reg		[6:0]	count;
wire	[3:0]	lnum, rnum;
reg		[2:0]	state;

binaryBCD bbcd(count,lnum,rnum);
bcd7SEG r(rnum, rbcd);
bcd7SEG l(lnum, lbcd);

parameter	IDLE = 3'b000,
			l_1 = 3'b001,
			l_12 = 3'b011,
			l_2 = 3'b010,
			a_2 = 3'b100,
			a_21 = 3'b101,
			a_1 =3'b111;

always@(posedge clk or posedge reset)
begin
	if(reset)
	begin
		state = IDLE;
		count = 0;
	end
	else
	begin
		case(state)
			IDLE:
			begin
				case({sen2, sen1})
				2'b00:state = state;
				2'b01:state = l_1;
				2'b10:state = a_2;
				2'b11:state = IDLE; //error
				endcase
			end
			l_1:
			begin
				case({sen2, sen1})
				2'b00:state = IDLE;
				2'b01:state = state;
				2'b10:state = state; //error
				2'b11:state = l_12;
				endcase
			end
			l_12:
			begin
				case({sen2, sen1})
				2'b00:state = state; //error
				2'b01:state = l_1;
				2'b10:state = l_2;
				2'b11:state = state;
				endcase
			end
			l_2:
			begin
				case({sen2, sen1})
				2'b00:
				begin
					state = IDLE;
					count = count-1;
					end
				2'b01:state = state;//error
				2'b10:state = state;
				2'b11:state = l_12;
				endcase
			end
			a_2:
			begin
				case({sen2, sen1})
				2'b00:state = IDLE;
				2'b01:state = state;//error
				2'b10:state = state;
				2'b11:state = a_21;
				endcase
			end
			a_21:
			begin
				case({sen2, sen1})
				2'b00:state = state;//error
				2'b01:state = a_1;
				2'b10:state = a_2;
				2'b11:state = state;
				endcase
			end
			a_1:
			begin
				case({sen2, sen1})
				2'b00:
				begin
					state = IDLE;
					count = count + 1;
				end
				2'b01:state = state;
				2'b10:state = state;//error
				2'b11:state = a_21;
				endcase
			end
			default:
				state = IDLE;
			end
	end
	
end



endmodule


module binaryBCD(
	input	[7:0]	A,
	output	[3:0]	ONES,
	output	[3:0]	TENS,
);
	wire [3:0] c1,c2,c3,c4,c5,c6,c7;
	wire [3:0] d1,d2,d3,d4,d5,d6,d7;

	assign d1 = {1'b0,A[7:5]};
	assign d2 = {c1[2:0],A[4]};
	assign d3 = {c2[2:0],A[3]};
	assign d4 = {c3[2:0],A[2]};
	assign d5 = {c4[2:0],A[1]};
	assign d6 = {1'b0,c1[3],c2[3],c3[3]};
	assign d7 = {c6[2:0],c4[3]};
	add3 m1(d1,c1);
	add3 m2(d2,c2);
	add3 m3(d3,c3);
	add3 m4(d4,c4);
	add3 m5(d5,c5);
	add3 m6(d6,c6);
	add3 m7(d7,c7);
	assign ONES = {c5[2:0],A[0]};
	assign TENS = {c7[2:0],c5[3]};
endmodule

module add3(in,out);
	input [3:0] in;
	output [3:0] out;
	reg [3:0] out;

	always @ (in)
	if(in > 4)
		in = in + 3;
	else
		in = in;
	endmodule

module bcd7SEG
(
	input		[3:0]	BCD,
	output	reg	[6:0]	SEG_7
);
always@ (BCD)
case (BCD)
	4'b0000:SEG_7=7'b1111110;
	4'b0001:SEG_7=7'b0110000;
	4'b0010:SEG_7=7'b1101101;
	4'b0011:SEG_7=7'b1111001;
	4'b0100:SEG_7=7'b0110011;
	4'b0101:SEG_7=7'b1011011;
	4'b0110:SEG_7=7'b1011111;
	4'b0111:SEG_7=7'b1110000;
	4'b1000:SEG_7=7'b1111111;
	4'b1001:SEG_7=7'b1111101;
	default:SEG_7=7'b0000000;
	endcase
endmodule

