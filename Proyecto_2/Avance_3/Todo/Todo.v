`include "Arbitro.v"
`include "FIFO.v"
`include "Contador.v"

module todo_cond (
		  //Inputs
		  input        clk,
		  input        rst,
		  input [3:0]  Estado,
		  input        push_prob_FIFOE_0,
		  input        push_prob_FIFOE_1,
		  input        push_prob_FIFOE_2,
		  input        push_prob_FIFOE_3,
		  input [9:0]  data_in_FIFOE_0,
		  input [9:0]  data_in_FIFOE_1,
		  input [9:0]  data_in_FIFOE_2,
		  input [9:0]  data_in_FIFOE_3,
		  input        pop_prob_FIFOS_0,
		  input        pop_prob_FIFOS_1,
		  input        pop_prob_FIFOS_2,
		  input        pop_prob_FIFOS_3,

		  //Outputs
		  output [4:0] count_0,
		  output [4:0] count_1,
		  output [4:0] count_2,
		  output [4:0] count_3,
		  output       empty_FIFOE_0,
		  output       empty_FIFOE_1,
		  output       empty_FIFOE_2,
		  output       empty_FIFOE_3,
		  output       empty_FIFOS_0,
		  output       empty_FIFOS_1,
		  output       empty_FIFOS_2,
		  output       empty_FIFOS_3,
		  output       alm_full_FIFOE_0,
		  output       alm_full_FIFOE_1,
		  output       alm_full_FIFOE_2,
		  output       alm_full_FIFOE_3,
		  output       alm_full_FIFOS_0,
		  output       alm_full_FIFOS_1,
		  output       alm_full_FIFOS_2,
		  output       alm_full_FIFOS_3,
		  output [9:0] data_out_FIFOS_0,
		  output [9:0] data_out_FIFOS_1,
		  output [9:0] data_out_FIFOS_2,
		  output [9:0] data_out_FIFOS_3
		  );

   wire 		       rd_FIFOE_0, rd_FIFOE_1, rd_FIFOE_2, rd_FIFOE_3, wr_FIFOS_0, wr_FIFOS_1, wr_FIFOS_2, wr_FIFOS_3;

   wire [9:0] 		       data_poped_0, data_poped_1, data_poped_2, data_poped_3, data_linea_0, data_linea_1, data_linea_2, data_linea_3;
   

   arbitro_cond arbitro (.clk(clk), .rst(rst), .empty_0(empty_FIFOE_0), .empty_1(empty_FIFOE_1), .empty_2(empty_FIFOE_2), .empty_3(empty_FIFOE_3), .alm_full_0(alm_full_FIFOS_0), .alm_full_1(alm_full_FIFOS_1), .alm_full_2(alm_full_FIFOS_2), .alm_full_3(alm_full_FIFOS_3), .data_poped_0(data_poped_0), .data_poped_1(data_poped_1), .data_poped_2(data_poped_2), .data_poped_3(data_poped_3), .pop_0(rd_FIFOE_0), .pop_1(rd_FIFOE_1), .pop_2(rd_FIFOE_2), .pop_3(rd_FIFOE_3), .push_0(wr_FIFOS_0), .push_1(wr_FIFOS_1), .push_2(wr_FIFOS_2), .push_3(wr_FIFOS_3), .data_pushed_0(data_linea_0), .data_pushed_1(data_linea_1), .data_pushed_2(data_linea_2), .data_pushed_3(data_linea_3));

   //FIFO's de entrada
   FIFO_cond FIFOE_0 (.clk(clk), .rst(rst), .wr_enb(push_prob_FIFOE_0), .rd_enb(rd_FIFOE_0), .data_in(data_in_FIFOE_0), .data_out(data_poped_0), .empty(empty_FIFOE_0), .alm_full(alm_full_FIFOE_0));

   FIFO_cond FIFOE_1 (.clk(clk), .rst(rst), .wr_enb(push_prob_FIFOE_1), .rd_enb(rd_FIFOE_1), .data_in(data_in_FIFOE_1), .data_out(data_poped_1), .empty(empty_FIFOE_1), .alm_full(alm_full_FIFOE_1));

   FIFO_cond FIFOE_2 (.clk(clk), .rst(rst), .wr_enb(push_prob_FIFOE_2), .rd_enb(rd_FIFOE_2), .data_in(data_in_FIFOE_2), .data_out(data_poped_2), .empty(empty_FIFOE_2), .alm_full(alm_full_FIFOE_2));

   FIFO_cond FIFOE_3 (.clk(clk), .rst(rst), .wr_enb(push_prob_FIFOE_3), .rd_enb(rd_FIFOE_3), .data_in(data_in_FIFOE_3), .data_out(data_poped_3), .empty(empty_FIFOE_3), .alm_full(alm_full_FIFOE_3));

   //FIFO's de salida
   FIFO_cond FIFOS_0 (.clk(clk), .rst(rst), .wr_enb(wr_FIFOS_0), .rd_enb(pop_prob_FIFOS_0), .data_in(data_linea_0), .data_out(data_out_FIFOS_0), .empty(empty_FIFOS_0), .alm_full(alm_full_FIFOS_0));

   FIFO_cond FIFOS_1 (.clk(clk), .rst(rst), .wr_enb(wr_FIFOS_1), .rd_enb(pop_prob_FIFOS_1), .data_in(data_linea_1), .data_out(data_out_FIFOS_1), .empty(empty_FIFOS_1), .alm_full(alm_full_FIFOS_1));

   FIFO_cond FIFOS_2 (.clk(clk), .rst(rst), .wr_enb(wr_FIFOS_2), .rd_enb(pop_prob_FIFOS_2), .data_in(data_linea_2), .data_out(data_out_FIFOS_2), .empty(empty_FIFOS_2), .alm_full(alm_full_FIFOS_2));

   FIFO_cond FIFOS_3 (.clk(clk), .rst(rst), .wr_enb(wr_FIFOS_3), .rd_enb(pop_prob_FIFOS_3), .data_in(data_linea_3), .data_out(data_out_FIFOS_3), .empty(empty_FIFOS_3), .alm_full(alm_full_FIFOS_3));

   //Contador
   contador_cond contador (.clk(clk), .rst(rst), .Estado(Estado), .data_in_0(data_out_FIFOS_0), .data_in_1(data_out_FIFOS_1), .data_in_2(data_out_FIFOS_2), .data_in_3(data_out_FIFOS_3), .total_0(count_0), .total_1(count_1), .total_2(count_2), .total_3(count_3));

endmodule // todo_cond
   
   
			
