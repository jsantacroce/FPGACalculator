`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2026 10:42:20 PM
// Design Name: 
// Module Name: disp_sel
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

module disp_sel(
    input wire [15:0] ans,
    input wire [7:0]  sw,
    input wire ans_flag,
    input wire loadop,
    output reg [15:0] disp
);

    always @(*) begin
        if (ans_flag) begin
            disp = ans;
        end
        else if (loadop) begin
            disp = {13'd0, sw[2:0]};
        end 
        else begin
            disp = {8'h00, sw};
        end
    end
endmodule
