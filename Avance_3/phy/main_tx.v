`include "Serial_Paralelo_phy_tx.v"
`include "recirculacion.v"
`include "main_muxes.v"
`include "main_com_out.v"
// conductual y del probador

module main_tx_cond (
		     output 	  data_out,
		     input 	  clk_f,
		     input 	  clk_2f,
		     input 	  clk_4f,
		     input 	  clk_32f,
		     input 	  valid0,
		     input 	  valid1,
		     input 	  valid2,
		     input 	  valid3,
		     input [7:0]  data_in0,
		     input [7:0]  data_in1,
		     input [7:0]  data_in2,
		     input [7:0]  data_in3,
		     input 	  control_data_in,
		     input 	  default_values,
		     output [7:0] control_data_out,
		     output 	  active,
		     output 	  idle_out,
		     output [7:0] data_between
		     );
   
   wire 			  L1_valid0, L1_valid1, L1_valid2, L1_valid3, valid_out0, valid_out1, valid_out_l2;
   
   wire [7:0] 			  L1_in0, L1_in1, L1_in2, L1_in3, L1_data_out0, L1_data_out1, data_out_l2;

   Serial_Paralelo_phy_tx_cond Serial_Paralelo_phy_tx (
						       .clk_32f (clk_32f),
						       .data_in (control_data_in),
						       .default_values (default_values),
						       .active (active),
						       .data_out (control_data_out),
						       .idle_out (idle_out)


						       ); 

   recirculacion_cond	recirculacion_(
				       .IDL 			(idle_out),
				       .data_in0		(data_in0[7:0]),
				       .data_in1		(data_in1[7:0]),
				       .data_in2		(data_in2[7:0]),
				       .data_in3		(data_in3[7:0]),
				       .valid0			(valid0),
				       .valid1			(valid1),
				       .valid2			(valid2),
				       .valid3			(valid3),
				       .L1_in0 		(L1_in0),
				       .L1_in1 		(L1_in1),
				       .L1_in2 		(L1_in2),
				       .L1_in3 		(L1_in3),
				       .L1_valid0		(L1_valid0),
				       .L1_valid1		(L1_valid1),
				       .L1_valid2		(L1_valid2),
				       .L1_valid3		(L1_valid3)
				       );

   main_muxes_cond main_muxes (
			       .aclk (clk_f),
			       .bclk (clk_2f),
			       .cclk (clk_4f),
			       .valid0 (L1_valid0),
			       .valid1 (L1_valid1),
			       .valid2 (L1_valid2),
			       .valid3 (L1_valid3),
			       .data_in0 (L1_in0),
			       .data_in1 (L1_in1),
			       .data_in2 (L1_in2),
			       .data_in3 (L1_in3),
			       .valid_out0 (valid_out0),
			       .valid_out1 (valid_out1),
			       .valid_out_l2 (valid_out_l2),
			       .data_out0 (L1_data_out0),
			       .data_out1 (L1_data_out1),
			       .data_out_l2 (data_out_l2)
			       );

   main_com_out_cond main_com_out (
				   .cclk (clk_4f),
				   .dclk	(clk_32f),
				   .valid (valid_out_l2),
				   .data_in (data_out_l2),
				   .default_values (default_values),
				   .data_between (data_between),
				   .data_out (data_out)
				   );
   
endmodule // BancoPruebas
