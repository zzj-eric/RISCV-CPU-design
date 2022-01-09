`timescale 1ns / 1ps
module dataMem(
    input  rstn,
    input  clk,
    input  isWriteMem,//写使能信号
    input  [31:0] address,//要写入的地址
    input  [31:0] WriteData,//要写入的数据
    output reg  [31:0] ReadData//读出的数据
    );

    reg [31:0] mem[0:255];
    initial begin mem = 0; end
    always @(posedge clk or negedge rstn) begin
        if(rstn&&isWriteMem)
            mem[address[9:2]]<=WriteData;
        else if(rstn&&!isWriteMem)
            ReadData<=mem[address[9:2]];
        else if(~rstn&&!isWriteMem)
            ReadData<=32'b0;
    end
endmodule

