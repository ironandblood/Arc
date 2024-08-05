module musictop(
            input logic CLK100MHZ,
            output logic AUD_PWM,
            output logic AUD_SD);          
    
    music M1(.clk(CLK100MHZ),.audioData(AUD_PWM),.audioSD(AUD_SD));

endmodule