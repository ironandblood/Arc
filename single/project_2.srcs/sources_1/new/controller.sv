`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/01 15:56:08
// Design Name: 
// Module Name: controller
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


module controller(input  logic [5:0] op, funct,
                  input  logic zero,
                  output logic memtoreg, memwrite,
                  output logic pcsrc, alusrc,
                  output logic regdst, regwrite,
                  output logic jump,
                  output logic [2:0] alucontrol,
                  output logic immext);
    logic [2:0] aluop;
    logic branch, branchbne;
    
    maindec md(op, memtoreg, memwrite, branch, alusrc, regdst, 
               regwrite, jump, aluop, immext, branchbne);
    
    aludec ad(funct, aluop, alucontrol);
    
    assign pcsrc = (branch & zero)|(branchbne & ~zero);
endmodule
