`include "muxL.v" 

module main_muxes_cond(
		       input 	    aclk, bclk, cclk, valid0, valid1, valid2, valid3, 
		       input [7:0]  data_in0, data_in1, data_in2, data_in3,
		       output [7:0] data_out_l2, data_out0, data_out1,
		       output 	    valid_out_l2, valid_out0, valid_out1
		       );



   muxL_cond muxL1_1 (
		      .aclk (aclk),
		      .bclk (bclk),
		      .valid0 (valid0),
		      .valid1 (valid1),
		      .data_in0 (data_in0),
		      .data_in1 (data_in1),
		      .valid_out0 (valid_out0),
		      .data_out0 (data_out0));

   
   muxL_cond muxL2 (
		    .aclk (aclk),
		    .bclk (bclk),
		    .valid0 (valid2),
		    .valid1 (valid3),
		    .data_in0 (data_in2),
		    .data_in1 (data_in3),
		    .valid_out0 (valid_out1),
		    .data_out0 (data_out1));


   muxL_cond muxL1_2 (
		      .aclk (bclk),
		      .bclk (cclk),
		      .valid0 (valid_out0),
		      .valid1 (valid_out1),
		      .data_in0 (data_out0),
		      .data_in1 (data_out1),
		      .valid_out0 (valid_out_l2),
		      .data_out0 (data_out_l2));

   
endmodule // BancoPruebas
