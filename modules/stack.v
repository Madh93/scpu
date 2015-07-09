module stack(dataIO, reset, push, pop, 
              SP, full, empty, err); 

  // Declare input, output and inout ports
  inout [9:0] dataIO; 
  input push, pop, reset;
  output full, empty, err;
  output [1:0] SP;

  // Declare registers
  reg full, empty, err;
  reg [1:0] SP;
  reg [9:0] stack [3:0];
  reg [9:0] dataR;

  //Continous assignment of dataIO to dataR register, with delay 0
  wire [9:0]  #(0) dataIO = dataR;



  always @(posedge push or posedge pop or posedge reset) 
  begin

    if (push == 1)
    begin
      //WHen the stack is empty
      if (empty == 1)
      begin
        stack[SP] = dataIO;
        empty = 0;
        if (err == 1)
          err = 0;
      end
      else if (full == 1) //When the stack is full
      begin
        stack[SP] = dataIO;
        err = 1;
      end
      else
      begin
        SP = SP + 1;
        stack[SP] = dataIO;
        if (SP == 2'b11)
          full = 1;
      end
    end


    if (pop == 1) //if SP indicates the last location but
    begin             // the stack is not empty 
      if ((SP == 2'b00) && (empty != 1))
      begin
        dataR = stack[SP];
        empty = 1;
      end
      else if (empty == 1) //When the stack is empty
      begin
        dataR = stack[SP];
        err = 1;
      end
      else
      begin
        dataR = stack[SP];
        if (SP != 2'b00)
          SP = SP - 1;
        //if the stack is full
        if (err == 1)  err = 0;
        if (full == 1)  full = 0;
      end
    end


    if (reset == 1)
    begin
      dataR = 10'bzzzzzzzzzz;
      SP = 2'b00;
      full = 0;
      empty = 0;
      err = 0;
    end

  end


  always @(negedge pop)
  begin
    dataR = 10'bzzzzzzzzzz;
  end  


endmodule // stack  