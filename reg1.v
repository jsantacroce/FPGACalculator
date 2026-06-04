`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2026 07:56:53 PM
// Design Name: 
// Module Name: reg1
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


module reg1(
    input wire reset,
    input wire clk_100M,
    input wire load1,
    input wire [7:0]sw,
    output reg [7:0]out
    );
    
    always @(posedge clk_100M) begin
        if (reset) begin
            out[7:0] <= 8'd0;
        end
        else if (load1) begin
            out[7:0] <= sw[7:0];
        end
    end
endmodule
