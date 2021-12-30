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


module IDmem(
    input clk, wr, rw,
    input [31:0] Addr,
    //input [31:0] PCA,
    input [31:0] in_bits,
    output [31:0] out_bits
    );
    reg [7:0] Imem0[63:0];
    reg [7:0] Imem1[63:0];
    reg [7:0] Imem2[63:0];
    reg [7:0] Imem3[63:0];
    //reg [8:0] Imem[2047:0];
    
    reg [7:0] Dmem0[127:0];
    reg [7:0] Dmem1[127:0];
    reg [7:0] Dmem2[127:0];
    reg [7:0] Dmem3[127:0];
    //reg [8:0] Dmem[4095:0];
    reg [31:0] out_buffer;
    
    initial begin
        Dmem3[0] = 8'h11;
        Dmem2[0] = 8'h71;
        Dmem1[0] = 8'h91;
        Dmem0[0] = 8'h95;
        
        Dmem3[1] = 8'h16;
        Dmem2[1] = 8'h03;
        Dmem1[1] = 8'h29;
        Dmem0[1] = 8'h76;
        
        Dmem3[2] = 8'h11;
        Dmem2[2] = 8'h75;
        Dmem1[2] = 8'h94;
        Dmem0[2] = 8'h26;                
        end
        
        
//        // READ 
        
//         always @(posedge clk) begin
//        if(rw) begin
        
//        if (Addr[31:16]==12'h001) begin
//            //out_buffer<={Dmem[Addr[11:0]+12'd3], Dmem[Addr[11:0]+12'd2], Dmem[Addr[11:0]+12'd1], Dmem[Addr[11:0]]};
//           out_buffer[31:24]<=Dmem[Addr[11:0]+12'd3];
//           out_buffer[23:16]<=Dmem[Addr[11:0]+12'd2];
//           out_buffer[15:8]<=Dmem[Addr[11:0]+12'd1];
//           out_buffer[7:0]<=Dmem[Addr[11:0]];
//        end
        
//        else if (Addr[31:16]==12'h010) begin
//            //out_buffer<={Imem[Addr[11:0]+12'd3], Imem[Addr[11:0]+12'd2], Imem[Addr[11:0]+12'd1], Imem[Addr[11:0]]};
//            out_buffer[31:24]<=Dmem[Addr[11:0]+12'd3];
//            out_buffer[23:16]<=Dmem[Addr[11:0]+12'd2];
//            out_buffer[15:8]<=Dmem[Addr[11:0]+12'd1];
//            out_buffer[7:0]<=Dmem[Addr[11:0]];
//            end
            
//        else if (Addr[31:16]==12'h800) begin
//            //out_buffer<={Dmem[Addr[11:0]+12'd3], Dmem[Addr[11:0]+12'd2], Dmem[Addr[11:0]+12'd1], Dmem[Addr[11:0]]};
//            out_buffer[31:24]<=Dmem[Addr[11:0]+12'd3];
//            out_buffer[23:16]<=Dmem[Addr[11:0]+12'd2];
//            out_buffer[15:8]<=Dmem[Addr[11:0]+12'd1];
//            out_buffer[7:0]<=Dmem[Addr[11:0]];
//            end
            
//        end
//        end
        
   assign out_bits=out_buffer;
   
   
        // WRITE
          always @(posedge clk) begin  
          if (wr) begin
              if (Addr[31:16]==12'h800) begin
              Dmem3[Addr[11:0]]<=in_bits[31:24];
              Dmem2[Addr[11:0]]<=in_bits[23:16];
              Dmem1[Addr[11:0]]<=in_bits[15:8];
              Dmem0[Addr[11:0]]<=in_bits[7:0];
          
          end
          end
                  
                  
                  
                  
                  
          end 
        
endmodule
