//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Module Name:     RegFile
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
module RegFile
(
    input  wire         clk,
    input  wire         rst,
    // read section
    input  wire [ 4: 0] r1addr, // ��һ�����Ĵ����˿�Ҫ��ȡ�ĵ�ַ
    output reg [31: 0] r1data, // ��һ�����Ĵ����˿ڶ���������
    input  wire [ 4: 0] r2addr,
    output reg [31: 0] r2data,
    // write section
    input  wire         wreg,       // дʹ��
    input  wire [ 4: 0] wraddr,     // д�Ĵ����˿�Ҫд��ĵ�ַ
    input  wire [31: 0] wrdata      // Ҫд�������
    
   // input wire r1read, // �Ĵ���1��ʹ��
    //input wire r2read
);

    reg  [31: 0] GPR [31: 0]; // General-Purpose Registers 32��ͨ�üĴ���

    integer i;
    initial begin // 32���Ĵ�������ֵ0
        for (i = 0; i < 32; i = i + 1)
            GPR[i] = 32'b0;
    end

    // д����
    always @(posedge clk) begin
        if(!rst) begin
            if(wreg) GPR[wraddr] <= wrdata; // дʹ����д������
        end
    end

    // ������ û������ǰ�ƣ�
//    assign r1data = r1addr == 5'b0 ? 32'b0 : GPR[r1addr];
//    assign r2data = r2addr == 5'b0 ? 32'b0 : GPR[r2addr];
    
        // ���˿�1 �Ķ�����
        always @ (*) begin
           // ������������ 32'h0
          if(rst || r1addr == 5'b0) begin
              r1data <= 32'b0;
           // ������ַ��д��ַ��ͬ����дʹ��ʱ��Ҫ��д�������ֱ�Ӷ�������ʵ�����������������ǰ��
          end else if((r1addr == wraddr) && (wreg == 1)) begin
                r1data <= wrdata;
           // �����ȡ��Ӧ�Ĵ�����Ԫ
          end else begin
              r1data <= GPR[r1addr];
          end
        end
     
            // ���˿�2 �Ķ�����
            always @ (*) begin
               // ������������ 32'h0
              if(rst || r2addr == 5'b0) begin
                  r2data <= 32'b0;
               // ������ַ��д��ַ��ͬ����дʹ�ܣ���Ҫ��д�������ֱ�Ӷ�����
               //   ����ǰ�Ƶ�ʵ�֣�������ἰ
              end else if((r2addr == wraddr) && (wreg == 1)) begin
                    r2data <= wrdata;
               // �����ȡ��Ӧ�Ĵ�����Ԫ
              end else begin
                  r2data <= GPR[r2addr];
              end
            end

endmodule

