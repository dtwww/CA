//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Annotation:      SPC
// Module Name:     IF_ID
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
module IF_ID
(
    input  wire         clk,
    input  wire         rst,

    input  wire [31: 0] if_pc, // 取得的指令地址
    input  wire [31: 0] if_inst, // 取得的指令

    output reg  [31: 0] id_pc,      // 指令地址
    output reg  [31: 0] id_inst,     // 指令
    input wire  [ 5: 0] stall
);

    always @(posedge clk, posedge rst) begin
        if(rst) begin // 复位信号上升沿
            id_pc   <= 32'b0;
            id_inst <= 32'b0;
        end
        else if(stall[1] == 1'b1 && stall[2] == 1'b0) begin //传递数据
            id_pc <= 32'b0;
            id_inst <= 32'b0;
            // 否则继续执行
        end else if(stall[1] == 1'b0) begin
            id_pc   <= if_pc;
            id_inst <= if_inst;
        end
    end

endmodule