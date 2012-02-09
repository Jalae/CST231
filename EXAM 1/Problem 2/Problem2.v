//Kehnin Dyer
//Exam 1

module stest
(
input	wire	clk,
input	wire	data_rdy,
input	wire	drdy,
input	wire	done,
output	reg		req,
output	reg		den
);

always@(posedge clk, posedge done)
begin
	if(done)
	begin
		req = 0;
		den = 0;
	end
	else if(clk)
	begin
		req <= data_rdy;
		den <= req & drdy;
	end
end
endmodule

