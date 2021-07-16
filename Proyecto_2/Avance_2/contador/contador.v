module contador (
	input wire clk,
	input wire reset,
	input wire [9:0] data_in,
	output reg [2:0] count
);

	always @(posedge clk)
	begin
			if (reset)
				count <= 3'b0;
			if (data_in)
				count <= count + 1;

	end

endmodule
