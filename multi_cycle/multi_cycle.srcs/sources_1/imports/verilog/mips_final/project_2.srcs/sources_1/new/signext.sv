`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/01 16:00:26
// Design Name: 
// Module Name: signext
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


module signext(input  logic immext, 
               input  logic [15:0] a,
               output logic [31:0] y);//组合逻辑电路
    logic tmp=0;
    always_comb
        case(immext)//
            1'b0: y <= {{16{a[15]}}, a};//0--符号扩展
            1'b1: y <= {{16{tmp}}, a};//1--0扩展
        endcase
endmodule
