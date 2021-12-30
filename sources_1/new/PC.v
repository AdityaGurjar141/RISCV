`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2021 04:22:42 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,rst,run,
    input complete_bit,
    input [31:0] a,
    output [31:0] out
    );
    reg [31:0] counter;
    
    
    always @(posedge clk) begin
    
    if(rst)    counter<=32'h01000000;

    end
    
    always @(posedge complete_bit)begin
    
//    if (complete_bit)  counter<=counter + 32'h00000004;
     if(run) counter<=a;
    end
    
    assign out = counter;
    
endmodule
