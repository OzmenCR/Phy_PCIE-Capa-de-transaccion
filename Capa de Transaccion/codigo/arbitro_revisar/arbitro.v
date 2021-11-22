 module  arbitro( 
                  input clk,
                  input [7:0] data_in0,
                  input [7:0] data_in1,
                  input [7:0] data_in2,
                  input [7:0] data_in3,
                  input reset_L,
                  input [3:0] dest_in0,
                  input [3:0] dest_in1,
                  input [3:0] dest_in2,
                  input [3:0] dest_in3,
                  output reg [3:0] dest_out0,
                  output reg [3:0] dest_out1,
                  output reg [3:0] dest_out2,
                  output reg [3:0] dest_out3,
                  output reg [7:0] data_out0,
                  output reg [7:0] data_out1,
                  output reg [7:0] data_out2,
                  output reg [7:0] data_out3,  
                  output reg empty0,
                  output reg empty1,
                  output reg empty2,
                  output reg empty3
                  /* output reg push0,
                  output reg push1,
                  output reg push2,
                  output reg push3,
                  output reg pop0,
                  output reg pop1,
                  output reg pop2,
                  output reg pop3,
                  */

); 

reg [1:0] contador;
//reg [0:1] selector0,selector1,selector2,selector3;

   always @(posedge clk or negedge reset_L) begin
         if(reset_L == 0) begin
            data_out0 <= 8'b0;
            data_out1 <= 8'b0;
            data_out2 <= 8'b0;
            data_out3 <= 8'b0;
            dest_out0 <= 4'b0;
            dest_out1 <= 4'b0;
            dest_out2 <= 4'b0;
            dest_out3 <= 4'b0;
               //los emptys van en uno porque implica que esta vacios desde el inicio
            empty0 <= 1'b1;
            empty1 <= 1'b1;
            empty2 <= 1'b1;
            empty3 <= 1'b1;
            contador <= 0;
         end else begin
         //selector <= ~selector;
         //primer vector fifo
         if (contador == 0) begin
            if(dest_in0 == 0) begin
               data_out0 <= data_in0;
               empty0 <= 1'b1;
               dest_out0 <= dest_in0;
            end else if (dest_in0 == 1) begin
               data_out1 <= data_in0;
               empty0 <= 1'b1;
               dest_out0 <= dest_in0;
            end else if (dest_in0 == 2) begin
               data_out2 <= data_in0;
               empty0 <= 1'b1;
               dest_out0 <= dest_in0;
            end else if (dest_in0 == 3) begin
               data_out3 <= data_in0;
               empty0 <= 1'b1;
               dest_out0 <= dest_in0;
               //contador <= 2'b01;
            end 
            contador <=contador+1;
         end else 
         if (contador == 1) begin
            //segundo vector fifo
            if(dest_in1 == 0) begin
               data_out0 <= data_in1;
               empty1 <= 1'b1;
               dest_out1 <= dest_in1;
            end else if (dest_in1 == 1) begin
               data_out1 <= data_in1;
               empty1 <= 1'b1;
               dest_out1 <= dest_in1;
            end else if (dest_in1 == 2) begin
               data_out2 <= data_in1;
               empty1 <= 1'b1;
               dest_out1 <= dest_in1;
            end else if (dest_in1 == 3) begin
               data_out3 <= data_in1;
               empty1 <= 1'b1;
               dest_out1 <= dest_in1;
            end 
         contador <=contador+1;
         end else
         if (contador == 2) begin
         //tercer vector fifo
            if(dest_in2 == 0) begin
               data_out0 <= data_in2;
               empty2 <= 1'b1;
               dest_out2 <= dest_in2;
            end else if (dest_in2 == 1) begin
               data_out1 <= data_in2;
               empty2 <= 1'b1;
               dest_out2 <= dest_in2;
            end else if (dest_in1 == 2) begin
               data_out2 <= data_in1;
               empty2 <= 1'b1;
               dest_out2 <= dest_in2;
            end else if (dest_in1 == 3)begin
               data_out3 <= data_in1;
               empty2 <= 1'b1;
               dest_out2 <= dest_in2;
            end
         contador <=contador+1;
         end else
         if (contador == 3) begin
            //cuarto vector fifo
            if(dest_in3 == 0) begin
               data_out0 <= data_in3;
               empty3 <= 1'b1;
               dest_out3 <= dest_in3;
            end else if (dest_in3 == 1)begin
               data_out1 <= data_in3;
               empty3 <= 1'b1;
               dest_out3 <= dest_in3;
            end else if (dest_in3 == 2)begin
               data_out2 <= data_in3;
               empty3 <= 1'b1;
               dest_out3 <= dest_in3;
            end else if (dest_in3 == 3)begin
               data_out3 <= data_in3;
               empty3 <= 1'b1;
               dest_out3 <= dest_in3;
            end 
            empty0 <= 0;
            empty1 <= 0;
            empty2 <= 0;
            empty3 <= 0;
            contador <= contador+1;
         end
         //los emptys van en cero porque implica que estan llenos loa vectors de salida con los cuatro datos de 8 bits
      end //fin del reset
   end //fin del always
endmodule
