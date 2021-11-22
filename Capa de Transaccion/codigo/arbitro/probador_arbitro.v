 module     probador_arbitro( 
 // 4. Parameter definitions  
 //outputs
 output reg clk,
 output reg [7:0] data_in0,
 output reg [7:0] data_in1,
 output reg [7:0] data_in2,
 output reg [7:0] data_in3,
 output reg reset_L,
 output reg [3:0] dest_in0,
 output reg [3:0] dest_in1,
 output reg [3:0] dest_in2,
 output reg [3:0] dest_in3,
 //inputs
 input [3:0] dest_out0,
 input [3:0] dest_out1,
 input [3:0] dest_out2,
 input [3:0] dest_out3,
/* output reg push0,
 output reg push1,
 output reg push2,
 output reg push3,
 output reg pop0,
 output reg pop1,
 output reg pop2,
 output reg pop3,
 */
 input [7:0] data_out0,
 input [7:0] data_out1,
 input [7:0] data_out2,
 input [7:0] data_out3,  
 input empty0,
 input empty1,
 input empty2,
 input empty3,
 //estructural
 input [3:0] dest_out0E,
 input [3:0] dest_out1E,
 input [3:0] dest_out2E,
 input [3:0] dest_out3E,
/* output reg push0,
 output reg push1,
 output reg push2,
 output reg push3,
 output reg pop0,
 output reg pop1,
 output reg pop2,
 output reg pop3,
 */
 input [7:0] data_out0E,
 input [7:0] data_out1E,
 input [7:0] data_out2E,
 input [7:0] data_out3E,  
 input empty0E,
 input empty1E,
 input empty2E,
 input empty3E
 );
   
 initial  
      begin 
           $dumpfile("test.vcd");
           $dumpvars;
           $display ("\tclk,\treset,\tdatain0,\tdatain1,\tdatain2,\tdatain3,\tdataout0,\tdataout1,\tdataout2,\tdataout3,\tdes0,\tdes1,\tdes2,\tdes3 ");
		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		   $monitor($time,"\t%b\t%b\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", clk, reset_L, data_in0, data_in1, data_in2, data_in3, dest_in0, dest_in1,dest_in2, dest_in3);
		
        //Initial Conditions 

        reset_L  <= 1'b0;
        data_in0 <= 8'b0;
        data_in1 <= 8'b0;
        data_in2 <= 8'b0;
        data_in3 <= 8'b0;
        dest_in0 <= 4'b0;
        dest_in1 <= 4'b0;
        dest_in2 <= 4'b0;
        dest_in3 <= 4'b0;

//condiciones con el reloj
//vector 0
             reset_L <= 1'b0;
            @(posedge clk) data_in0 <= 0;
            @(posedge clk) dest_in0 <= 0;
            //reset_L <= 1'b0;
            reset_L <= 1'b1;
            @(posedge clk) data_in0 <= 10;
            @(posedge clk) dest_in0 <= 1;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
            @(posedge clk) data_in0 <= 20;
            @(posedge clk) dest_in0 <= 2;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
            @(posedge clk) data_in0 <= 30;
            @(posedge clk) dest_in0 <= 3;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
        //vector 1
            @(posedge clk) data_in1 <= 0;
            @(posedge clk) dest_in1 <= 0;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
            @(posedge clk) data_in1 <= 10;
            @(posedge clk) dest_in1 <= 1;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
            @(posedge clk) data_in1 <= 20;
            @(posedge clk) dest_in1 <= 2;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
            @(posedge clk) data_in1 <= 30;
            @(posedge clk) dest_in1 <= 3;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
        //vector 2
            @(posedge clk) data_in2 <= 0;
            @(posedge clk) dest_in2 <= 0;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
            @(posedge clk) data_in2 <= 10;
            @(posedge clk) dest_in2 <= 1;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
            @(posedge clk) data_in2 <= 20;
            @(posedge clk) dest_in2 <= 2;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
            @(posedge clk) data_in2 <= 30;
            @(posedge clk) dest_in2 <= 3;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
        //vector 3
            @(posedge clk) data_in3 <= 0;
            @(posedge clk) dest_in3 <= 0;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
            @(posedge clk) data_in3 <= 10;
            @(posedge clk) dest_in3 <= 1;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
            @(posedge clk) data_in3 <= 20;
            @(posedge clk) dest_in3 <= 2;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
            @(posedge clk) data_in3 <= 30;
            @(posedge clk) dest_in3 <= 3;
            //reset_L <= 1'b0;
            //reset_L <= 1'b1;
        $finish;
        end  //initial
        
 //Reloj
 initial clk <= 0;
 always #2 clk <= ~clk;         
 endmodule