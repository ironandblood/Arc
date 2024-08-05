module VGA_colors_Top(
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
     
     assign VGA_R=(displayOn)? SW[11:8]:4'b0000;
     assign VGA_G=(displayOn)? SW[7:4]:4'b0000;
     assign VGA_B=(displayOn)? SW[3:0]:4'b0000;
endmodule