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
(* chip_pin = "43" *)						input				CLK,
(* chip_pin = "9, 11, 12, 14" *)			input		[3:0]	K_I,//8, 7, 6, 5
(* chip_pin = "16, 17, 18, 19" *)			output		[3:0]	K_O,//4, 3, 2, 1
(* chip_pin = "25,26,27,28,29,31,33" *)		output		[6:0]	SEG,
(* chip_pin = "24,21,20" *)					output		[2:0]	COM
);

wire	[1:0]	count;
wire	[1:0]	row;
wire 			load, 
				ena;
wire	[3:0]	Key,
				A,
				B,
				C;

assign ena = &K_I;	//if they are all 1, there is nothing pushed.
					//then ena becomes 0 locking out changes.

KP_Scan sc(CLK, ena, K_O, count); //posedge clk change outputs.
KP_Read rd(K_I, row);
KP_sMachine stm(CLK, ena, load);
KP_Latch lc(ena, {count,row}, Key);
KP_ShiftRegister shr(CLK, load, Key, C, B, A);
lab1 lb(CLK, A, B, C, SEG, COM);









endmodule

