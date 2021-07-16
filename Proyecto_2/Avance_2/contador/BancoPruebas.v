`timescale 	1ns / 100ps // Se define la escala de tiempo de simulacion

`include "probador.v"
`include "contador.v"
`include "contador_estructural.v"

module BancoPruebas;

   	wire clk, rst;
   	wire [9:0] data_in;
   	wire [2:0] count, count_estructural;

   	probador u0 (
		.clk (clk),
		.rst (rst),
		.data_in (data_in)
		);

	contador c0 (
		.clk (clk),
		.reset (rst),
		.data_in (data_in),
		.count (count)
		);

	contador_estructural c0_estructural (
		.clk (clk),
		.reset (rst),
		.data_in (data_in),
		.count (count_estructural)
		);		


endmodule