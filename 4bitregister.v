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
// CREATED		"Fri May 21 12:02:27 2021"

module \4bitregister (
	clock,
	clearNot,
	enable,
	inputBus,
	outputBus
);


input wire	clock;
input wire	clearNot;
input wire	enable;
input wire	[3:0] inputBus;
output wire	[3:0] outputBus;

wire	clear;
wire	high;
reg	[3:0] outputBus_ALTERA_SYNTHESIZED;





always@(posedge clock or negedge clear or negedge high)
begin
if (!clear)
	begin
	outputBus_ALTERA_SYNTHESIZED[3] <= 0;
	end
else
if (!high)
	begin
	outputBus_ALTERA_SYNTHESIZED[3] <= 1;
	end
else
if (enable)
	begin
	outputBus_ALTERA_SYNTHESIZED[3] <= inputBus[3];
	end
end



always@(posedge clock or negedge clear or negedge high)
begin
if (!clear)
	begin
	outputBus_ALTERA_SYNTHESIZED[2] <= 0;
	end
else
if (!high)
	begin
	outputBus_ALTERA_SYNTHESIZED[2] <= 1;
	end
else
if (enable)
	begin
	outputBus_ALTERA_SYNTHESIZED[2] <= inputBus[2];
	end
end


always@(posedge clock or negedge clear or negedge high)
begin
if (!clear)
	begin
	outputBus_ALTERA_SYNTHESIZED[1] <= 0;
	end
else
if (!high)
	begin
	outputBus_ALTERA_SYNTHESIZED[1] <= 1;
	end
else
if (enable)
	begin
	outputBus_ALTERA_SYNTHESIZED[1] <= inputBus[1];
	end
end


always@(posedge clock or negedge clear or negedge high)
begin
if (!clear)
	begin
	outputBus_ALTERA_SYNTHESIZED[0] <= 0;
	end
else
if (!high)
	begin
	outputBus_ALTERA_SYNTHESIZED[0] <= 1;
	end
else
if (enable)
	begin
	outputBus_ALTERA_SYNTHESIZED[0] <= inputBus[0];
	end
end

assign	outputBus = outputBus_ALTERA_SYNTHESIZED;
assign	clear = clearNot;
assign	high = 1;

endmodule
