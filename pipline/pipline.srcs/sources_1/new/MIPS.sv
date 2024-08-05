`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/10 09:52:30
// Design Name: 
// Module Name: MIPS
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


module MIPS(    input logic clk,reset, 
                input logic [31:0] instrF , readdataM , 
                output logic [31:0] pcF ,
                output logic memwriteM, 
                output logic [31:0] aluoutM ,
                output logic [31:0] writedataM );
 logic [5:0]    opD , functD ;
 logic          pcsrcD , equalD ;
 logic          branchD,jumpD;
 logic [2:0]    alucontrolE ;
 logic          memtoregE , regwriteE , regdstE , alusrcE , flushE ;
 logic          memtoregM , regwriteM ;
 logic          memtoregW , regwriteW ;
 logic          bneD,immextE;
 
 controller c ( clk , reset ,
                opD , functD , equalD , 
                flushE ,
                pcsrcD , branchD , jumpD ,// output 
                alucontrolE ,// output 
                regwriteE , memtoregE , alusrcE , regdstE ,// output 
                regwriteM , memtoregM , memwriteM ,// output 
                regwriteW , memtoregW, 
                immextE,bneD);// output 
                
 datapath dp (  clk , reset ,
                instrF ,
                pcsrcD , branchD , jumpD , 
                alucontrolE ,
                regwriteE , memtoregE , alusrcE , regdstE , 
                readdataM ,
                regwriteM , memtoregM , 
                regwriteW , memtoregW ,
                pcF ,                   // output 
                opD , functD , equalD , // output
                flushE ,                // output
                aluoutM , writedataM ,// output
                immextE,
                bneD);
 
 endmodule
