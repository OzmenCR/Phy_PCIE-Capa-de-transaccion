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
                 
                  

); 
 reg push0,push1, push2,push3,pop0, pop1,pop2,pop3;
reg [1:0] contador,contador2,contador3,contador4;
reg [6:0] prueba;
//reg [0:1] selector0,selector1,selector2,selector3;

   always @(posedge clk /*or negedge reset_L*/) begin
         if(reset_L == 0) begin
            data_out0 <= 8'b0;
            data_out1 <= 8'b0;
            data_out2 <= 8'b0;
            data_out3 <= 8'b0;
            dest_out0 <= 4'b0;
            dest_out1 <= 4'b0;
            dest_out2 <= 4'b0;
            dest_out3 <= 4'b0;
            pop0 <= 0;
            pop1 <= 0;
            pop2 <= 0;
            pop3 <= 0;
            push0 <=0;
            push1 <=0;
            push2 <=0;
            push3 <=0;
               //los emptys van en uno porque implica que esta vacios desde el inicio
            empty0 <= 1'b1;
            empty1 <= 1'b1;
            empty2 <= 1'b1;
            empty3 <= 1'b1;
            contador <= 0;
            contador2 <= 0;
            contador3<= 0;
            contador4 <= 0;
            prueba <=0;
         end else begin
         //selector <= ~selector;
         //primer vector fifo
         if (contador == 0) begin
         prueba <=1;
            if(dest_in0 == 0) begin
               data_out0 <= data_in0;
               empty0 <= 1'b1;
               dest_out0 <= dest_in0;
               prueba <=2;
               push0 <=1;
               pop0 <= 1;
            end else if (dest_in0 == 1) begin
               data_out1 <= data_in0;
               empty0 <= 1'b1;
               dest_out0 <= dest_in0;
               prueba <=3;
                push0 <=1;
                 pop0 <= 1;
            end else if (dest_in0 == 2) begin
               data_out2 <= data_in0;
               empty0 <= 1'b1;
               dest_out0 <= dest_in0;
               prueba <=4;
                push0 <=1;
                 pop0 <= 1;
            end else if (dest_in0 == 3) begin
               data_out3 <= data_in0;
               empty0 <= 1'b1;
               dest_out0 <= dest_in0;
               //dest_out0 <= 0;
               prueba <=5;
                push0 <=0;
                 pop0 <= 0;
               contador2<= 0;
               contador <= 1;
               empty0 <= 0;
            end 
            
           // prueba <=6;
         end else 
         if (contador2 == 0) begin
         prueba <=7;
            //segundo vector fifo
            if(dest_in1 == 0) begin
               data_out0 <= data_in1;
               empty1 <= 1'b1;
               dest_out1 <= dest_in1;
               prueba <=8;
                pop1 <= 1;
               push1 <=1;
            end else if (dest_in1 == 1) begin
               data_out1 <= data_in1;
               empty1 <= 1'b1;
               dest_out1 <= dest_in1;
               prueba <=9;
                pop1 <= 1;
               push1 <=1;
            end else if (dest_in1 == 2) begin
               data_out2 <= data_in1;
               empty1 <= 1'b1;
               dest_out1 <= dest_in1;
               prueba <=10;
               push1 <=1;
                pop1 <= 1;
            end else if (dest_in1 == 3) begin
               data_out3 <= data_in1;
               empty1 <= 1'b1;
               dest_out1 <= dest_in1;
             //  dest_out1 <= 0;
               prueba <=12;
               contador3<= 0;
               contador2 <= 1;
               empty1 <= 0;
               push1 <=0;
                pop1 <= 0;
            end 
         
        // prueba <=13;
         end else
         if (contador3 == 0) begin
         //tercer vector fifo
         prueba <=14;
            if(dest_in2 == 0) begin
               data_out0 <= data_in2;
               empty2 <= 1'b1;
               dest_out2 <= dest_in2;
               prueba <=15;
               pop2 <= 1;
               push2 <=1;
            end else if (dest_in2 == 1) begin
               data_out1 <= data_in2;
               empty2 <= 1'b1;
               dest_out2 <= dest_in2;
               prueba <=16;
               push2 <=1;
               pop2 <= 1;
            end else if (dest_in2 == 2) begin
               data_out2 <= data_in1;
               empty2 <= 1'b1;
               dest_out2 <= dest_in2;
               prueba <=17;
               push2 <=1;
               pop2 <= 1;
            end else if (dest_in2 == 3)begin
               data_out3 <= data_in1;
               empty2 <= 1'b1;
               push2 <=0;
               pop2 <= 0;
               dest_out2 <= dest_in2;
               //dest_out2 <= 0;
               prueba <=18;
               contador4<= 0;
               contador3 <= 1;
               empty2 <= 0;
            end
         
         end else
         if (contador4 == 0) begin
         prueba <=19;
            //cuarto vector fifo
            if(dest_in3 == 0) begin
               data_out0 <= data_in3;
               empty3 <= 1'b1;
               dest_out3 <= dest_in3;
               prueba <=20;
               pop3 <= 1;
               push3 <=1;
            end else if (dest_in3 == 1)begin
               data_out1 <= data_in3;
               empty3 <= 1'b1;
               dest_out3 <= dest_in3;
               prueba <=21;
                pop3 <= 1;
               push3 <=1;
            end else if (dest_in3 == 2)begin
               data_out2 <= data_in3;
               empty3 <= 1'b1;
               dest_out3 <= dest_in3;
               prueba <=22;
               push3 <=1;
                pop3 <= 1;
            end else if (dest_in3 == 3)begin
               data_out3 <= data_in3;
               empty3 <= 1'b1;
               
               //dest_out3 <= 0;
               prueba <=23;
               pop3 <= 0;
               push3 <=0;
               contador<= 0;
               contador2<= 0;
               contador3<= 0;
               contador4<= 0;
            dest_out3 <= dest_in3;
               empty3 <= 0;
            end 
            
            //contador <= 0;
          //  prueba <=24;
         end
        
         //los emptys van en cero porque implica que estan llenos loa vectors de salida con los cuatro datos de 8 bits
      end //fin del reset
   end //fin del always
endmodule
