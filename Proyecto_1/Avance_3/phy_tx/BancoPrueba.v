`timescale 	1ns / 100ps // Se define la escala de tiempo de simulacion

`include "probador.v"
`include "main_tx.v"
`include "main_tx_estructural.v"
// conductual y del probador

module BancoPruebas;
   wire clk_f, clk_2f, clk_4f, clk_32f, valid0, valid1, valid2, valid3, valid_out0, valid_out1, valid_out_l2, control_data_in, default_values, active, idle_out, data_out_estructural, active_estructural, idle_out_estructural;
   wire [7:0] data_in0, data_in1, data_in2, data_in3, data_out0, data_out1, data_out_l2, control_data_out, control_data_out_estructural, data_between;
   wire [2:0] cnt;

   probador probador (
		      .clk_f (clk_f),
		      .clk_2f (clk_2f),
		      .clk_4f (clk_4f),
		      .clk_32f (clk_32f),
		      .valid0 (valid0),
		      .valid1 (valid1),
		      .valid2 (valid2),
		      .valid3 (valid3),
		      .data_in0 (data_in0),
		      .data_in1 (data_in1),
		      .data_in2 (data_in2),
		      .data_in3 (data_in3),
		      .control_data_in (control_data_in),
		      .default_values (default_values)
	);

   main_tx main_tx (
   		 	.data_out (data_out),
		    	.clk_f (clk_f),
			   .clk_2f (clk_2f),
			   .clk_4f (clk_4f),
			   .clk_32f (clk_32f),
			   .valid0 (valid0),
			   .valid1 (valid1),
			   .valid2 (valid2),
			   .valid3 (valid3),
			   .data_in0 (data_in0),
			   .data_in1 (data_in1),
			   .data_in2 (data_in2),
			   .data_in3 (data_in3),
			   .control_data_in (control_data_in),
			   .default_values (default_values),
			   .data_out_l2 (data_out_l2),

			   .control_data_out (control_data_out),
			   .active (active),
			   .idle_out (idle_out),
			   .cnt (cnt)
	);

   main_tx_estructural main_tx_estructural (
   		 	.data_out (data_out_estructural),
		    	.clk_f (clk_f),
			   .clk_2f (clk_2f),
			   .clk_4f (clk_4f),
			   .clk_32f (clk_32f),
			   .valid0 (valid0),
			   .valid1 (valid1),
			   .valid2 (valid2),
			   .valid3 (valid3),
			   .data_in0 (data_in0),
			   .data_in1 (data_in1),
			   .data_in2 (data_in2),
			   .data_in3 (data_in3),
			   .control_data_in (control_data_in),
			   .default_values (default_values),

			   .control_data_out (control_data_out_estructural),
			   .active (active_estructural),
			   .idle_out (idle_out_estructural),
			   .data_between (data_between)
	);



   
endmodule // BancoPruebas
