`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/01 15:57:33
// Design Name: 
// Module Name: aludec
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


module aludec(input  logic [5:0] funct,
              input  logic [2:0] aluop,
              output logic [2:0] alucontrol);
    always_comb
        case(aluop)
            3'b000: alucontrol <= 3'b010; // add (for lw/sw/addi)
            3'b001: alucontrol <= 3'b110; // sub (for beq)
            3'b011: alucontrol <= 3'b001; // or  (for ori)
            3'b100: alucontrol <= 3'b000; // and (for andi)
            default: case(funct) // R-type instructions
                6'b100000: alucontrol <= 3'b010; // add
                6'b100010: alucontrol <= 3'b110; // sub
                6'b100100: alucontrol <= 3'b000; // and
                6'b100101: alucontrol <= 3'b001; // or
                6'b101010: alucontrol <= 3'b111; // slt
                default: alucontrol <= 3'bxxx; // ???
            endcase
        endcase
endmodule
