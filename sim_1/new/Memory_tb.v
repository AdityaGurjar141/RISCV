`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2021 03:07:13 AM
// Design Name: 
// Module Name: Memory_tb
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


module Memory_tb(

    );
    reg clk;
    reg rw;
    reg wr;
    reg [31:0] Addr;
    reg [31:0] in_bits;
    wire [31:0] out_bits;
    
    Memory t1 (.clk (clk),  .rw (rw), .wr (wr), .Addr (Addr), .in_bits (in_bits), .out_bits (out_bits));
    
    always #2 clk = ~clk;
    
    
    initial
    begin
    clk<=0;
    in_bits<=32'h55555555;
    Addr<=32'h00100000; 
    rw<=0;
    wr<=0;
    
   #5
   rw<=1;
   #10
   rw<=0;
    #20 
        Addr<=32'h00100004; 
    #5
   rw<=1;
   #10
   rw<=0;
    #20
    
    Addr<=32'h00100008;
     #5
   rw<=1;
   #10
   rw<=0;
    #20
    
    Addr<=32'h8000000C;
    #5
    wr<=1;
    #5
    wr<=0;
    #5
     rw<=1;
   #10
   rw<=0;
    
    
 
    
    
    end
    
endmodule
