module SVGA800x600_60(
    input logic clk,clr,
    output logic hSync,vSync,
    output logic [10:0] xPixel,yPixel,
    output logic displayOn
    );
    
    localparam H_DISPLAY=800;
    localparam H_SYNC=128;
    localparam H_BACK=88;
    localparam H_FRONT=40;
    
    localparam V_DISPLAY=600;
    localparam V_SYNC=4;
    localparam V_TOP=23;
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