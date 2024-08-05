module VGA_Stripes_Top(
    input logic CLK100MHZ,BTNC,
    input logic [11:0]SW,
    output logic VGA_HS,VGA_VS,
    output logic [3:0] VGA_R,VGA_G,VGA_B);
    
    logic clk25MHZ,displayOn;
    logic [10:0] xPixel,yPixel;
    
    clkDiv C1(.clk(CLK100MHZ),.clr(BTNC),.clk25MHZ(clk25MHZ));
    
    VGA640x480 V1(.clk(clk25MHZ),.clr(BTNC),
                    .hSync(VGA_HS),.hSync(VGA_VS),
                    .xPixel(xPixel),.yPixel(yPixel),
                    .displayOn(displayOn));
                    
      VGA_Stripes VS(.displayOn(displayOn),
                    .xPixel(xPixel),.yPixel(yPixel),
                    .red(VGA_R),.green(VGA_G),.blue(VGA_B));
       
       endmodule