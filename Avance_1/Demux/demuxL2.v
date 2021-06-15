module demuxL2 (
		input 		 bclk,
		input 		 cclk,
		input 		 valid,
		input [7:0] 	 data_in,
		output reg 	 valid_out0,
		output reg 	 valid_out1,
		output reg [7:0] data_out0,
		output reg [7:0] data_out1
		);

   reg [7:0] 			 data_ant;
   reg 				 valid_ant;

   always @ (posedge cclk) begin
      data_ant <= data_in;
      valid_ant <= valid;
   end

   always @ (posedge bclk) begin

      // Logica para data_out1
      if (valid == 1) begin
	 data_out1 = data_in;
	 valid_out1 = valid;
      end
      else begin
	 data_out1 = 8'h00;
	 valid_out1 = valid;
      end

      // Logica para data_out0
      if (valid_ant == 1) begin
	 data_out0 = data_ant;
	 valid_out0 = valid_ant;
      end
      else begin
	 data_out0 = 8'h00;
	 valid_out0 = valid_ant;
      end
   end // always @ (posedge 2clk)

endmodule // demuxL2
