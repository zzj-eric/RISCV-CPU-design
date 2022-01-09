`timescale 1ns / 1ps

module PC(
    input clk,//CPU时钟
    input rstn,//reset信号              
    input [31:0] nextPc,//下一条指令的地址

    output reg [31:0] nowPc,//目前指令的地址
    output reg clear//归零信号
    );

    always @(posedge clk or negedge rstn) begin
        if(~rstn)
            clear<=1'b0;
        else
            clear<=1'b1;
    end
    always @(posedge clk) begin
        if(~clear)
            nowPc<=32'b0;
        else
            nowPc<=nextPc;
    end
endmodule
