`include "cmos_cells.v"
`include "fifo_mem.v"

`include "Estructural_fifo_mem.v"

`include "probador.v"
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
 wire [7:0] data_in, data_out, data_outE;
 wire clk, rst_n, wr, rd, fifo_full, fifo_fullE, fifo_empty, fifo_emptyE, fifo_threshold, fifo_thresholdE, fifo_overflow, fifo_overflowE, fifo_underflow, fifo_underflowE; 
  //input wr, rd, clk, rst_n;  
  //input[7:0] data_in;   // FPGA projects using Verilog/ VHDL
  //output[7:0] data_out;  
  //output fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow;  
  wire[4:0] wptr,rptr;  
  wire fifo_we,fifo_rd; 
 fifo_mem tb (/*AUTOARG*/  
   // Outputs  
   .data_out (data_out),
   .fifo_full (fifo_full), 
   .fifo_empty (fifo_empty), 
   .fifo_threshold (fifo_threshold), 
   .fifo_overflow (fifo_overflow),   
   .fifo_underflow (fifo_underflow),   
   // Inputs  
   .clk (clk), 
   .rst_n (rst_n), 
   .wr (wr), 
   .rd (rd), 
   .data_in (data_in)  
   ); 
    fifo_memS Estructural (/*AUTOARG*/  
   // Outputs  
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
   ); 
   /*
  write_pointer writer(
  .wptr (wptr),
  .fifo_we (fifo_we),
  .wr (wr),
  .fifo_full (fifo_full),
  .clk (clk),
  .rst_n (rst_n)
  );  
  read_pointer read(
  .rptr (rptr),
  .fifo_rd (fifo_rd),
  .rd (rd),
  .fifo_empty (fifo_empty),
  .clk (clk),
  .rst_n (rst_n)
  );  
  memory_array memory(
  .data_out (data_out), 
  .data_in (data_in), 
  .clk (clk),
  .fifo_we (fifo_we), 
  .wptr (wptr),
  .rptr (rptr)
  );  
  status_signal status(
  .fifo_full (fifo_full), 
  .fifo_empty (fifo_empty), 
  .fifo_threshold (fifo_threshold),
  .fifo_overflow (fifo_overflow), 
  .fifo_underflow (fifo_underflow), 
  .wr (wr),  
  .rd (rd), 
  .fifo_we (fifo_we), 
  .fifo_rd (fifo_rd), 
  .wptr (wptr),
  .rptr (rptr),
  .clk (clk),
  .rst_n (rst_n)
  );  
  */
   probador probador (
   .data_out (data_out),
   .fifo_full (fifo_full), 
   .fifo_empty (fifo_empty), 
   .fifo_threshold (fifo_threshold), 
   .fifo_overflow (fifo_overflow),   
   .fifo_underflow (fifo_underflow), 
   .data_outE (data_outE),
   .fifo_fullE (fifo_fullE), 
   .fifo_emptyE (fifo_emptyE), 
   .fifo_thresholdE (fifo_thresholdE), 
   .fifo_overflowE (fifo_overflowE),   
   .fifo_underflowE (fifo_underflowE),   
   // Inputs  
   .clk (clk), 
   .rst_n (rst_n), 
   .wr (wr), 
   .rd (rd), 
   .data_in (data_in)  
   
   );
    endmodule  