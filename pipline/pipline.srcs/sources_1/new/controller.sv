module controller ( input logic clk,reset,
                    input logic [5:0] opD , functD , 
                    input logic equalD,
                    input logic flushE,
                    output logic pcsrcD , branchD , jumpD ,
                    output logic [2:0] alucontrolE , 
                    output logic regwriteE , memtoregE , alusrcE , regdstE ,
                    output logic regwriteM , memtoregM , memwriteM ,
                    output logic regwriteW , memtoregW ,
                    
                    output logic immextE,
                    output logic bneD);

 logic [2:0]    alucontrolD;
 logic          regwriteD , regdstD ; 
 logic          alusrcD ;
 logic          memwriteD , memtoregD ;
 logic          memwriteE ;
 logic [2:0]    aluopD ;
 
 logic immextD;
 
 maindec md(opD,
            regwriteD,regdstD,//output
            alusrcD,branchD,
            memwriteD,memtoregD,
            jumpD,aluopD,
            bneD,immextD);
            
 aludec ad(functD,aluopD,
            alucontrolD);
            
  assign pcsrcD=((branchD&equalD)|(bneD&~equalD));
  
  // pipeline registers 
 floprc #(9) regE ( clk , reset , flushE ,
                    { memtoregD , memwriteD , alusrcD , regdstD , regwriteD , alucontrolD ,immextD},
                    { memtoregE , memwriteE , alusrcE , regdstE , regwriteE , alucontrolE ,immextE});
                    
 flopr #(3) regM (  clk , reset ,
                    { memtoregE , memwriteE , regwriteE },
                    { memtoregM , memwriteM , regwriteM });
                    
 flopr #(2) regW (  clk , reset ,
                    { memtoregM , regwriteM },
                    { memtoregW , regwriteW });
 endmodule        