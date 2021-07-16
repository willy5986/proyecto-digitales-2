`timescale 	1ns / 100ps // Se define la escala de tiempo de simulacion

`include "Todo.v"
`include "Todo_synth.v"
`include "probador.v"
`include "./lib/cmos_cells.v"
// conductual y del probador

module BancoPruebas;
   
   wire clk, rst, push_FIFOE_0, push_FIFOE_1, push_FIFOE_2, push_FIFOE_3, pop_FIFOS_0, pop_FIFOS_1, pop_FIFOS_2, pop_FIFOS_3, empty_FIFOE_0, empty_FIFOE_1, empty_FIFOE_2, empty_FIFOE_3, empty_FIFOS_0, empty_FIFOS_1, empty_FIFOS_2, empty_FIFOS_3, alm_full_FIFOE_0, alm_full_FIFOE_1, alm_full_FIFOE_2, alm_full_FIFOE_3, alm_full_FIFOS_0, alm_full_FIFOS_1, alm_full_FIFOS_2, alm_full_FIFOS_3, empty_FIFOE_0_estruc, empty_FIFOE_1_estruc, empty_FIFOE_2_estruc, empty_FIFOE_3_estruc, empty_FIFOS_0_estruc, empty_FIFOS_1_estruc, empty_FIFOS_2_estruc, empty_FIFOS_3_estruc, alm_full_FIFOE_0_estruc, alm_full_FIFOE_1_estruc, alm_full_FIFOE_2_estruc, alm_full_FIFOE_3_estruc, alm_full_FIFOS_0_estruc, alm_full_FIFOS_1_estruc, alm_full_FIFOS_2_estruc, alm_full_FIFOS_3_estruc;

   wire [2:0] umbral;
   
   wire [3:0] Estado, Estado_estruc;

   wire [4:0] contador_FIFOS_0, contador_FIFOS_1, contador_FIFOS_2, contador_FIFOS_3, contador_FIFOS_0_estruc, contador_FIFOS_1_estruc, contador_FIFOS_2_estruc, contador_FIFOS_3_estruc;
	
   wire [9:0] data_in_FIFOE_0, data_in_FIFOE_1, data_in_FIFOE_2, data_in_FIFOE_3, data_out_FIFOS_0, data_out_FIFOS_1, data_out_FIFOS_2, data_out_FIFOS_3, data_out_FIFOS_0_estruc, data_out_FIFOS_1_estruc, data_out_FIFOS_2_estruc, data_out_FIFOS_3_estruc;

   probador u0 (
		.clk (clk),
		.rst (rst),
		.Estadoa (Estado),
		.Estadob (Estado_estruc),
		.umbral (umbral),
		.wr_enb_FIFOE_0 (push_FIFOE_0),
		.wr_enb_FIFOE_1 (push_FIFOE_1),
		.wr_enb_FIFOE_2 (push_FIFOE_2),
		.wr_enb_FIFOE_3 (push_FIFOE_3),
		.rd_enb_FIFOS_0 (pop_FIFOS_0),
		.rd_enb_FIFOS_1 (pop_FIFOS_1),
		.rd_enb_FIFOS_2 (pop_FIFOS_2),
		.rd_enb_FIFOS_3 (pop_FIFOS_3),
		.data_in_FIFOE_0 (data_in_FIFOE_0),
		.data_in_FIFOE_1 (data_in_FIFOE_1),
		.data_in_FIFOE_2 (data_in_FIFOE_2),
		.data_in_FIFOE_3 (data_in_FIFOE_3)
		);
   
   todo_cond u1 (
		 //Inputs
		 .clk (clk),
		 .rst (rst),
		 .push_prob_FIFOE_0 (push_FIFOE_0),
		 .push_prob_FIFOE_1 (push_FIFOE_1),
		 .push_prob_FIFOE_2 (push_FIFOE_2),
		 .push_prob_FIFOE_3 (push_FIFOE_3),
		 .pop_prob_FIFOS_0 (pop_FIFOS_0),
		 .pop_prob_FIFOS_1 (pop_FIFOS_1),
		 .pop_prob_FIFOS_2 (pop_FIFOS_2),
		 .pop_prob_FIFOS_3 (pop_FIFOS_3),
		 .data_in_FIFOE_0 (data_in_FIFOE_0),
		 .data_in_FIFOE_1 (data_in_FIFOE_1),
		 .data_in_FIFOE_2 (data_in_FIFOE_2),
		 .data_in_FIFOE_3 (data_in_FIFOE_3),

		 //Outputs
		 .count_0 (contador_FIFOS_0),
		 .count_1 (contador_FIFOS_1),
		 .count_2 (contador_FIFOS_2),
		 .count_3 (contador_FIFOS_3),
		 .Estado (Estado),
		 .empty_FIFOE_0 (empty_FIFOE_0),
		 .empty_FIFOE_1 (empty_FIFOE_1),
		 .empty_FIFOE_2 (empty_FIFOE_2),
		 .empty_FIFOE_3 (empty_FIFOE_3),
		 .empty_FIFOS_0 (empty_FIFOS_0),
		 .empty_FIFOS_1 (empty_FIFOS_1),
		 .empty_FIFOS_2 (empty_FIFOS_2),
		 .empty_FIFOS_3 (empty_FIFOS_3),
		 .alm_full_FIFOE_0 (alm_full_FIFOE_0),
		 .alm_full_FIFOE_1 (alm_full_FIFOE_1),
		 .alm_full_FIFOE_2 (alm_full_FIFOE_2),
		 .alm_full_FIFOE_3 (alm_full_FIFOE_3),
		 .alm_full_FIFOS_0 (alm_full_FIFOS_0),
		 .alm_full_FIFOS_1 (alm_full_FIFOS_1),
		 .alm_full_FIFOS_2 (alm_full_FIFOS_2),
		 .alm_full_FIFOS_3 (alm_full_FIFOS_3),
		 .data_out_FIFOS_0 (data_out_FIFOS_0),
		 .data_out_FIFOS_1 (data_out_FIFOS_1),
		 .data_out_FIFOS_2 (data_out_FIFOS_2),
		 .data_out_FIFOS_3 (data_out_FIFOS_3)
		 );

   todo_cond u2 (
		 //Inputs
		 .clk (clk),
		 .rst (rst),
		 .push_prob_FIFOE_0 (push_FIFOE_0),
		 .push_prob_FIFOE_1 (push_FIFOE_1),
		 .push_prob_FIFOE_2 (push_FIFOE_2),
		 .push_prob_FIFOE_3 (push_FIFOE_3),
		 .pop_prob_FIFOS_0 (pop_FIFOS_0),
		 .pop_prob_FIFOS_1 (pop_FIFOS_1),
		 .pop_prob_FIFOS_2 (pop_FIFOS_2),
		 .pop_prob_FIFOS_3 (pop_FIFOS_3),
		 .data_in_FIFOE_0 (data_in_FIFOE_0),
		 .data_in_FIFOE_1 (data_in_FIFOE_1),
		 .data_in_FIFOE_2 (data_in_FIFOE_2),
		 .data_in_FIFOE_3 (data_in_FIFOE_3),

		 //Outputs
		 .count_0 (contador_FIFOS_0_estruc),
		 .count_1 (contador_FIFOS_1_estruc),
		 .count_2 (contador_FIFOS_2_estruc),
		 .count_3 (contador_FIFOS_3_estruc),
		 .Estado (Estado_estruc),
		 .empty_FIFOE_0 (empty_FIFOE_0_estruc),
		 .empty_FIFOE_1 (empty_FIFOE_1_estruc),
		 .empty_FIFOE_2 (empty_FIFOE_2_estruc),
		 .empty_FIFOE_3 (empty_FIFOE_3_estruc),
		 .empty_FIFOS_0 (empty_FIFOS_0_estruc),
		 .empty_FIFOS_1 (empty_FIFOS_1_estruc),
		 .empty_FIFOS_2 (empty_FIFOS_2_estruc),
		 .empty_FIFOS_3 (empty_FIFOS_3_estruc),
		 .alm_full_FIFOE_0 (alm_full_FIFOE_0_estruc),
		 .alm_full_FIFOE_1 (alm_full_FIFOE_1_estruc),
		 .alm_full_FIFOE_2 (alm_full_FIFOE_2_estruc),
		 .alm_full_FIFOE_3 (alm_full_FIFOE_3_estruc),
		 .alm_full_FIFOS_0 (alm_full_FIFOS_0_estruc),
		 .alm_full_FIFOS_1 (alm_full_FIFOS_1_estruc),
		 .alm_full_FIFOS_2 (alm_full_FIFOS_2_estruc),
		 .alm_full_FIFOS_3 (alm_full_FIFOS_3_estruc),
		 .data_out_FIFOS_0 (data_out_FIFOS_0_estruc),
		 .data_out_FIFOS_1 (data_out_FIFOS_1_estruc),
		 .data_out_FIFOS_2 (data_out_FIFOS_2_estruc),
		 .data_out_FIFOS_3 (data_out_FIFOS_3_estruc)
		 );
   todo_synth u (
		 );
endmodule // BancoPruebas
