`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 19:11:21
// Design Name: 
// Module Name: memery
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


module memery(input [31:0] adr,
              input [31:0] wd,
              input we,clk,irwrite,
              output [31:0]instr,
              output [31:0]data
    );
    
    logic [31:0] rd;
    mem m(clk,we,adr,wd,rd);
    reg32 pcreg(clk,irwrite,rd,instr);
    //reg32 datareg(clk,1'b1,rd,data);
    assign data=rd;
endmodule
