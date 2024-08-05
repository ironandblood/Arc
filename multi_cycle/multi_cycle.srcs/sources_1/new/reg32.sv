`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 15:23:01
// Design Name: 
// Module Name: reg32
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


module reg32(  input  logic            clk,
               input  logic            en,
               input  logic [31:0]     ip,
               output logic [31:0]     op);
               
   logic [31:0] re;
   
   always_ff @(posedge clk)
    if(en) re<=ip;
    
    assign op=re;
endmodule

