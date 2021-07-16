module arbitro_cond (
		     input 	  clk,
		     input 	  rst,
		     input 	  empty_0,
		     input 	  empty_1,
		     input 	  empty_2,
		     input 	  empty_3,
		     input 	  alm_full_0,
		     input 	  alm_full_1,
		     input 	  alm_full_2,
		     input 	  alm_full_3,
		     input [9:0]  data_poped_0,
		     input [9:0]  data_poped_1,
		     input [9:0]  data_poped_2,
		     input [9:0]  data_poped_3,
		     output reg	  pop_0,
		     output reg	  pop_1,
		     output reg	  pop_2,
		     output reg	  pop_3,
		     output reg	  push_0,
		     output reg	  push_1,
		     output reg	  push_2,
		     output reg	  push_3,
		     output reg [9:0] data_pushed_0,
		     output reg [9:0] data_pushed_1,
		     output reg [9:0] data_pushed_2,
		     output reg [9:0] data_pushed_3
		     );

   reg 				 pop_0_d, pop_1_d, pop_2_d, pop_3_d;

   always @(posedge clk) begin
      // Esto es para saber luego de cual FIFO tomar los datos leidos
      pop_0_d <= pop_0;
      pop_1_d <= pop_1;
      pop_2_d <= pop_2;
      pop_3_d <= pop_3;
   end // always @ (posedge clk)
   
   always @(posedge clk) begin

      // Establecer valores en 0
      if (rst) begin
	 pop_0 = 0;
	 pop_1 <= 0;
	 pop_2 <= 0;
	 pop_3 <= 0;
	 push_0 <= 0;
	 push_1 <= 0;
	 push_2 <= 0;
	 push_3 <= 0;
      end

      else begin

	 // Pop's
	 
	 // Pop de P0
	 if (!empty_0 & (!alm_full_0 & !alm_full_1 & !alm_full_2 & !alm_full_3))
	   pop_0 <= 1;
	 else
	   pop_0 <= 0;

	 // Pop de P1
	 if (empty_0 & !empty_1 & (!alm_full_0 & !alm_full_1 & !alm_full_2 & !alm_full_3))
	   pop_1 <= 1;
	 else
	   pop_1 <= 0;

	 // Pop de P2
	 if (empty_0 & empty_1 & !empty_2 & (!alm_full_0 & !alm_full_1 & !alm_full_2 & !alm_full_3))
	   pop_2 <= 1;
	 else
	   pop_2 <= 0;

	 // Pop de P3
	 if (empty_0 & empty_1 & empty_2 & !empty_3 & (!alm_full_0 & !alm_full_1 & !alm_full_2 & !alm_full_3))
	   pop_3 <= 1;
	 else
	   pop_3 <= 0;

	 // Push's
	 
	 // Evaluacion de pushes cuando se popea a FIFO_0
	 if (pop_0_d) begin
	    
	    if (data_poped_0[9:8] == 0) begin
	       push_0 <= 1;
	       data_pushed_0 <= data_poped_0;
	    end
	    else
	      push_0 <= 0;

	    if (data_poped_0[9:8] == 1) begin
	       push_1 <= 1;
	       data_pushed_1 <= data_poped_0;
	    end
	    else
	      push_1 <= 0;

	    if (data_poped_0[9:8] == 2) begin
	       push_2 <= 1;
	       data_pushed_2 <= data_poped_0;
	    end
	    else
	      push_2 <= 0;

	    if (data_poped_0[9:8] == 3) begin
	       push_3 <= 1;
	       data_pushed_3 <= data_poped_0;
	    end
	    else
	      push_3 <= 0;
	 end // if (pop_0_d)

	 

	 // Evaluacion de pushes cuando se popea a FIFO_1
	 else if (pop_1_d) begin
	    
	    if (data_poped_1[9:8] == 0) begin
	       push_0 <= 1;
	       data_pushed_0 <= data_poped_1;
	    end
	    else
	      push_0 <= 0;

	    if (data_poped_1[9:8] == 1) begin
	       push_1 <= 1;
	       data_pushed_1 <= data_poped_1;
	    end
	    else
	      push_1 <= 0;

	    if (data_poped_1[9:8] == 2) begin
	       push_2 <= 1;
	       data_pushed_2 <= data_poped_1;
	    end
	    else
	      push_2 <= 0;

	    if (data_poped_1[9:8] == 3) begin
	       push_3 <= 1;
	       data_pushed_3 <= data_poped_1;
	    end
	    else
	      push_3 <= 0;
	 end // if (pop_1_d)
	 

	 
	 // Evaluacion de pushes cuando se popea a FIFO_2
	 else if (pop_2_d) begin
	    
	    if (data_poped_2[9:8] == 0) begin
	       push_0 <= 1;
	       data_pushed_0 <= data_poped_2;
	    end
	    else
	      push_0 <= 0;

	    if (data_poped_2[9:8] == 1) begin
	       push_1 <= 1;
	       data_pushed_1 <= data_poped_2;
	    end
	    else
	      push_1 <= 0;

	    if (data_poped_2[9:8] == 2) begin
	       push_2 <= 1;
	       data_pushed_2 <= data_poped_2;
	    end
	    else
	      push_2 <= 0;

	    if (data_poped_2[9:8] == 3) begin
	       push_3 <= 1;
	       data_pushed_3 <= data_poped_2;
	    end
	    else
	      push_3 <= 0;
	 end // if (pop_2_d)
	 

	 
	 // Evaluacion de pushes cuando se popea a FIFO_3
	 else if (pop_3_d) begin
	    
	    if (data_poped_3[9:8] == 0) begin
	       push_0 <= 1;
	       data_pushed_0 <= data_poped_3;
	    end
	    else
	      push_0 <= 0;

	    if (data_poped_3[9:8] == 1) begin
	       push_1 <= 1;
	       data_pushed_1 <= data_poped_3;
	    end
	    else
	      push_1 <= 0;

	    if (data_poped_3[9:8] == 2) begin
	       push_2 <= 1;
	       data_pushed_2 <= data_poped_3;
	    end
	    else
	      push_2 <= 0;

	    if (data_poped_3[9:8] == 3) begin
	       push_3 <= 1;
	       data_pushed_3 <= data_poped_3;
	    end
	    else
	      push_3 <= 0;
	 end // if (pop_3_d)

	 
	 else begin
	    push_0 <= 0;
	    push_1 <= 0;
	    push_2 <= 0;
	    push_3 <= 0;
	 end // else: !if(pop_3_d)
	 
      end // else: !if(rst)
   end // always @ (posedge clk)

   
endmodule // arbitro_cond
