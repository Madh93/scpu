module cpu(input wire clk, reset,
        input wire [3:0] e1, 
        input wire [3:0] e2, 
        input wire [1:0] e3,
        input wire [7:0] e4,
        input wire VGA_CLOCK, 
				output wire [7:0] s1,s2,s3,s4, 
        output wire [5:0] opcode, 
				//output wire [2:0] operacion, 
        output wire z,	//añadir nuevas señales y entradas y salidas de los registros
        output wire [3:0] VGA_R,
        output wire [3:0] VGA_G,
        output wire [3:0] VGA_B,
        output wire VGA_VS,
        output wire VGA_HS,
        output wire VGA_BLANK,
        output wire VGA_SYNC,
        output wire VGA_CLK);       

  // Cables
  wire sinc, sinm, we3, rwe1, rwe2, rwe3, rwe4, sec, s_es, s_rel, swe, s_ret;
  wire [1:0] id_in, id_out;
  wire [2:0] op;
  wire [7:0] data_mem, data_reg, data_in;
  wire rst;

  assign rst = ~reset;
  //assign operacion = e3[1:0];

  // Instancias
  uc uc_(clk, rst, z, id_out, opcode, sinc, sinm, we3, rwe1, rwe2, rwe3, rwe4, sec, s_es, s_rel, swe, s_ret, op);
  microc microc_(clk, rst, sinc, sinm, we3, s_es, s_rel, swe, s_ret, op, data_in, z, opcode, data_mem, data_reg, id_in, id_out);
  e_s e_s_(clk, rst, sec, rwe1, rwe2, rwe3, rwe4, data_mem, data_reg, e1, e2, e3, e4, id_out, id_in, data_in, s1, s2, s3, s4);


  // VGA
  vga_adapter VGA1(
        .resetn(rst),
        .clock(VGA_CLOCK),
        .colour(3'b000),  //1 o 0 que lea desde la memoria
        // .x(x),  //salida2
        .x(1),  //salida2
        // .y(y),  //salida3
        .y(1),  //salida3
        // .plot(~(KEY[1])), //salida4 (equivalente al enable)
        .plot(0), //salida4 (equivalente al enable)
        /* Signals for the DAC to drive the monitor. */
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS));

endmodule