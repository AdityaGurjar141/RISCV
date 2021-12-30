`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2021 04:22:42 PM
// Design Name: 
// Module Name: RegF
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


//x0	zero	hardwired zero	-
//x1	ra	return address	Caller
//x2	sp	stack pointer	Callee
//x3	gp	global pointer	-
//x4	tp	thread pointer	-
//x5-7	t0-2	temporary registers	Caller
//x8	s0 / fp	saved register / frame pointer	Callee
//x9	s1	saved register	Callee
//x10-11	a0-1	function arguments / return values	Caller
//x12-17	a2-7	function arguments	Caller
//x18-27	s2-11	saved registers	Callee
//x28-31	t3-6	temporary registers	Caller

module RegF(
    input clk,
    input rst,
    input rw,
    input wr,
    input [4:0] Ad_rs1,
    input [4:0] Ad_rs2,
    input [4:0] Ad_rd,
    input [31:0] rd_data_in,
    output [31:0] rs1_data,
    output [31:0] rs2_data

    );
    reg[31:0] regfile [0:31];
    
    initial begin
    regfile[0] = 32'h00000000;
    
    end
    
    always @(posedge clk) begin
    if(rst)
    begin
    regfile[1] <= 32'h00000000;
    regfile[2] <= 32'h00000000;
    regfile[3] <= 32'h00000000;
    regfile[4] <= 32'h00000000;
    regfile[5] <= 32'h00000000;
    regfile[6] <= 32'h00000000;
    regfile[7] <= 32'h00000000;
    regfile[8] <= 32'h00000000;
    regfile[9] <= 32'h00000000;
    regfile[10] <= 32'h00000000;
    regfile[11] <= 32'h00000000;
    regfile[12] <= 32'h00000000;
    regfile[13] <= 32'h00000000;
    regfile[14] <= 32'h00000000;
    regfile[15] <= 32'h00000000;
    regfile[16] <= 32'h00000000;
    regfile[17] <= 32'h00000000;
    regfile[18] <= 32'h00000000;
    regfile[19] <= 32'h00000000;
    regfile[20] <= 32'h00000000;
    regfile[21] <= 32'h00000000;
    regfile[22] <= 32'h00000000;
    regfile[23] <= 32'h00000000;
    regfile[24] <= 32'h00000000;
    regfile[25] <= 32'h00000000;
    regfile[26] <= 32'h00000000;
    regfile[27] <= 32'h00000000;
    regfile[28] <= 32'h00000000;
    regfile[29] <= 32'h00000000;
    regfile[30] <= 32'h00000000;
    regfile[31] <= 32'h00000000;
    end
    else if(wr)
    begin
        if      (Ad_rd == 5'd1) regfile[1] <= rd_data_in;
        if      (Ad_rd == 5'd2) regfile[2] <= rd_data_in;
        if      (Ad_rd == 5'd3) regfile[3] <= rd_data_in;
        if      (Ad_rd == 5'd4) regfile[4] <= rd_data_in;
        if      (Ad_rd == 5'd5) regfile[5] <= rd_data_in;
        if      (Ad_rd == 5'd6) regfile[6] <= rd_data_in;
        if      (Ad_rd == 5'd7) regfile[7] <= rd_data_in;
        if      (Ad_rd == 5'd8) regfile[8] <= rd_data_in;
        if      (Ad_rd == 5'd9) regfile[9] <= rd_data_in;
        if      (Ad_rd == 5'd10) regfile[10] <= rd_data_in;
        if      (Ad_rd == 5'd11) regfile[11] <= rd_data_in;
        if      (Ad_rd == 5'd12) regfile[12] <= rd_data_in;
        if      (Ad_rd == 5'd13) regfile[13] <= rd_data_in;
        if      (Ad_rd == 5'd14) regfile[14] <= rd_data_in;
        if      (Ad_rd == 5'd15) regfile[15] <= rd_data_in;
        if      (Ad_rd == 5'd16) regfile[16] <= rd_data_in;
        if      (Ad_rd == 5'd17) regfile[17] <= rd_data_in;
        if      (Ad_rd == 5'd18) regfile[18] <= rd_data_in;
        if      (Ad_rd == 5'd19) regfile[19] <= rd_data_in;
        if      (Ad_rd == 5'd20) regfile[20] <= rd_data_in;
        if      (Ad_rd == 5'd21) regfile[21] <= rd_data_in;
        if      (Ad_rd == 5'd22) regfile[22] <= rd_data_in;
        if      (Ad_rd == 5'd23) regfile[23] <= rd_data_in;
        if      (Ad_rd == 5'd24) regfile[24] <= rd_data_in;
        if      (Ad_rd == 5'd25) regfile[25] <= rd_data_in;
        if      (Ad_rd == 5'd26) regfile[26] <= rd_data_in;
        if      (Ad_rd == 5'd27) regfile[27] <= rd_data_in;
        if      (Ad_rd == 5'd28) regfile[28] <= rd_data_in;
        if      (Ad_rd == 5'd29) regfile[29] <= rd_data_in;
        if      (Ad_rd == 5'd30) regfile[30] <= rd_data_in;
        if      (Ad_rd == 5'd31) regfile[31] <= rd_data_in;
     
    end  
end    

    reg [31:0] rs1_buffer;
    reg [31:0] rs2_buffer;
       
    always @ *
    begin
    if(rw)
    begin
        case (Ad_rs1)
        5'd1: rs1_buffer = regfile[1];
        5'd2: rs1_buffer = regfile[2];
        5'd3: rs1_buffer = regfile[3];
        5'd4: rs1_buffer = regfile[4];
        5'd5: rs1_buffer = regfile[5];
        5'd6: rs1_buffer = regfile[6];
        5'd7: rs1_buffer = regfile[7];
        5'd8: rs1_buffer = regfile[8];
        5'd9: rs1_buffer = regfile[9];
        5'd10: rs1_buffer = regfile[10];
        5'd11: rs1_buffer = regfile[11];
        5'd12: rs1_buffer = regfile[12];
        5'd13: rs1_buffer = regfile[13];
        5'd14: rs1_buffer = regfile[14];
        5'd15: rs1_buffer = regfile[15];
        5'd16: rs1_buffer = regfile[16];
        5'd17: rs1_buffer = regfile[17];
        5'd18: rs1_buffer = regfile[18];
        5'd19: rs1_buffer = regfile[19];
        5'd20: rs1_buffer = regfile[20];
        5'd21: rs1_buffer = regfile[21];
        5'd22: rs1_buffer = regfile[22];
        5'd23: rs1_buffer = regfile[23];
        5'd24: rs1_buffer = regfile[24];
        5'd25: rs1_buffer = regfile[25];
        5'd26: rs1_buffer = regfile[26];
        5'd27: rs1_buffer = regfile[27];
        5'd28: rs1_buffer = regfile[28];
        5'd29: rs1_buffer = regfile[29];
        5'd30: rs1_buffer = regfile[30];
        5'd31: rs1_buffer = regfile[31];
        default : rs1_buffer = 32'h00000000;
        endcase

        case (Ad_rs2)
        5'd1: rs2_buffer = regfile[1];
        5'd2: rs2_buffer = regfile[2];
        5'd3: rs2_buffer = regfile[3];
        5'd4: rs2_buffer = regfile[4];
        5'd5: rs2_buffer = regfile[5];
        5'd6: rs2_buffer = regfile[6];
        5'd7: rs2_buffer = regfile[7];
        5'd8: rs2_buffer = regfile[8];
        5'd9: rs2_buffer = regfile[9];
        5'd10: rs2_buffer = regfile[10];
        5'd11: rs2_buffer = regfile[11];
        5'd12: rs2_buffer = regfile[12];
        5'd13: rs2_buffer = regfile[13];
        5'd14: rs2_buffer = regfile[14];
        5'd15: rs2_buffer = regfile[15];
        5'd16: rs2_buffer = regfile[16];
        5'd17: rs2_buffer = regfile[17];
        5'd18: rs2_buffer = regfile[18];
        5'd19: rs2_buffer = regfile[19];
        5'd20: rs2_buffer = regfile[20];
        5'd21: rs2_buffer = regfile[21];
        5'd22: rs2_buffer = regfile[22];
        5'd23: rs2_buffer = regfile[23];
        5'd24: rs2_buffer = regfile[24];
        5'd25: rs2_buffer = regfile[25];
        5'd26: rs2_buffer = regfile[26];
        5'd27: rs2_buffer = regfile[27];
        5'd28: rs2_buffer = regfile[28];
        5'd29: rs2_buffer = regfile[29];
        5'd30: rs2_buffer = regfile[30];
        5'd31: rs2_buffer = regfile[31];
        default : rs2_buffer = 32'h00000000;
        endcase
       end
    end
    
    assign rs1_data = rs1_buffer;
    assign rs2_data = rs2_buffer;
    
       
endmodule
