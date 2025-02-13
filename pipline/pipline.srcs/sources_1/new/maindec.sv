 module maindec (   input logic [5:0] op ,
                    output logic regwrite,regdst,
                    output logic alusrc,branch ,
                    output logic memwrite , memtoreg ,
                    output logic jump ,
                    output logic [2:0] aluop ,
                    
                    output logic bne,
                    output logic immext);
                    
 logic[8:0] controls ;
 
 assign {   regwrite , regdst , alusrc , branch ,
            memwrite , memtoreg , jump , aluop[1:0] }= controls ;
            
 assign bne=(op==6'b000101);
 assign immext=~((op==6'b001101)|(op==6'b001100));
 assign aluop[2]=~immext;
            
 always_comb 
    case ( op )
        6'b000000: controls =9'b110000010;// Rtype 
        6'b100011: controls =9'b101001000;// L 
        6'b101011: controls =9'b001010000;// SIW 
        6'b000100: controls =9'b000100001;// BEQ 
        6'b001000: controls =9'b101000000;// ADDI 
        6'b000010: controls =9'b000000100;//J
        
        6'b001101: controls =9'b101000000;//ori
        6'b001100: controls =9'b101000001;//andi
        6'b000101: controls =9'b000000001;//bne
        default :  controls =9'b0xxx0xxxx ;
    endcase
endmodule