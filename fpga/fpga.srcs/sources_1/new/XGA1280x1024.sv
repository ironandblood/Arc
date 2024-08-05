`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/24 15:45:31
// Design Name: 
// Module Name: XGA1280x1024
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


module XGA1280x1024(
    input logic clk,clr,
    output logic hSync,vSync,
    output logic [10:0] xPixel,yPixel,
    output logic displayOn
    );
    
    localparam H_DISPLAY=1280;
    localparam H_SYNC=112;
    localparam H_BACK=248;
    localparam H_FRONT=48;
    
    localparam V_DISPLAY=1024;
    localparam V_SYNC=3;
    localparam V_TOP=38;
    localparam V_BOTTOM=1;
    
    localparam
        H_SYNC_START=H_SYNC+H_BACK,
        H_SYNC_END=H_SYNC+H_BACK+H_DISPLAY,
        H_PIXELS=H_SYNC+H_BACK+H_DISPLAY+H_FRONT,
        V_SYNC_START=V_SYNC+V_TOP,
        V_SYNC_END=V_SYNC+V_TOP+V_DISPLAY,
        V_LINES=V_SYNC+V_TOP+V_BOTTOM+V_DISPLAY;
        
    logic hMaxed,vMaxed;
    assign hMaxed=(xPixel==H_PIXELS-1)||clr;
    assign vMaxed=(yPixel==V_LINES-1)||clr;
    
    always @(posedge clk) begin
        hSync<=(xPixel>=H_SYNC&&xPixel<H_SYNC_END);
        if(hMaxed) xPixel<=0;
        else xPixel<=xPixel+1;
        end
     
    always @(posedge clk) begin
        vSync<=(yPixel>=V_SYNC&&yPixel<V_SYNC_END);
        if(vMaxed) yPixel<=0;
        else yPixel<=yPixel+1;
        end
        
    assign displayOn=((xPixel>=H_SYNC_START)&&
                        (xPixel<H_SYNC_END)&&
                        (yPixel>=V_SYNC_START)&&
                        (yPixel<V_SYNC_END));
endmodule
