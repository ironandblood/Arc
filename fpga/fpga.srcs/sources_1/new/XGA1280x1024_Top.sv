`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/24 16:06:51
// Design Name: 
// Module Name: XGA1280x1024_Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module XGA1280x1024_Top(
    input logic CLK100MHZ,BTNC,
    output logic VGA_HS,VGA_VS,
    output logic [3:0] VGA_R,VGA_G,VGA_B);
    
    logic CLK108MHZ,displayOn;
    logic [10:0] xPixel,yPixel;
    
    clk108MHZ C1(.clk_in1(CLK100MHZ),.reset(BTNC),.clk_out1(CLK108MHZ));
    
    XGA1280x1024 V1(.clk(CLK108MHZ),.clr(BTNC),
                    .hSync(VGA_HS),.hSync(VGA_VS),
                    .xPixel(xPixel),.yPixel(yPixel),
                    .displayOn(displayOn));
                    
     assign VGA_R=(displayOn)? 4'b1111:4'b0000;
     assign VGA_G=4'b0;
     assign VGA_B=4'b0;
endmodule