module i_sram_to_sram_like (
    input wire clk, rst,
    //sram
    input wire inst_sram_en,
    input wire [31:0] inst_sram_addr,
    output wire [31:0] inst_sram_rdata,
    output wire i_stall,
    //sram like
    output wire inst_req, //
    output wire inst_wr,
    output wire [1:0] inst_size,
    output wire [31:0] inst_addr,
    output wire [31:0] inst_wdata,
    input wire inst_addr_ok,
    input wire inst_data_ok,
    input wire [31:0] inst_rdata,
    input [3:0] cnt,

    input wire all_stall
);
    reg addr_rcv;      //地址握手成功
    reg do_finish;     //读事务结束

    always @(posedge clk) begin
        addr_rcv <= rst          ? 1'b0 :
                    inst_req & inst_addr_ok & ~inst_data_ok ? 1'b1 :    //保证先inst_req再addr_rcv；如果addr_ok同时data_ok，则优先data_ok
                    inst_data_ok ? 1'b0 : addr_rcv;
    end

    always @(posedge clk) begin
        do_finish <= rst          ? 1'b0 :
                     inst_data_ok ? 1'b1 :
                     ~all_stall ? 1'b0 : do_finish;
    end

    //save rdata
    reg [31:0] inst_rdata_save;
    always @(posedge clk) begin
        inst_rdata_save <= rst ? 32'b0:
                           inst_data_ok ? inst_rdata : inst_rdata_save;
    end

    //sram like
    assign inst_req = inst_sram_en & ~addr_rcv & ~do_finish;
    assign inst_wr = 1'b0;
    assign inst_size = 2'b10;
    assign inst_addr = inst_sram_addr;
    assign inst_wdata = 32'b0;

    //sram
    assign inst_sram_rdata = inst_rdata_save;
    assign i_stall = inst_sram_en & ~do_finish;
    // assign i_stall = inst_sram_en & ~inst_data_ok & ~do_finish;
endmodule