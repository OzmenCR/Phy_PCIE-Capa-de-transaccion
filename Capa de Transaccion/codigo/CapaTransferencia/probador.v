 `define          DELAY 10  
 module     probador( 
 // 4. Parameter definitions  
 
 // 5. DUT Input regs  
 output reg [1:0] idx,
 
 output reg     rst_n, clk, request, 
 output reg     wr0,wr1,wr2,wr3,  
 //output reg     rd,  
 output reg     [9:0] data_in0,data_in1,data_in2,data_in3
 
 
 );  
 integer i;  
  parameter     ENDTIME      = 2500; 
 
 initial  
      begin 
           $dumpfile("test.vcd");
           $dumpvars; 
           clk     = 1'b0;  
           rst_n     = 1'b0;  
           wr0     = 1'b0;  
           wr1     = 1'b0;  
           wr2     = 1'b0;  
           wr3     = 1'b0;
           data_in0   = 0;
           data_in1   = 0;
           data_in2   = 0;
           data_in3   = 0; 
           idx=0; 
           request = 0;
      end  
 // 9. Generating Test Vectors  
 initial  
      begin  
           main;  
      end  
 task main;  
      fork  
           clock_generator;  
           reset_generator;  
           operation_process;  
           debug_fifo;  
           endsimulation;  
      join  
 endtask  
 task clock_generator;  
      begin  
           forever #`DELAY clk = !clk;  
      end  
 endtask  
 task reset_generator;  
      begin  
           #(`DELAY*2)  
           rst_n = 1'b1;  
           # 7.9  
           rst_n = 1'b0;  
           # 7.09  
           rst_n = 1'b1;  
      end  
 endtask  
 task operation_process;  
     begin  
           //primer fifo entrada
           
           for (i = 0; i < 7; i = i + 1) begin: WRE0  
                #(`DELAY*5)  
                wr0 = 1'b1;  
                data_in0 = data_in0 + 1; 
                data_in0 [9:8] = data_in0 [9:8] + 1; 
                #(`DELAY*2)  
                wr0 = 1'b0;  
           end
           data_in1 <= data_in0;
           data_in1 [9:8] <= 0;
           #(`DELAY)
           
           //segundo fifo entrada
           
           for (i = 0; i < 7; i = i + 1) begin: WRE1  
                #(`DELAY*5)  
                wr1 = 1'b1;  
                data_in1 = data_in1 + 1; 
                data_in1 [9:8] = data_in1 [9:8] + 1; 
                #(`DELAY*2)  
                wr1 = 1'b0;  
           end
           data_in2 <= data_in1;
           data_in2 [9:8] <= 0;
           #(`DELAY)

           //tercer fifo entrada
           
           for (i = 0; i < 7; i = i + 1) begin: WRE2  
                #(`DELAY*5)  
                wr2 = 1'b1;  
                data_in2 = data_in2 + 1; 
                data_in2 [9:8] = data_in2 [9:8] + 1; 
                #(`DELAY*2)  
                wr2 = 1'b0;  
           end
           data_in3 <= data_in2;
           data_in3 [9:8] <= 0;
           #(`DELAY)

           //cuarto fifo entrada
           
           for (i = 0; i < 7; i = i + 1) begin: WRE3  
                #(`DELAY*5)  
                wr3 = 1'b1;  
                data_in3 = data_in3 + 1; 
                data_in3 [9:8] = data_in3 [9:8] + 1; 
                #(`DELAY*2)  
                wr3 = 1'b0;  
           end

           //#(`DELAY)
           request<=1;
          repeat(6) begin
               @(posedge clk) begin
                    idx<=idx+1;
               end
          end
          request <= 0;
           
     end
 endtask  
 // 10. Debug fifo  
 task debug_fifo;  
      begin  
           $display("----------------------------------------------");  
           $display("------------------   -----------------------");  
           $display("----------- SIMULATION RESULT ----------------");  
           $display("--------------       -------------------");  
           $display("----------------     ---------------------");  
           $display("----------------------------------------------");  
      end  
 endtask  
 
 //12. Determines the simulation limit  
 task endsimulation;  
      begin  
           #ENDTIME  
           $display("-------------- THE SIMUALTION FINISHED ------------");  
           $finish;  
      end  
 endtask  
 endmodule  