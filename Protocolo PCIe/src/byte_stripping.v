module byte_stripping(
          input [31:0] data_in,
          input valid,reset_L,clock1,clock2,clock4,
          output reg [31:0] lane_0,lane_1,
	       output reg valid0,valid1
          );
   reg selector;
   
   always @(posedge clock2 or negedge reset_L) begin
      if(reset_L==0) begin
      lane_0 <= 'h0000000;
      lane_1 <= 'h0000000;
      valid0 <= 1'b0;
      valid1 <= 1'b0;
      selector <= 0;
      end else begin
         if (selector==1)  begin
            lane_1 <= lane_1;
            lane_0 <= data_in;
            valid0 <= valid;
         end else begin
            lane_0 <= lane_0;
            lane_1 <= data_in;
            valid1 <= valid;
         end
         selector <= ~selector;
      end
   end
endmodule   
