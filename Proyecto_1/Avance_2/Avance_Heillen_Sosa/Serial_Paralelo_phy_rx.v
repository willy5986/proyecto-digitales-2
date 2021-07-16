module Serial_Paralelo_phy_rx (	input clk_32f,
				input data_in,
				input default_values,
				output reg active,
				output reg valid,
				output reg [7:0] data_out
				);
				
	reg [7:0] buffer;
	reg BC_flag;
	integer BC_counter;
	integer data_bits_counter;
	
	//default values
	//data_bits_counter <= 0;
	//BC_counter <= 0;
	//BC_flag <= 0;
	//buffer <= 0;
	
	always @ (posedge clk_32f) begin
		if (default_values == 1) begin
			data_bits_counter <= 0;
			BC_counter <= 0;
			BC_flag <= 0;
			buffer <= 0;
			active <= 0;
			valid <= 0;
			data_out <= 0;
		end
		else begin
			buffer <= buffer << 1;
			buffer[0] <= data_in;
			if (BC_flag == 0) begin
				if (buffer == 8'hBC) begin
					valid <= 0;
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
						valid <= 1;
					//end
				end
			end
		end
	end
	
endmodule
