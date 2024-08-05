`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/14 10:30:42
// Design Name: 
// Module Name: testbench2
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


module testbench2();
    logic clk;
    logic reset;
    logic [31:0] writedata, dataadr;
    logic memwrite;
    
    //istantiate device to be tested
    top dut(clk,reset,writedata,dataadr,memwrite);
    
    //initial test
    initial begin
        reset<=1;#22;reset<=0;
        end
    
    //generate clock to sequence tests
    always
        begin
        clk<=1;#5;clk<=0;#5;
        end;
     
     //ckl that 7 gets written to address 84
     always @(negedge clk)
        begin
            if(memwrite) begin
                if (dataadr ===84 && writedata ===7) begin
                $display ("Simulation succeeded");
                $stop;
                end else if (dataadr !== 80) begin
                $display ("Simulation failed");
                $stop;
                end
              end
            end
endmodule
