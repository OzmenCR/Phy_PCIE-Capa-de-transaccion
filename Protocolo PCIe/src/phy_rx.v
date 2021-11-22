//phy_rx.v

`include "un_byte_striping.v"
`include "serial_paralelo1.v"
`include "serial_paralelo2.v"
`include "c8b_32b.v"
`include "c8b_32b2.v"

module phy_rx(
	      input 	    reset_L, 
	      input 	    clock1,
              input 	    clock2,
              input 	    clock4,
              input 	    clock32,
              input 	    data_out1,
            //  input [7:0]  data2sent1,
             // input 	   valid5,
             // input [15:0]  counterBC2,

              input 	    data_out0,
             // input [7:0]  data2sent0,
             // input 	   valid4,
             // input [15:0]  counterBC1,
        
              output [31:0] data_out,

              output 	    v4
);
wire clock1,clock2,clock4,input1;
wire [31:0] ulane0,ulane1;
wire [7:0] lane_2,lane_3,w0,w1;
   wire    v0,v1,v2, v3;
   reg 	   reset1, reset2, select;
   
reg selector;
//---------conductual-----------

always @(posedge clock32)begin
   reset1 <= reset_L;
   reset2 <= reset1;
  
   end

//Serie a paralelo
serial_paralelo1 serie_paralelo_linea0(
    .data_in    (data_out0),
    .clock32    (clock32),
    .clock4		(clock4),
 //   .valid_in   (valid4),
    .reset_L (reset_L),
    .data_out   (w0),
   // .data2sent  (data2sent0),
    .valid_out  (v0)
);
serial_paralelo2 serie_paralelo_linea1(
    .data_in    (data_out1),
    .clock32    (clock32),
    .clock4		(clock4),
  //  .valid_in   (valid5),
    .reset_L (reset_L),
    .data_out   (w1),
   // .data2sent  (data2sent1),
    .valid_out  (v1)
);
c8b_32b Linea0_8b_32(
    .data_in (w0),
    .data_out (ulane0),
    .valid (v0),
    .clock1 (clock1),
    .clock4 (clock4),
    .reset_L (reset_L),
    .valid_out (v2)
);
c8b_32b2 Linea1_8b_32(
    .data_in (w1),
    .data_out (ulane1),
    .valid (v1),
    .clock1 (clock1),
    .clock4 (clock4),
    .reset_L (reset_L),
    .valid_out (v3)
);
un_byte_striping unbyte_stripping(  
				    // Outputs
				    .data_out		(data_out),
				    
				    .valid_out		(v4),
				    // Inputs
				    .valid_0		(v2),
				    .valid_1		(v3),
				    .reset_L		(reset2),
				    .lane_0		(ulane0),
				    .lane_1		(ulane1),
				    .clk_2f		(clock2),
				    .clk_f		(clock1)
				   // .clk_32f (clock32)
);

endmodule
