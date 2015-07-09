//Memoria de VGA

module memvga(input  wire clk,
               input  wire [4:0] ra,
               output wire [7:0] rd);

  reg [7:0] mem[0:31]; //memoria de 32 palabras (0123456789+-*/=!) de 8 bits de ancho (3*5+1)/2

  initial
  begin
    $readmemb("/home/alumno/Escritorio/scpu/modules/vga.dat",mem); // inicializa la memoria del fichero en texto binario
    // $readmemb("/home/migue/Escritorio/scpu/modules/vga.dat",mem); // inicializa la memoria del fichero en texto binario
  end
  assign rd = mem[ra];

        


endmodule