`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 06:10:19 PM
// Design Name: 
// Module Name: dec_reg
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


module dec_reg(
    input [31:0] rdD,
    input [31:0] rdad,
    input [31:0] aluad,
    output [31:0] r_out,
    output reg wrR,
    
    
        input wire clk, 
    input wire [6:0]opcode,
    input wire [31:0]operand1,
    input wire [31:0]operand2,
    input wire [2:0] state,
    input wire [19:0]immediate20,
    input wire [11:0]immediate12,
    input wire [6:0]immediate7,
    input wire [4:0]immediate5,
    input wire [4:0]shamt,
    input wire [2:0]func,
    input wire [31:0]pc,
    output reg [11:0]immediate12_b,
    output reg [19:0]immediate20_b,
    output reg [11:0]immediate12_b_st,
    output reg [31:0]sign_extended_immediate,
    output reg [31:0]pc_updated_val,
    output reg [31:0]result,
    
    
    output reg [31:0] PC
    );
   // reg[31:0] pc;
    parameter idle=0,fetch=1,decode=2,execute=3,store=4;
        reg [7:0] numbers[11:0]; 
    reg [7:0] Dmem[4095:0];
    reg [31:0] in_buffer;
    reg [31:0] out_buffer;
    reg [31:0] i_out_buffer;
    reg wrM,rwM;
    
    
    
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
    
    // Load from memory and write register with memory data at rAddr
     always @* begin
        if(rwM & ! wrM) begin
        
        if (aluad[31:20]==12'h001) begin
            //out_buffer<={Dmem[Addr[11:0]+12'd3], Dmem[Addr[11:0]+12'd2], Dmem[Addr[11:0]+12'd1], Dmem[Addr[11:0]]};
           out_buffer[31:24]<=numbers[aluad[11:0]+12'd3];
           out_buffer[23:16]<=numbers[aluad[11:0]+12'd2];
           out_buffer[15:8]<=numbers[aluad[11:0]+12'd1];
           out_buffer[7:0]<=numbers[aluad[11:0]];
        end
            
        else if (aluad[31:20]==12'h800) begin
            //out_buffer<={Dmem[Addr[11:0]+12'd3], Dmem[Addr[11:0]+12'd2], Dmem[Addr[11:0]+12'd1], Dmem[Addr[11:0]]};
            out_buffer[31:24]<=Dmem[aluad[11:0]+12'd3];
            out_buffer[23:16]<=Dmem[aluad[11:0]+12'd2];
            out_buffer[15:8]<=Dmem[aluad[11:0]+12'd1];
            out_buffer[7:0]<=Dmem[aluad[11:0]];
            end
            
        end
        end
        
        //out buffer assigned to r_out
    assign r_out = out_buffer;
    
    
            // WRITE memory or store data
          always @* begin  
          if (wrM & ! rwM) begin
              if (aluad[31:20]==12'h800) begin
              Dmem[aluad[11:0]+12'd3]<=rdD[31:24];
              Dmem[aluad[11:0]+12'd2]<=rdD[23:16];
              Dmem[aluad[11:0]+12'd1]<=rdD[15:8];
              Dmem[aluad[11:0]]<=rdD[7:0];
          end
          end
    end 
    
    //write alu data into register at location Rdaddr
    always @* begin  
          if (wrR) begin
            out_buffer<=aluad;
          end
          end
    
    always@(posedge clk)
begin
    if(state==store)
    begin
    case(opcode)
    7'b0110111 : begin rwM = 0; wrM = 0; wrR = 1;
                 end
    7'b0010111 : begin rwM = 0; wrM = 0; wrR = 1;
                 end
    7'b1101111 : begin rwM = 0; wrM = 0; wrR = 1; end
    7'b1100111 : begin rwM = 0; wrM = 0; wrR = 1;
                 end
                 
    7'b1100011 : begin
                 rwM = 0; wrM = 0; wrR = 1;
                 end
                 
      7'b0000011:begin
                 rwM = 1; wrM = 0; wrR = 0;
                 end
      7'b0100011:begin
                 rwM = 0; wrM = 1; wrR = 0;
                 end
      7'b0010011:begin
                 rwM = 0; wrM = 0; wrR = 1;
                 end
      7'b0110011:begin
                 rwM = 0; wrM = 0; wrR = 1;
                 end
      7'b0001111 : begin
                 rwM = 0; wrM = 0; wrR = 1;
                 end
      7'b1110011 : begin
                rwM = 0; wrM = 0; wrR = 0;
                 end
                 
    endcase
    end
    else begin
            wrM<=0;
            rwM<=0;
            end
end

    
    
endmodule
