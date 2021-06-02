module converter_bits (
		input 		 cclk,
		input 		 dclk,
		input [7:0] 	 data_in,		
		output reg data_out
		);


	//valid_out0 = 0;

	reg [2:0] cnt;


   always @ (posedge cclk) begin


		cnt = 3'b111;

   end
	

   always @ (posedge dclk) begin


   	data_out <= data_in[cnt];

   	cnt <= cnt - 1;




   end // always @ (posedge dclk)

endmodule // 8_to_1_bits
