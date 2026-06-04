`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2026 08:39:24 PM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(
    input wire [2:0] op,
    input wire [7:0] regA,
    input wire [7:0] regB,
    output reg[15:0] ans,
    output wire two_flag
    );  
        always @(*) begin
        case (op)
            3'b000: ans = {8'd0, (regA ^ regB)};//XOR
            3'b001: ans = {8'd0, (regA & regB)};//AND
            3'b010: ans = {8'd0, (regA | regB)};//OR
            3'b011: ans = {8'd0, regA} + {8'd0, regB};//ADD
            3'b100: ans = $signed({1'b0, regA}) - $signed({1'b0, regB});//SUB
            default: ans = 16'd0;
        endcase
    end
    assign two_flag = (op == 3'b100) && ans[15];

endmodule