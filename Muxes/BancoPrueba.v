`timescale 	1ns / 100ps // Se define la escala de tiempo de simulacion

`include "probador.v"
`include "muxL2.v" // Ahora se incluyen los archivos de la descripcion 
// conductual y del probador
`include "muxL2_estructural.v"

module BancoPruebas;
   wire aclk, bclk, cclk, valid0, valid1, valid2, valid3, valid_out0, valid_out1,valid_out2,valid_out3, valid_out_l2;
   wire [7:0] data_in0, data_in1, data_in2, data_in3, data_out0, data_out1, data_out2, data_out3, data_out_l2;

   probador probador (
		      .aclk (aclk),
		      .bclk (bclk),
		      .cclk (cclk),
		      .valid0 (valid0),
		      .valid1 (valid1),
		      .valid2 (valid2),
		      .valid3 (valid3),
		      .data_in0 (data_in0),
		      .data_in1 (data_in1),
		      .data_in2 (data_in2),
		      .data_in3 (data_in3));

   muxL muxL1_1 (
		    .aclk (aclk),
		    .bclk (bclk),
		    .valid0 (valid0),
		    .valid1 (valid1),
		    .data_in0 (data_in0),
		    .data_in1 (data_in1),
		    .valid_out0 (valid_out0),
		    .data_out0 (data_out0));
   
   muxL muxL2 (
		    .aclk (aclk),
		    .bclk (bclk),
		    .valid0 (valid2),
		    .valid1 (valid3),
		    .data_in0 (data_in2),
		    .data_in1 (data_in3),
		    .valid_out0 (valid_out1),
		    .data_out0 (data_out1));


   muxL muxL1_2 (
		    .aclk (bclk),
		    .bclk (cclk),
		    .valid0 (valid_out0),
		    .valid1 (valid_out1),
		    .data_in0 (data_out0),
		    .data_in1 (data_out1),
		    .valid_out0 (valid_out_l2),
		    .data_out0 (data_out_l2));

   muxL2_estr m_estr(
		    .aclk (aclk), 
		    .bclk (bclk), 
		    .valid0 (valid0), 
		    .valid1 (valid1), 
		    .data_in0 (data_in0), 
		    .data_in1 (data_in1), 
	  	    .valid_out0 (valid_out0), 
		    .valid_out1 (valid_out1), 
		    .valid_out2 (valid_out2), 
		    .valid_out3 (valid_out3), 
		    .data_out0 (data_out0), 
		    .data_out1 (data_out1), 
		    .data_out2 (data_out2), 
		    .data_out3 (data_out3));

endmodule // BancoPruebas
