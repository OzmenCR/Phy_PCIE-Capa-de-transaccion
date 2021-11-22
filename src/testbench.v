`timescale	1ns	/100ps 

`include "tester.v"
`include "clock.v"
`include "c32b_8b.v"
`include "c32b_8b0.v"
`include "byte_stripping.v"
`include "paralelo_serie.v"
`include "clockS.v"
`include "c32b_8bS.v"
`include "byte_strippingS.v"
`include "paralelo_serieS.v"
`include "cmos_cells.v"
`include "serial_paralelo1.v"
`include "serial_paralelo2.v"
`include "serial_paralelo1S.v"
`include "c8b_32b.v"
`include "c8b_32b2.v"
`include "c8b_32bS.v"
`include "un_byte_striping.v"
`include "un_byte_stripingS.v"

module testbench;
wire clock1,clock2,clock4,input1,reset_L;
wire valid,valid0,valid1,valid2,valid3,valid4,valid5;
wire [31:0] data_in,lane_0,lane_1,ulane0,ulane1,final;
wire [15:0] counterBC1,counterBC2;
wire [7:0] lane_2,lane_3,data2sent0,data2sent1,w0,w1;
wire data_out0,data_out1,v0,v1,v2,v3;
//---------conductual-----------
//generador relojes
clk clk0(
    .clock32 (clock32),
    .reset_L (reset_L),
    .clock4 (clock4),
    .clock2 (clock2),
    .clock1 (clock1)
);
//probador
tester test(
    .clock32 (clock32),
    .reset_L (reset_L),
    .valid (valid),
    .clock4 (clock4),
    .clock2 (clock2),
    .clock1 (clock1),
    .data_in (data_in)
);
//byte stripping
byte_stripping b1(
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
c32b_8b c1(
    .data_in (lane_0),
    .data_out (lane_2),
    .valid_in (valid0),
    .clock1 (clock1),
    .clock4 (clock4),
    .reset_L (reset_L),
    .valid_out (valid2)
);
c32b_8b0 c2(
    .data_in (lane_1),
    .data_out (lane_3),
    .valid_in (valid1),
    .clock1 (clock1),
    .clock4 (clock4),
    .reset_L (reset_L),
    .valid_out (valid3)
);
//paralelo a serie
paralelo_serie p1(
    .data_out	(data_out0),
    .data2sent  (data2sent0),
    .data_in    (lane_2),
    .counterBC  (counterBC1),
    .valid      (valid2),
    .clock32    (clock32),
    .clock4		(clock4),
    .reset_L (reset_L)
);
paralelo_serie p2(
    .data_out	(data_out1),
    .data2sent  (data2sent1),
    .data_in    (lane_3),
    .counterBC  (counterBC2),
    .valid      (valid3),
    .clock32    (clock32),
    .clock4		(clock4),
    .reset_L (reset_L)
);
//Serie a paralelo
serial_paralelo1 s1(
    .data_in    (data_out0),
    .clock32    (clock32),
    .clock4		(clock4),
    .reset_L (reset_L),
    .data_out   (w0),
    .valid_out  (v0)
);
serial_paralelo2 s2(
    .data_in    (data_out1),
    .clock32    (clock32),
    .clock4		(clock4),
    .reset_L (reset_L),
    .data_out   (w1),
    .valid_out  (v1)
);
c8b_32b c81(
    .data_in (w0),
    .data_out (ulane0),
    .valid (v0),
    .clock1 (clock1),
    .clock4 (clock4),
    .reset_L (reset_L),
    .valid_out (v2)
);
c8b_32b2 c82(
    .data_in (w1),
    .data_out (ulane1),
    .valid (v1),
    .clock1 (clock1),
    .clock4 (clock4),
    .reset_L (reset_L),
    .valid_out (v3)
);
un_byte_striping uns(  
				    // Outputs
				    .data_out		(final),
				    .valid_0		(v2),
				    .valid_1		(v3),
				    .valid_out		(v4),
				    // Inputs
				    .reset_L		(reset_L),
				    .lane_0		(ulane0),
				    .lane_1		(ulane1),
				    .clk_2f		(clock2),
				    .clk_f		(clock1)
);

//-------------estructural------------

clkS clkS1(
    .clock32 (clock32),
    .reset_L (reset_L),
    .clock4 (clock4),
    .clock2 (clock2),
    .clock1 (clock1)
);
//probador
//byte stripping
byte_strippingS bS1(
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
c32b_8bS cS1(
    .data_in (lane_0),
    .data_out (lane_2),
    .valid_in (valid0),
    .clock1 (clock1),
    .clock4 (clock4),
    .reset_L (reset_L),
    .valid_out (valid2)
);
paralelo_serieS p1S(
    .data_out	(data_out0),
    .data2sent  (data2sent0),
    .data_in    (lane_2),
    .valid (valid2),
    .clock32    (clock32),
    .clock4		(clock4),
    .reset_L    (reset_L)
    
);
serial_paraleloS s1S(
    .data_in    (data_out0),
    .clock32    (clock32),
    .clock4		(clock4),
    .reset_L (reset_L),
    .data_out   (w0),
    .valid_out  (v0)
);
c8b_32bS c81S(
    .data_in (w0),
    .data_out (ulane0),
    .valid (v0),
    .clock1 (clock1),
    .clock4 (clock4),
    .reset_L (reset_L),
    .valid_out (v2)
);
un_byte_stripingS uns1(  
				    // Outputs
				    .data_out		(final),
				    .valid_0		(v2),
				    .valid_1		(v3),
				    .valid_out		(v4),
				    // Inputs
				    .reset_L		(reset_L),
				    .lane_0		(ulane0),
				    .lane_1		(ulane1),
				    .clk_2f		(clock2),
				    .clk_f		(clock1)
);
endmodule