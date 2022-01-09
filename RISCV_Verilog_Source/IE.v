`timescale 1ns / 1ps
module IE(
    input  [31:0] instruct, //指令
    input  [2:0] exop, // 控制信号
    output reg[31:0] imm // 输出立即数
    );
    always @(*) begin
        case (exop)
            3'b000: begin imm <= {{20{instruct[31]}} , instruct[31:20]}; end // ori lw immI 
            3'b001: begin imm <= {instruct[31:12], 12'b0}; end // lui immU 
            3'b010: begin imm <= {{20{instruct[31]}}, instruct[31:25], instruct[11:7]}; end // sw immS
            3'b011: begin imm <= {{20{instruct[31]}}, instruct[7], instruct[30:25], instruct[11:8], 1'b0}; end // beq immB
            3'b100: begin imm <= {{12{instruct[31]}}, instruct[19:12], instruct[20], instruct[30:21], 1'b0}; end // jal immJ
            3'b101: begin imm <= {{27{instruct[31]}}, instruct[24:20]}; end // slli
            3'b110: begin imm <= {20'b0 , instruct[31:20]}; end // 无符号扩展31:20立即数
        endcase
    end

endmodule
