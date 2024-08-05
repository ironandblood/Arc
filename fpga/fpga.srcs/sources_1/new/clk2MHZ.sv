`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/17 10:47:23
// Design Name: 
// Module Name: clk2MHZ
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


module clk2MHZ(
    input logic clk,
    output logic nclk
    );
    logic [5:0] q;
    
    always @(posedge clk)
         q<=q+1;
        
     assign nclk=q[5];
    
endmodule
