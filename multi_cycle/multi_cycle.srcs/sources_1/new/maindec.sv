`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 16:47:31
// Design Name: 
// Module Name: maindec
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


module maindec(input logic clk,
                input logic reset,
                input logic [5:0] op,
                output logic pcwrite,memwrite,irwrite,regwrite,
                output logic alusrca,branch,iord,memtoreg,regdst,
                output logic [1:0] alusrcb,pcsrc,
                output logic [2:0] aluop,
                
                output logic immext,
                output logic bne);
                
    localparam  FETCH =4'b0000;//State0
    localparam  DECODE=4'b0001;//State 1 
    localparam  MEMADR=4'b0010;//State 2
    localparam  MEMRD =4'b0011;// State 3
    localparam  MEMWB =4'b0100;// State 4
    localparam  MEMWR =4'b0101;// State 5
    localparam  RTYPEEX =4'b0110;//State 6
    localparam  RTYPEWB =4'b0111;//State7
    localparam  BEQEX =4'b1000;// State 8
    localparam  ADDIEX =4'b1001;// State 9
    localparam  ADDIWB =4'b1010;//state 10
    localparam  JEX =6'b1011;//State 11
    localparam  ANDIEX=6'b1100;//12
    localparam  ORIEX=6'b1101;//13
    localparam  BNEEX=4'b1110;//14
    
    
    localparam  LW =6'b100011;// Opcode for lw 
    localparam  SW =6'b101011;// Opcode for SW 
    localparam  RTYPE =6'b000000;// Opcode for R - type 
    localparam  BEQ =6'b000100;// Opcode for beq 
    localparam  ADDI =6'b001000;// Opcode for addi 
    localparam  J =6'b000010;// Opcode for j    
    localparam  ANDI= 6'b001100;//Opcode for andi
    localparam  ORI=6'b001101;//Opcode for ori
    localparam  BNE=6'b000101;//Opcode for bne
    
    logic [3:0] state , nextstate ; 
    logic [15:0] controls ;
    logic low;
    //state register 
    always_ff @( posedge clk or posedge reset )
    if ( reset ) state <= FETCH ;
    else state <= nextstate ;
    
    //next state logic 
    always_comb 
        case ( state )
         FETCH :nextstate = DECODE ;
         
         DECODE :case ( op )
            LW :nextstate = MEMADR ; 
            SW : nextstate = MEMADR ; 
            RTYPE : nextstate = RTYPEEX ; 
            BEQ : nextstate = BEQEX ; 
            ADDI : nextstate = ADDIEX ;
            J: nextstate = JEX ;
            ANDI:nextstate=ANDIEX;
            ORI:nextstate=ORIEX;
            BNE:nextstate=BNEEX;                        
            default : nextstate =4'bx ;// never happen
         endcase
         
         MEMADR : case ( op )
            LW :nextstate = MEMRD ;
            SW :nextstate = MEMWR ;
            default : nextstate =4'bx ;
        endcase 
        
        MEMRD :nextstate = MEMWB ;
        MEMWB :nextstate = FETCH ;
        MEMWR :nextstate = FETCH ;
        RTYPEEX : nextstate = RTYPEWB ; 
        RTYPEWB : nextstate = FETCH ;
        BEQEX :nextstate = FETCH ;
        ADDIEX :nextstate = ADDIWB ; 
        ADDIWB : nextstate = FETCH ;
        JEX :nextstate = FETCH ;
        ANDIEX:nextstate=ADDIWB;
        ORIEX:nextstate=ADDIWB;
        BNEEX:nextstate=FETCH;
        default : nextstate =4'bx ;// never happer endcase 
    endcase
    
    // output logic 
    assign { immext,pcwrite , memwrite , irwrite, 
             regwrite,alusrca , branch , iord,
             memtoreg , regdst , alusrcb , 
             pcsrc , aluop[2:1]} = controls ;
    assign aluop[0]=low;
    assign aluop[0]=(state==ANDIEX)|(state==ORI);
    assign bne=(state==BNEEX);
             
    always_comb 
        case ( state )
            FETCH :begin controls =16'h5010;end
            DECODE :begin controls =16'h0030;end
            MEMADR :begin controls =16'h0420;end
            MEMRD :begin controls =16'h0100;end
            MEMWB :begin controls =16'h0880;end
            MEMWR :begin controls =16'h2100;end
            RTYPEEX : begin controls =16'h0402;end
            RTYPEWB :begin  controls =16'h0840;end
            BEQEX :begin controls =16'h0605;end
            ADDIEX :begin  controls =16'h0420;end
            ADDIWB :begin  controls =16'h0800;end
            JEX :begin controls =16'h4008;end
            
            ANDIEX:begin controls=16'h8421;end
            ORI:begin controls=16'h8420;end 
            BNEEX :begin controls =16'h0405;end
            default : controls =16'hxxxx ;// never happen 
    endcase 
 endmodule

