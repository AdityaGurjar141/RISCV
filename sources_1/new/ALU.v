`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2021 01:21:30 PM
// Design Name: 
// Module Name: alu
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


module ALU(
    input clk, 
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    input [19:0] last20,
    input [31:0] A,
    input [31:0] B,
    output [31:0] C
    );
    reg [31:0] result;
    
    
    
    
    always@ *
begin
    case (opcode)
    
    7'b0110111 : begin 

                 end
    7'b0010111 : begin 
                       
                 end
    7'b1101111 : begin 
                       
                    
                 end
    7'b1100111 : begin 
    
                 end
                 
    7'b1100011 : begin
                                 case(funct3)
                 3'd0:begin end
                 3'd1:begin end
                 3'd4:begin end
                 3'd5:begin end
                 3'd6:begin end
                 3'd7:begin end
                 endcase
                 end
                 
      7'b0000011:begin
                 end
      7'b0100011:begin

                 end
      7'b0010011:begin
                 case(funct3)
                 3'd0: begin  end
                 3'd2: begin  end
                 3'd3: begin  end
                 3'd4: begin  end
                 3'd6: begin  end
                 3'd7: begin  end
                 3'd1: begin  end
                 3'd5: begin 
                 if(funct7==7'b0100000)
                 begin
                 
                 end
                 else if(funct7==7'd0)
                 begin
                 
                 end
                 end
                 endcase
                 
                 end
      7'b0110011:begin
                 case(funct3)
                 3'd0 : if(funct7==7'd0) begin  end
                 else if(funct7==7'b0100000) begin   end
                 
                 3'd1: begin  end
                 3'd2: begin  end
                 3'd3: begin  end
                 3'd4: begin  end
                 3'd5 : begin  if(funct7==7'd0) begin  end
                 else if(funct7==7'b0100000) begin   end end
                 3'd6 : begin  end
                 3'd7 : begin  end
                 endcase
                 
                 end
      7'b0001111 : begin
                 
                 end
      7'b1110011 : begin
                 if(last20==12'b000000000000)begin end
                 else if(last20==12'b000000000001) begin end
                 end
                 




    endcase
end

 
endmodule
