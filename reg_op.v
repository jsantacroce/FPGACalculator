`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2026 08:14:12 PM
// Design Name: 
// Module Name: reg_op
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


module reg_op(
    input wire clk_100M,
    input wire reset,
    input wire [2:0] sw,
    input wire loadop,
    output reg [2:0] op
    );
    always @(posedge clk_100M) begin
        if (reset) begin
            op[2:0] <= 3'd0;
        end
        else if (loadop) begin
            op[2:0] <= sw[2:0];
        end
    end
endmodule
