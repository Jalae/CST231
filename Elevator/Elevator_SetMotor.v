module Elevator_SetMotor(
	input	en,
	input	dir,
	output	motor_up,
			motor_down
);

assign motor_up = dir && en;
assign motor_down = (~dir) && en;

endmodule

