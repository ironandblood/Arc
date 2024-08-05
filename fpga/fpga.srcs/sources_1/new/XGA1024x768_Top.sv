module XGA1024x768_Top(
    input logic CLK100MHZ,BTNC,
    output logic VGA_HS,VGA_VS,
    output logic [3:0] VGA_R,VGA_G,VGA_B);
    
    logic CLK65MHZ,displayOn;
    logic [10:0] xPixel,yPixel;
    
    clk65MHZ C1(.clk_in1(CLK100MHZ),.reset(BTNC),.clk_out1(CLK65MHZ));
    
    XGA1024x768 V1(.clk(CLK65MHZ),.clr(BTNC),
                    .hSync(VGA_HS),.hSync(VGA_VS),
                    .xPixel(xPixel),.yPixel(yPixel),
                    .displayOn(displayOn));
                    
     assign VGA_R=(displayOn)? 4'b1111:4'b0000;
     assign VGA_G=4'b0;
     assign VGA_B=4'b0;
endmodule