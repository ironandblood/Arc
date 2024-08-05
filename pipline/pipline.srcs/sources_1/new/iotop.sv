`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/11 19:17:15
// Design Name: 
// Module Name: iotop
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


module iotop(input logic CLK100MHZ,
                input logic BTNC,
                input logic BTNL,
                input logic BTNR,
                input logic [15:0]SW,
                output logic [7:0]AN,
                output logic [6:0]A2G,
                output logic DP);
                
    logic clk;
    assign clk=CLK100MHZ;
    logic [ 31:0 ] pc,instr,readdata,writedata,dataadr;
    logic memwrite;
    
    iMem imem (pc [7:2 ] ,instr );
    
    MIPS mips(  clk, BTNC,
            instr,readdata,
            pc, memwrite, dataadr, writedata);
            
    dMemoryDecoder dmd(clk,memwrite,writedata,
                        dataadr[7:0],readdata,
                        
                        BTNC,BTNL,BTNR,
                        SW,AN,DP,A2G);
                        
endmodule
