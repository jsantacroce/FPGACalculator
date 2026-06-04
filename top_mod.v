`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2026 11:58:34 PM
// Design Name: 
// Module Name: top_mod
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


module top_mod(
    input wire clk_100M,
    input wire btnL,
    input wire btnR,
    input wire [7:0] sw,
    output wire [6:0] seg,
    output wire [3:0] an,
    output wire led_two
);

    wire reset = btnL;
    wire tick_1k;
    wire load1, load2, loadop;
    wire ans_flag;
    wire [7:0] A;
    wire [7:0] B;
    wire [2:0] op;
    wire [15:0] ans;
    wire two_flag;
    wire [15:0] disp;

    clk_div u_clkdiv (
        .clk_100M(clk_100M),
        .reset(reset),
        .tick_1k(tick_1k)
    );
    ctrl_mod u_ctrl (
        .clk_100M(clk_100M),
        .reset(reset),
        .btnR(btnR),
        .load1(load1),
        .load2(load2),
        .loadop(loadop),
        .ans_flag(ans_flag)
    );
    reg1 u_regA(
        .reset(reset),
        .clk_100M(clk_100M),
        .load1(load1),
        .sw(sw),
        .out(A)
    );
    reg1 u_regB (
        .reset(reset),
        .clk_100M(clk_100M),
        .load1(load2),
        .sw(sw),
        .out(B)
    );
    reg_op u_op (
        .clk_100M(clk_100M),
        .reset(reset),
        .sw(sw[2:0]),
        .loadop(loadop),
        .op(op)
    );
    alu u_alu (
        .regA(A),
        .regB(B),
        .op(op),
        .ans(ans),
        .two_flag(two_flag)
    );
    disp_sel u_disp (
        .ans(ans),
        .sw(sw),
        .loadop(loadop),
        .ans_flag(ans_flag),
        .disp(disp)
    );
    D_D u_dd (
        .clk_100M(clk_100M),
        .reset(reset),
        .tick_1k(tick_1k),
        .disp(disp),
        .seg(seg),
        .an(an)
    );
    assign led_two = two_flag;

endmodule
