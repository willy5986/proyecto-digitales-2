module com_valid_cond (
		       input 		cclk,
		       input 		dclk,
		       input 		valid,
		       input 		default_values,
		       input [7:0] 	data_in, 
		       output reg [7:0] data_out
		       );


   //valid_out0 = 0;


   always @ (posedge cclk) begin

      if (default_values==1) begin
   	 data_out <= 0;
      end
      else begin

	 if (!valid) begin
	    data_out <= 8'hBC;


	 end

	 else begin
	    data_out <= data_in;
	 end

      end

   end

endmodule // 8_to_1_bits
