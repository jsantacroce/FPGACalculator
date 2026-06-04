`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2026 10:51:18 PM
// Design Name: 
// Module Name: D_D
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


module D_D(
    input wire clk_100M,
    input wire tick_1k,
    input wire reset,
    input wire [15:0] disp,
    output reg [6:0] seg,
    output reg [3:0] an
);
    reg [1:0] digsel;
    reg [3:0] dig;
    always @(posedge clk_100M) begin
        if (reset)
            digsel <= 2'd0;
        else if (tick_1k)
            digsel <= digsel + 1'b1;
    end
    always @(*) begin
        case (digsel)
            2'd0: dig = disp[3:0];
            2'd1: dig = disp[7:4];
            2'd2: dig = disp[11:8];
            2'd3: dig = disp[15:12];
            default: dig = 4'h0;
        endcase
    end
    always @(*) begin
        case (dig)
            4'h0: seg = 7'b1000000;
            4'h1: seg = 7'b1111001;
            4'h2: seg = 7'b0100100;
            4'h3: seg = 7'b0110000;
            4'h4: seg = 7'b0011001;
            4'h5: seg = 7'b0010010;
            4'h6: seg = 7'b0000010;
            4'h7: seg = 7'b1111000;
            4'h8: seg = 7'b0000000;
            4'h9: seg = 7'b0010000;
            4'hA: seg = 7'b0001000;
            4'hB: seg = 7'b0000011;
            4'hC: seg = 7'b1000110;
            4'hD: seg = 7'b0100001;
            4'hE: seg = 7'b0000110;
            4'hF: seg = 7'b0001110;
            default: seg = 7'b1111111;
        endcase
    end
    always @(*) begin
        case (digsel)
            2'd0: an = 4'b1110;
            2'd1: an = 4'b1101;
            2'd2: an = 4'b1011;
            2'd3: an = 4'b0111;
            default: an = 4'b1111;
        endcase
    end

endmodule
