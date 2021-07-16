module probador (
		 output reg 	  aclk,
		 output reg 	  bclk,
		 output reg 	  cclk,
		 output reg 	  valid0,
       output reg      valid1,
       output reg      valid2,
       output reg      valid3,
		 output reg [7:0] data_in0,
       output reg [7:0] data_in1,
       output reg [7:0] data_in2,
       output reg [7:0] data_in3
		 );

   initial begin
      $dumpfile("mux_L2.vcd");
      $dumpvars;

      valid0 = 0;
      valid1 = 0;
      valid2 = 0; 
      valid3 = 0;   
      data_in0 = 8'h00;
      data_in1 = 8'h00;
      data_in2 = 8'h00;
      data_in3 = 8'h00;

   end

   initial begin
      #1 @(posedge aclk);
      data_in0 <= 8'hFF;
      data_in1 <= 8'hEE;
      data_in2 <= 8'hDD;
      data_in3 <= 8'hCC;
     
      @(posedge aclk);
      data_in0 <= 8'hBB;
      data_in1 <= 8'hAA;
      data_in2 <= 8'h99;
      data_in3 <= 8'h88;

      @(posedge aclk);
      data_in0 <= 8'h00;
      data_in1 <= 8'h00;
      data_in2 <= 8'h77;
      data_in3 <= 8'h00;

      @(posedge aclk);
      data_in2 <= 8'h00;
      

      #4 $finish;
  
   end // initial begin

   initial begin
      #1 @(posedge aclk);
      valid0 <= 1;
      valid1 <= 1;
      valid2 <= 1;
      valid3 <= 1;

      #6 @(posedge aclk);
      valid0 <= 0;
      valid1 <= 0;
      valid3 <= 0;

      @(posedge aclk);
      valid2 <= 0;      


   end // initial begin

   initial aclk <= 0;
   always #2 aclk <= ~aclk;

   initial bclk <= 0;
   always #1 bclk <= ~bclk;

   initial cclk <= 0;
   always #0.5 cclk <= ~cclk;

endmodule // probador
