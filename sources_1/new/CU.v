`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2021 04:22:42 PM
// Design Name: 
// Module Name: CU
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


module CU(
    input clk,rst,
    input [31:0] in_bits,
    output complete_bit, wrM,rwM,wrR,rwR,
    output [16:0] opdata,
    output  last20,
    output [18:0] toMain
    );

    reg [31:0] inn;
    reg [31:0] hold_i;
    
assign opdata = {in_bits[16:10], in_bits[9:7], in_bits[6:0]};
assign last20 = in_bits[20];

    
    always@ *
begin
    case (in_bits[6:0])
    
    7'b0110111 : begin 

                 end
    7'b0010111 : begin 
                       
                 end
    7'b1101111 : begin 
                       
                    
                 end
    7'b1100111 : begin 
    
                 end
                 
    7'b1100011 : begin
                                 case(in_bits[14:12])
                 3'd0:begin end
                 3'd1:begin end
                 3'd4:begin  end
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
                 case(in_bits[14:12])
                 3'd0: begin  end
                 3'd2: begin  end
                 3'd3: begin  end
                 3'd4: begin  end
                 3'd6: begin  end
                 3'd7: begin  end
                 3'd1: begin  end
                 3'd5: begin 
                 if(in_bits[31:25]==7'b0100000)
                 begin
                 
                 end
                 else if(in_bits[31:25]==7'd0)
                 begin
                 
                 end
                 end
                 endcase
                 
                 end
      7'b0110011:begin
                 case(in_bits[14:12])
                 3'd0 : if(in_bits[31:25]==7'd0) begin  end
                 else if(in_bits[31:25]==7'b0100000) begin   end
                 
                 3'd1: begin  end
                 3'd2: begin  end
                 3'd3: begin  end
                 3'd4: begin  end
                 3'd5 : begin  if(in_bits[31:25]==7'd0) begin  end
                 else if(in_bits[31:25]==7'b0100000) begin   end end
                 3'd6 : begin  end
                 3'd7 : begin  end
                 endcase
                 
                 end
      7'b0001111 : begin
                 
                 end
      7'b1110011 : begin
                 if(in_bits[31:20]==12'b000000000000)begin end
                 else if(in_bits[31:20]==12'b000000000001) begin end
                 end
                 




    endcase
end

    
endmodule
