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
//-----------------------------------------------------------------------------

module lab5(
	input				CLK,
	input				RESET,
	input		[3:0]	K_I,
	output	reg	[3:0]	K_O,
	output	reg	[6:0]	SEG
);



endmodule

