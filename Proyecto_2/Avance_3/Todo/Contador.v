module contador_cond (
		      input 	       clk,
		      input 	       rst,
		      input [3:0]      Estado,
		      input [9:0]      data_in_0,
		      input [9:0]      data_in_1,
		      input [9:0]      data_in_2,
		      input [9:0]      data_in_3,
		      output reg [4:0] total_0,
		      output reg [4:0] total_1,
		      output reg [4:0] total_2,
		      output reg [4:0] total_3
		      );

   reg [4:0] 		      count_0, count_1, count_2, count_3;

   always @(posedge clk) begin
      if (rst) begin
	 count_0 <= -1;
	 count_1 <= -1;
	 count_2 <= -1;
	 count_3 <= -1;
      end
   end
   
   always @(data_in_0)
     count_0 = count_0 + 1;

   always @(data_in_1)
     count_1 = count_1 + 1;

   always @(data_in_2)
     count_2 = count_2 + 1;

   always @(data_in_3)
     count_3 = count_3 + 1;

   always @(posedge clk) begin
      if (Estado == 4) begin
	 total_0 <= count_0;
	 total_1 <= count_1;
	 total_2 <= count_2;
	 total_3 <= count_3;
      end

      else begin
	 total_0 <= 0;
	 total_1 <= 0;
	 total_2 <= 0;
	 total_3 <= 0;
      end // else: !if(IDLE)
   end // always @ (posedge clk)

endmodule // contador
