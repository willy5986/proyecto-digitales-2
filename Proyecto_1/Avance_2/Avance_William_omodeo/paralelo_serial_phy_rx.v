module paralelo_serial_phy_rx (
	output reg[7:0] data_out,
	input clk_4f,
	input clk_32f,
	input active
	);
	reg[7:0] com;
	reg[7:0] idl;
	always @ (*) begin 

		if(active == 1) begin 
			data_out = 8'b01111100; 
		end
		else begin
			data_out = 8'b10111100;
		end
	end 

endmodule
