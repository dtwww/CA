`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/23 09:29:12
// Design Name: 
// Module Name: CTRL
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


module CTRL(
	input wire					 rst,
    input wire                   stallreq_from_id, // 来自ID阶段的暂停请求
    input wire                   stallreq_from_ex, // 来自EX阶段的暂停请求
    output reg[5:0]              stall   
    );
    
    // 1表示暂停，0表示继续执行
    always @ (*) begin
        if(rst) begin
            stall <= 6'b000000;
        end else if(stallreq_from_ex) begin
            stall <= 6'b001111;
        end else if(stallreq_from_id) begin
            stall <= 6'b000111;            
        end else begin
            stall <= 6'b000000;
        end    //if
    end      //always
    
endmodule
