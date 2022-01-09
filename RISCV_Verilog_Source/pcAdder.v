`timescale 1ns / 1ps

module pcAdder(
    input  [31:0] nowPc,
    input [31:0]  imm,
    input [1:0]   branch,
    input  zero,
    input  result,
    input  jump,
    
    output reg [31:0] nextPc
    );

    always @(*) begin
        if(branch==2'b01&&(zero||jump))
            nextPc<=nowPc+imm;
        else if(branch==2'b10&&(~zero||jump))
            nextPc<=nowPc+imm;
        else if(branch==2'b11&&result)
            nextPc<=nowPc+imm;
        else if(jump)
            nextPc<=nowPc+imm;
        else 
            nextPc<=nowPc+4'h4;
    end
endmodule
