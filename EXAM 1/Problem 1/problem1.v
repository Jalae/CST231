//Kehnin Dyer
//Exam 1
module ALU
(
input	wire	[3:0]	A,
						B,
input	wire	[1:0]	C,
output	reg				cout,
output	reg		[3:0]	AccOut
);

always@(A or B or C)
begin
	case(C)
	2'b00:
		begin
			AccOut = A;
			cout = 0;
		end
	2'b01:
		begin
			{cout, AccOut} = A + B;
		end
	2'b10:
		begin
			AccOut = A & B;
			cout = 0;
		end
	2'b11:
		begin
			AccOut = A';
			cout = 0;
		end
	default:
		begin
			AccOut = A;
			cout = 0;
		end
end

endmodule
