 module  arbitro( 
                  input clk,
                  input reset_L,

                  input [9:0] data_in0,
                  input [9:0] data_in1,
                  input [9:0] data_in2,
                  input [9:0] data_in3,

                  input empty0,
                  input empty1,
                  input empty2,
                  input empty3,
                  
                  output reg [9:0] data_out0,
                  output reg [9:0] data_out1,
                  output reg [9:0] data_out2,
                  output reg [9:0] data_out3,

                  output reg rd0,
                  output reg rd1,
                  output reg rd2,
                  output reg rd3,

                  output reg wr4,
                  output reg wr5,
                  output reg wr6,
                  output reg wr7
); 
reg [1:0] posicion;
//reg push0,push1, push2,push3,pop0, pop1,pop2,pop3;
//reg [1:0] contador,contador2,contador3,contador4,posicion;
//reg [6:0] prueba;
//reg [0:1] selector0,selector1,selector2,selector3;

   always @(posedge clk or negedge reset_L) begin
         //condicion reset negedge
         if(reset_L == 0) begin
            data_out0 <= 0;
            data_out1 <= 0;
            data_out2 <= 0;
            data_out3 <= 0;
            rd0<=0;
            rd1<=0;
            rd2<=0;
            rd3<=0;
            wr4<=0;
            wr5<=0;
            wr6<=0;
            wr7<=0;
            posicion <= 0;
         end else begin

            rd0<=0;
            rd1<=0;
            rd2<=0;
            rd3<=0;
            wr4<=0;
            wr5<=0;
            wr6<=0;
            wr7<=0;

            //primer vector fifo
            if (empty0 == 0) begin
            posicion<=data_in0[9:8];
            rd0<=~rd0;
               if(data_in0[9:8] == 0) begin
                  data_out0 <= data_in0;
                  wr4<=1;
               end else if (data_in0[9:8] == 1) begin
                  data_out1 <= data_in0;
                  wr5<=1;
               end else if (data_in0[9:8] == 2) begin
                  data_out2 <= data_in0;
                  wr6<=1;
               end else if (data_in0[9:8] == 3) begin
                  data_out3 <= data_in0;
                  wr7<=1;
               end
            end else //segundo vector fifo
            if (empty1 == 0) begin
            posicion<=data_in1 [9:8];
            rd1<=~rd1;
               if(data_in1 [9:8] == 0) begin
                  data_out0 <= data_in1;
                  wr4<=1;
               end else if (data_in1[9:8] == 1) begin
                  data_out1 <= data_in1;
                  wr5<=1;
               end else if (data_in1 [9:8] == 2) begin
                  data_out2 <= data_in1;
                  wr6<=1;
               end else if (data_in1[9:8] == 3) begin
                  data_out3 <= data_in1;
                  wr7<=1;
               end 
            end else //tercer vector fifo
            if (empty2 == 0) begin
            posicion<=data_in2 [9:8];
            rd2<=~rd2;
               if(data_in2 [9:8] == 0) begin
                  data_out0 <= data_in2;
                  wr4<=1;
               end else if (data_in2 [9:8] == 1) begin
                  data_out1 <= data_in2;
                  wr5<=1;
               end else if (data_in2 [9:8] == 2) begin
                  data_out2 <= data_in2;
                  wr6<=1;
               end else if (data_in2 [9:8] == 3)begin
                  data_out3 <= data_in2;
                  wr7<=1;
               end
            end else//cuarto vector fifo
            if (empty3 == 0) begin
            posicion<=data_in3 [9:8];
            rd3<=~rd3;
               if(data_in3 [9:8] == 0) begin
                  data_out0 <= data_in3;
                  wr4<=1;
               end else if (data_in3 [9:8] == 1)begin
                  data_out1 <= data_in3;
                  wr5<=1;
               end else if (data_in3 [9:8] == 2)begin
                  data_out2 <= data_in3;
                  wr6<=1;
               end else if (data_in3 [9:8] == 3)begin
                  data_out3 <= data_in3;
                  wr7<=1;
               end
         end
         /*if(empty0) begin
            rd0<=0;
            wr4<=0; 
         end
         if(empty1) begin
            rd1<=0;
            wr5<=0;
         end
         if(empty2) begin
            rd2<=0;
            wr6<=0;
         end
         if(empty3) begin
            rd3<=0;
            wr7<=0;
         end*/
         //fin de los ifs
      end //fin del reset
   end //fin del always
endmodule
