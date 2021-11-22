//phy_tx.v
`include "c32b_8b.v"
`include "c32b_8b0.v"
`include "byte_stripping.v"
`include "paralelo_serie.v"

module phy_tx(input [31:0]  data_in,
            input  valid,
            input  reset_L,
            input  clock1,
            input  clock2,
            input  clock4,
            input  clock32,
            output data_out1,
          //  output [7:0]  data2sent1,
         //   output 	  valid5,
          //  output [15:0] counterBC2,
            output data_out0
         //   output [7:0]  data2sent0,
          //  output 	  valid4,
           // output [15:0] counterBC1
);
            
            
wire input1;
wire valid0,valid1,valid2, valid3;
wire [31:0] lane_0,lane_1;
wire [7:0] lane_2,lane_3, data2send0, data2send1;
   wire [15:0] counterBC1, counterBC2;
   
//---------conductual-----------

//byte stripping
byte_stripping byte_stripping(
    .data_in (data_in),
    .valid (valid),
    .reset_L (reset_L),
    .clock1 (clock1),
    .clock2 (clock2),
    .clock4 (clock4),

    .lane_0 (lane_0),
    .lane_1 (lane_1),
    .valid0 (valid0),
    .valid1 (valid1)
);
//32 a 8
c32b_8b linea0_32_8(
    .data_in (lane_0),
    .data_out (lane_2),
    .valid_in (valid0),
    .clock1 (clock1),
    .clock4 (clock4),
    .reset_L (reset_L),
    .valid_out (valid2)
);
c32b_8b0 linea1_32_8(
    .data_in (lane_1),
    .data_out (lane_3),
    .valid_in (valid1),
    .clock1 (clock1),
    .clock4 (clock4),
    .reset_L (reset_L),
    .valid_out (valid3)
);
//paralelo a serie
paralelo_serie paralelo_serie_linea0(
    .data_out	(data_out0),
   // .valid_out  (valid4),
    .data2sent  (data2sent0),
    .data_in    (lane_2),
    .counterBC  (counterBC1),
    .valid      (valid2),
    .clock32    (clock32),
    .clock4		(clock4),
    .reset_L (reset_L)
);
paralelo_serie paralelo_serie_linea1(
    .data_out	(data_out1),
    .data2sent  (data2sent1),
  // .valid_out  (valid5),
    .data_in    (lane_3),
    .counterBC  (counterBC2),
    .valid      (valid3),
    .clock32    (clock32),
    .clock4		(clock4),
    .reset_L (reset_L)
);

endmodule
