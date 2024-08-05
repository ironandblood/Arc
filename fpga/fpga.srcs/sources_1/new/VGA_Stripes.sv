`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/24 11:32:02
// Design Name: 
// Module Name: VGA_Stripes
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


module VGA_Stripes(
    input logic displayOn,
    input logic [10:0] xPixel,yPixel,
    output logic [3:0] red,green,blue
    );
    
    assign red={4{yPixel[4]}};
    assign green=~{4{yPixel[4]}};
    assign red=0;
endmodule
