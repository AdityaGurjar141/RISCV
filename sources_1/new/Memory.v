`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2021 04:22:42 PM
// Design Name: 
// Module Name: IDmem
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


module Memory(
    input clk, wr, rw,
    input [31:0] Addr,          //alu is connected to dec_reg -> to Datamem
    input [31:0] PCA,
    input [31:0] in_bits,
    output [31:0] out_bits,
    output [31:0] i_outs
    );

    reg [7:0] Imem[2047:0];
    reg [7:0] numbers[11:0]; 

    reg [7:0] Dmem[4095:0];
    reg [31:0] in_buffer;
    reg [31:0] out_buffer;
    reg [31:0] i_out_buffer;
    
    initial begin
        numbers[3] = 8'h11;
        numbers[2] = 8'h71;
        numbers[1] = 8'h91;
        numbers[0] = 8'h95;
       
        
        numbers[7] = 8'h16;
        numbers[6] = 8'h03;
        numbers[5] = 8'h29;
        numbers[4] = 8'h76;
        
        numbers[11] = 8'h11;
        numbers[10] = 8'h75;
        numbers[9] = 8'h94;
        numbers[8] = 8'h26;                
        end
        
        
        // READ 
        
        always @(posedge clk) begin
        if(rw) begin
        
        if (Addr[31:20]==12'h001) begin
            //out_buffer<={Dmem[Addr[11:0]+12'd3], Dmem[Addr[11:0]+12'd2], Dmem[Addr[11:0]+12'd1], Dmem[Addr[11:0]]};
           out_buffer[31:24]<=numbers[Addr[11:0]+12'd3];
           out_buffer[23:16]<=numbers[Addr[11:0]+12'd2];
           out_buffer[15:8]<=numbers[Addr[11:0]+12'd1];
           out_buffer[7:0]<=numbers[Addr[11:0]];
        end
            
        else if (Addr[31:20]==12'h800) begin
            //out_buffer<={Dmem[Addr[11:0]+12'd3], Dmem[Addr[11:0]+12'd2], Dmem[Addr[11:0]+12'd1], Dmem[Addr[11:0]]};
            out_buffer[31:24]<=Dmem[Addr[11:0]+12'd3];
            out_buffer[23:16]<=Dmem[Addr[11:0]+12'd2];
            out_buffer[15:8]<=Dmem[Addr[11:0]+12'd1];
            out_buffer[7:0]<=Dmem[Addr[11:0]];
            end
            
        if (PCA[31:20]==12'h010) begin
            //out_buffer<={Imem[Addr[11:0]+12'd3], Imem[Addr[11:0]+12'd2], Imem[Addr[11:0]+12'd1], Imem[Addr[11:0]]};
            i_out_buffer[31:24]<=Imem[PCA[11:0]+12'd3];
            i_out_buffer[23:16]<=Imem[PCA[11:0]+12'd2];
            i_out_buffer[15:8]<=Imem[PCA[11:0]+12'd1];
            i_out_buffer[7:0]<=Imem[PCA[11:0]];
            end
        end
        end
        
   assign out_bits=out_buffer;
   assign i_outs = i_out_buffer;
   
   
        // WRITE
          always @(posedge clk) begin  
          if (wr) begin
              if (Addr[31:20]==12'h800) begin
              Dmem[Addr[11:0]+12'd3]<=in_bits[31:24];
              Dmem[Addr[11:0]+12'd2]<=in_bits[23:16];
              Dmem[Addr[11:0]+12'd1]<=in_bits[15:8];
              Dmem[Addr[11:0]]<=in_bits[7:0];
          
          end
          end
                  
                  
                  
                  
                  
          end 
        
endmodule
