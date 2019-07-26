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

    input  wire [31: 0] if_pc, // ȡ�õ�ָ���ַ
    input  wire [31: 0] if_inst, // ȡ�õ�ָ��

    output reg  [31: 0] id_pc,      // ָ���ַ
    output reg  [31: 0] id_inst,     // ָ��
    input wire  [ 5: 0] stall
);

//    always @(posedge clk, posedge rst) begin
//        if(rst || (stall[1] == 1'b1 && stall[2] == 1'b0)) begin // ��λ��stall[1]Ϊ1����>=2λΪ0����ģ�鲻��������
//            id_pc   <= 32'b0;
//            id_inst <= 32'b0;
//        end else begin // ������������
//            id_pc   <= if_pc;
//            id_inst <= if_inst;
//        end
//    end

    always @(posedge clk, posedge rst) begin
        if(rst) begin // ��λ�ź�������
            id_pc   <= 32'b0;
            id_inst <= 32'b0;
        end else if(stall[1] == 1'b1 && stall[2] == 1'b0) begin // stall[1]Ϊ1����>=2λΪ0����ģ�鲻��������
            id_pc <= 32'b0;
            id_inst <= 32'b0;
        end else if(stall[1] == 1'b0) begin // ������������
            id_pc   <= if_pc;
            id_inst <= if_inst;
        end
    end

endmodule