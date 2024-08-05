`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/01 16:06:25
// Design Name: 
// Module Name: dmem
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


module mem (input logic clk, we,
            input logic [31:0] a,
            input logic [31:0] wd,
            output logic [31:0] rd);
            
            logic [31:0] RAM[255:0];
            initial
            //$readmemh("memfile.dat",RAM);
            //$readmemh("extend.dat",RAM);
            $readmemh("ioFile.dat",RAM);
            
    assign rd = RAM[a[31:2]];    // word aligned
    always_ff @(posedge clk)
        if (we) RAM[a[31:2]] <= wd;
endmodule
