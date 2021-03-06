module probador(
		output reg 	 clk,
		output reg 	 rst,
		output reg [3:0] Estadoa,
		output reg [3:0] Estadob,
		output reg [2:0] umbral,
		output reg 	 wr_enb_FIFOE_0,
		output reg 	 wr_enb_FIFOE_1,
		output reg 	 wr_enb_FIFOE_2,
		output reg 	 wr_enb_FIFOE_3,
		output reg 	 rd_enb_FIFOS_0,
		output reg 	 rd_enb_FIFOS_1,
		output reg 	 rd_enb_FIFOS_2,
		output reg 	 rd_enb_FIFOS_3,
		output reg [9:0] data_in_FIFOE_0,
		output reg [9:0] data_in_FIFOE_1,
		output reg [9:0] data_in_FIFOE_2,
		output reg [9:0] data_in_FIFOE_3
		); // Primero se define el modulo del creador de todas las
   // señales con todos sus puertos correspondientes

   initial begin
      $dumpfile("Todo.vcd");
      $dumpvars;

      rst = 1;
      wr_enb_FIFOE_0 = 0;
      wr_enb_FIFOE_1 = 0;
      wr_enb_FIFOE_2 = 0;
      wr_enb_FIFOE_3 = 0;
      rd_enb_FIFOS_0 = 0;
      rd_enb_FIFOS_1 = 0;
      rd_enb_FIFOS_2 = 0;
      rd_enb_FIFOS_3 = 0;
      data_in_FIFOE_0 = 10'b0;
      data_in_FIFOE_1 = 10'b0;
      data_in_FIFOE_2 = 10'b0;
      data_in_FIFOE_3 = 10'b0;
      
   end // En esta parte se va a crear el archivo para hacer la simulacion 
   // en GTkWave y se establecen los valores por defecto de los registros

   initial begin
      @(posedge clk);
      rst <= 0;
      umbral <= 7;
      Estadoa <= 1;
      Estadob <= 1;

      @(posedge clk);
      Estadoa <= 2;
      Estadob <= 2;

      @(posedge clk);
      umbral <= 5;

      @(posedge clk);
      umbral <= 6;
      Estadoa <= 4;
      Estadob <= 4;
      
      @(posedge clk);
      data_in_FIFOE_0 <= 10'b0010101010;
      wr_enb_FIFOE_0 <= 1;

      data_in_FIFOE_1 <= 10'b0111101010;
      wr_enb_FIFOE_1 <= 1;

      data_in_FIFOE_2 <= 10'b1010111110;
      wr_enb_FIFOE_2 <= 1;

      data_in_FIFOE_3 <= 10'b1110101110;
      wr_enb_FIFOE_3 <= 1;

      @(posedge clk);
      data_in_FIFOE_0 <= data_in_FIFOE_0 + 1;
      data_in_FIFOE_1 <= data_in_FIFOE_1 + 1;
      data_in_FIFOE_2 <= data_in_FIFOE_2 + 1;
      data_in_FIFOE_3 <= data_in_FIFOE_3 + 1;

      @(posedge clk);
      Estadoa <= 8;
      Estadob <= 8;
      data_in_FIFOE_0 <= data_in_FIFOE_0 + 1;
      data_in_FIFOE_1 <= data_in_FIFOE_1 + 1;
      data_in_FIFOE_2 <= data_in_FIFOE_2 + 1;
      data_in_FIFOE_3 <= data_in_FIFOE_3 + 1;
      
      repeat(3) begin
	 @(posedge clk);
	 data_in_FIFOE_0 <= data_in_FIFOE_0 + 1;
	 data_in_FIFOE_1 <= data_in_FIFOE_1 + 1;
	 data_in_FIFOE_2 <= data_in_FIFOE_2 + 1;
	 data_in_FIFOE_3 <= data_in_FIFOE_3 + 1;
      end

      @(posedge clk);
      wr_enb_FIFOE_0 <= 0;
      wr_enb_FIFOE_1 <= 0;
      wr_enb_FIFOE_2 <= 0;
      wr_enb_FIFOE_3 <= 0;

      //Alm_full FIFOS_0
      #16 @(posedge clk);
      rd_enb_FIFOS_0 <= 1;

      @(posedge clk);
      rd_enb_FIFOS_0 <= 0;

      //Alm_full FIFOS_1
      #28 @(posedge clk);
      rd_enb_FIFOS_1 <= 1;

      @(posedge clk);
      rd_enb_FIFOS_1 <= 0;

      //Alm_full FIFOS_2
      #28 @(posedge clk);
      rd_enb_FIFOS_2 <= 1;

      @(posedge clk);
      rd_enb_FIFOS_2 <= 0;

      //Alm_full FIFOS_3
      #24 @(posedge clk);
      data_in_FIFOE_0 <= 10'b0010111010;
      wr_enb_FIFOE_0 <= 1;

      data_in_FIFOE_1 <= 10'b0111101011;
      wr_enb_FIFOE_1 <= 1;

      data_in_FIFOE_2 <= 10'b1010111110;
      wr_enb_FIFOE_2 <= 1;

      data_in_FIFOE_3 <= 10'b1111101110;
      wr_enb_FIFOE_3 <= 1;

      repeat(5) begin
	 @(posedge clk);
	 data_in_FIFOE_0 <= data_in_FIFOE_0 + 1;
	 data_in_FIFOE_1 <= data_in_FIFOE_1 + 1;
	 data_in_FIFOE_2 <= data_in_FIFOE_2 + 1;
	 data_in_FIFOE_3 <= data_in_FIFOE_3 + 1;
      end

      @(posedge clk);
      wr_enb_FIFOE_0 <= 0;
      wr_enb_FIFOE_1 <= 0;
      wr_enb_FIFOE_2 <= 0;
      wr_enb_FIFOE_3 <= 0;

      rd_enb_FIFOS_0 <= 1;
      rd_enb_FIFOS_1 <= 1;
      rd_enb_FIFOS_2 <= 1;
      rd_enb_FIFOS_3 <= 1;

      #132 @(posedge clk);
      Estadoa <= 4;
      Estadob <= 4;
      data_in_FIFOE_0 <= data_in_FIFOE_0 + 1;
      data_in_FIFOE_1 <= data_in_FIFOE_0 + 2;
      data_in_FIFOE_2 <= data_in_FIFOE_0 + 0;
      data_in_FIFOE_3 <= data_in_FIFOE_0 + 3;

      wr_enb_FIFOE_0 <= 1;
      wr_enb_FIFOE_1 <= 1;
      wr_enb_FIFOE_2 <= 1;
      wr_enb_FIFOE_3 <= 1;
      
      @(posedge clk);
      data_in_FIFOE_0 <= data_in_FIFOE_0 + 10'b0100000001;
      data_in_FIFOE_1 <= data_in_FIFOE_1 + 10'b0100000001;
      data_in_FIFOE_2 <= data_in_FIFOE_2 + 10'b0100000001;
      data_in_FIFOE_3 <= data_in_FIFOE_3 + 10'b0100000001;

      @(posedge clk);
      Estadoa <= 8;
      Estadob <= 8;
      data_in_FIFOE_0 <= data_in_FIFOE_0 + 10'b0100000001;
      data_in_FIFOE_1 <= data_in_FIFOE_1 + 10'b0100000001;
      data_in_FIFOE_2 <= data_in_FIFOE_2 + 10'b0100000001;
      data_in_FIFOE_3 <= data_in_FIFOE_3 + 10'b0100000001;

      @(posedge clk);
      data_in_FIFOE_0 <= data_in_FIFOE_0 + 10'b0100000001;
      data_in_FIFOE_1 <= data_in_FIFOE_1 + 10'b0100000001;
      data_in_FIFOE_2 <= data_in_FIFOE_2 + 10'b0100000001;
      data_in_FIFOE_3 <= data_in_FIFOE_3 + 10'b0100000001;

      @(posedge clk);
      wr_enb_FIFOE_0 <= 0;
      wr_enb_FIFOE_1 <= 0;
      wr_enb_FIFOE_2 <= 0;
      wr_enb_FIFOE_3 <= 0;

      #84 @(posedge clk);
      Estadoa <= 4;
      Estadob <= 4;
      
      #12 $finish;
      
   end // initial begin
   
   initial clk <= 0;
   always #2 clk <= ~clk; // Ahora se crea el reloj y se define su periodo
   
endmodule // probador
