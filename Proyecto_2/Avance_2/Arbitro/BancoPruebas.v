`timescale 	1s	/ 100ps
// escala	unidad temporal (valor de "#1") / precisión

// includes de archivos de verilog
// Pueden omitirse y llamarse desde el makefile
`include "Arbitro.v"
//`include "Arbitro_synth.v"
`include "probador.v"
`include "./lib/cmos_cells.v" 

module BancoPruebas;
	
	wire write_enable_0, write_enable_1, write_enable_2, write_enable_3, read_enable_0, read_enable_1, read_enable_2, read_enable_3, clk, rst, mem_empty_0, mem_empty_1, mem_empty_2, mem_empty_3, mem_alm_full_0, mem_alm_full_1, mem_alm_full_2, mem_alm_full_3;
	
	
	wire [9:0] data_read_0, data_read_1, data_read_2, data_read_3, data_write_0, data_write_1, data_write_2, data_write_3;
	
	//arbitro_estruct
	//wire write_enable_0_estruct, write_enable_1_estruct, write_enable_2_estruct, write_enable_3_estruct, read_enable_0_estruct, read_enable_1_estruct, read_enable_2_estruct, read_enable_3_estruct, clk, rst, mem_empty_0_estruct, mem_empty_1_estruct, mem_empty_2_estruct, mem_empty_3_estruct, mem_alm_full_0_estruct, mem_alm_full_1_estruct, mem_alm_full_2_estruct, mem_alm_full_3_estruct;
	
	//arbitro_estruct
	//wire [9:0] data_read_0_estruct, data_read_1_estruct, data_read_2_estruct, data_read_3_estruct, data_write_0_estruct, data_write_1_estruct, data_write_2_estruct, data_write_3_estruct;

	arbitro_cond arbitro_cond( 	//OUTPUTS
								.pop_0			(write_enable_0),
								.pop_1			(write_enable_1),
								.pop_2			(write_enable_2),
								.pop_3			(write_enable_3),
								.push_0			(read_enable_0),
								.push_1			(read_enable_1),
								.push_2			(read_enable_2),
								.push_3			(read_enable_3),
								.data_pushed_0 	(data_read_0[9:0]),
								.data_pushed_1 	(data_read_1[9:0]),
								.data_pushed_2 	(data_read_2[9:0]),
								.data_pushed_3 	(data_read_3[9:0]),
								//INPUTS
								.clk			(clk),
								.rst			(rst),
								.empty_0		(mem_empty_0),
								.empty_1		(mem_empty_1),
								.empty_2		(mem_empty_2),
								.empty_3		(mem_empty_3),
								.alm_full_0		(mem_alm_full_0),
								.alm_full_1		(mem_alm_full_1),
								.alm_full_2		(mem_alm_full_2),
								.alm_full_3		(mem_alm_full_3),
								.data_poped_0	(data_write_0[9:0]),
								.data_poped_1	(data_write_1[9:0]),
								.data_poped_2	(data_write_2[9:0]),
								.data_poped_3	(data_write_3[9:0])
								);
								
//	arbitro_synth arbitro_synth( //OUTPUTS
//								.pop_0			(write_enable_0_estruct),
//								.pop_1			(write_enable_1_estruct),
//								.pop_2			(write_enable_2_estruct),
//								.pop_3			(write_enable_3_estruct),
//								.push_0			(read_enable_0_estruct),
//								.push_1			(read_enable_1_estruct),
//								.push_2			(read_enable_2_estruct),
//								.push_3			(read_enable_3_estruct),
//								.data_pushed_0 	(data_read_0_estruct[9:0]),
//								.data_pushed_1 	(data_read_1_estruct[9:0]),
//								.data_pushed_2 	(data_read_2_estruct[9:0]),
//								.data_pushed_3 	(data_read_3_estruct[9:0]),
//								//INPUTS
//								.clk			(clk),
//								.rst			(rst),
//								.empty_0		(mem_empty_0_estruct),
//								.empty_1		(mem_empty_1_estruct),
//								.empty_2		(mem_empty_2_estruct),
//								.empty_3		(mem_empty_3_estruct),
//								.alm_full_0		(mem_alm_full_0_estruct),
//								.alm_full_1		(mem_alm_full_1_estruct),
//								.alm_full_2		(mem_alm_full_2_estruct),
//								.alm_full_3		(mem_alm_full_3_estruct),
//								.data_poped_0	(data_write_0_estruct[9:0]),
//								.data_poped_1	(data_write_1_estruct[9:0]),
//								.data_poped_2	(data_write_2_estruct[9:0]),
//								.data_poped_3	(data_write_3_estruct[9:0])
//								);
								
								
	probador 		probador(
								//OUTPUTS
								.clk			(clk),
								.rst			(rst),
								.empty_0		(mem_empty_0),
								.empty_1		(mem_empty_1),
								.empty_2		(mem_empty_2),
								.empty_3		(mem_empty_3),
								.alm_full_0		(mem_alm_full_0),
								.alm_full_1		(mem_alm_full_1),
								.alm_full_2		(mem_alm_full_2),
								.alm_full_3		(mem_alm_full_3),
								.data_poped_0	(data_write_0[9:0]),
								.data_poped_1	(data_write_1[9:0]),
								.data_poped_2	(data_write_2[9:0]),
								.data_poped_3	(data_write_3[9:0]),
								//INPUTS
								.pop_0			(write_enable_0),
								.pop_1			(write_enable_1),
								.pop_2			(write_enable_2),
								.pop_3			(write_enable_3),
								.push_0			(read_enable_0),
								.push_1			(read_enable_1),
								.push_2			(read_enable_2),
								.push_3			(read_enable_3),
								.data_pushed_0 	(data_read_0[9:0]),
								.data_pushed_1 	(data_read_1[9:0]),
								.data_pushed_2 	(data_read_2[9:0]),
								.data_pushed_3 	(data_read_3[9:0])
								);
								
endmodule								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
