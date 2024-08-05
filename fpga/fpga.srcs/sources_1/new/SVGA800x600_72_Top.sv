`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/24 15:28:29
// Design Name: 
// Module Name: SVGA800x600_72_Top
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


module SVGA800x600_72_Top(
    input logic CLK100MHZ,BTNC,
    output logic VGA_HS,VGA_VS,
    output logic [3:0] VGA_R,VGA_G,VGA_B);
    
    logic CLK50MHZ,displayOn;
    logic [10:0] xPixel,yPixel;
    
    clk50MHZ C1(.clk_in1(CLK100MHZ),.reset(BTNC),.clk_out1(CLK50MHZ));
    
    SVGA800x600_72 V1(.clk(CLK50MHZ),.clr(BTNC),
                    .hSync(VGA_HS),.hSync(VGA_VS),
                    .xPixel(xPixel),.yPixel(yPixel),
                    .displayOn(displayOn));
                    
     assign VGA_R=(displayOn)? 4'b1111:4'b0000;
     assign VGA_G=4'b0;
     assign VGA_B=4'b0;
endmodule
