`timescale 	1ns / 100ps // Se define la escala de tiempo de simulacion

`include "probador.v"
`include "main.v"
// conductual y del probador

module BancoPruebas;
   wire cclk, dclk, valid, data_out;
   wire [7:0] data_in, data_between;

   probador probador (
		      .cclk (cclk),
		      .dclk (dclk),
		      .valid (valid),
		      .data_in (data_in)
	);

	main main (
				.cclk (cclk),
				.dclk	(dclk),
				.valid (valid),
				.data_in (data_in),
				.data_between (data_between),
				.data_out (data_out)
	);




   
endmodule // BancoPruebas
