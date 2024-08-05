`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 19:20:30
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


module top( input logic CLK100MHZ,
            input logic BTNC,
            input logic BTNL,
            input logic BTNR,
            input logic[15:0] SW,
            output logic [7:0] AN,
            output logic [6:0] A2G,
            output logic DP
            //output logic memwrite,
            //output logic [31:0] writedata,dataadr            
    );
    logic clk;
    assign clk=CLK100MHZ;
    logic [31:0] data,instr,adr,wd;
    logic irwrite,mw,iord;
    //assign memwrite=mw;
    //assign writedata=wd;
    //assign dataadr=adr;
    mips mi(clk,BTNC,instr,data,wd,mw,irwrite,adr);
    //memery me(adr,wd,mw,clk,irwrite,instr,data);
    dMemoryDecoder dem(clk,mw,wd,adr,irwrite,data,instr,
                        BTNC,BTNL,BTNR,SW,AN,DP,A2G);
endmodule
