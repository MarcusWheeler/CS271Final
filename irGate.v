// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
// CREATED		"Fri May 21 21:05:02 2021"

module irGate(
	Clock,
	Signal,
	reset,
	enable,
	again
);


input wire	Clock;
input wire	Signal;
input wire	reset;
output wire	enable;
output wire	again;

wire	clockandsignal;
wire	fourmsresult;
wire	goAgain;
wire	high;
wire	ninemsresult;
wire	notsignal;
wire	twopoint25msresult;
wire	SYNTHESIZED_WIRE_0;





counter	b2v_2point25ms_low(
	.clk(notsignal),
	.en(high),
	.reset(reset),
	.result(twopoint25msresult)
	);
	defparam	b2v_2point25ms_low.M = 112500;
	defparam	b2v_2point25ms_low.N = 19;


counter	b2v_4ms_low(
	.clk(notsignal),
	.en(high),
	.reset(reset),
	.result(fourmsresult)
	);
	defparam	b2v_4ms_low.M = 225000;
	defparam	b2v_4ms_low.N = 19;


counter	b2v_9ms_high(
	.clk(clockandsignal),
	.en(high),
	.reset(reset),
	.result(ninemsresult)
	);
	defparam	b2v_9ms_high.M = 450000;
	defparam	b2v_9ms_high.N = 19;


assign	clockandsignal = Clock & Signal;

assign	notsignal = Clock & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_0 =  ~Signal;

assign	enable = ninemsresult & twopoint25msresult;

assign	goAgain = ninemsresult & fourmsresult;

assign	again = goAgain;
assign	high = 1;

endmodule
