module tester(
    output reg clock32,reset_L,valid,
	input clock4,clock2,clock1,
	output reg [31:0] data_in
);

	initial begin 
		$dumpfile("output.vcd");
		$dumpvars;	
		$display ("\t\tclock32,clock4,\tclock2,\tclock1\treset_L");
		$monitor($time,"\t%b\t%b\t%b\t%b\t%b",clock32,clock4,clock2,clock1,reset_L);
		
		//valores iniciales
		reset_L<=1'b0;
		valid<=1'b0;
		data_in<='d0;
		//clock4<=0;

		//-------pruebas------------------------
		repeat(32) begin
			@(posedge clock32);
			reset_L<=0;
		end
		@(posedge clock32);
		  reset_L<=1;
		repeat(1) begin
		  @(posedge clock2);
		  valid<=1'b0;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<=32'hFABACAFC;
		  valid<=1;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<=32'hF0B0C0F0;
		  valid<=1;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<=32'hFFAABBCC;
		  valid<=1;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<=32'hE1122FFE;
		  valid<=1;
		end
		repeat(1) begin
		  @(posedge clock2);
		  //data_in<=32'hDDDDDDDD;
		  data_in<=32'h0;
		  valid<=0;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<=32'hCCCCCCCC;
		  valid<=1;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<=32'h0;
		  valid<=0;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<=32'h00000003;
		  valid<=1;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<=32'h00000004;
		  valid<=1;
		end
		repeat(2) begin
		  @(posedge clock2);
		  data_in<=32'h0;
		  valid<=0;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<=32'hAAAAAAAA;
		  valid<=1;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<=32'h99999999;
		  valid<=1;
		end
		repeat(2) begin
		  @(posedge clock2);
		  data_in<=32'h0;
		  valid<=0;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<=32'h00000007;
		  valid<=1;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<=32'h00000008;
		  valid<=1;
		end
		repeat(1) begin
		  @(posedge clock2);
		  data_in<='d0;
		  valid<=0;
		end
		$finish;

		
		/*repeat(16) begin
		  @(posedge clock2);
		  input1<=~input1;
		end*/
		
	end
	initial clock32<=0;
	always #2 clock32<=~clock32;
endmodule