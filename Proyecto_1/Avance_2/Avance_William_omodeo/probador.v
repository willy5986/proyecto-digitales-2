module probador(
	input [7:0] data_out, 
	//input [7:0] data_out_cond,
	output reg clk_4f,
	output reg clk_32f,
	output reg active
	);

	reg[7:0] com;
	reg[7:0] idl;
	//reg clk_4f;
	//reg clk_32f;
	
   initial begin
      $dumpfile("paralelo_serial_phy_rx.vcd");
      $dumpvars;

	$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b\t%b", clk_4f, clk_32f, active, com, idl, data_out);
	com <= 8'b00000000;
	idl <= 8'b00000000;
      	active <= 1'b0;
   //end
   //initial begin

      @(posedge clk_32f);
      active <= 1'b0;
	com <= 8'b10111100;
	idl <= 8'b00000000;
      @(posedge clk_32f);
      active <= 1'b0;
	com <= 8'b10111100;
	idl <= 8'b00000000;
      @(posedge clk_32f);
      active <= 1'b0;
	com <= 8'b10111100;
	idl <= 8'b00000000;
      @(posedge clk_32f);
      active <= 1'b0;
	com <= 8'b10111100;
	idl <= 8'b00000000;

      @(posedge clk_32f);
      active <= 1'b1;
	com <= 8'b00000000;
	idl <= 8'b01111100;
      @(posedge clk_32f);
      active <= 1'b1;
	com <= 8'b00000000;
	idl <= 8'b01111100;
      @(posedge clk_32f);
      active <= 1'b1;
	com <= 8'b00000000;
	idl <= 8'b01111100;
      @(posedge clk_32f);
      active <= 1'b1;
  	com <= 8'b00000000;
	idl <= 8'b01111100;
     $finish;
   end

	initial	clk_4f 	<= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always	#4 clk_4f <= ~clk_4f;		// Hace "toggle" cada 2*10ns

	initial	clk_32f <= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always	#0.5 clk_32f <= ~clk_32f;

endmodule

			
