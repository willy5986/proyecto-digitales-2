module probador(
		output reg 	 clk,
		output reg 	 rst,
		output reg 	 wr_enb,
		output reg 	 rd_enb,
		output reg [2:0] wr_ptr,
		output reg [2:0] rd_ptr,
		output reg [9:0] data_in
		); // Primero se define el modulo del creador de todas las
   // señales con todos sus puertos correspondientes

   initial begin
      $dumpfile("memory.vcd");
      $dumpvars;

      rst = 1;
      wr_enb = 0;
      rd_enb = 0;
      wr_ptr = 3'b0;
      rd_ptr = 3'b0;
      data_in = 10'b0;
      
   end // En esta parte se va a crear el archivo para hacer la simulacion 
   // en GTkWave y se establecen los valores por defecto de los registros

   initial begin
      @(posedge clk);
      rst <= 0;
      data_in <= 25;
      wr_enb <= 1;
      
      // Ya puede escribir en memoria
      @(posedge clk);
      data_in <= data_in + 20;
      rd_enb <= 1;
      wr_ptr <= wr_ptr + 1;

      // Ya puede leer y escribir en memoria
      repeat(6) begin
	 @(posedge clk);
	 data_in <= data_in + 20;
	 wr_ptr <= wr_ptr + 1;
	 rd_ptr <= rd_ptr + 1;
      end

      // Ultima escritura
      @(posedge clk);
      wr_enb <= 0;
      data_in <= 10'b0;
      wr_ptr <= wr_ptr + 1;
      rd_ptr <= rd_ptr + 1;

      // Ultima lectura
      @(posedge clk);
      rd_enb <= 0;
      rd_ptr <= rd_ptr + 1;

      #4 $finish;
      
   end // initial begin
   
   initial clk <= 0;
   always #2 clk <= ~clk; // Ahora se crea el reloj y se define su periodo
   
endmodule // probador
