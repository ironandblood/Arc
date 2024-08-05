`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/24 14:58:23
// Design Name: 
// Module Name: VGA_clkIP_Top
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


module VGA_clkIP_Top(
    input logic CLK100MHZ,BTNC,
    output logic VGA_HS,VGA_VS,
    output logic [3:0] VGA_R,VGA_G,VGA_B
    );
    
    logic clk25MHZ,displayOn;
    logic [10:0] xPixel,yPixel;
    
    CLK25MHZ C1(.clk_out1(clk25MHZ),
                .reset(BTNC),.clk_in1(CLK100MHZ));
                
    VGA640x480 V1(.clk(clk25MHZ),.clr(BTNC),
                    .hSync(VGA_HS),.hSync(VGA_VS),
                    .xPixel(xPixel),.yPixel(yPixel),
                    .displayOn(displayOn));
                    
     assign VGA_R=(displayOn)? 4'b1111:4'b0000;
     assign VGA_G=4'b0;
     assign VGA_B=4'b0;
endmodule
