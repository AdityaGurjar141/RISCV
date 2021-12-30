`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2021 01:28:22 AM
// Design Name: 
// Module Name: Main
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


module Main(
    input clk,
    input rst,
    input run
    );
    
    //1,2,3... represent a sequence of connections
    //A.B,C... represent parallel connections
    
    //PC to PC
    wire [31:0] pc2pc;
    wire [31:0] pc2pc2;
    wire [31:0] pc2pc3;
    //PC to Mem
    //wire [31:0] pc2mem;  //just pc2pc
    //PC to reg
    //wire [31:0] pc2pc; acts as  pc2reg;
    //wire [31:0] pc2reg2;  its just pc2pc2
    wire [31:0] pc2reg3;
    //PC to ALU
    //wire [31:0] pc2alu;    its just pc2pc
    wire [31:0] pc2alu2;
    //PC to CU
    //empty
    
    
    //Mem to PC
    //empty   
    //Mem to Reg
    wire [31:0] mem2reg;
    //wire [4:0]mem2regB;  //might be redundant
    //wire [4:0]mem2regC;   //might be redundant
    wire [31:0] mem2regD;   // from dataMemory 
    wire [31:0] mem2regD2;      //data_extender why? answer write here [__ ]
    wire [31:0] mem2regD3;
    //wire [31:0] pc2reg3 acts as mem2regD4 
    //mem to ALU
    //wire [19:0]mem2alu;  //mem2reg 31bits long is used for this    //Data can be 12 or 20 bits wide depending on type of instructions
    wire [31:0]mem2alu2; //extended output
    wire [31:0]mem2alu3;  //also used as reg2alu2
    //mem to CU
    wire [31:0] mem2cu;
    
    
    //Reg to PC
    //empty
    //Reg to mem
    wire [31:0] reg2mem;
    //Reg to ALU
    wire [31:0]reg2alu;
    //wire [31:0] pc2alu2 acts as reg2alu2
    //wire [31:0]reg2aluB; is actually just reg2mem
    //wire mem2alu3 acts as reg2aluB2
    //Reg to CU
    //empty
    
    
    //ALU to PC
    //wire [31:0] alu2pc;       just use alu2reg
    //wire [31:0] pc2pc3 acts as alu2pc2
    //ALU to Mem
    //wire [31:0] alu2mem;  Just use alu2reg
    //ALU to Reg
    wire [31:0] alu2reg;  //wil act as alu2mem and alu2pc same wire.
    //wire [31:0] mem2regD3 acts as alu2reg2
    //wire [31:0] pc2reg3 acts as mem2regD4 which acts as alu2reg3    
    //ALU to CU
    //empty
    
    
    //CU to PC
    wire complete_bit; 
    //CU to Mem
    wire wrM;
    wire rwM;
    //CU to Reg
    wire rwR;
    wire wrR;
    //CU to ALU
    wire [16:0]opdata;
    wire last20;
    
    //CU to all other main combinational conmpnents such as mux
    
    //All the main combinational functions
    reg [31:0] mux1;
    reg [31:0] plus4;
    reg [31:0] mux2;
    reg [31:0] mux3;
    reg [31:0] mux4;
    reg [31:0] mux5;
    reg [31:0] i_ext;
    reg [31:0] d_ext;

//Port maps to everything
//PC
PC u1(.clk(clk), .rst(rst), .complete_bit(complete_bit), .run(run), .a(pc2pc3), .out(pc2pc)); 
//Mem
    Memory u2(.clk(clk), .wr(wrM), .rw(rwM), .Addr(alu2reg), .PCA(pc2pc), .in_bits(reg2mem), .out_bits(mem2regD), .i_outs(mem2reg));
//Reg
    RegF u3(.clk(clk), .rst(rst), .rw(rwR), .wr(wrR), .Ad_rs1(mem2reg[19:15]), .Ad_rs2(mem2reg[24:20]), .Ad_rd(mem2reg[11:7]), .rd_data_in(pc2reg3), .rs1_data(reg2alu), .rs2_data(reg2mem) );
// ALU
    ALU u4(.clk(clk), .opcode(opdata[6:0]), .funct3(opdata[9:7]), .funct7(opdata[16:10]), .last20(last20), .A(pc2alu2), .B(mem2alu3), .C(alu2reg));
// CU
    
  
// This block connects the combinational components     
//  in the main file with the output wires that will carry the signal

assign pc2pc3 = mux1;
assign pc2pc2 = plus4;
assign pc2reg3 = mux2;
assign mem2alu2 = i_ext;
assign pc2alu2 = mux3;
assign mem2alu3 = mux4;
assign mem2regD2 = d_ext;
assign mem2regD3 = mux5;


    
always@ *
begin
    


end
    

endmodule
