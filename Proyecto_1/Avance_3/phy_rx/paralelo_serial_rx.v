module paralelo_serial_rx (
		input 		 	clk_32f,
		input		 	active,
		input			default_values,
		output reg [7:0] 	data_out
		);


	//valid_out0 = 0;


   always @ (posedge clk_32f) begin

   		if (default_values==1) begin
   			data_out <= 0;
   		end
   		else begin

			if (active == 0) begin
				data_out <= 8'hBC;


			end

			else begin
				data_out <= 8'h7C;
			end

		end

   end
	




endmodule // 8_to_1_bits
