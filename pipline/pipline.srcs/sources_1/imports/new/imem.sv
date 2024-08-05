`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/01 16:05:48
// Design Name: 
// Module Name: imem
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


module iMem(    input logic [5:0] a,
                output logic [31:0] rd);
    logic [31:0] RAM[63:0];
    initial
        //$readmemh("memfile.dat", RAM);
        //$readmemh("extend.dat",RAM);
        $readmemh("ioFile.dat",RAM);
    assign rd = RAM[a]; // word aligned
endmodule
