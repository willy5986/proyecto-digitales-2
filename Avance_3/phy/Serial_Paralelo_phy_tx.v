module Serial_Paralelo_phy_tx_cond (	input clk_32f,
					input 		 data_in,
					input 		 default_values,
					output reg 	 active,
					output reg 	 idle_out,
					output reg [7:0] data_out
					);
   
   reg [7:0] 						 buffer;
   reg 							 BC_flag;
   integer 						 BC_counter;
   integer 						 data_bits_counter;
   
   always @ (posedge clk_32f) begin
      if (default_values == 1) begin
	 data_bits_counter <= 0;
	 BC_counter <= 0;
	 BC_flag <= 0;
	 buffer <= 0;
	 active <= 0;
	 data_out <= 0;
      end
      else begin
	 buffer <= buffer << 1;
	 buffer[0] <= data_in;
	 if (BC_flag == 0) begin
	    if (buffer == 8'hBC) begin
	       BC_counter <= BC_counter + 1;
	       data_out <= buffer;
	       BC_flag <= 1;
	    end
	 end
	 else begin
	    data_bits_counter <= data_bits_counter + 1;
	    if (buffer == 8'hBC) begin
	       data_bits_counter <= 0;
	       BC_counter <= BC_counter + 1;
	       data_out <= buffer;
	       if (BC_counter >= 3) begin
		  active <= 1;
	       end
	    end
	    else if (data_bits_counter == 7) begin
	       data_bits_counter <= 0;
	       data_out <= buffer;

	    end
	 end // else: !if(BC_flag == 0)
      end // else: !if(default_values == 1)

      if (active & data_out != 8'hBC) begin
	 idle_out <= 1;
      end
      
      else
	idle_out <= 0;
      
   end // always @ (posedge clk_32f)
   
endmodule // Serial_Paralelo_phy_rx
