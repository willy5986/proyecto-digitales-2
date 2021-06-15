`timescale 	1ns / 100ps // Se define la escala de tiempo de simulacion

`include "probador.v"
`include "main.v"
`include "main_estructural.v"
//`include "cmos_cells.v"
// conductual y del probador

module BancoPruebas;
   wire cclk, dclk, valid, data_out, data_out_estru;
   wire [7:0] data_in, data_between, data_between_estru;

   probador probador (
		      .cclk (cclk),
		      .dclk (dclk),
		      .valid (valid),
		      .default_values (default_values),
		      .data_in (data_in)
	);

	main main (
				.cclk (cclk),
				.dclk	(dclk),
				.valid (valid),
				.data_in (data_in),
				.default_values (default_values),
				.data_between (data_between),
				.data_out (data_out)
	);


	main_estructural main_estructural (
				.cclk (cclk),
				.dclk	(dclk),
				.valid (valid),
				.data_in (data_in),
				.default_values (default_values),
				.data_between (data_between_estru),
				.data_out (data_out_estru)
	);




   
endmodule // BancoPruebas
