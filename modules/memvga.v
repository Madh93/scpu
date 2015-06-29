//Memoria de VGA

module memvga(input  wire clk,
               input  wire [3:0] ra,
               output wire [15:0] rd);

  reg [15:0] mem[0:15]; //memoria de 16 palabras (0123456789+-*/=!) de 16 bits de ancho (3*5+1)

  initial
  begin
    $readmemb("/home/alumno/Escritorio/scpu/modules/vga.dat",mem); // inicializa la memoria del fichero en texto binario
  end
  assign rd = mem[a];
endmodule