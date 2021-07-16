module probador (
                 output reg clk_32f,
                 output reg data_in,
                 output reg default_values
                 );
   initial begin
      $dumpfile("Serial_Paralelo_phy_tx.vcd");
      $dumpvars;
      // Mensaje que se imprime en consola una vez
      $display ("\t\t\tclk_32f,\tdata_in,\tdefault_values");
      // Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
      $monitor($time,"\t%b\t%b\t%b", clk_32f, data_in, default_values);
      

      data_in <= 1'b0;
      default_values <= 1'b0;

      @(posedge clk_32f);
      default_values <= 1'b1;

      @(posedge clk_32f);
      default_values <= 1'b0;
      
      repeat (2) begin		//Repeats 4 times
    	 repeat (4) begin		//Repeats 4 times
    	    //$BC word starts
	    @(posedge clk_32f);
    	    data_in <= 1'b1;
    	    
 	    @(posedge clk_32f);
	    data_in <= 1'b0;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b1;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b1;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b1;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b1;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b0;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b0;
    	    //$BC word ends		
    	 end
    	 //@(posedge clk_32f);
    	 //@(posedge clk_32f);
    	 //@(posedge clk_32f);
    	 //@(posedge clk_32f);
	 
    	 //$7C word starts
	 repeat(3) begin
	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b0;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b1;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b1;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b1;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b1;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b1;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b0;
    	    
    	    @(posedge clk_32f);
    	    data_in <= 1'b0;
	 end // repeat (3)
	 
    	 //$AA word ends
    	 //@(posedge clk_32f);
    	 //@(posedge clk_32f);
    	 //@(posedge clk_32f);
    	 //@(posedge clk_32f);
      end

      $finish;
   end

   initial 	clk_32f <= 0;
   always	#4 clk_32f 	<= ~clk_32f;

endmodule
