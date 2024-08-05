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


module mips(input  logic clk, reset,
            input   logic [31:0] instr,data,
            
            output logic [31:0] wd,
            output logic memwrite,irwrite,
            output logic [31:0] adr);
            
    logic pcen,iord,alusrca,regwrite,memtoreg,regdst,zero,immext;
       
    logic [2:0] alucontrol;
    logic [1:0] alusrcb,pcsrc;
    controller c(clk,instr[31:26], instr[5:0], 
                zero,reset,
                pcen,iord,memwrite,irwrite,pcsrc,alucontrol,alusrcb,alusrca,regwrite,memtoreg,regdst,immext);
                
    datapath dp(clk, reset, 
                zero,
               pcen,iord,pcsrc,alucontrol,alusrcb,alusrca,regwrite,memtoreg,regdst,immext,
               data,instr[25:0],adr,wd);
endmodule
