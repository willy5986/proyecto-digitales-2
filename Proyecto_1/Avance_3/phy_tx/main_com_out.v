`include "converter_bits.v"
`include "com_valid.v"
// conductual y del probador

module main_com_out(
	input					cclk,
	input					dclk,
	input					valid,
	input					default_values,
	input [7:0] 			data_in,
	output [7:0]			data_between,
	output 					data_out,
	output [2:0]			cnt
	);


	com_valid com_valid (
				.cclk (cclk),
				.dclk	(dclk),
				.valid (valid),
				.data_in (data_in),
				.data_out (data_between),
				.default_values (default_values)
	);


   converter_bits converter_bits (
		    .cclk (cclk),
		    .dclk (dclk),
		    .data_in (data_between),
		    .data_out (data_out),
		    .default_values (default_values),
		    .cnt (cnt)
	);



   
endmodule // BancoPruebas
