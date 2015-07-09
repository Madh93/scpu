module vga(
            input reset, clock,
            input wire colour,
            input wire [7:0] x,
            input wire [6:0] y,
            input wire [7:0] pos,
            input plot,
            output [3:0] VGA_R, VGA_G, VGA_B,
            output VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK);


  // wire [7:0] x_;
  // wire [6:0] y_;
  // assign x_ = x + 8;  // Comenzar dentro de los margenes
  // assign y_ = y + 20;


  wire [7:0] x_;
  wire [6:0] y_;
  wire [2:0] colour_;

  assign x_ = x + 10 + ((pos%5)*8'b00000101);//+ 8'b00011000;  // Comenzar dentro de los margenes
  assign y_ = y + 25;// + ((pos/8'b00000101)*10);
  assign colour_ = (colour == 1) ? 3'b011 : 3'b000;


  // reg [7:0] contador;

  // always @(posedge clock, posedge reset)
  //   if (reset) contador <= 8'b00000000;
  //   else       contador <= contador + 8'b00000001;  


  vga_adapter VGA_ADAPTER(
        .resetn(reset),
        .clock(clock),
        .colour(colour_),  //1 o 0 que lea desde la memoria
        // .x(x),  //salida2
        .x(x_),  //salida2
        // .y(y),  //salida3
        .y(y_),  //salida3
        // .plot(~(KEY[1])), //salida4 (equivalente al enable)
        .plot(plot), //salida4 (equivalente al enable)
        /* Signals for the DAC to drive the monitor. */
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS));

endmodule
