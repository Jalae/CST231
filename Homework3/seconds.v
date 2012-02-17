//-------------------------------------------------------------------
// Design Name	: Seconds counter for clock
// File Name		: sec_clk.v
// Function		: Seconds Counter for digital clock
// Coder		: Ralph Carestia
//-------------------------------------------------------------------


// Top level Structural design..
module sec_clk(
	input wire reset,
	input wire clk,
	output wire c_ten,c_min,
	output wire [3:0] rbcd,lbcd );
	
/************************************************
// Ralph Carestia   -   Verilog PLD Design
	Here is the top level Structural design..
************************************************/
	sec1_c u1 (
		.reset(reset),
		.clk (clk),
		.rbcd (rbcd),
		.c_ten (c_ten));

	sec10_c u2 (
		.reset(reset),
		.c_ten(c_ten),
		.clk(clk),
		.lbcd(lbcd),
		.c_min(c_min));
endmodule
//-------------------------------------------------------------------
// Design Name	: Second – ones counter for clock
// File Name	: sec1_c.v
// Function	: Ones digit for Seconds Counter 
// Coder		: Ralph Carestia
//-------------------------------------------------------------------
//	Here is a model for a one's counter..
module sec1_c(
	input	wire	reset,
	input	wire	clk,
	output	wire	c_ten,
	output	reg	[3:0] rbcd );

	parameter	scount=4'b0000;

	always @ (negedge reset or posedge clk)
	begin
		if (~reset)
			rbcd=scount; 		
		else if (rbcd < 4'b1001)
			rbcd = rbcd + 1;	 
		else	
			rbcd =0;			
	end
 	assign c_ten = (rbcd == 4'b1001);
endmodule

//-------------------------------------------------------------------
// Design Name	: Second – tens counter for clock
// File Name	: sec1_c.v
// Function	: Tens digit for Seconds Counter 
// Coder		: Ralph Carestia
//-------------------------------------------------------------------
//	Here is a model for the ten's counter..
module sec10_c (
	input wire reset,c_ten,
	input wire clk,
	output wire c_min,
	output reg [3:0] lbcd );
	parameter	scount=4'b0000;

	always @ (negedge reset or posedge clk)
		begin
			if (! reset)
				lbcd=scount;
			else
			case (c_ten) 
				1'b0:	begin
						lbcd = lbcd;
					end
				1'b1:	begin
					if (lbcd < 4'b0101)
						lbcd = lbcd + 1;	 
					else
						lbcd =0;
					end
				default: lbcd = lbcd;
			endcase
		end	
   assign c_min = (lbcd == 4'b0101) &  c_ten;
endmodule

