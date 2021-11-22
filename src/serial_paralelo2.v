  module serial_paralelo2(
			 input 		  data_in,clock32,clock4,reset_L,
			 output reg [7:0] data_out,
			 output reg   valid_out
          );
   reg [7:0]   bus;
   reg [2:0]   counter;
   reg [1:0]   counterBC;
   reg         active,counter0,bClock32;
always @(posedge clock32) begin
   if(reset_L==0) begin
      data_out<=0;
      valid_out<=0;
      bus<='hBC;
      counter<=7;
      counter0<=0;
      counterBC<='d2; //empieza en 2 por desfase
      active<=0;
   end else begin
      if (counter == 0) begin
         bus[7] <= data_in;
         counter0 <= counter0 + 1;
      end else if (counter == 1) begin
         bus[6] <= data_in;
      end else if (counter == 2) begin
         bus[5] <= data_in;
      end else if (counter == 3) begin
         bus[4] <= data_in;
      end else if (counter == 4) begin
         bus[3] <= data_in; //primeros 8bits
      end else if (counter == 5) begin
         bus[2] <= data_in;
      end else if (counter == 6) begin
         bus[1] <= data_in;
      end else if (counter == 7) begin
         bus[0] <= data_in;
      end
      counter <= counter +1'b1;
      if (bus!=8'b10111100 & counterBC==0) begin
         active<=1;
      end else begin
         active<=0;
      end
  // end
   if(counter0) begin
      if(bus==8'b10111100) begin
         counterBC<=counterBC+1;
         data_out<='h00;
         valid_out<=0;
      end 
      if (bus==8'b10111100 & counterBC == 0) begin
         data_out<='h00;
         valid_out<=0;
      end else if(active==1) begin
         data_out<=bus;
         valid_out<=1;
      end
      counter0<=0;
   end
end
end
endmodule // paralelo-serie
