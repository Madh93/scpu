//Componentes varios

//Banco de registros de dos salidas y una entrada
module regfile(input  wire        clk, 
               input  wire        we3,           //se�al de habilitaci�n de escritura
               input  wire [3:0]  ra1, ra2, wa3, //direcciones de regs leidos y reg a escribir
               input  wire [7:0]  wd3, 			 //dato a escribir
               output wire [7:0]  rd1, rd2);     //datos leidos

  reg [7:0] regb[0:15]; //memoria de 16 registros de 8 bits de ancho

  // El registro 0 siempre es cero
  // se leen dos reg combinacionalmente
  // y la escritura del tercero ocurre en flanco de subida del reloj
  always @(posedge clk)
    if (we3) regb[wa3] <= wd3;	
  
  assign rd1 = (ra1 != 0) ? regb[ra1] : 0;
  assign rd2 = (ra2 != 0) ? regb[ra2] : 0;
endmodule

//modulo sumador  
module sum(input  wire [9:0] a, b,
             output wire [9:0] y);

  assign y = a + b;
endmodule

//modulo de registro para modelar el PC, cambia en cada flanco de subida de reloj o de reset
module registro #(parameter WIDTH = 8)
              (input  wire             clk, reset,
               input  wire [WIDTH-1:0] d, 
               output reg  [WIDTH-1:0] q);

  always @(posedge clk, posedge reset)
    if (reset) q <= 0;
    else       q <= d;
endmodule

module retorno_reg #(parameter WIDTH = 10)
              (input  wire             swe, reset,
               input  wire [WIDTH-1:0] d, 
               output reg  [WIDTH-1:0] q);

  always @(posedge swe, posedge reset)
    if (reset) q <= 0;
    else       q <= d;
endmodule

//modulo multiplexor, cos s=1 sale d1, s=0 sale d0
module mux1 #(parameter WIDTH = 10)
             (input  wire [WIDTH-1:0] d0, d1, 
              input  wire             s, 
              output wire [WIDTH-1:0] y);

  assign y = s ? d1 : d0; 
endmodule


//modulo multiplexor, cos s=1 sale d1, s=0 sale d0
module mux2 #(parameter WIDTH = 8)
             (input  wire [WIDTH-1:0] d0, d1, 
              input  wire             s, 
              output wire [WIDTH-1:0] y);

  assign y = s ? d1 : d0; 
endmodule


/// ENTRADA/SALIDA

//modulo de registro activable de E/S
module reg_e #(parameter WIDTH = 8)
              (input  wire             clk, reset, rwe,
               input  wire [WIDTH-1:0] d, 
               output reg  [WIDTH-1:0] q);

  //$display("******: %d", d);

  always @(*)
    if (reset) q <= 0;
    else if (rwe) q <= d;
endmodule


//modulo multiplexor de entrada 4-1 al MicroC
module mux_in #(parameter WIDTH = 8)
             (input  wire [WIDTH-1:0] d0, d1, d2, d3, 
              input  wire [1:0]            s, 
              output wire [WIDTH-1:0] y);

    reg [7:0] aux;

    always @(d0,d1,d2,d3,s)
    begin
      case (s)              
        2'b00: aux = d0;
        2'b01: aux = d1;
        2'b10: aux = d2;
        2'b11: aux = d3;
        default: aux = 'bx; //desconocido en cualquier otro caso (x � z), por si se modifica el c�digo
      endcase
    end                 

  assign y = aux; 
endmodule


//modulo multiplexor de entrada 2-4 del MicroC
module mux_out #(parameter WIDTH = 8)
             (input  wire [WIDTH-1:0] e0, e1, 
              input  wire             s, 
              input  wire [1:0]       reg_, 
              output reg [WIDTH-1:0] d0, d1, d2, d3 );

  wire [7:0] aux;   
  assign aux = s ? e1 : e0;

  always @(reg_,aux)
  begin
    case (reg_)              
      2'b00: d0 = aux;
      2'b01: d1 = aux;
      2'b10: d2 = aux;
      2'b11: d3 = aux;
      //default: d0 = 'bx; d1 = 'bx; d2 = 'bx; d3 = 'bx;//desconocido en cualquier otro caso (x � z), por si se modifica el c�digo
    endcase
  end


endmodule