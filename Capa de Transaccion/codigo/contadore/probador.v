module probador( 
		 output reg 	  clk,
		 output reg [9:0] data_in0,
		 output reg [9:0] data_in1,
		 output reg [9:0] data_in2,
		 output reg [9:0] data_in3,
		 output reg 	  pop0,
		 output reg 	  pop1,
		 output reg 	  pop2,
		 output reg 	  pop3,
		 output reg 	  reset_L,
		 output reg [1:0] select,
		 output reg 	  request,
		 input [2:0] 	  contador,
		 input [2:0] 	  contadorE,
		 input 		  valid,
		 input 		  validE
		 );
 
   initial begin

      $dumpfile("test.vcd");
      $dumpvars;
      
      reset_L <= 0;
      pop0 <= 1;
      pop1 <= 0;
      pop2 <= 0;
      pop3 <= 0;
      select <= 0;
      data_in0 <= 16'b0;
      data_in1 <= 16'b0;
      data_in2 <= 16'b0;
      data_in3 <= 16'b0;
      request <= 0;
      
      @(posedge clk) data_in0 <= 640;
      pop0 <= 1;
      pop1 <= 0;
      pop2 <= 0;
      pop3 <= 0;
      select <= 0;
      reset_L <= 1;
      request <= 1;
      @(posedge clk) data_in0 <= 610;
      pop0 <= 1;
      pop1 <= 0;
      pop2 <= 0;
      pop3 <= 0;
      select <= 0;
      request <= 0;
       @(posedge clk) data_in1 <= 644;
      pop0 <= 0;
      pop1 <= 1;
      pop2 <= 0;
      pop3 <= 0;
      select <= 1;
      reset_L <= 1;
      request <= 0;
      @(posedge clk) data_in2 <= 140;
      pop0 <= 0;
      pop1 <= 0;
      pop2 <= 1;
      pop3 <= 0;
      select <= 2;
      request <= 1;
       @(posedge clk) data_in2 <= 640;
      pop0 <= 0;
      pop1 <= 0;
      pop2 <= 1;
      pop3 <= 0;
      select <= 2;
      reset_L <= 1;
      request <= 0;
      @(posedge clk) data_in2 <= 10;
      pop0 <= 0;
      pop1 <= 0;
      pop2 <= 1;
      pop3 <= 0;
      select <= 2;
      request <= 1;
       @(posedge clk) data_in3 <= 440;
      pop0 <= 0;
      pop1 <= 0;
      pop2 <= 0;
      pop3 <= 1;
      select <= 3;
      reset_L <= 1;
      request <= 0;
      @(posedge clk) data_in3 <= 614;
      pop0 <= 1;
      pop1 <= 0;
      pop2 <= 0;
      pop3 <= 1;
      select <= 3;
      request <= 1;
      
  
      $finish;
      
   end //initial
   //Retardos y frecuencia max
   realtime time_a, time_b, delta_ab;
   initial begin
      time_a = $realtime;
      #1;
      time_b = $realtime;
      #1;
      delta_ab = time_a - time_b;
      $display ("time_a: %d", time_a);
      $display ("time_b: %d", time_b);
      $display ("delta_ab: %d", delta_ab);
   end
   //CHECKER

   
   
   initial clk <= 0;
   always #2 clk <= ~clk;

endmodule // probador
