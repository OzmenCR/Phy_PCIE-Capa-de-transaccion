module un_byte_striping(
         output reg [31:0]      data_out,  
         input             reset_L,     
         input [31:0] lane_0,
         input [31:0] lane_1,
	      input	       valid_0,
         input	       valid_1,
         output reg	       valid_out,
	      input 	          clk_2f,
         input 	          clk_f);
reg selector;
/*always @(negedge reset_L) begin
if (reset_L == 0) begin
      valid_out <= 1'b0;
      selector <= 0;
      data_out <= 0;
   end 
end*/
always @(posedge clk_2f) begin
   if (valid_0 == 0) begin
      valid_out <= 1'b0;
      selector <= 0;
      data_out <= 0;
   end 
   else begin
      selector <= ~selector;
      valid_out <= ~valid_out;
      if (selector == 0) begin
         data_out <= lane_0;
         valid_out<=valid_0;
      end else begin
         data_out <= lane_1;
         valid_out<=valid_1;
      end
   end
end
endmodule   
