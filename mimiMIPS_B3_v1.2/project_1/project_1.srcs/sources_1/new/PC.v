//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Annotation:      SPC
// Module Name:     PC
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
module PC
(
    input  wire         clk, // 时钟
    input  wire         rst, // 复位
    input  wire         br_flag,    // branch flags
    input  wire [31: 0] br_addr,    // branch address
    output reg  [31: 0] pc // 要读取的指令地址
);

    always @(posedge clk, posedge rst) begin
        if(rst) begin // 复位信号上升沿
            pc   <= 32'b0;
        end
        else begin
            if(br_flag) pc <= br_addr; // 分支 pc赋值为分支指令地址
            else pc <= pc + 32'd4; // pc + 4
        end
    end

endmodule