`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 16:14:08
// Design Name: 
// Module Name: mux4
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


module mux4#(parameter WIDTH=8)
            (input logic [WIDTH-1:0]d0,d1,d2,d3,
             input logic [1:0]s,
             output logic [WIDTH-1:0]y);
    logic [WIDTH-1:0] tp;
    always_comb
        case(s)
            2'b00: tp<=d0;
            2'b01: tp<=d1;
            2'b10: tp<=d2;
            2'b11: tp<=d3;
         default:tp<=0;
         endcase
    assign y=tp;
endmodule

