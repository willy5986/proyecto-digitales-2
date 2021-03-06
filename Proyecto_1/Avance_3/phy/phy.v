`include "main_tx.v"
`include "phy_rx.v"

module phy_cond (
		 output       data_out,
		 input 	      clk_f,
		 input 	      clk_2f,
		 input 	      clk_4f,
		 input 	      clk_32f,
		 input 	      valid0,
		 input 	      valid1,
		 input 	      valid2,
		 input 	      valid3,
		 input 	      data_in,
		 input [7:0]  data_in0,
		 input [7:0]  data_in1,
		 input [7:0]  data_in2,
		 input [7:0]  data_in3,
		 input 	      control_data_in,
		 input 	      default_values,
		 output [7:0] control_data_out,
		 output       active,
		 output       active_rx,
		 output       valid,
		 output       idle_out,
		 output [7:0] data_between,
		 output [7:0] data_out0,
		 output [7:0] data_out1,
		 output [7:0] data_out2,
		 output [7:0] data_out3,
		 output       valid_out0,
		 output       valid_out1,
		 output       valid_out2,
		 output       valid_out3
		 );

   main_tx_cond u0 ( 
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
		     .control_data_out (control_data_out),
		     .active (active),
		     .idle_out (idle_out));

   phy_rx_cond u1 (
		   .aclk (clk_f),
		   .bclk (clk_2f),
		   .cclk (clk_4f),
		   .clk_32f (clk_32f),
		   .default_values (default_values),
		   .data_in (data_in),
		   .active (active_rx),
		   .valid (valid),
		   .data_out0 (data_out0),
		   .data_out1 (data_out1),
		   .data_out2 (data_out2),
		   .data_out3 (data_out3),
		   .valid_out0 (valid_out0),
		   .valid_out1 (valid_out1),
		   .valid_out2 (valid_out2),
		   .valid_out3 (valid_out3)
		   );
   
endmodule // phy_cond
