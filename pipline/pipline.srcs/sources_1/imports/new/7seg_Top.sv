`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/14 10:27:41
// Design Name: 
// Module Name: 7seg_Top
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


module x7seg_Top(
    input logic        CLK100MHZ,
    input logic [15:0] SW,
    output logic [6:0] A2G,
    output logic [7:0] AN,
    output logic        DP);
    
    logic  [15:0] x;
    
    
    mux7seg x7(.x(SW[15:0]),
             .clk(CLK100MHZ),
             .clr(0),
             .a2g(A2G),
             .an(AN),
             .dp(DP));
endmodule