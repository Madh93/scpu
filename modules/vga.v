module vga(
            input reset, clock,
            input wire [2:0] colour,
            input wire [7:0] x,
            input wire [6:0] y,
            input plot,
            output [3:0] VGA_R, VGA_G, VGA_B,
            output VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK);

  vga_adapter VGA_ADAPTER(
        .resetn(reset),
        .clock(clock),
        .colour(colour),  //1 o 0 que lea desde la memoria
        // .x(x),  //salida2
        .x(x),  //salida2
        // .y(y),  //salida3
        .y(y),  //salida3
        // .plot(~(KEY[1])), //salida4 (equivalente al enable)
        .plot(plot), //salida4 (equivalente al enable)
        /* Signals for the DAC to drive the monitor. */
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS));

endmodule
