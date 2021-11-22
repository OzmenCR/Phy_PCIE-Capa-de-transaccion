//The timescale directive  
`timescale 1ns /100ps 
//Includ modules
`include "cmos_cells.v"

`include "arbitro.v"
`include "Estructural_arbitro.v"
`include "probador_arbitro.v"
//new module
module     banco_pruebas_arbitro;  

 // 4. Parameter definitions  
 //outputs
 wire clk, reset_L, empty0, empty0E, empty1, empty1E, empty2, empty2E, empty3, empty3E;
 wire [7:0] data_in0, data_in1, data_in2,data_in3;

 wire [3:0] dest_in0, dest_out0E, dest_in1, dest_out1E, dest_in2, dest_out2E, dest_in3, dest_out3E, dest_out0, dest_out1, dest_out2, dest_out3;

 wire  [7:0] data_out0, data_out1, data_out2, data_out3;  
 wire  [7:0] data_out0E, data_out1E, data_out2E, data_out3E;  

arbitro arbitro_conductual(/*AUTOINST*/
			   // Outputs
			   .dest_out0		(dest_out0[3:0]),
			   .dest_out1		(dest_out1[3:0]),
			   .dest_out2		(dest_out2[3:0]),
			   .dest_out3		(dest_out3[3:0]),
			   .data_out0		(data_out0[7:0]),
			   .data_out1		(data_out1[7:0]),
			   .data_out2		(data_out2[7:0]),
			   .data_out3		(data_out3[7:0]),
			   .empty0		(empty0),
			   .empty1		(empty1),
			   .empty2		(empty2),
			   .empty3		(empty3),
			   // Inputs
			   .clk			(clk),
			   .data_in0		(data_in0[7:0]),
			   .data_in1		(data_in1[7:0]),
			   .data_in2		(data_in2[7:0]),
			   .data_in3		(data_in3[7:0]),
			   .reset_L		(reset_L),
			   .dest_in0		(dest_in0[3:0]),
			   .dest_in1		(dest_in1[3:0]),
			   .dest_in2		(dest_in2[3:0]),
			   .dest_in3		(dest_in3[3:0])); 
   Estructural_arbitro Estructural_A (/*AUTOINST*/
				      // Outputs
				      .data_out0	(data_out0E[7:0]),
				      .data_out1	(data_out1E[7:0]),
				      .data_out2	(data_out2E[7:0]),
				      .data_out3	(data_out3E[7:0]),
				      .dest_out0	(dest_out0E[3:0]),
				      .dest_out1	(dest_out1E[3:0]),
				      .dest_out2	(dest_out2E[3:0]),
				      .dest_out3	(dest_out3E[3:0]),
				      .empty0		(empty0E),
				      .empty1		(empty1E),
				      .empty2		(empty2E),
				      .empty3		(empty3E),
				      // Inputs
				      .clk		(clk),
				      .data_in0		(data_in0[7:0]),
				      .data_in1		(data_in1[7:0]),
				      .data_in2		(data_in2[7:0]),
				      .data_in3		(data_in3[7:0]),
				      .dest_in0		(dest_in0[3:0]),
				      .dest_in1		(dest_in1[3:0]),
				      .dest_in2		(dest_in2[3:0]),
				      .dest_in3		(dest_in3[3:0]),
				      .reset_L		(reset_L));

   probador_arbitro probador_A (/*AUTOINST*/
				// Outputs
				.clk		(clk),
				.data_in0	(data_in0[7:0]),
				.data_in1	(data_in1[7:0]),
				.data_in2	(data_in2[7:0]),
				.data_in3	(data_in3[7:0]),
				.reset_L	(reset_L),
				.dest_in0	(dest_in0[3:0]),
				.dest_in1	(dest_in1[3:0]),
				.dest_in2	(dest_in2[3:0]),
				.dest_in3	(dest_in3[3:0]),
				// Inputs
				.dest_out0	(dest_out0[3:0]),
				.dest_out1	(dest_out1[3:0]),
				.dest_out2	(dest_out2[3:0]),
				.dest_out3	(dest_out3[3:0]),
				.data_out0	(data_out0[7:0]),
				.data_out1	(data_out1[7:0]),
				.data_out2	(data_out2[7:0]),
				.data_out3	(data_out3[7:0]),
				.empty0		(empty0),
				.empty1		(empty1),
				.empty2		(empty2),
				.empty3		(empty3),
				.dest_out0E	(dest_out0E[3:0]),
				.dest_out1E	(dest_out1E[3:0]),
				.dest_out2E	(dest_out2E[3:0]),
				.dest_out3E	(dest_out3E[3:0]),
				.data_out0E	(data_out0E[7:0]),
				.data_out1E	(data_out1E[7:0]),
				.data_out2E	(data_out2E[7:0]),
				.data_out3E	(data_out3E[7:0]),
				.empty0E	(empty0E),
				.empty1E	(empty1E),
				.empty2E	(empty2E),
				.empty3E	(empty3E));
endmodule  
