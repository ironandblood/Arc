`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/08 14:25:05
// Design Name: 
// Module Name: datamemorydecoder
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


module dMemoryDecoder(  input  logic clk,writeEN,
                         input  logic [31:0] writeData,
                         input  logic [7:0] addr, 
                         output logic [31:0] readData,
                         
                         input  logic IOclock,
                         input  logic reset,
                         input  logic btnL,btnR,
                         input  logic [15:0] switch,
                         output logic [7:0] an,
                         output logic dp,
                         output logic [6:0] a2g);
                         
    logic [31:0] readData1, readData2, digit;
    logic [11:0] led;
    logic [3:0]  zero;
    assign zero = 4'b1111;
    logic we, pWrite;
    
    assign we=~addr[7]&writeEN;
    assign pWrite=addr[7]&writeEN;
    /*
    always_comb
        case(addr[7])
            1'b0: begin
                we <= writeEN;
                //pWrite <= ~writeEN;
            end
            1'b1: begin
                //we <= ~writeEN;
                pWrite <= writeEN;
            end
        endcase 
       */
    dmem dmem(clk, we, addr[7:0], writeData,readData1);
    IO IO(IOclock, reset, addr[7], pWrite, addr[3:2], writeData[11:0], readData2, btnL, btnR, switch, led);
    
    assign digit = {switch, zero, led};
    always_comb
        case(addr[7])
            1'b0: readData <= readData1;
            1'b1: readData <= readData2;
        endcase
    mux7seg mux7seg(IOclock, reset, digit, an, dp, a2g);
endmodule
