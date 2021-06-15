`timescale 1ns/100ps

`include "phy_rx.v"
`include "phy_rx_estructural.v"
`include "probador.v"
`include "./lib/cmos_cells.v"


module BancoPruebas; 

   wire aclk, bclk, cclk, clk_32f, data_in, default_values, active, valid, valid_out0, valid_out1, valid_out2, valid_out3, valid_out0_estruc, valid_out1_estruc, valid_out2_estruc, valid_out3_estruc;
   wire [7:0] data_out, data_out0, data_out1, data_out2, data_out3, data_out0_estruc, data_out1_estruc, data_out2_estruc, data_out3_estruc, data_hexa, data_hexa_estruc;

   phy_rx_cond u0 (
		   .aclk (aclk),
		   .bclk (bclk),
		   .cclk (cclk),
		   .clk_32f (clk_32f),
		   .default_values (default_values),
		   .data_in (data_in),
		   .active (active),
		   .valid (valid),
		   .data_out0 (data_out0),
		   .data_out1 (data_out1),
		   .data_out2 (data_out2),
		   .data_out3 (data_out3),
		   .valid_out0 (valid_out0),
		   .valid_out1 (valid_out1),
		   .valid_out2 (valid_out2),
		   .valid_out3 (valid_out3),
		   .data_hexa (data_hexa)
		   );

   phy_rx_cond u1 (
		   .aclk (aclk),
		   .bclk (bclk),
		   .cclk (cclk),
		   .clk_32f (clk_32f),
		   .default_values (default_values),
		   .data_in (data_in),
		   .active (active_estruc),
		   .valid (valid_estruc),
		   .data_out0 (data_out0_estruc),
		   .data_out1 (data_out1_estruc),
		   .data_out2 (data_out2_estruc),
		   .data_out3 (data_out3_estruc),
		   .valid_out0 (valid_out0_estruc),
		   .valid_out1 (valid_out1_estruc),
		   .valid_out2 (valid_out2_estruc),
		   .valid_out3 (valid_out3_estruc),
		   .data_hexa (data_hexa_estruc)
		   );

   probador     probador(
			 .aclk (aclk),
			 .bclk (bclk),
			 .cclk (cclk),
                         .clk_32f        (clk_32f),
                         .default_values (default_values),
                         .active         (active),
                         .valid          (valid),
                         .data_out       (data_out),
                         .data_in        (data_in)
                         );

endmodule // BancoPruebas
