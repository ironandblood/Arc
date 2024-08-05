`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/10 09:35:03
// Design Name: 
// Module Name: Top
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


module Top(input logic clk,
            input logic reset,
            output logic [31:0] writedata ,
            output logic [31:0] dataadr ,
            output logic memwrite);
logic [ 31:0 ] pc,instr,readdata;
MIPS mips(  clk, reset,
            instr,readdata,
            pc, memwrite, dataadr, writedata);
iMem imem (pc [7:2 ] ,instr );
dMem dmem (clk,memwrite, dataadr ,writedata,readdata);
endmodule
