`include "8_to_1_bits.v"
`include "com.v"
// conductual y del probador

module main(
	input					cclk,
	input					dclk,
	input					valid,
	input [7:0] 		data_in,
	output [7:0]		data_between,
	output				data_out
	);


	com_valid com_valid (
				.cclk (cclk),
				.dclk	(dclk),
				.valid (valid),
				.data_in (data_in),
				.data_out (data_between)
	);

   converter_bits converter_bits (
		    .cclk (cclk),
		    .dclk (dclk),
		    .data_in (data_between),
		    .data_out (data_out)
	);



   
endmodule // BancoPruebas
