//Convertir una entrada de 32b a 8b

module c8b_32b(input[7:0] data_in,
	      output reg [31:0] data_out,
	      input 	       valid,
	      input 	       clock1,
	      input 	       clock4,
         input           reset_L,
         output reg      valid_out);

   reg [31:0] 		       bus0;
   reg [1:0] 		       counter,counter0;
   /*always @(negedge valid) begin
         valid_out<=0;
         bus0<='h00000000;
         counter<=3;
         data_out<=0;
   end*/
   always @(posedge clock4 or negedge reset_L) begin
      if(~reset_L) begin
         valid_out<=0;
         bus0<='h00000000;
         counter<=3;
         counter0<=0;
         data_out<=0;
      end else begin 
         if(counter==0) begin
         bus0[24] <= data_in[0];
         bus0[25] <= data_in[1];
         bus0[26] <= data_in[2];
         bus0[27] <= data_in[3];
         bus0[28] <= data_in[4];//cuartos 8bits
         bus0[29] <= data_in[5];
         bus0[30] <= data_in[6];
         bus0[31] <= data_in[7];
         counter0 <= 0;
         end
         
         else if(counter==1)begin
         bus0[16] <= data_in[0];
         bus0[17] <= data_in[1];
         bus0[18] <= data_in[2];
         bus0[19] <= data_in[3];
         bus0[20] <= data_in[4];//terceros 8bits
         bus0[21] <= data_in[5];
         bus0[22] <= data_in[6];
         bus0[23] <= data_in[7];
         //counter <= 2;
         end
         
         else if(counter==2)begin
         bus0[8] <= data_in[0];
         bus0[9] <= data_in[1];
         bus0[10] <= data_in[2];
         bus0[11] <= data_in[3];
         bus0[12] <= data_in[4];//segundos 8bits
         bus0[13] <= data_in[5];
         bus0[14] <= data_in[6];
         bus0[15] <= data_in[7];
         //counter <= 3;
         end
         else if(counter==3)begin
         bus0[0] <= data_in[0];
         bus0[1] <= data_in[1];
         bus0[2] <= data_in[2];
         bus0[3] <= data_in[3];
         bus0[4] <= data_in[4]; //primeros 8bits
         bus0[5] <= data_in[5];
         bus0[6] <= data_in[6];
         bus0[7] <= data_in[7];
         //counter <= 0;
         counter0<=3;
         end
         if(counter0==3) begin
            data_out <= bus0;
            valid_out <= valid;
            counter0<=0;
         end
         counter<=counter+1'b1;
      end
   end
endmodule // c32b_8b
