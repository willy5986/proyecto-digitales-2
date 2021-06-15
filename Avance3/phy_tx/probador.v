module probador (
		 output reg 	  clk_f,
		 output reg 	  clk_2f,
		 output reg 	  clk_4f,
		 output reg 	  clk_32f,
		 output reg 	  valid0,
		 output reg 	  valid1,
		 output reg 	  valid2,
		 output reg 	  valid3,
		 output reg [7:0] data_in0,
		 output reg [7:0] data_in1,
		 output reg [7:0] data_in2,
		 output reg [7:0] data_in3,
		 output reg 	  control_data_in,
		 output reg 	  default_values
		 );

   initial begin
      $dumpfile("phy_tx.vcd");
      $dumpvars;


      //initial values
      valid0 = 0;
      valid1 = 0;
      valid2 = 0; 
      valid3 = 0;   
      data_in0 = 8'h00;
      data_in1 = 8'h00;
      data_in2 = 8'h00;
      data_in3 = 8'h00;
      control_data_in <= 1'b0;      
      default_values <= 1'b0;

      //default_values
      @(posedge clk_32f);
      default_values <= 1'b1;

      @(posedge clk_32f);
      default_values <= 1'b0;

      repeat (4) begin    //Repeats 4 times
         //$BC word starts
	 @(posedge clk_32f);
         control_data_in <= 1'b1;
         
	 @(posedge clk_32f);
	 control_data_in <= 1'b0;
         
         @(posedge clk_32f);
         control_data_in <= 1'b1;
         
         @(posedge clk_32f);
         control_data_in <= 1'b1;
         
         @(posedge clk_32f);
         control_data_in <= 1'b1;
         
         @(posedge clk_32f);
         control_data_in <= 1'b1;
         
         @(posedge clk_32f);
         control_data_in <= 1'b0;
         
         @(posedge clk_32f);
         control_data_in <= 1'b0;
         //$BC word ends     
      end
      //@(posedge clk_32f);
      //@(posedge clk_32f);
      //@(posedge clk_32f);
      //@(posedge clk_32f);
      
      //$7C word starts
      repeat(12) begin
	 
         @(posedge clk_32f);
         control_data_in <= 1'b0;
         
         @(posedge clk_32f);
         control_data_in <= 1'b1;
         
         @(posedge clk_32f);
         control_data_in <= 1'b1;
         
         @(posedge clk_32f);
         control_data_in <= 1'b1;
         
         @(posedge clk_32f);
         control_data_in <= 1'b1;
         
         @(posedge clk_32f);
         control_data_in <= 1'b1;
         
         @(posedge clk_32f);
         control_data_in <= 1'b0;
         
         @(posedge clk_32f);
         control_data_in <= 1'b0;
      end // repeat (12)
   end // initial begin

   //data_in
   initial begin
      #70 @(posedge clk_f);
      data_in0 <= 8'hFF;
      data_in1 <= 8'hEE;
      data_in2 <= 8'hDD;
      data_in3 <= 8'hCC;
      
      @(posedge clk_f);
      data_in0 <= 8'hBB;
      data_in1 <= 8'hAA;
      data_in2 <= 8'h99;
      data_in3 <= 8'h88;

      @(posedge clk_f);
      data_in0 <= 8'h00;
      data_in1 <= 8'h00;
      data_in2 <= 8'h00;
      data_in3 <= 8'h00;

      #4 $finish;
      
   end // initial begin

   initial begin
      #70 @(posedge clk_f);
      valid0 <= 1;
      valid1 <= 1;
      valid2 <= 1;
      valid3 <= 1;

      #70 @(posedge clk_f);
      valid0 <= 0;
      valid1 <= 0;
      valid2 <= 0;
      valid3 <= 0;

   end // initial begin

   //clocks
   initial clk_f <= 0;
   always #32 clk_f <= ~clk_f;

   initial clk_2f <= 0;
   always #16 clk_2f <= ~clk_2f;

   initial clk_4f <= 0;
   always #8 clk_4f <= ~clk_4f;

   initial clk_32f <= 0;
   always #1 clk_32f <= ~clk_32f; 

endmodule // probador
