`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2026 11:15:22 PM
// Design Name: 
// Module Name: ctrl_mod
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


module ctrl_mod (
    input wire clk_100M,
    input wire reset,
    input wire btnR,
    output reg load1,
    output reg load2,
    output reg loadop,
    output reg ans_flag
);

    reg [2:0] state, next_state;
    reg btnR_sync, btnR_prev;
    wire btnR_pulse;

    always @(posedge clk_100M) begin
        if (reset) begin
            btnR_sync <= 1'b0;
            btnR_prev <= 1'b0;
        end else begin
            btnR_sync <= btnR;
            btnR_prev <= btnR_sync;
        end
    end

    assign btnR_pulse = btnR_sync & ~btnR_prev;

    always @(posedge clk_100M) begin
        if (reset)
            state <= 3'd0;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case (state)
            3'd0: begin
                if (btnR_pulse) next_state = 3'd1;//wait for first operand
            end
            3'd1: begin
                next_state = 3'd2;//buffer state
            end
            3'd2: begin
                if (btnR_pulse) next_state = 3'd3;//wait for second operand
            end
            3'd3: begin
                next_state = 3'd4;//buffer state
            end
            3'd4: begin
                if (btnR_pulse) next_state = 3'd5;//wait for operation
            end
            3'd5: begin
                next_state = 3'd6;//buffer state
            end
            3'd6: begin
                next_state = 3'd6;//wait for return input
            end
            default: next_state = 3'd0;
        endcase
    end

    always @(*) begin
        load1 = 1'b0;
        load2 = 1'b0;
        loadop = 1'b0;
        ans_flag = 1'b0;

        case (state)
            3'd0: load1 = 1'b1;
            3'd3: load2 = 1'b1;
            3'd5: loadop = 1'b1;
            3'd6: ans_flag = 1'b1;
            default: ;
        endcase
    end

endmodule
