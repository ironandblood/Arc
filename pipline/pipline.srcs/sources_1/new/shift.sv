`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/10 11:36:50
// Design Name: 
// Module Name: shift
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


module sl2(input logic [31:0] a,
            output logic [31:0] y);

assign y={a[29:0],2'b00};
endmodule

module signext(input logic [15:0]a,
                output logic [31:0] y,
                output logic [31:0]x);
                
        assign y={{16{a[15]}} , a};
        assign x={{16{1'b0}} , a};
endmodule
