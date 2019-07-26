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
    input  wire         clk, // ʱ��
    input  wire         rst, // ��λ
    input  wire         br_flag,    // branch flags
    input  wire [31: 0] br_addr,    // branch address
    output reg  [31: 0] pc, // Ҫ��ȡ��ָ���ַ
    input  wire [ 5: 0] stall
);

    always @(posedge clk, posedge rst) begin
        if(rst) begin // ��λ
            pc   <= 32'b0;
        end
        else begin
            if(br_flag) begin
                pc <= br_addr; // ��֧ pc��ֵΪ��ָ֧���ַ
            end else if(stall[0] == 1'b0) begin // stall�źŵ�0λ����PCģ��
                pc <= pc + 32'd4; // pc + 4
            end
        end
//        else begin
//            if(br_flag) begin
//                pc <= br_addr; // ��֧ pc��ֵΪ��ָ֧���ַ
//            end else begin
//                pc <= pc + 32'd4; // pc + 4
//            end
//        end
    end

endmodule