`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/01 15:55:22
// Design Name: 
// Module Name: mips
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


module MIPS(input  logic clk, reset,
            output logic [31:0] pc,
            input  logic [31:0] instr,
            output logic memwrite,
            output logic [31:0] aluout, writedata,
            input  logic [31:0] readdata);
    logic memtoreg, alusrc, regdst, regwrite, jump, pcsrc, zero, immext;
    logic [2:0] alucontrol;
    controller c(instr[31:26], instr[5:0], zero, memtoreg, memwrite, pcsrc,
                 alusrc, regdst, regwrite, jump, alucontrol, immext);
    datapath dp(clk, reset, memtoreg, pcsrc,alusrc, regdst, regwrite, jump, alucontrol, 
                zero, pc, instr[25:0], aluout, writedata, readdata, immext);
endmodule
