module muxL (
		input 		 aclk,
		input 		 bclk,
		input 		 valid0,
		input 		 valid1,
		input [7:0] 	 data_in0,
		input [7:0] 	 data_in1,		
		output reg 	 valid_out0,
		output reg [7:0] data_out0
		);


	//valid_out0 = 0;

   always @ (posedge bclk) begin


      if (aclk) begin
      	if (valid0) begin
      		data_out0 = data_in0;

      	end


      	valid_out0 = valid0;
      end

      else begin

      	if (valid1) begin
      		data_out0 = data_in1;
      	end


      	valid_out0 = valid1;

      end




   end // always @ (posedge 2clk)

endmodule // muxL2
