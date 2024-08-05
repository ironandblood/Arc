`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/24 11:32:02
// Design Name: 
// Module Name: clkDiv
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


module clkDiv(
    input logic clk,
    input logic clr,
    output logic clk25MHZ
    );
    logic [1:0] q;
    
    always @(posedge clk,posedge clr)
        if(clr==1) q<=0;
        else q<=q+1;
        
     assign clk25MHZ=q[1];
endmodule
