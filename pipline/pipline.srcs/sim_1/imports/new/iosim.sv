`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/17 16:07:56
// Design Name: 
// Module Name: iosim
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

module iosim();
logic clk,btnc,btnl,btnr;
logic [15:0] sw;
logic [7:0] an;
logic [6:0] a2g;

iotop t(clk,btnc,btnl,btnr,sw,an,a2g);

initial begin
    #0;btnc<=1;
    #2;btnc<=0;
    #2;btnl<=1;btnr<=1;
    #2;sw<=16'b00000100_00001000;
 end
 
 always begin
    clk<=1;#5;clk<=0;#5;end
endmodule
