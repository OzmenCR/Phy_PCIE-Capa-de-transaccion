//phy.v
`timescale	1ns	/100ps 
`include "cmos_cells.v"
`include "tester.v"
`include "phy.v"
`include "phyS.v"



module Testbench;

   wire clock32, rest_L, valido, clock4, clock2, clock1, v2, v3, v4, valid;
   wire [31:0] data_in, data_out;
   wire        clockS1, clockS2, clockS4, v4S;
   wire [31:0] data_outS;
   

//probador
tester test(/*AUTOINST*/
	    // Outputs
	    .clock32			(clock32),
	    .reset_L			(reset_L),
	    .valid			(valid),
	    .data_in			(data_in[31:0]),
	    // Inputs
	    .clock4			(clock4),
	    .clock2			(clock2),
	    .clock1			(clock1));
   
	   // .data_out			(data_out[31:0]),
	  //  .v4				(v4));

   phy Phy(/*AUTOINST*/
	   // Outputs
	   .data_out			(data_out[31:0]),
	   .v4				(v4),
	   .clock1			(clock1),
	   .clock2			(clock2),
	   .clock4			(clock4),
	   // Inputs
	   .clock32			(clock32),
	   .reset_L			(reset_L),
	   .data_in			(data_in[31:0]),
	   .valid			(valid));

   phyS PhyS(/*AUTOINST*/
	     // Outputs
	     .clockS1			(clockS1),
	     .clockS2			(clockS2),
	     .clockS4			(clockS4),
	     .data_out			(data_outS[31:0]),
	     .v4			(v4),
	     // Inputs
	     .clockS32			(clock32),
	     .data_in			(data_in[31:0]),
	     .reset_L			(reset_L),
	     .valid			(valid));
   
   
endmodule
