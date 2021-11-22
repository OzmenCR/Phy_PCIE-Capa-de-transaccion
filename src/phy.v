//phy.v

`include "clock.v"
`include "phy_rx.v"
`include "phy_tx.v"



module phy(
	   input 	clock32,
	   input 	reset_L,
	   input [31:0] data_in,
	   input 	valid,

	  output  [31:0] 	data_out,
	   output  	v4,
	   output clock1,clock2,clock4);

wire input1,reset_L;
wire valid0,valid1,valid2,valid3,valid4,valid5;

wire [31:0] data_in,lane_0,lane_1,ulane0,ulane1t;
wire [15:0] counterBC1,counterBC2;
wire [7:0] lane_2,lane_3,data2sent0,data2sent1,w0,w1;
wire data_out0,data_out1,v0,v1,v2,v3;
   
//generador relojes
   
clock clk0(/*AUTOINST*/
	   // Outputs
	   .clock4			(clock4),
	   .clock2			(clock2),
	   .clock1			(clock1),
	   // Inputs
	   .clock32			(clock32),
	   .reset_L			(reset_L));


phy_tx TX(/*AUTOINST*/
	  // Outputs
	  .data_out1			(data_out1),
	  .data_out0			(data_out0),
	  // Inputs
	  .data_in			(data_in[31:0]),
	  .valid			(valid),
	  .reset_L			(reset_L),
	  .clock1			(clock1),
	  .clock2			(clock2),
	  .clock4			(clock4),
	  .clock32			(clock32));

   
phy_rx RX(/*AUTOINST*/
	  // Outputs
	  .data_out			(data_out[31:0]),
	  .v4				(v4),
	  // Inputs
	  .reset_L			(reset_L),
	  .clock1			(clock1),
	  .clock2			(clock2),
	  .clock4			(clock4),
	  .clock32			(clock32),
	  .data_out1			(data_out1),
	  .data_out0			(data_out0));
   
   
endmodule
