module cpu_vga(
        input wire clk, reset,
        //input wire vgae,
        input wire [3:0] e1, 
        input wire [3:0] e2, 
        input wire [1:0] e3,
        // input wire [7:0] e4,
        input VGA_CLOCK, 
        output wire [7:0] s1,s2,s3,s4, 
        output wire [5:0] opcode, 
        output wire z,  //añadir nuevas señales y entradas y salidas de los registros
        output [3:0] VGA_R,
        output [3:0] VGA_G,
        output [3:0] VGA_B,
        output VGA_VS,
        output VGA_HS,
        output VGA_BLANK,
        output VGA_SYNC,
        output VGA_CLK);


  wire [7:0] e4;     


  cpu cpu_(clk, reset, e1, e2, e3, e4, s1, s2, s3, s4, opcode, z);

  // vga vga_(reset, VGA_CLOCK, 0, 1, 1, 0, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK);

  vga vga_(
        .reset(reset),
        .clock(VGA_CLOCK),
        .colour(3'b011),  //1 o 0 que lea desde la memoria
        .x(s1),  //salida2
        // .y(s2[6:0]),  //salida3
        .y(s2[6:0]),  //salida3
        .plot(s3[0]), //salida4 (equivalente al enable)
        // Signals for the DAC to drive the monitor.
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS));

    memvga memvga_(clk, s4[4:0], e4);

endmodule