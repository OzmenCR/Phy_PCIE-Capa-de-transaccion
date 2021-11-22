module contador(
		input		clk,
		input [1:0] idx,
		input		empty0,
		input		empty1,
		input		empty2,
		input		empty3,
		output	reg	pop0,pop1,pop2,pop3,
		input		reset_L,
		input		request,
		output reg [5:0] contador_out,
		output reg 	 valid
		);
   //reg bit_mapeado;
   
   reg [5:0]	contador0, contador1, contador2, contador3;
   

   always @(posedge clk or reset_L) begin
      if(~reset_L)begin
		valid <= 0;
		contador0 <=0;
		contador1 <= 0;
		contador2 <= 0;
		contador3 <= 0;
		contador_out <= 0;
      end else begin
		//reiniciar datos
		pop0 <= 0;
		pop1 <= 0;
		pop2 <= 0;
		pop3 <= 0;
		valid <= 0;
		contador_out <= 0;

		if(empty0 == 0)begin
			pop0 <= 1;
			contador0 <= contador0 + 1;   
		end
		if(empty1 == 0)begin
			pop1 <= 1;
			contador1 <= contador1 + 1;   
		end
		if(empty2 == 0)begin
			pop2 <= 1;
			contador2 <= contador2 + 1;   
		end
		if(empty3 == 0)begin
			pop3 <= 1;
			contador3 <= contador3 + 1;
		end
		if(request) begin
		valid <= request; 
			if(idx == 0)begin
				contador_out <= contador0;
			end
			if(idx == 1)begin
				contador_out <= contador1;	  
			end
			if(idx == 2)begin
				contador_out <= contador2;
			end
			if(idx == 3)begin
				contador_out <= contador3; 
			end 
		end
    end // else: !if(reset_L == 0)
   end
endmodule
