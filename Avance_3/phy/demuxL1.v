module demuxL1_cond (
		     input 	      aclk,
		     input 	      bclk,
		     input 	      valid0,
		     input 	      valid1,
		     input [7:0]      data_in0,
		     input [7:0]      data_in1,
		     output reg       valid_out0,
		     output reg       valid_out1,
		     output reg       valid_out2,
		     output reg       valid_out3,
		     output reg [7:0] data_out0,
		     output reg [7:0] data_out1,
		     output reg [7:0] data_out2,
		     output reg [7:0] data_out3
		     );

   reg [7:0] 			 data_ant0, data_ant1;
   reg 				 valid_ant0, valid_ant1;

   always @ (negedge bclk) begin
      data_ant0 <= data_in0;
      valid_ant0 <= valid0;

      data_ant1 <= data_in1;
      valid_ant1 <= valid1;
   end

   // Salidas 0 y 1
   always @ (negedge aclk) begin

      // Logica para data_out1
      if (valid0 == 1) begin
	 data_out1 = data_in0;
	 valid_out1 = valid0;
      end
      else begin
	 data_out1 = 8'h00;
	 valid_out1 = valid0;
      end

      // Logica para data_out0
      if (valid_ant0 == 1) begin
	 data_out0 = data_ant0;
	 valid_out0 = valid_ant0;
      end
      else begin
	 data_out0 = 8'h00;
	 valid_out0 = valid_ant0;
      end
   end // always @ (posedge aclk)

   // Salidas 2 y 3
   always @ (negedge aclk) begin

      // Logica para data_out3
      if (valid1 == 1) begin
	 data_out3 = data_in1;
	 valid_out3 = valid1;
      end
      else begin
	 data_out3 = 8'h00;
	 valid_out3 = valid1;
      end

      // Logica para data_out2
      if (valid_ant1 == 1) begin
	 data_out2 = data_ant1;
	 valid_out2 = valid_ant1;
      end
      else begin
	 data_out2 = 8'h00;
	 valid_out2 = valid_ant1;
      end
   end // always @ (posedge aclk)

endmodule // demuxL1
