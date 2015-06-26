module cpu(input wire clk, reset,
        input wire [3:0] e1, 
        input wire [3:0] e2, 
        input wire [1:0] e3,
        input wire [7:0] e4, 
				output wire [7:0] s1,s2,s3,s4, 
        output wire [5:0] opcode, 
				//output wire [2:0] operacion, 
        output wire z);	//añadir nuevas señales y entradas y salidas de los registros

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
  e_s e_s_(clk,rst, sec, rwe1, rwe2, rwe3, rwe4, data_mem, data_reg, e1, e2, e3, e4, id_out, id_in, data_in, s1, s2, s3, s4);

endmodule