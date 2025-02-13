`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/01 09:18:19
// Design Name: 
// Module Name: alu
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


module alu(input logic [31:0]a,b,
           input logic [2:0]alucont,
           output logic [31:0]aluout,
           output logic zero);
    always_comb
        case(alucont)
            3'b000:aluout=a&b;//
            3'b001:aluout=a|b;//
            3'b010:aluout=a+b;//
            3'b110:aluout=a-b;//
            3'b111:aluout=(a<b)?32'b1:32'b0;//
            default:aluout=a;
        endcase
    assign zero=(aluout==0);
endmodule
