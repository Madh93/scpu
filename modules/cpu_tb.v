`timescale 1 ns /10 ps

`include "alu.v"
`include "componentes.v"
`include "cpu.v"
`include "e_s.v"
`include "memprog.v"
`include "memvga.v"
`include "microc.v"
`include "printvga.v"
`include "regtovga.v"
`include "uc.v"

`include "cpu_vga.v"
`include "vga.v"
`include "stack.v"

module cpu_tb;

  reg clk, reset;
  reg [7:0] e1,e2,e3,e4;
  wire [7:0] s1,s2,s3,s4;
  wire [5:0] opcode;
  wire [2:0] operacion;
  wire z;
  reg vgae;
  wire [7:0] vgax;
  wire [7:0] vgay;
  wire vgaw;

  wire CLOCK;
  wire [3:0] VGA_R;
  wire [3:0] VGA_G;
  wire [3:0] VGA_B;
  wire VGA_VS;
  wire VGA_HS;
  wire VGA_BLANK;
  wire VGA_SYNC;
  wire VGA_CLK;  


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

    $dumpfile("cpu_tb.vcd"); 
    $dumpvars;

    e1 = 8'b00000100; //4
    e2 = 8'b00000011; //3
    e3 = 8'b00000000; //0
    e4 = 8'b00000000; //0

    vgae=0;

    reset = 1;
    #5
    reset = 0;
    #10000

    $finish;
  end

  //cpu cpu_(clk,~reset,vgae,e1,e2,e3,e4,s1,s2,s3,s4,opcode,z);
  

  cpu_vga cpu_vga_(clk,~reset,e1,e2,e3,CLOCK,s1,s2,s3,s4,opcode,z,VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK,VGA_SYNC,VGA_CLK);
  
endmodule