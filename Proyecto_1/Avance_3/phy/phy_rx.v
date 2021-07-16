`include "Serial_Paralelo_phy_rx.v"
`include "demuxL1.v"
`include "demuxL2.v"

module phy_rx_cond (
		    input 	 aclk,
		    input 	 bclk,
		    input 	 cclk,
		    input 	 clk_32f,
		    input 	 default_values,
		    input 	 data_in,
		    output 	 active,
		    output 	 valid,
		    output [7:0] data_out0,
		    output [7:0] data_out1,
		    output [7:0] data_out2,
		    output [7:0] data_out3,
		    output 	 valid_out0,
		    output 	 valid_out1,
		    output 	 valid_out2,
		    output 	 valid_out3
		    );

   wire [7:0] 			 w0, w1, w2;
   wire 			 w5, w6;
   
   
   
   Serial_Paralelo_phy_rx_cond u0 (
				   .clk_32f        (clk_32f),
				   .valid          (valid),
				   .default_values (default_values),
				   .active         (active),
				   .data_out       (w0), //
				   .data_in        (data_in)
				   );

   demuxL2_cond u1 (
		    .bclk (bclk),
		    .cclk (cclk),
		    .valid (valid),
		    .data_in (w0), //
		    .valid_out0 (w5), //
		    .valid_out1 (w6), //
		    .data_out0 (w1), //
		    .data_out1 (w2) //
		    );

   demuxL1_cond u2 (
		    .aclk (aclk),
		    .bclk (bclk),
		    .valid0 (w5), //
		    .valid1 (w6), //
		    .data_in0 (w1), //
		    .data_in1 (w2), //
		    .valid_out0 (valid_out0),
		    .valid_out1 (valid_out1),
		    .valid_out2 (valid_out2),
		    .valid_out3 (valid_out3),
		    .data_out0 (data_out0),
		    .data_out1 (data_out1),
		    .data_out2 (data_out2),
		    .data_out3 (data_out3)
		    );
   
endmodule // phy_rx_cond
