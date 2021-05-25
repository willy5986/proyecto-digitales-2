`timescale 	1ns / 100ps // Se define la escala de tiempo de simulacion

`include "probador.v"
`include "demuxL2.v"
`include "demuxL1.v" // Ahora se incluyen los archivos de la descripcion 
// conductual y del probador

module BancoPruebas;
   wire aclk, bclk, cclk, valid, valid_out0, valid_out1, valid_out_out0, valid_out_out1, valid_out_out2, valid_out_out3;
   wire [7:0] data_in, data_out0, data_out1, data_out_out0, data_out_out1, data_out_out2, data_out_out3;

   probador probador (
		      .aclk (aclk),
		      .bclk (bclk),
		      .cclk (cclk),
		      .valid (valid),
		      .data_in (data_in));
   
   demuxL2 demuxL2 (
		    .bclk (bclk),
		    .cclk (cclk),
		    .valid (valid),
		    .data_in (data_in),
		    .valid_out0 (valid_out0),
		    .valid_out1 (valid_out1),
		    .data_out0 (data_out0),
		    .data_out1 (data_out1));
   
   demuxL1 demuxL1 (
		    .aclk (aclk),
		    .bclk (bclk),
		    .valid0 (valid_out0),
		    .valid1 (valid_out1),
		    .data_in0 (data_out0),
		    .data_in1 (data_out1),
		    .valid_out0 (valid_out_out0),
		    .valid_out1 (valid_out_out1),
		    .valid_out2 (valid_out_out2),
		    .valid_out3 (valid_out_out3),
		    .data_out0 (data_out_out0),
		    .data_out1 (data_out_out1),
		    .data_out2 (data_out_out2),
		    .data_out3 (data_out_out3));
   
endmodule // BancoPruebas
