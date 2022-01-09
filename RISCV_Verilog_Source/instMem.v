`timescale 1ns / 1ps
module instMem(
    input  clear, // 配合rstn
    input  [31:0] address, //地址
    output reg [31:0] instruct 
    );
    reg [31:0] iMem[0:255]; 
    
    always @( *) begin
        if(~clear)begin
            iMem[0]<=32'h00000037;
            iMem[1]<=32'h000000b7;
            iMem[2]<=32'h02002103;
            iMem[3]<=32'h000001B7;
            iMem[4]<=32'h00402203;
            iMem[5]<=32'h000002B7;
            iMem[6]<=32'h00000337;
            iMem[7]<=32'h00802383;
            iMem[8]<=32'h00000437;
            iMem[9]<=32'h000004B7;
            iMem[10]<=32'h00000537;
            iMem[11]<=32'h00C02583;
            iMem[12]<=32'h000004B3;
            iMem[13]<=32'h001102B3;
            iMem[14]<=32'h0242C1B3;
            iMem[15]<=32'h02B181B3;
            iMem[16]<=32'h0001A303;
            iMem[17]<=32'h02730263;
            iMem[18]<=32'h00735463;
            iMem[19]<=32'h00734863;
            iMem[20]<=32'h00300133;
            iMem[21]<=32'h02B14133;
            iMem[22]<=32'hFDDFF46F;
            iMem[23]<=32'h003000B3;
            iMem[24]<=32'h02B0C0B3;
            iMem[25]<=32'hFD1FF46F;
            iMem[26]<=32'h003004B3;
            iMem[27]<=32'h02B4C4B3;
        end
    end

    always @(*) begin
        if(~clear)
            instruct<=0;
        else
            instruct<=iMem[address[9:2]];
    end
endmodule

