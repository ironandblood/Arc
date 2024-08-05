`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 20:01:23
// Design Name: 
// Module Name: testbench1
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


module testbench();
 logic clk , reset , memwrite ;
 logic [31:0] writedata , dataadr ;
 
 //instantiate device to be tested 
 top dut ( clk , reset , memwrite ,writedata , dataadr  );
 initial begin // initialize test 
 reset <=1;#22; reset <=0;
 end 
 
 always begin //generate clock 
 clk <=1;#5; clk <=0;#5;
 end 
 
 always @( negedge clk )//check results 
 begin 
    if ( memwrite ) begin 
        if ( dataadr ===84 & writedata ===7) begin 
            $display (" Simulation succeeded ");
            $stop ;
        end else if ( dataadr !==80) begin 
            $display (" Simulation failed ");
            $stop ;
        end
      end 
    end 
endmodule 