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

    e1 = 8'b00000011; //1
    e2 = 8'b00000011; //8
    e3 = 8'b00000000; //5
    e4 = 8'b00000000; //128

    vgae=0;

    reset = 1;
    #5
    reset = 0;
    #5000

    $finish;
  end

  cpu cpu_(clk,~reset,vgae,e1,e2,e3,e4,s1,s2,s3,s4,vgax,vgay,vgaw,opcode,z);
endmodule