`include "memory_array.v"
`include "read_pointer.v"
`include "status_signal.v"
`include "write_pointer.v"
module fifo_mem(data_out,fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow,clk, rst_n, wr, rd, data_in);  
  input wr, rd, clk, rst_n;  
  input[7:0] data_in;   // FPGA projects using Verilog/ VHDL
  output[7:0] data_out;  
  output fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow;  
  wire[4:0] wptr,rptr;  
  wire fifo_we,fifo_rd;   
  write_pointer writer(wptr,fifo_we,wr,fifo_full,clk,rst_n);  
  read_pointer read(rptr,fifo_rd,rd,fifo_empty,clk,rst_n);  
  memory_array memory(data_out, data_in, clk,fifo_we, wptr,rptr);  
  status_signal status(fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow, wr, rd, fifo_we, fifo_rd, wptr,rptr,clk,rst_n);  
 endmodule  
