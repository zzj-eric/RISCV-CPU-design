`timescale 1ns / 1ps

module mux_From_rs2_To_mem(
    input  [1:0]mrs2_ctr,
    input  [31:0]rs2,

    output reg [31:0] mrs2_out
    );

    always @( *) begin
        case (mrs2_ctr)
            1'b00:begin
                mrs2_out<=rs2;
            end
            2'b01:begin
               mrs2_out <= {{24{rs2[7]}}, rs2[7:0]};
            end
            2'b11:begin
               mrs2_out <= {{16{rs2[15]}}, rs2[15:0]};
            end
            
        endcase
    end
endmodule
