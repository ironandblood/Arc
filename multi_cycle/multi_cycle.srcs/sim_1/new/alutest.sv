`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/04 10:46:51
// Design Name: 
// Module Name: alutest
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


module alutest();
logic [2:0] aluop;
logic zero;
logic [31:0] res,a,b;

alu al(a,b,aluop,res,zero);

initial begin
a<=32'b010;b<=32'b010;aluop<=110;#20;
a<=32'b001;b<=32'b010;aluop<=111;#20;
end
endmodule
