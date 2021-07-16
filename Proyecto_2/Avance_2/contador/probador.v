module probador(
		output reg 	 clk,
		output reg 	 rst,
		output reg [9:0] data_in
		); // Primero se define el modulo del creador de todas las
   // señales con todos sus puertos correspondientes

   initial begin
      $dumpfile("contador.vcd");
      $dumpvars;

      rst = 1;
      data_in = 10'b0;
      
   end // En esta parte se va a crear el archivo para hacer la simulacion 
   // en GTkWave y se establecen los valores por defecto de los registros

   initial begin
      @(posedge clk);
      rst <= 0;

      @(posedge clk);
      data_in <= 25;

      
      // Ya puede escribir en memoria
      @(posedge clk);
      data_in <= data_in + 20;
 

      // Ya puede leer y escribir en memoria
      repeat(4) begin
	     @(posedge clk);
	     data_in <= data_in + 20;
      end

      // Ultima escritura y primera lectura "pop"
      @(posedge clk);
      data_in <= 10'b0; // No se escribe

      // Se sigue vaciando la memoria
      repeat(5) begin
         @(posedge clk);

      end

      // Aqui se da un empty
      @(posedge clk);
      data_in <= data_in + 20;

      // Se comienzan a escribir datos
      // para eliminar a empty y llegar a alm_full
      repeat(5) begin
	     @(posedge clk);
	     data_in <= data_in + 20;
      end

      // Se llega a alm_full
      @(posedge clk);
      data_in <= 10'b0; // No se escribe

      #4 $finish;
      
   end // initial begin
   
   initial clk <= 0;
   always #2 clk <= ~clk; // Ahora se crea el reloj y se define su periodo
   
endmodule // probador
