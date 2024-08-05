`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/01 08:29:09
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


module controller( input clk,
                    input  logic [5:0] op,funct,

                    input  logic       zero,reset,
                  
                    output  pcen,
                    output  iord,
                    output  memwrite,
                    output  irwrite,
                    output  [1:0]pcsrc,
                    output[2:0]  alucontrol,
                    output[1:0]  alusrcb,
                    output  alusrca,
                    output  regwrite,
                    output  memtoreg,
                    output  regdst,
                    
                    output  immext);
   logic [2:0] aluop;
   logic       branch,pcwrite,bne;
   maindec md(clk,reset,op,pcwrite,memwrite,irwrite,regwrite,alusrca,branch,iord,
               memtoreg,regdst,alusrcb,pcsrc,aluop,immext,bne);
   aludec  ad(funct,aluop,alucontrol);
   
   assign pcen=(branch&zero)|pcwrite|(bne&~zero);              
endmodule
