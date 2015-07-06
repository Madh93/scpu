module printvga(input wire clk, reset, vgae,
                input wire [15:0] e,
                output wire [7:0] vgax, vgay,
                output wire vgaw);


  // reg [7:0] i,j;
  integer i;

  // always @(posedge clock, posedge reset)
  //   if (reset)
  //   begin
  //     i <= 8'b00000000;
  //     j <= 8'b00000000;
  //   end
  //   else if (vgae)
  //   begin
  //     j <= 8'b00000000;
  //   end
  // end

  //0

  initial begin
    for (i=0; i<10; i=i+1) begin
      i=i;
    end
  end



  assign vgax = 8'b00000000;
  assign vgay = 8'b00000000;
  assign vgaw = 1;

  // //1
  // assign vgax = 8'b00000000;
  // assign vgay = 8'b00000001;
  // assign vgaw = 1;

  // //2
  // assign vgax = 8'b00000000;
  // assign vgay = 8'b00000010;
  // assign vgaw = 1;

  // //3
  // assign vgax = 8'b00000001;
  // assign vgay = 8'b00000000;
  // assign vgaw = 1;

  // //4
  // assign vgax = 8'b00000001;
  // assign vgay = 8'b00000001;
  // assign vgaw = 0;

  // //5
  // assign vgax = 8'b00000001;
  // assign vgay = 8'b00000010;
  // assign vgaw = 1;

  // //6
  // assign vgax = 8'b00000010;
  // assign vgay = 8'b00000000;
  // assign vgaw = 1;

  // //7
  // assign vgax = 8'b00000010;
  // assign vgay = 8'b00000001;
  // assign vgaw = 0;

  // //8
  // assign vgax = 8'b00000010;
  // assign vgay = 8'b00000010;
  // assign vgaw = 1;

  // //9
  // assign vgax = 8'b00000011;
  // assign vgay = 8'b00000000;
  // assign vgaw = 1;

  // //10
  // assign vgax = 8'b00000011;
  // assign vgay = 8'b00000001;
  // assign vgaw = 0;

  // //11
  // assign vgax = 8'b00000011;
  // assign vgay = 8'b00000010;
  // assign vgaw = 1;

  // //12
  // assign vgax = 8'b00000100;
  // assign vgay = 8'b00000000;
  // assign vgaw = 1;

  // //13
  // assign vgax = 8'b00000100;
  // assign vgay = 8'b00000001;
  // assign vgaw = 1;

  // //14
  // assign vgax = 8'b00000100;
  // assign vgay = 8'b00000010;
  // assign vgaw = 1;


endmodule // printvga