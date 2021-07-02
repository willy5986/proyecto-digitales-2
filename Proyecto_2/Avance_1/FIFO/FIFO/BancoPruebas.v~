`timescale 	1ns / 100ps // Se define la escala de tiempo de simulacion

`include "probador.v"
`include "./lib/cmos_cells.v"
`include "memory.v"
`include "memory_synth.v"
// conductual y del probador

module BancoPruebas;
   
   wire clk, rst, wr_enb, rd_enb;
   wire [2:0] wr_ptr, rd_ptr;
   wire [9:0] data_in, data_out_cond, data_out_synth;

   probador u0 (
		.clk (clk),
		.rst (rst),
		.wr_enb (wr_enb),
		.rd_enb (rd_enb),
		.wr_ptr (wr_ptr),
		.rd_ptr (rd_ptr),
		.data_in (data_in)
		);
   
   dual_ram_cond u1 (
		     .clk (clk),
		     .rst (rst),
		     .wr_enb (wr_enb),
		     .rd_enb (rd_enb),
		     .wr_ptr (wr_ptr),
		     .rd_ptr (rd_ptr),
		     .data_in (data_in),
		     .data_out (data_out_cond)
		     );

   dual_ram_synth u2 (
		      .clk (clk),
		      .rst (rst),
		      .wr_enb (wr_enb),
		      .rd_enb (rd_enb),
		      .wr_ptr (wr_ptr),
		      .rd_ptr (rd_ptr),
		      .data_in (data_in),
		      .data_out (data_out_synth)
		      );
   
endmodule // BancoPruebas
