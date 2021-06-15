`timescale 	1ns / 100ps // Se define la escala de tiempo de simulacion

`include "probador.v"
`include "main_muxes.v"
// conductual y del probador
`include "main_muxes_estructural.v"
`include "cmos_cells.v"
module BancoPruebas;
   wire aclk, bclk, cclk, valid0, valid1, valid2, valid3, valid_out0, valid_out1, valid_out_l2, valid_out0_estru, valid_out1_estru, valid_out_l2_estru;
   wire [7:0] data_in0, data_in1, data_in2, data_in3, data_out0, data_out1, data_out_l2, data_out0_estru, data_out1_estru, data_out_l2_estru;

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
		      .data_in3 (data_in3)
	);

   main_muxes main_muxes (
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
		    .data_in3 (data_in3),
		    .valid_out0 (valid_out0),
		    .valid_out1 (valid_out1),
		    .valid_out_l2 (valid_out_l2),
		    .data_out0 (data_out0),
		    .data_out1 (data_out1),
		    .data_out_l2 (data_out_l2)
	);
      main_muxes_estructural mux_estru (
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
		    .data_in3 (data_in3),
		    .valid_out0 (valid_out0_estru),
		    .valid_out1 (valid_out1_estru),
		    .valid_out_l2 (valid_out_l2_estru),
		    .data_out0 (data_out0_estru),
		    .data_out1 (data_out1_estru),
		    .data_out_l2 (data_out_l2_estru)
	);


   
endmodule // BancoPruebas
