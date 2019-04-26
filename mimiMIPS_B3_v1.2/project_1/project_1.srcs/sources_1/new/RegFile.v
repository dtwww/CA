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
    input  wire [ 4: 0] r1addr, // 第一个读寄存器端口要读取的地址
    output reg [31: 0] r1data, // 第一个读寄存器端口读出的数据
    input  wire [ 4: 0] r2addr,
    output reg [31: 0] r2data,
    // write section
    input  wire         wreg,       // 写使能
    input  wire [ 4: 0] wraddr,     // 写寄存器端口要写入的地址
    input  wire [31: 0] wrdata      // 要写入的数据
    
   // input wire r1read, // 寄存器1读使能
    //input wire r2read
);

    reg  [31: 0] GPR [31: 0]; // General-Purpose Registers 32个通用寄存器

    integer i;
    initial begin // 32个寄存器赋初值0
        for (i = 0; i < 32; i = i + 1)
            GPR[i] = 32'b0;
    end

    // 写操作
    always @(posedge clk) begin
        if(!rst) begin
            if(wreg) GPR[wraddr] <= wrdata; // 写使能则写入数据
        end
    end

    // 读操作 没有数据前推！
//    assign r1data = r1addr == 5'b0 ? 32'b0 : GPR[r1addr];
//    assign r2data = r2addr == 5'b0 ? 32'b0 : GPR[r2addr];
    
        // 读端口1 的读操作
        always @ (*) begin
           // 如果重置则读出 32'h0
          if(rst || r1addr == 5'b0) begin
              r1data <= 32'b0;
           // 当读地址与写地址相同，且写使能时，要把写入的数据直接读出来。实现了相隔两条的数据前推
          end else if((r1addr == wraddr) && (wreg == 1)) begin
                r1data <= wrdata;
           // 否则读取相应寄存器单元
          end else begin
              r1data <= GPR[r1addr];
          end
        end
     
            // 读端口2 的读操作
            always @ (*) begin
               // 如果重置则读出 32'h0
              if(rst || r2addr == 5'b0) begin
                  r2data <= 32'b0;
               // 当读地址与写地址相同，且写使能，则要把写入的数据直接读出来
               //   数据前推的实现，后面会提及
              end else if((r2addr == wraddr) && (wreg == 1)) begin
                    r2data <= wrdata;
               // 否则读取相应寄存器单元
              end else begin
                  r2data <= GPR[r2addr];
              end
            end

endmodule

