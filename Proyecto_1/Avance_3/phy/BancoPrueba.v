`timescale 	1ns / 100ps // Se define la escala de tiempo de simulacion

`include "probador.v"
`include "./lib/cmos_cells.v"
`include "phy.v"
`include "phy_synth.v"
// conductual y del probador

module BancoPruebas;
   wire clk_f, clk_2f, clk_4f, clk_32f, valid, valid_estruc, valid0, valid1, valid2, valid3, valid_out0, valid_out1, valid_out2, valid_out3, valid_out0_estruc, valid_out1_estruc, valid_out2_estruc, valid_out3_estruc, control_data_in, default_values, active, active_rx, active_rx_estruc, idle_out, data_out_estruc, active_estruc, idle_out_estruc, data_in;
   
   wire [7:0] data_in0, data_in1, data_in2, data_in3, control_data_out, control_data_out_estruc, data_bet, data_bet_estruc, data_out0, data_out1, data_out2, data_out3, data_out0_estruc, data_out1_estruc, data_out2_estruc, data_out3_estruc;

   probador u1 (
		.clk_f (clk_f),
		.clk_2f (clk_2f),
		.clk_4f (clk_4f),
		.clk_32f (clk_32f),
		.valid0 (valid0),
		.valid1 (valid1),
		.valid2 (valid2),
		.valid3 (valid3),
		.data_in (data_in),
		.data_in0 (data_in0),
		.data_in1 (data_in1),
		.data_in2 (data_in2),
		.data_in3 (data_in3),
		.control_data_in (control_data_in),
		.default_values (default_values)
		);

   phy_cond u2 (
   		.data_out (data_out),
		.clk_f (clk_f),
		.clk_2f (clk_2f),
		.clk_4f (clk_4f),
		.clk_32f (clk_32f),
		.valid0 (valid0),
		.valid1 (valid1),
		.valid2 (valid2),
		.valid3 (valid3),
		.data_in (data_in),
		.data_in0 (data_in0),
		.data_in1 (data_in1),
		.data_in2 (data_in2),
		.data_in3 (data_in3),
		.control_data_in (control_data_in),
		.default_values (default_values),
		.control_data_out (control_data_out),
		.active (active),
		.active_rx (active_rx),
		.valid (valid),
		.idle_out (idle_out),
		.data_between (data_bet),
		.data_out0 (data_out0),
		.data_out1 (data_out1),
		.data_out2 (data_out2),
		.data_out3 (data_out3),
		.valid_out0 (valid_out0),
		.valid_out1 (valid_out1),
		.valid_out2 (valid_out2),
		.valid_out3 (valid_out3)
		);

   phy_synth u3 (
   		.data_out (data_out_estruc),
		.clk_f (clk_f),
		.clk_2f (clk_2f),
		.clk_4f (clk_4f),
		.clk_32f (clk_32f),
		.valid0 (valid0),
		.valid1 (valid1),
		.valid2 (valid2),
		.valid3 (valid3),
		.data_in (data_in),
		.data_in0 (data_in0),
		.data_in1 (data_in1),
		.data_in2 (data_in2),
		.data_in3 (data_in3),
		.control_data_in (control_data_in),
		.default_values (default_values),
		.control_data_out (control_data_out_estruc),
		.active (active_estruc),
		.active_rx (active_rx_estruc),
		.valid (valid_estruc),
		.idle_out (idle_out_estruc),
		.data_between (data_bet_estruc),
		.data_out0 (data_out0_estruc),
		.data_out1 (data_out1_estruc),
		.data_out2 (data_out2_estruc),
		.data_out3 (data_out3_estruc),
		.valid_out0 (valid_out0_estruc),
		.valid_out1 (valid_out1_estruc),
		.valid_out2 (valid_out2_estruc),
		.valid_out3 (valid_out3_estruc)
		);
   
endmodule // BancoPruebas
