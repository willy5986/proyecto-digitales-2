module converter_bits (
		input	 		cclk,
		input	 		dclk,
		input			default_values,
		input [7:0] 	data_in,		
		output reg data_out
		);


	//valid_out0 = 0;

	reg [2:0] cnt;


   	always @ (posedge dclk) begin

   		if (default_values==1) begin
   			cnt <= 3'b111;
   			data_out <= 0;
   		end


   		else begin

	   		if(cnt ==0) begin
	   			cnt <= 3'b111;
	   		end
	   		data_out <= data_in[cnt];

	   		cnt <= cnt - 1;
	   	end



   	end // always @ (posedge dclk)

endmodule // 8_to_1_bits
