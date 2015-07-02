`timescale 1 ns /10 ps

`include "alu.v"
`include "componentes.v"
`include "cpu.v"
`include "cpu_vga.v"
`include "e_s.v"
`include "memprog.v"
`include "memvga.v"
`include "microc.v"
`include "uc.v"
// `include "vga.v"

module cpu_vga_tb;

  reg clk, reset;
  reg [7:0] e1,e2,e3,e4;
  wire [7:0] s1,s2,s3,s4;
  wire [5:0] opcode;
  wire [2:0] operacion;
  wire z;



  always 
  begin
    clk = 1;
    #20;
    clk = 0;
    #60;
  end

  initial
  begin
    $monitor("time: %0d, clk: %b, reset: %b", $time, clk, reset);

    $dumpfile("cpu_vga_tb.vcd"); 
    $dumpvars;

    e1 = 8'b00000011; //1
    e2 = 8'b00000011; //8
    e3 = 8'b00000001; //5
    e4 = 8'b00000000; //128

    reset = 1;
    #5
    reset = 0;
    #5000

    $finish;
  end


// input wire clk, reset,
//         input wire [3:0] e1, 
//         input wire [3:0] e2, 
//         input wire [1:0] e3,
//         input wire [7:0] e4,
//         input VGA_CLOCK, 
//         output wire [7:0] s1,s2,s3,s4, 
//         output wire [5:0] opcode, 
//         output wire z,  //añadir nue


  cpu_vga cpu_vga_(
                    .clk      (clk),
                    .reset    (e4),
                    .e1       (e1),
                    .e2       (e2),
                    .e3       (e3),
                    .e4       (e4),
                    .s1       (s1),
                    .s2       (s2),
                    .s3       (s3),
                    .s4       (s4),
                    .opcode   (opcode),
                    .z        (z));

endmodule