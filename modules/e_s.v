module e_s(input wire clk, reset, sec, rwe1, rwe2, rwe3, rwe4, input wire [7:0] data_mem, data_reg, in1, in2, in3, in4, input wire [1:0] id_out, id_in, output wire [7:0] data_in, out1, out2, out3, out4);

  //Cables nuevos para E/S
  wire [7:0] mux_reg1, mux_reg2, mux_reg3, mux_reg4;

  //Instancias
  mux_in #(8) mux_entrada(in1,in2,in3,in4,id_in,data_in);
  mux_out #(8) mux_salida(data_mem,data_reg,sec,id_out,mux_reg1, mux_reg2, mux_reg3, mux_reg4);

  reg_e #(8) sal1(clk, reset, rwe1, mux_reg1, out1);
  reg_e #(8) sal2(clk, reset, rwe2, mux_reg2, out2);
  reg_e #(8) sal3(clk, reset, rwe3, mux_reg3, out3);
  reg_e #(8) sal4(clk, reset, rwe4, mux_reg4, out4);

endmodule