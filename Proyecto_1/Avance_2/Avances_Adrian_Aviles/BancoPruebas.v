`timescale 1ns/100ps

`include "Serial_Paralelo_phy_tx.v"
`include "Serial_Paralelo_phy_tx_synth.v"

`include "probador.v"
`include "./lib/cmos_cells.v"


module BancoPruebas; 

   wire clk_32f, data_in, default_values, active_cond, idle_out_cond, idle_out_estruc, active_estruct;
   wire [7:0] data_out_cond, data_out_estruct;

   Serial_Paralelo_phy_tx     SP_cond(
                                      .clk_32f        (clk_32f),
                                      .idle_out       (idle_out_cond),
                                      .default_values (default_values),
                                      .active         (active_cond),
                                      .data_out       (data_out_cond[7:0]),
                                      .data_in        (data_in)
                                      );

   Serial_Paralelo_phy_tx_synth     SP_estruc(
					 .clk_32f        (clk_32f),
					 .idle_out       (idle_out_estruc),
					 .default_values (default_values),
					 .active         (active_estruct),
					 .data_out       (data_out_estruct[7:0]),
					 .data_in        (data_in)
					 );

   probador     probador(
                         .clk_32f        (clk_32f),
                         .default_values (default_values),
                         .data_in        (data_in)
                         );

endmodule // BancoPruebas
