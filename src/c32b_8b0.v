//Convertir una entrada de 32b a 8b

module c32b_8b0(input[31:0] data_in,
	      output reg [7:0] data_out,
	      input valid_in,clock1,clock4,reset_L,
	      output reg valid_out
);

reg [1:0] select;
always @(posedge clock4 or negedge reset_L) begin
   if(reset_L==0) begin
      select<=3;
      data_out<=0;
      valid_out<=0;
   end else begin
      if(select==3) begin
         data_out[0] <= data_in[0];
         data_out[1] <= data_in[1];
         data_out[2] <= data_in[2];
         data_out[3] <= data_in[3];
         data_out[4] <= data_in[4]; //primeros 8bits
         data_out[5] <= data_in[5];
         data_out[6] <= data_in[6];
         data_out[7] <= data_in[7];
         valid_out<=valid_in;
      end if(select==2) begin
         data_out[0] <= data_in[8];
         data_out[1] <= data_in[9];
         data_out[2] <= data_in[10];
         data_out[3] <= data_in[11];
         data_out[4] <= data_in[12];//segundos 8bits
         data_out[5] <= data_in[13];
         data_out[6] <= data_in[14];
         data_out[7] <= data_in[15];
         valid_out<=valid_in;
      end if(select==1) begin
         data_out[0] <= data_in[16];
         data_out[1] <= data_in[17];
         data_out[2] <= data_in[18];
         data_out[3] <= data_in[19];
         data_out[4] <= data_in[20];//terceros 8bits
         data_out[5] <= data_in[21];
         data_out[6] <= data_in[22];
         data_out[7] <= data_in[23];
         valid_out<=valid_in;
      end if(select==0) begin
         data_out[0] <= data_in[24];
         data_out[1] <= data_in[25];
         data_out[2] <= data_in[26];
         data_out[3] <= data_in[27];
         data_out[4] <= data_in[28];//cuartos 8bits
         data_out[5] <= data_in[29];
         data_out[6] <= data_in[30];
         data_out[7] <= data_in[31];
         valid_out<=valid_in;
      end
      select<=select+2'b01;
   end
end
endmodule // c32b_8b
