`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/08 10:42:21
// Design Name: 
// Module Name: IO
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

module IO(input logic clk,
          input logic reset,
          input logic pRead,
          input logic pWrite,
          input logic [1:0] addr,
          input logic [11:0] pWriteData,
          output logic [31:0] pReadData,
          input logic buttonL,//LED输出
          input logic buttonR,//Switch输入
          input logic [15:0] switch,//直接显示
          output logic [11:0] led);
          
    logic [1:0] status;
    logic [15:0] switch1;
    logic [11:0] led1;
    
    always_ff@(posedge clk) begin
        if(reset) begin
            status <=  2'b00;
            led1   <= 12'h00;
            switch1 <= 16'h00;
            end
            
        else begin
            //开关位置已经拨好，可以输入新数据
            if(buttonR) begin
                status[1] <= 1;
                switch1 <= switch;
            end
            //LEDs已经准备好，可以输出新数据
            if(buttonL) begin
                status[0] <= 1;
                led <=led1;
            end
            
            //向数据输出端口输出(LED)
            if(pWrite & (addr==2'b01)) begin
                led1 <= pWriteData[11:0];
                status[0] <= 0;
            end
            //读数据
            if(pRead) begin
                //11:数据输入端口(高)， 10:数据输入端口(低)
                //01:数据输出端口(LED)， 00:状态端口
                case(addr)
                    2'b11: pReadData <= {24'b0, switch1[15:8]};
                    2'b10: pReadData <= {24'b0, switch1[7:0]};
                    2'b00: pReadData <= {24'b0, 6'b000000, status};
                    default: pReadData <= 32'b0;
                endcase
            end
        end //if
    end //always_if
endmodule
