module probador (
		 output reg 	  aclk,
		 output reg 	  bclk,
		 output reg 	  cclk,
		 output reg 	  valid,
		 output reg [7:0] data_in
		 );

   initial begin
      $dumpfile("demux_L2.vcd");
      $dumpvars;

      valid = 0;
      data_in = 8'h00;
   end

   initial begin
      #1 @(posedge cclk);
      data_in <= 8'hFF;
     
      @(posedge cclk);
      data_in <= 8'hDD;
      
      @(posedge cclk);
      data_in <= 8'hEE;

      @(posedge cclk);
      data_in <= 8'hCC;

      @(posedge cclk);
      data_in <= 8'hBB;

      @(posedge cclk);
      data_in <= 8'h99;

      @(posedge cclk);
      data_in <= 8'hAA;

      @(posedge cclk);
      data_in <= 8'h88;

      #2 @(posedge cclk);
      data_in <= 8'h77;

      @(posedge cclk);
      data_in <= 8'h00;

      #7 $finish;
  
   end // initial begin

   initial begin
      #1 @(posedge cclk);
      valid <= 1;

      #8 @(posedge cclk);
      valid <= 0;

      #1 @(posedge cclk);
      valid <= 1;
      
      @(posedge cclk);
      valid <= 0;
   end // initial begin

   initial aclk <= 0;
   always #2 aclk <= ~aclk;

   initial bclk <= 0;
   always #1 bclk <= ~bclk;

   initial cclk <= 0;
   always #0.5 cclk <= ~cclk;

endmodule // probador
