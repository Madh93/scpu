module microc(input wire clk, reset, s_inc, s_inm, we3, s_es, s_rel, swe, s_ret, input wire [2:0] op, input wire [7:0] data_in,
              output wire z, output wire [5:0] opcode, output wire [7:0] data_mem, data_reg, output wire [1:0] id_in, id_out);  //Es necesario añadir nuevas señales de control

  //Cables
  wire [9:0] mux1_pc;
  wire [9:0] pc_memprog;	//tambien va a sum
  wire [9:0] sum_mux1;
  wire [15:0] memprog;	// va a los 2 multiplexores y al banco de registros
  wire [7:0] rd1,rd2,wd3;
  wire [7:0] alu_mux2;
  wire zero;

  //Nuevos cables de E/S
  wire [7:0] mux2_out;

  //Nuevos cables adicionales
  wire [9:0] mux4_sum, sub_mux5, mux5_pc, mux_subreg;

  //Cables VGA
  wire [3:0] num;  
  wire [15:0] num_vga;


// reg [9:0] DataR;  
// reg Push, Pop, Reset;  
// wire Full, Empty, Err;  
// wire [1:0] SP;  
/*
 continuous assignment of DataIO to  
DataR register, with delay 0 *
*/ 
wire [9:0] #(0) DataIO = DataR;  


  //Enviar opcode a la UC
  assign opcode = memprog[5:0];

  //Asignaciones de la E/S
  assign data_mem = memprog[11:4];
  assign data_reg = rd1;
  assign id_out = memprog[15:14];
  assign id_in = memprog[5:4];

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //Creación de instancias	
  mux1 #(10) mux1_(memprog[15:6], sum_mux1, s_inc, mux1_pc); 
  registro #(10) PC_(clk, reset, mux5_pc, pc_memprog);
  sum sumador_(mux4_sum, pc_memprog, sum_mux1);
  memprog memoria_(clk, pc_memprog, memprog);
  regfile banco_(clk, we3, memprog[7:4], memprog[11:8], memprog[15:12], wd3, rd1, rd2);
  alu alu_(rd1, rd2, op, alu_mux2, zero);
  mux2 #(8) mux2_(alu_mux2, memprog[11:4], s_inm, mux2_out); //cambiar salida wd3 por mux2_out
  registro #(1) ffzero(clk, reset, zero, z);



  //EntradaSalida
  mux2 #(8) mux3_(mux2_out,data_in,s_es,wd3);

  
  //Adicionales
  mux1 #(10) mux4_(1, memprog[15:6], s_rel, mux4_sum);
  
  retorno_reg #(10) sub_reg(swe, reset, mux_subreg, sub_mux5);
  // retorno_reg #(10) sub_reg(push, pop, reset, mux_subreg, sub_mux5);
  //stack stack_(mux_subreg, reset, swe, s_ret, SP, full, empty, err); 


  mux1 #(10) mux5_(mux1_pc, sub_mux5, s_ret, mux5_pc);
  // mux1 #(10) mux5_(mux1_pc, DataR, s_ret, mux5_pc);
  sum sumador2(1, pc_memprog, mux_subreg);


  //Controlar VGA
  //regtovga regtovga_(clk, vgae2, rd1, num);
  //memvga memvga_(clk, s42[4:0], e4);
  //printvga printvga_(clk, reset, vgae2, num_vga, vgax, vgay, vgaw);  

endmodule