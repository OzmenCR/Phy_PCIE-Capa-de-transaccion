`include "cmos_cells.v"
`include "fifo_mem.v"
`include "arbitro.v"
`include "probador.v"
`include "contador.v"
//`include "Estructural_fifo_mem.v"
// 1. The timescale directive  
 `timescale     10 ps/ 10 ps  
// fpga4student.com: FPga projects, Verilog projects, VHDL projects
// Verilog project: Verilog code for FIFO memory
// Verilog Testbench code for FIFO memory 
 // 2. Preprocessor Directives  
 //`define          DELAY 10  
 // 3. Include Statements  
 //`include     "counter_define.h"  
 module     banco_pruebas;  
 wire [9:0] data_in0,data_in1,data_in2,data_in3;
 wire [9:0] data_outA0,data_outA1,data_outA2,data_outA3;
 wire [9:0] data_outF0,data_outF1,data_outF2,data_outF3;
 wire clk, rst_n, request;
 wire rd0,rd1,rd2,rd3,rd4,rd5,rd6,rd7;
 wire empty0,empty1,empty2,empty3,empty4,empty5,empty6,empty7;
 wire wr0,wr1,wr2,wr3,wr4,wr5,wr6,wr7;
 wire [1:0] idx;
  

probador probador (
   .clk (clk), 
   .rst_n (rst_n), 
   .wr0 (wr0),
   .wr1 (wr1),
   .wr2 (wr2),
   .wr3 (wr3), 
   .data_in0 (data_in0),
   .data_in1 (data_in1),
   .data_in2 (data_in2),
   .data_in3 (data_in3),
   .request (request),
   .idx (idx)
   );

arbitro arbiter(
    .clk (clk),
    .reset_L (rst_n),
    .data_in0 (data_outA0),
    .data_in1 (data_outA1),
    .data_in2 (data_outA2),
    .data_in3 (data_outA3),
    .empty0 (empty0),
    .empty1 (empty1),
    .empty2 (empty2),
    .empty3 (empty3),
    .data_out0 (data_outF0),
    .data_out1 (data_outF1),
    .data_out2 (data_outF2),
    .data_out3 (data_outF3),
    .rd0 (rd0),
    .rd1 (rd1),
    .rd2 (rd2),
    .rd3 (rd3),
    .wr4 (wr4),
    .wr5 (wr5),
    .wr6 (wr6),
    .wr7 (wr7)
);
  fifo_mem Fin0 (/*AUTOARG*/  
   // Outputs  
   .data_out (data_outA0),
   .fifo_empty (empty0),
   // Inputs  
   .clk (clk), 
   .rst_n (rst_n), 
   .wr (wr0), 
   .rd (rd0), 
   .data_in (data_in0)  
   );

  fifo_mem Fin1 (/*AUTOARG*/  
   // Outputs  
   .data_out (data_outA1),
   .fifo_empty (empty1),
   // Inputs  
   .clk (clk), 
   .rst_n (rst_n), 
   .wr (wr1), 
   .rd (rd1), 
   .data_in (data_in1)  
   );

  fifo_mem Fin2 (/*AUTOARG*/  
   // Outputs  
   .data_out (data_outA2),
   .fifo_empty (empty2), 
   // Inputs  
   .clk (clk), 
   .rst_n (rst_n), 
   .wr (wr2), 
   .rd (rd2), 
   .data_in (data_in2)  
   );

  fifo_mem Fin3 (/*AUTOARG*/  
   // Outputs  
   .data_out (data_outA3),
   .fifo_empty (empty3), 
   // Inputs  
   .clk (clk), 
   .rst_n (rst_n), 
   .wr (wr3), 
   .rd (rd3), 
   .data_in (data_in3)  
   );
    
  fifo_mem Fout0 (/*AUTOARG*/  
   // Outputs  
   //.data_out (data_outF0),  
   // Inputs  
   .fifo_empty (empty4), 
   .clk (clk), 
   .rst_n (rst_n), 
   .wr (wr4), 
   .rd (rd4), 
   .data_in (data_outF0)  
   );

   fifo_mem Fout1 (/*AUTOARG*/  
   // Outputs  
   //.data_out (data_outF1),  
   // Inputs  
   .fifo_empty (empty5), 
   .clk (clk), 
   .rst_n (rst_n),
   .wr (wr5), 
   .rd (rd5), 
   .data_in (data_outF1)  
   );

   fifo_mem Fout2 (/*AUTOARG*/  
   // Outputs  
   //.data_out (data_outF2),  
   // Inputs  
   .fifo_empty (empty6), 
   .clk (clk), 
   .rst_n (rst_n), 
   .wr (wr6), 
   .rd (rd6), 
   .data_in (data_outF2)  
   );

  fifo_mem Fout3 (/*AUTOARG*/  
   // Outputs  
   //.data_out (data_outF3),  
   // Inputs  
   .clk (clk), 
   .rst_n (rst_n), 
   .fifo_empty (empty7), 
   .wr (wr7), 
   .rd (rd7), 
   .data_in (data_outF3)  
   );

   contador counter (
     .clk (clk),
     .idx (idx),
     .empty0 (empty4),
     .empty1 (empty5),
     .empty2 (empty6),
     .empty3 (empty7),
     .pop0 (rd4),
     .pop1 (rd5),
     .pop2 (rd6),
     .pop3 (rd7),
     .reset_L (rst_n),
     .request (request)
   );
    //fifo_memS Estructural (/*AUTOARG*/  
   // Outputs 
   /* 
   .data_out (data_outE),
   .fifo_full (fifo_fullE), 
   .fifo_empty (fifo_emptyE), 
   .fifo_threshold (fifo_thresholdE), 
   .fifo_overflow (fifo_overflowE),   
   .fifo_underflow (fifo_underflowE),   
   // Inputs  
   .clk (clk), 
   .rst_n (rst_n), 
   .wr (wr), 
   .rd (rd), 
   .data_in (data_in)  
   ); */
   //probador
   
    endmodule  