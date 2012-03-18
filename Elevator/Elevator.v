

module Elevator_sMachine(
	input		clk
	input	[3:0]	FB,
	input	[3:0]	Call,
	output	[3:0]	Door
);

wire	[3:0]	button;
wire	[1:0]	curFlr;
wire	[1:0]	nxtFlr;

//put these into a module
Elevator_ButtonLatch bl(clk,FB,Call,button);


Elevator_sMachine machine(clk, );

endmodule

