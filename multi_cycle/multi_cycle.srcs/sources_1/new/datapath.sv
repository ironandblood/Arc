`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 15:35:16
// Design Name: 
// Module Name: datapath
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


module datapath(input  logic clk, reset,//basic
                output zero,

                input  pcen,
                input  iord,
                //input  MemWrite,
                //input  IRWrite,
                input  [1:0]pcsrc,
                input[2:0]  alucontrol,
                input[1:0]  alusrcb,
                input  alusrca,
                input  regwrite,
                input  memtoreg,
                input  regdst, 
                
                input immext,             //control
                
                input  [31:0] data,         //input
                input  [25:0] instr,
                
                output [31:0] adr,          //output
                output [31:0] wd
                );
          
     
     logic [31:0] srca,srcb,aluresult,aluout;
     logic [31:0]rd1,rd2,wd3,a,b,signimm,slimm;
     logic [4:0] a3;      
     logic [31:0] pcnext,pcout,srca0,immad;
     
     //immediate ad
     sl2 adsl({6'b0,instr},immad);
     
    //pc logic
        
    flopr #(32) pcreg(clk,reset,pcen,pcnext,pcout);
    assign srca0=pcout;
    mux2 #(32) admux(pcout,aluout,iord,adr);
    
    // register file logic
    
    regfile rf(clk, regwrite, instr[25:21], instr[20:16], a3, wd3, rd1, rd2);
    
    mux2 #(5) wrmux(instr[20:16], instr[15:11], regdst, a3);
    mux2 #(32) wdmux(aluout,data,memtoreg,wd3);
    reg32 ra(clk,1'b1,rd1,a);
    reg32 rb(clk,1'b1,rd2,b);
    assign wd=b;
    
    //shift logic
    signext se(immext,instr[15:0], signimm);
    sl2 immsh(signimm,slimm);
    
    
    // ALU logic
    mux2 #(32) srcamux(srca0, a, alusrca, srca);
    mux4 #(32) srcbmux(b,32'b0100,signimm,slimm,alusrcb,srcb);
    alu alu(srca, srcb, alucontrol, aluresult, zero);
    reg32 alureg(clk,1'b1,aluresult,aluout);
    mux4 #(32) pcmux(aluresult,aluout,{pcout[31:28],immad[27:0]},32'b0,pcsrc,pcnext);
endmodule

