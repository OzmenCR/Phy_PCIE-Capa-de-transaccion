module paralelo_serie(
         input [7:0]    data_in,
         output reg [7:0] data2sent,
	      output reg     data_out,
         output reg [15:0] counterBC,
	      input 	      valid,clock32,clock4,reset_L
         );
   reg [2:0] select;
   always @(posedge clock32 or negedge reset_L) begin
      if(reset_L==0) begin
         counterBC<=0;
         data2sent<=8'b0;
         select<=0;
         data_out<=0;
      end else begin
         if(valid==0) begin
            data2sent<='hBC;
            case(select)
               3'b000: begin
               data_out<=1;
               end
               3'b001: begin
               data_out<=0;
               end
               3'b010: begin
               data_out<=1;
               end
               3'b011: begin
               data_out<=1;
               end
               3'b100: begin
               data_out<=1;
               end
               3'b101: begin
               data_out<=1;
               end
               3'b110: begin
               data_out<=0;
               end
               3'b111: begin
               data_out<=0;
               end
               default: begin
               counterBC<=0;
               data_out<=0;
               end
               default: begin
               select<=0;
               end
            endcase
            select<=select+1'b1;
            if(select==7) begin
               counterBC<=counterBC+1;
            end
         end else begin
            data2sent<=data_in;
            case(select)
               3'b000: begin
               data_out<=data_in[7];
               end
               3'b001: begin
               data_out<=data_in[6];
               end
               3'b010: begin
               data_out<=data_in[5];
               end
               3'b011: begin
               data_out<=data_in[4];
               end
               3'b100: begin
               data_out<=data_in[3];
               end
               3'b101: begin
               data_out<=data_in[2];
               end
               3'b110: begin
               data_out<=data_in[1];
               end
               3'b111: begin
               data_out<=data_in[0];
               end
               default: begin
               counterBC<=0;
               data_out<=0;
               //data_in<=8'b0;
               end
            endcase
            select<=select+1'b1;
         end
      end   
   end 

endmodule