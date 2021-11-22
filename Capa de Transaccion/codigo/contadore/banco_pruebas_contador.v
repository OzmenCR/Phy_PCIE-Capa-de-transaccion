`timescale 1ns /100ps
`include "cmos_cells.v"
`include "Estructural.v"

`include "probador.v"
`include "contadorr.v"



module banco_pruebas;
//testbench 

   wire  [1:0] 	 select;
   
   wire [9:0] 	 data_in0, data_in1, data_in2, data_in3, data_out, data_outE;
   
   wire 	 pop0, pop1, pop2, pop3, reset_L, clk;
   
   wire [2:0] 	 contador, contadorE ;

   

contadorr Contadore(  /*AUTOINST*/
		    // Outputs
		    .contador		(contador[2:0]),
		    .valid		(valid),
		    // Inputs
		    .clk		(clk),
		    .select		(select[1:0]),
		    .data_in0		(data_in0[9:0]),
		    .data_in1		(data_in1[9:0]),
		    .data_in2		(data_in2[9:0]),
		    .data_in3		(data_in3[9:0]),
		    .pop0		(pop0),
		    .pop1		(pop1),
		    .pop2		(pop2),
		    .pop3		(pop3),
		    .reset_L		(reset_L),
		    .request		(request));

Estructural Estructural(  /*AUTOINST*/
			// Outputs
			.contador	(contadorE[2:0]),
			.valid		(validE),
			// Inputs
			.clk		(clk),
			.data_in0	(data_in0[9:0]),
			.data_in1	(data_in1[9:0]),
			.data_in2	(data_in2[9:0]),
			.data_in3	(data_in3[9:0]),
			.pop0		(pop0),
			.pop1		(pop1),
			.pop2		(pop2),
			.pop3		(pop3),
			.request	(request),
			.reset_L	(reset_L),
			.select		(select[1:0]));

probador probador(           /*AUTOINST*/
		  // Outputs
		  .clk			(clk),
		  .data_in0		(data_in0[9:0]),
		  .data_in1		(data_in1[9:0]),
		  .data_in2		(data_in2[9:0]),
		  .data_in3		(data_in3[9:0]),
		  .pop0			(pop0),
		  .pop1			(pop1),
		  .pop2			(pop2),
		  .pop3			(pop3),
		  .reset_L		(reset_L),
		  .select		(select[1:0]),
		  .request		(request),
		  // Inputs
		  .contador		(contador[2:0]),
		  .contadorE		(contadorE[2:0]),
		  .valid		(valid),
		  .validE		(validE));

		  
endmodule
