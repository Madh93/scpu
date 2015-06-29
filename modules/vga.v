  vga_adapter VGA1(
        .resetn(0),
        .clock(VGA_CLOCK),
        .colour(1),  //1 o 0 que lea desde la memoria
        // .x(x),  //salida2
        .x(20),  //salida2
        // .y(y),  //salida3
        .y(20),  //salida3
        // .plot(~(KEY[1])), //salida4 (equivalente al enable)
        .plot(1), //salida4 (equivalente al enable)
        /* Signals for the DAC to drive the monitor. */
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS));


module vga(
    input wire clk,
    );



module vga(CLOCK_50, SW, KEY,
                VGA_R, VGA_G, VGA_B,
                VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK);
    
    input CLOCK_50; 
    input [9:0] SW;
    input [1:0] KEY;
    output [3:0] VGA_R;
    output [3:0] VGA_G;
    output [3:0] VGA_B;
    output VGA_HS;
    output VGA_VS;
    output VGA_BLANK;
    output VGA_SYNC;
    output VGA_CLK; 
    
    wire [2:0] colour;
    wire [7:0] x;
    wire [6:0] y;
    
    assign colour = 3'b101; //101 magenta
    assign x = {3'd0, SW[9:5]};
    assign y = {2'd0, SW[4:0]};

    vga_adapter VGA1(
            .resetn(KEY[0]),
            .clock(CLOCK_50),
            .colour(colour),
            .x(x),
            .y(y),
            .plot(~(KEY[1])),
            /* Signals for the DAC to drive the monitor. */
            .VGA_R(VGA_R),
            .VGA_G(VGA_G),
            .VGA_B(VGA_B),
            .VGA_HS(VGA_HS),
            .VGA_VS(VGA_VS));
/*
    vga_adapter VGA2(
            .resetn(KEY[0]),
            .clock(CLOCK_50),
            .colour(colour),
            .x(10),
            .y(12),
            .plot(~(KEY[1])),
             // Signals for the DAC to drive the monitor. 
            .VGA_R(VGA_R),
            .VGA_G(VGA_G),
            .VGA_B(VGA_B),
            .VGA_HS(VGA_HS),
            .VGA_VS(VGA_VS));

    vga_adapter VGA3(
            .resetn(KEY[0]),
            .clock(CLOCK_50),
            .colour(colour),
            .x(11),
            .y(12),
            .plot(~(KEY[1])),
             // Signals for the DAC to drive the monitor. 
            .VGA_R(VGA_R),
            .VGA_G(VGA_G),
            .VGA_B(VGA_B),
            .VGA_HS(VGA_HS),
            .VGA_VS(VGA_VS));

    vga_adapter VGA4(
            .resetn(KEY[0]),
            .clock(CLOCK_50),
            .colour(colour),
            .x(12),
            .y(12),
            .plot(~(KEY[1])),
             // Signals for the DAC to drive the monitor. 
            .VGA_R(VGA_R),
            .VGA_G(VGA_G),
            .VGA_B(VGA_B),
            .VGA_HS(VGA_HS),
            .VGA_VS(VGA_VS));

    vga_adapter VGA5(
            .resetn(KEY[0]),
            .clock(CLOCK_50),
            .colour(colour),
            .x(13),
            .y(12),
            .plot(~(KEY[1])),
             // Signals for the DAC to drive the monitor. 
            .VGA_R(VGA_R),
            .VGA_G(VGA_G),
            .VGA_B(VGA_B),
            .VGA_HS(VGA_HS),
            .VGA_VS(VGA_VS));

    vga_adapter VGA6(
            .resetn(KEY[0]),
            .clock(CLOCK_50),
            .colour(colour),
            .x(14),
            .y(12),
            .plot(~(KEY[1])),
            //  Signals for the DAC to drive the monitor. 
            .VGA_R(VGA_R),
            .VGA_G(VGA_G),
            .VGA_B(VGA_B),
            .VGA_HS(VGA_HS),
            .VGA_VS(VGA_VS));


*/

        defparam VGA1.RESOLUTION = "160x120";
        defparam VGA1.MONOCHROME = "FALSE";
        defparam VGA1.BITS_PER_COLOUR_CHANNEL = 1;
        defparam VGA1.BACKGROUND_IMAGE = "image.colour.mif";
        defparam VGA1.USING_DE1 = "TRUE";
/*    
        defparam VGA2.RESOLUTION = "160x120";
        defparam VGA2.MONOCHROME = "FALSE";
        defparam VGA2.BITS_PER_COLOUR_CHANNEL = 1;
        defparam VGA2.BACKGROUND_IMAGE = "image.colour.mif";
        defparam VGA2.USING_DE1 = "TRUE";
    
        defparam VGA3.RESOLUTION = "160x120";
        defparam VGA3.MONOCHROME = "FALSE";
        defparam VGA3.BITS_PER_COLOUR_CHANNEL = 1;
        defparam VGA3.BACKGROUND_IMAGE = "image.colour.mif";
        defparam VGA3.USING_DE1 = "TRUE";
    
        defparam VGA4.RESOLUTION = "160x120";
        defparam VGA4.MONOCHROME = "FALSE";
        defparam VGA4.BITS_PER_COLOUR_CHANNEL = 1;
        defparam VGA4.BACKGROUND_IMAGE = "image.colour.mif";
        defparam VGA4.USING_DE1 = "TRUE";
    
        defparam VGA5.RESOLUTION = "160x120";
        defparam VGA5.MONOCHROME = "FALSE";
        defparam VGA5.BITS_PER_COLOUR_CHANNEL = 1;
        defparam VGA5.BACKGROUND_IMAGE = "image.colour.mif";
        defparam VGA5.USING_DE1 = "TRUE";
    
        defparam VGA6.RESOLUTION = "160x120";
        defparam VGA6.MONOCHROME = "FALSE";
        defparam VGA6.BITS_PER_COLOUR_CHANNEL = 1;
        defparam VGA6.BACKGROUND_IMAGE = "image.colour.mif";
        defparam VGA6.USING_DE1 = "TRUE";
*/        
endmodule
