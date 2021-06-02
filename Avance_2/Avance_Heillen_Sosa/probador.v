module probador (
                   output reg       clk_32f,
                   output reg	    data_in,
                   output reg       default_values,
                   input  active,
                   input  valid,
                   input  [7:0] data_out
                   );
    initial begin
        $dumpfile("probador.vcd");
        $dumpvars;
        // Mensaje que se imprime en consola una vez
	$display ("\t\t\tclk_32f,\tdata_in,\tdefault_values,\tactive,\tdata_out,\tvalid");
	// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
	$monitor($time,"\t%b\t%b\t%b\t%b\t%b\t%h", clk_32f, data_in, default_values, active, valid, data_out);
	

    	data_in <= 1'b0;
    	default_values <= 1'b0;

    	@(posedge clk_32f);
    	default_values <= 1'b1;
    	repeat (4) begin		//Repeats 4 times
    		#1@(posedge clk_32f);
    		default_values <= 1'b0;
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
    		//$AA word starts
    		@(posedge clk_32f);
    		data_in <= 1'b1;
    	
    		@(posedge clk_32f);
    		data_in <= 1'b0;
    	
    		@(posedge clk_32f);
    		data_in <= 1'b1;
    	
    		@(posedge clk_32f);
    		data_in <= 1'b0;
    	
    		@(posedge clk_32f);
    		data_in <= 1'b1;
    	
    		@(posedge clk_32f);
    		data_in <= 1'b0;
    	
    		@(posedge clk_32f);
    		data_in <= 1'b1;
    	
    		@(posedge clk_32f);
    		data_in <= 1'b0;
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
