`timescale 1ns / 1ps
module ALU(
    input  [31:0] rs1, // 第一个寄存器
    input  [31:0] rs2, // 第二个寄存器
    input  [5:0] ALUcontrol, // ALU控制
    output reg [31:0] result, // 计算结果
    output reg iszero  // 0判断 (0->1 1->0) 
    );
    always @(*) begin
        case(ALUcontrol)
            6'b000000:begin result<=rs1+rs2; end
            6'b000001:begin result<=rs1&rs2; end
            6'b000010:begin result<=rs1|rs2; end
            6'b000011:begin result<=rs1^rs2; end
            6'b000100:begin result<=rs1>>rs2; end
            6'b000101:begin result<=rs1<<rs2; end
            6'b000110:begin
                if(rs1<rs2)result<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
                else result<=0;
            end
            6'b000111:begin
                if(rs1<rs2)result<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
                else result<=0;
            end
            6'b001000:begin result<=rs1/rs2; end
            6'b001001:begin result<=rs1/rs2; end
            6'b001010:begin result<=rs1*rs2; end
            6'b001011:begin result<=rs1*rs2>>32; end
            6'b001100:begin result<=rs1*rs2>>32; end
            6'b001101:begin result<=rs1*rs2>>32; end
            6'b001110:begin result<=rs1%rs2; end
            6'b001111:begin result<=rs1%rs2; end
            6'b010000:begin result<=rs1>>rs2; end
            6'b010001:begin result<=rs1-rs2; end
            6'b010010:begin result<=rs1<<rs2; end
            6'b010011:begin
                if(rs1<rs2)result<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
                else result<=0;
            end
            6'b010100:begin result<=rs1>>rs2; end
            6'b010101:begin result<=(rs1>=rs2); end
            6'b010110:begin result<=(rs1<rs2); end
            6'b010111:begin result<=rs2; end
        endcase
        if(result==0)iszero<=1;
        else iszero<=0;
    end
endmodule
