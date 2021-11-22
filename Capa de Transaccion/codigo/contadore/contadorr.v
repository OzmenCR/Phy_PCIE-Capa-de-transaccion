module contadorr(
		input 		 clk,
		input [1:0] 	 select,
		input [9:0] 	 data_in0,
		input [9:0] 	 data_in1,
		input [9:0] 	 data_in2,
		input [9:0] 	 data_in3,
		input 		 pop0,
		input 		 pop1,
		input 		 pop2,
		input 		 pop3,
		input 		 reset_L,
		input 		 request,
		output reg [2:0] contador,
		output reg 	 valid
		);
   
   

   //reg bit_mapeado;
   
   reg [2:0] 			 contador0, contador1, contador2, contador3;
   

   always @(posedge clk) begin

      if(reset_L == 0)begin
	 valid <= 0;
	 contador0 <=0;
	 contador1 <= 0;
	 contador2 <= 0;
	 contador3 <= 0;
	 contador <= 0;
	 
      end
      
      else begin 
	 if(pop0 == 1)begin
	    contador0 <= contador0 + 1;   
	 end

	 if(pop1 == 1)begin
	    contador1 <= contador1 + 1;   
	 end

	 if(pop2 == 1)begin
	    contador2 <= contador2 + 1;   
	 end

	 if(pop3 == 1)begin
	    contador3 <= contador3 + 1;
	 end

	 if(select == 0)begin
	    contador <= contador0;
	    valid <= request; 
	 end

	 if(select == 1)begin
	    contador <= contador1;
	    valid <= request; 	  
	 end

	 if(select == 2)begin
	    contador <= contador2;
	    valid <= request;
	    
	 end
	 
	 if(select == 3)begin
	    contador <= contador3;
	    valid <= request; 	  
	 end
	 
      end // else: !if(reset_L == 0)

      
   end




endmodule
