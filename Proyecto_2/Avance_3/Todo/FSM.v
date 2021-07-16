module FSM (input clk,
	    input 	     init,
	    input 	     rst,
	    input [7:0]      FIFO_empties,
	    input [4:0]      umbral_entrada_empty,
	    input [4:0]      umbral_entrada_full,
	    output reg [4:0] umbral_empty,
	    output reg [4:0] umbral_full,
	    output reg [3:0] estado,
	    output reg [3:0] estado_proximo,
	    output reg 	     idle
	    );

   //FIFO_empties tiene en cada bit la salida empty de uno de los FIFOs, esto se necesita hacer en el codigo general

   //reg[3:0] estado, estado_proximo;
   parameter RESET = 1;
   parameter INIT = 2;
   parameter IDLE = 4;
   parameter ACTIVE = 8;

   always @ (posedge clk) begin
      if (rst) begin
	 estado<= RESET;
	 umbral_empty <= 0;
	 umbral_full <= 8;
      end
      else begin
	 estado<= estado_proximo;
      end
   end
   always @ (*) begin

      idle = 0;
      estado_proximo= estado;
      case (estado)

	RESET: begin
	   if (init)
	     estado_proximo= INIT;
	end

	INIT: begin
	   umbral_empty = umbral_entrada_empty;
	   umbral_full = umbral_entrada_full;
	   if (FIFO_empties == 7)
	     estado_proximo= IDLE;
	end

	IDLE: begin
	   idle = 1;

	   if (init)
	     estado_proximo= INIT;


	   else 
	     if (FIFO_empties != 7) 
	       estado_proximo = ACTIVE;

	end

	ACTIVE: begin

	   if (init)
	     estado_proximo= INIT;
	   else 
	     if (FIFO_empties == 7)
	       estado_proximo= IDLE;

	end


	default:
	  estado_proximo= RESET;
      endcase
   end
endmodule // FSM
