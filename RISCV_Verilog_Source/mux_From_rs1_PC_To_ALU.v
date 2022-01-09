`timescale 1ns / 1ps

module mux_From_rs1_PC_To_ALU(
    input  mrs1andpc_ctr,
    input  [31:0] rs1,
    input  [31:0] pc,
    output reg[31:0] mrs1andpc_out
    );
    always @( *) begin
        case (mrs1andpc_ctr)
            1'b0:begin
                mrs1andpc_out<=rs1;
            end
            1'b1:begin
                mrs1andpc_out<=pc;
            end
        endcase
    end
endmodule
