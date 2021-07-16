module probador (
		 output reg  aclk,
		 output reg  bclk,
		 output reg  cclk,
                 output reg  clk_32f,
                 output reg  data_in,
                 output reg  default_values,
                 input 	     active,
                 input 	     valid,
                 input [7:0] data_out,
		output reg 	  control_data_in
                 );
   initial begin
      $dumpfile("Serial_Paralelo_phy_rx_TEMP.vcd");
      $dumpvars;
      // Mensaje que se imprime en consola una vez
      $display ("\t\t\tclk_32f,\tdata_in,\tdefault_values,\tactive,\tdata_out,\tvalid");
      // Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
      $monitor($time,"\t%b\t%b\t%b\t%b\t%b\t%h", clk_32f, data_in, default_values, active, valid, data_out);
      

      data_in <= 1'b0;
      default_values <= 1'b0;
      control_data_in <= 1'b0;

      @(posedge clk_32f);
      default_values <= 1'b1;

      @(posedge clk_32f);
      default_values <= 1'b0;
      
       
      //Repeats 4 times
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

      repeat(2) begin
	 //$random words start
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 //$random word ends

	 //$random words start
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 //$random word ends

	 //$random words start
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 //$random word ends

	 //$random words start
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b1;
	 
	 @(posedge clk_32f);
	 data_in <= data_in + 1'b0;
	 //$random word ends
	 

      end // repeat (2)
      #150 $finish;
   end // initial begin

   initial aclk <= 0;
   always #32 aclk <= ~aclk;

   initial bclk <= 0;
   always #16 bclk <= ~bclk;

   initial cclk <= 0;
   always #8 cclk <= ~cclk;

   initial clk_32f <= 0;
   always #1 clk_32f <= ~clk_32f;



endmodule
