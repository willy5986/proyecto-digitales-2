module probador(
		     output reg	  	clk,
		     output reg	  	rst,
		     output reg	  	empty_0,
		     output reg	  	empty_1,
		     output reg	  	empty_2,
		     output reg			empty_3,
		     output reg			alm_full_0,
		     output reg		alm_full_1,
		     output reg			alm_full_2,
		     output reg	  	alm_full_3,
		     output reg [9:0]	data_poped_0,
		     output reg [9:0]	data_poped_1,
		     output reg [9:0]	data_poped_2,
		     output reg [9:0]	data_poped_3,
		     input 	  		pop_0,
		     input 	  		pop_1,
		     input 	  		pop_2,
		     input 	  		pop_3,
		     input 	  		push_0,
		     input 	  		push_1,
		     input 	  		push_2,
		     input 	  		push_3,
		     input [9:0] 	data_pushed_0,
		     input [9:0] 	data_pushed_1,
		     input [9:0] 	data_pushed_2,
		     input [9:0] 	data_pushed_3
		); // Primero se define el modulo del creador de todas las
   // señales con todos sus puertos correspondientes

		initial begin
		$dumpfile("FIFO.vcd");
		$dumpvars;
      
		//Inicializando valores

		rst <= 1;
		empty_0 <= 1;
		empty_1 <= 1;
		empty_2 <= 1;
		empty_3 <= 1;
		alm_full_0 <= 0;
		alm_full_1 <= 0;
		alm_full_2 <= 0;
		alm_full_3 <= 0;
		data_poped_0 <= 10'b0;
		data_poped_1 <= 10'b0;
		data_poped_2 <= 10'b0;
		data_poped_3 <= 10'b0;
			
		// 1
		@(posedge clk);

		@(posedge clk);

		@(posedge clk);

		@(posedge clk);

		// 1er ciclo	
		@(posedge clk);
		empty_0 = 0;
		empty_1 <= 0;
		empty_2 <= 0;
		empty_3 <= 0;     		
		rst <= 0;
		data_poped_0 <= 10'b0011001100;
		data_poped_1 <= 10'b0111001100;
		data_poped_2 <= 10'b1011001100;
		data_poped_3 <= 10'b1111001100;
		@(posedge clk);
		@(posedge clk);

		//2do ciclo
		@(posedge clk);
      	rst <= 0;
		empty_0 = 0;
		empty_1 <= 0;
		empty_2 <= 0;
		empty_3 <= 0;   
		data_poped_0 <= 10'b0110101010;
		data_poped_1 <= 10'b0110101010;
		data_poped_2 <= 10'b1010101010;
		data_poped_3 <= 10'b1110101010;
		@(posedge clk);
		@(posedge clk);
		
		// 3er ciclo
		@(posedge clk);
      		rst <= 0;
		empty_0 = 0;
		empty_1 <= 0;
		empty_2 <= 0;
		empty_3 <= 0;  
		data_poped_0 <= 10'b1011001100;
		data_poped_1 <= 10'b0111001100;
		data_poped_2 <= 10'b1011001100;
		data_poped_3 <= 10'b1111001100;
		@(posedge clk);
		@(posedge clk);

		// 4to ciclo
		@(posedge clk);

      		rst <= 0;
		empty_0 = 0;
		empty_1 <= 0;
		empty_2 <= 0;
		empty_3 <= 0;  
		data_poped_0 <= 10'b1110101010;
		data_poped_1 <= 10'b0110101010;
		data_poped_2 <= 10'b1010101010;
		data_poped_3 <= 10'b1110101010;
		@(posedge clk);
		@(posedge clk);

		//5to ciclo
		@(posedge clk);
      		rst <= 0;
		empty_0 = 0;
		empty_1 <= 0;
		empty_2 <= 0;
		empty_3 <= 0;  
		data_poped_0 <= 10'b0011001100;
		data_poped_1 <= 10'b0111001100;
		data_poped_2 <= 10'b1011001100;
		data_poped_3 <= 10'b1111001100;

		@(posedge clk);
		@(posedge clk);

		//6to ciclo
		@(posedge clk);
      	rst <= 0;
		alm_full_0 <= 1;
		alm_full_1 <= 0;
		alm_full_2 <= 0;
		alm_full_3 <= 0; 
		data_poped_0 <= 10'b0010101010;
		data_poped_1 <= 10'b0110101010;
		data_poped_2 <= 10'b1010101010;
		data_poped_3 <= 10'b1110101010;
		@(posedge clk);
		@(posedge clk);
		alm_full_0 <= 0;
		@(posedge clk);
      	rst <= 0;
		data_poped_0 <= 10'b0011001100;
		data_poped_1 <= 10'b0111001100;
		data_poped_2 <= 10'b1011001100;
		data_poped_3 <= 10'b1111001100; 
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		/////////////SEGUNDA SECUENCIA//////////////
		// 1er ciclo	
		@(posedge clk);
		empty_0 = 1;
		empty_1 <= 0;
		empty_2 <= 0;
		empty_3 <= 0;     		
		rst <= 0;
		data_poped_0 <= 10'b0011001100;
		data_poped_1 <= 10'b0011001100;
		data_poped_2 <= 10'b1011001100;
		data_poped_3 <= 10'b1111001100;
		@(posedge clk);
		@(posedge clk);

		//2do ciclo
		@(posedge clk);
      	rst <= 0;
		empty_0 = 0;
		empty_1 <= 0;
		empty_2 <= 0;
		empty_3 <= 0;   
		data_poped_0 <= 10'b0110101010;
		data_poped_1 <= 10'b0110101010;
		data_poped_2 <= 10'b1010101010;
		data_poped_3 <= 10'b1110101010;
		@(posedge clk);
		@(posedge clk);
		
		// 3er ciclo
		@(posedge clk);
      		rst <= 0;
		empty_0 = 0;
		empty_1 <= 0;
		empty_2 <= 0;
		empty_3 <= 0;  
		data_poped_0 <= 10'b1011001100;
		data_poped_1 <= 10'b1011001100;
		data_poped_2 <= 10'b1011001100;
		data_poped_3 <= 10'b1111001100;
		@(posedge clk);
		@(posedge clk);

		// 4to ciclo
		@(posedge clk);

      		rst <= 0;
		empty_0 = 0;
		empty_1 <= 0;
		empty_2 <= 0;
		empty_3 <= 0;  
		data_poped_0 <= 10'b1110101010;
		data_poped_1 <= 10'b1110101010;
		data_poped_2 <= 10'b1010101010;
		data_poped_3 <= 10'b1110101010;
		@(posedge clk);
		@(posedge clk);

		//5to ciclo
		@(posedge clk);
      		rst <= 0;
		empty_0 = 0;
		empty_1 <= 0;
		empty_2 <= 0;
		empty_3 <= 0;  
		data_poped_0 <= 10'b0011001100;
		data_poped_1 <= 10'b0111001100;
		data_poped_2 <= 10'b1011001100;
		data_poped_3 <= 10'b1111001100;

		@(posedge clk);
		@(posedge clk);

		//6to ciclo
		@(posedge clk);
      	rst <= 0;
		alm_full_0 = 0;
		alm_full_1 <= 1;
		alm_full_2 <= 0;
		alm_full_3 <= 0; 
		data_poped_0 <= 10'b0010101010;
		data_poped_1 <= 10'b0110101010;
		data_poped_2 <= 10'b1010101010;
		data_poped_3 <= 10'b1110101010;
		@(posedge clk);
		@(posedge clk);
		alm_full_1 <= 0;
		@(posedge clk);
      	rst <= 0;
		data_poped_0 <= 10'b0011001100;
		data_poped_1 <= 10'b0111001100;
		data_poped_2 <= 10'b1011001100;
		data_poped_3 <= 10'b1111001100; 
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		
		
		
		$finish;
		end

		initial clk <= 0;
		always #2 clk <= ~clk; // Ahora se crea el reloj y se define su periodo
   
endmodule // probador
