`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2026 07:36:36 PM
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input wire clk_100M,
    input wire reset,
    output reg tick_1k = 1'b0
);
    parameter DIV_1K = 17'd100000;
    reg [16:0] c2 = 32'd0;

    always @(posedge clk_100M) begin
        if (reset) begin//on reset initialize all to 0
            c2 <= 17'd0;
            tick_1k <= 1'b0;
        end else begin//ticks low

            tick_1k <= 1'b0;

            if (c2 == DIV_1K-1) begin//1KHz tick, same logic
                c2 <= 17'd0;
                tick_1k <= 1'b1;
            end else begin
                c2 <= c2 + 1'b1;
            end
        end
    end
endmodule
