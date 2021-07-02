`timescale 	1ns / 100ps // Se define la escala de tiempo de simulacion

`include "probador.v"
`include "./lib/cmos_cells.v"
`include "FIFO.v"
`include "FIFO_synth.v"
// conductual y del probador

module BancoPruebas;
   
   wire clk, rst, wr_enb, rd_enb, empty_cond, alm_empty_cond, alm_full_cond, empty_synth, alm_empty_synth, alm_full_synth;
   wire [9:0] data_in, data_out_cond, data_out_synth;

   probador u0 (
		.clk (clk),
		.rst (rst),
		.wr_enb (wr_enb),
		.rd_enb (rd_enb),
		.data_in (data_in)
		);
   
   FIFO_cond u1 (
		 .clk (clk),
		 .rst (rst),
		 .wr_enb (wr_enb),
		 .rd_enb (rd_enb),
		 .data_in (data_in),
		 .data_out (data_out_cond),
		 .empty (empty_cond),
		 .alm_empty (alm_empty_cond),
		 .alm_full (alm_full_cond)
		 );

   FIFO_synth u2 (
		 .clk (clk),
		 .rst (rst),
		 .wr_enb (wr_enb),
		 .rd_enb (rd_enb),
		 .data_in (data_in),
		 .data_out (data_out_synth),
		 .empty (empty_synth),
		 .alm_empty (alm_empty_synth),
		 .alm_full (alm_full_synth)
		 );
   
endmodule // BancoPruebas
