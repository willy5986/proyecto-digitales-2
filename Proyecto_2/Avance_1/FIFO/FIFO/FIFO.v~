module FIFO_cond (clk, wr_enb, rd_enb, rst, data_in, data_out,
		  empty, alm_empty, alm_full);

   // Cada celda va a tener 10 bits de informacion
   parameter RAM_WIDTH = 10;

   // Van a ser 8 celdas en vertical para la memoria
   parameter RAM_DEPTH = 8;

   // Se ocupan 3 bits para definir a cual celda de memoria nos
   // estamos refiriendo porque 2 elevado a la 3 = 8, justamente
   // las 8 celdas de memoria que poseemos
   parameter PTR_SIZE = 3;

   input clk, wr_enb, rd_enb, rst;
   input [RAM_WIDTH-1:0] data_in;

   // Los punteros que diran a cual celda de memoria debemos escribir
   // o leer
   reg [PTR_SIZE-1:0] 	 rd_ptr, wr_ptr;

   // Señales de control que van a ser transmitidas al arbitro
   output reg		 empty, alm_empty, alm_full;

   // Los datos de salida cuando halla una señal de read o "pop"
   output reg [RAM_WIDTH-1:0] data_out;

   ////////////////////////////////////////////////////////
   // Esta es la memoria sobre la que se trabaja
   reg [RAM_WIDTH-1:0] 	      mem[RAM_DEPTH-1:0];
   ////////////////////////////////////////////////////////
   
   integer 		      i;


   // Aqui se definen las señales de control que va a ocupar el arbitro
   always @(posedge clk) begin

      // Evalua señal empty
      if ( ((wr_ptr - rd_ptr + RAM_DEPTH) % RAM_DEPTH) == 0 )
	empty <= 1;
      else
	empty <= 0;

      // Evalua señal almost empty
      if ( ((wr_ptr - rd_ptr + RAM_DEPTH) % RAM_DEPTH) == 1 | ((wr_ptr - rd_ptr + RAM_DEPTH) % RAM_DEPTH) == 2 )
	alm_empty <= 1;
      else
	alm_empty <= 0;

      // Evalua señal almost full
      if ( ((wr_ptr - rd_ptr + RAM_DEPTH) % RAM_DEPTH) >= 6 )
	alm_full <= 1;
      else
	alm_full <= 0;
   end // always @ (posedge clk)

   // Escritura (push) o lectura (pop) sobre memoria
   always @(posedge clk) begin

      // Se colocan todos los datos de la memoria con valor inicial de 0,
      // asi como los ptr en posicion inicial
      if (rst) begin
	 for (i=0; i<RAM_DEPTH; i=i+1)
	   mem[i] <= 0;
	 data_out <= 0;
	 wr_ptr <= 0;
	 rd_ptr <= 0;
      end

      // Se escribe (push) o lee (pop) sobre campos de la memoria
      else begin
	 
	 // Escritura o "push"
	 if (wr_enb) begin
	    mem[wr_ptr] <= data_in;
	    wr_ptr <= wr_ptr + 1; // Se incrementa la direc del wr_ptr
	 end

	 // Lectura o "pop"
	 if (rd_enb) begin
	    data_out <= mem[rd_ptr];
	    mem[rd_ptr] <= 0; // El dato leido debe ser expulsado
	    // porque es un "pop"
	    rd_ptr <= rd_ptr + 1; // Se incrementa la direc del rd_ptr
	 end
	 
      end // else: !if(rst)
   end // always @ (posedge clk)

endmodule // FIFO_cond
