`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/01 16:05:16
// Design Name: 
// Module Name: top
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


module top(input  logic clk, reset,
           output logic [31:0] writedata, dataadr,
           output logic memwrite,
           output logic [31:0] readData,
           input  logic btnL, btnR,
           input  logic [15:0] switch,
           output logic [7:0] AN,
           output logic DP,
           output logic [6:0] A2G);
    logic [31:0] pc, instr, readdata;
    //logic [31:0] writedata, dataadr;
    //logic memwrite; 
    // instantiate processor and memories
    MIPS mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
    iMemory imem(pc[7:2], instr);
    dMemoryDecoder dmem_decoder(clk, memwrite, dataadr, writedata, readData, 
                                   ~clk, reset, btnL, btnR, switch, AN, DP, A2G);
endmodule
