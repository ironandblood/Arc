module SVGA800x600_60_Top(
    input logic CLK100MHZ,BTNC,
    output logic VGA_HS,VGA_VS,
    output logic [3:0] VGA_R,VGA_G,VGA_B);
    
    logic CLK40MHZ,displayOn;
    logic [10:0] xPixel,yPixel;
    
    clk40MHZ C1(.clk_in1(CLK100MHZ),.reset(BTNC),.clk_out1(CLK40MHZ));
    
    SVGA800x600_60 V1(.clk(CLK40MHZ),.clr(BTNC),
                    .hSync(VGA_HS),.hSync(VGA_VS),
                    .xPixel(xPixel),.yPixel(yPixel),
                    .displayOn(displayOn));
                    
     assign VGA_R=(displayOn)? 4'b1111:4'b0000;
     assign VGA_G=4'b0;
     assign VGA_B=4'b0;
endmodule