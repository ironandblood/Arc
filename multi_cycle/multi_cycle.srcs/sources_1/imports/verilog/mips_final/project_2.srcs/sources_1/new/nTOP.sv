`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/13 15:33:37
// Design Name: 
// Module Name: nTOP
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


module Top (    input logic CLK100MHZ, 
                input logic BTNC ,// reset 
                input logic BTNL ,// SW input data 
                input logic BTNR ,//七段数码管显示
                input logic [15:0] SW ,// a : SW[15:8], b : SW [7:0] 
                output logic [7:0] AN ,
                output logic DP ,
                output logic [6:0]A2G);
            
logic [31:0] pc, instr;
iMemory imem (.a ( pc [7:2]),
              .rd ( instr ));// output 
              
logic Write ;//写信号：可能是 memwrite ，也可能是 iowrite 
logic [31:0] dataAdr , writeData , readData ;

MIPS mips (. clk (CLK100MHZ),
           . reset ( BTNC ),
           . pc(pc), //output 
           . instr ( instr ),
           . memwrite ( Write ),//output 
           . aluout ( dataAdr ),// output 
           . writedata ( writeData ),// output 
           . readdata ( readData ));

logic IOclock;
assign IOclock =~ CLK100MHZ;
           
 dMemoryDecoder dmd(. clk (CLK100MHZ), 
                    . writeEN ( Write ),
                    . addr ( dataAdr [7:0]),
                    . writeData ( writeData ),
                    . readData ( readData ),// output
                    //下面是IO接口
                    . IOclock(IOclock),
                    . reset ( BTNC ),
                    . btnL ( BTNL ),
                    . btnR ( BTNR ),
                    . switch ( SW ),
                    . an ( AN ),// output 
                    . dp ( DP ),// output 
                    . a2g( A2G));// output 
 endmodule
