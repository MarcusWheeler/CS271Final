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
// CREATED		"Fri May 21 21:05:20 2021"

module irSorter(
	clock,
	signal,
	informationReady
);


input wire	clock;
input wire	signal;
output wire	informationReady;

wire	[7:0] addressBus;
wire	again;
wire	arrayFull;
wire	[7:0] command;
wire	[4:0] count;
wire	counterEnable;
wire	enable;
wire	[7:0] inverseAddress;
wire	[7:0] inverseCommand;
wire	notEnable;
wire	[31:0] properBit;
wire	ready;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[14:0] SYNTHESIZED_WIRE_3;





irGate	b2v_inst(
	.Clock(clock),
	.reset(ready),
	.Signal(signal),
	.enable(enable),
	.again(again));


\4bitregister 	b2v_inst1(
	.clearNot(notEnable),
	.enable(enable),
	.clock(clock),
	.inputBus(properBit[27:24])
	);


counter	b2v_inst10(
	.clk(SYNTHESIZED_WIRE_0),
	.en(counterEnable),
	
	
	.q(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst10.M = 450000;
	defparam	b2v_inst10.N = 15;


\4bitregister 	b2v_inst11(
	.clearNot(notEnable),
	.enable(enable),
	.clock(clock),
	.inputBus(properBit[7:4])
	);


\4bitregister 	b2v_inst12(
	.clearNot(notEnable),
	.enable(enable),
	.clock(clock),
	.inputBus(properBit[3:0])
	);

assign	SYNTHESIZED_WIRE_0 = clock & SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_1 =  ~signal;


sorter	b2v_inst15(
	.fate(SYNTHESIZED_WIRE_2),
	.clock(clock),
	.counter(count),
	.properBit(properBit));
	defparam	b2v_inst15.M = 32;
	defparam	b2v_inst15.N = 5;



\4bitregister 	b2v_inst2(
	.clearNot(notEnable),
	.enable(enable),
	.clock(clock),
	.inputBus(properBit[23:20])
	);


\4bitregister 	b2v_inst27(
	.clearNot(notEnable),
	.enable(enable),
	.clock(clock),
	.inputBus(properBit[31:28])
	);


counter	b2v_inst3(
	.clk(signal),
	.en(counterEnable),
	.reset(ready),
	.result(arrayFull),
	.q(count));
	defparam	b2v_inst3.M = 32;
	defparam	b2v_inst3.N = 5;

assign	ready = again | arrayFull;

assign	notEnable =  ~enable;


\4bitregister 	b2v_inst6(
	.clearNot(notEnable),
	.enable(enable),
	.clock(clock),
	.inputBus(properBit[19:16])
	);


irComparator	b2v_inst7(
	.lowCount(SYNTHESIZED_WIRE_3),
	.equalToM(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst7.M = 28125;
	defparam	b2v_inst7.N = 15;


\4bitregister 	b2v_inst8(
	.clearNot(notEnable),
	.enable(enable),
	.clock(clock),
	.inputBus(properBit[15:12])
	);


\4bitregister 	b2v_inst9(
	.clearNot(notEnable),
	.enable(enable),
	.clock(clock),
	.inputBus(properBit[11:8])
	);

assign	informationReady = ready;
assign	counterEnable = 1;

endmodule
