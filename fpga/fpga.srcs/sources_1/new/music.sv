`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/17 09:29:44
// Design Name: 
// Module Name: music
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


module music(
    input logic clk,
    output logic audioData,
    output logic audioSD
    );
    
    assign audioSD=1;
    
    localparam MEM_SIZE=65535;
    logic [16:0] address;
    logic [7:0] value;
    logic clk2048kHZ;
    
    clk2MHZ C2(clk,clk2048kHZ);
    
   eire p(.clka(clk),
            .addra(address),
            .douta(value));
            
    logic [7:0] counter=0;
    
    always @(posedge clk2048kHZ)
    begin
        counter <=counter+1;
        
        audioData<=(counter<value);
        
        if(counter ==(256-1))
        begin
            address<=address+1;
            if(address==MEM_SIZE) address<=0;
        end
    end  
endmodule
