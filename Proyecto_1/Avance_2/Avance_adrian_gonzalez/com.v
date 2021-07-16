module com_valid (
		input 		 		cclk,
		input 		 		dclk,
		input		 		valid,
		input [7:0]			data_in,		
		output reg [7:0] 	data_out
		);


	//valid_out0 = 0;


   always @ (posedge cclk) begin


		if (!valid) begin
			data_out = 8'hBC;


		end

		else begin
			data_out = data_in;
		end

   end
	




endmodule // 8_to_1_bits
