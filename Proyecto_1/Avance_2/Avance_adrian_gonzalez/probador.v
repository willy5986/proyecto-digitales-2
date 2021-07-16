module probador (
		 output reg 	  cclk,
       output reg      dclk,
		 output reg 	  valid,
		 output reg [7:0] data_in
		 );

   initial begin
      $dumpfile("paralelo_serial.vcd");
      $dumpvars;

      valid = 0;
      data_in = 8'h00;
   end

   initial begin
      #32 @(posedge cclk);
      data_in <= 8'hFF;
      valid <=1;
     
      @(posedge cclk);
      data_in <= 8'hDD;
      
      @(posedge cclk);
      data_in <= 8'hEE;

      @(posedge cclk);
      data_in <= 8'hCC;

      @(posedge cclk);
      data_in <= 8'h00;
      valid <= 0;
      #32 $finish;
  
   end // initial begin

/*
   initial begin
      #8 @(posedge cclk);
      valid <= 1;

      #64 @(posedge cclk);
      valid <= 0;


   end // initial begin
*/

   initial cclk <= 0;
   always #8 cclk <= ~cclk;

   initial dclk <= 0;
   always #1 dclk <= ~dclk;


endmodule // probador
