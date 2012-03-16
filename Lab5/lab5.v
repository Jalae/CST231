//-----------------------------------------------------------------------------
//University: OIT - CSET
//Class: CST 231
//Lab:Lab 5
//Project: keypad controller
//
//Author: Kehnin Dyer
//Date: 2012 03 14
//Dependancies: none
//-----------------------------------------------------------------------------
//DISCRIPTION:
//In this lab, you will be reading input from a keypad and display the corresponding
//button pressed onto a seven segment display. You will be required to write a Verilog program
//which will determine which key has been pressed on the key pad. The program will
//then display the corresponding character by decoding it and displaying it on the
//multiplexed seven segment display from the PLD class.  Each BCD character (0-9) will
//be displayed in the least significant digit and shifted over when a new key is entered.
//If the ÅgCLEARÅh key is hit it will cause the display to clear.  The other key on the keypad
//will just cause the display to hold the present data.
//The keypad switches have a 3 msec bounce therefore the clock frequency is 1 Khz to minimize
//the switch bounce.
//
//	  |		5		6		7		8
//____|________________________________
//	1 |		1		2		3		^
//	2 |		4		5		6		V
//	3 |		7		8		9		Sec
//	4 |		CLR		0		HEL		ENT
//-----------------------------------------------------------------------------

module lab5(
	input				CLK,
	input				RESET,
	input		[3:0]	K_I,//8, 7, 6, 5
	output	reg	[3:0]	K_O,//4, 3, 2, 1
	output	reg	[6:0]	SEG,
	output	reg	[2:0]	COM
);

reg [1:0]	count;
reg [1:0]	col;


assign ena = &K_O;	//if they are all 1, there is nothing pushed.
					//then ena becomes 0 locking out changes.

KP_Scan sc(CLK, ena, K_O, count); //posedge clk change outputs.

//ena changes fast
//but the column value changes slow.
KP_Read rd(K_I, col);
KP_Latch lc()

reg [3:0]	KeyVal; //output set by



always@(posedge ~CLK)
State = nState;

always@(posedge CLK)
begin


end

always@(~RESET or )
begin
	if(~RESET)
	begin
		{db0,db1,db2,db3} = 16'hFFFF;
	end

end



endmodule

