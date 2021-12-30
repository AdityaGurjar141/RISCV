`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2021 02:27:45 PM
// Design Name: 
// Module Name: RegF_tb
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


module RegF_tb(

    );
    reg clk;
    reg rst;
    reg rw;
    reg wr;
    reg [4:0] Ad_rs1;
    reg [4:0] Ad_rs2;
    reg [4:0] Ad_rd;
    reg [31:0] rd_data_in;
    wire [31:0] rs1_data;
    wire [31:0] rs2_data;
    
    RegF t1 (.clk (clk), .rst (rst), .rw (rw), .wr (wr), .Ad_rs1 (Ad_rs1), .Ad_rs2 (Ad_rs2), .Ad_rd (Ad_rd), .rd_data_in (rd_data_in), .rs1_data (rs1_data), .rs2_data (rs2_data));
    
    always #2 clk = ~clk;
    
    
    initial
    begin
    rst<=0;
    clk<=0;
    rd_data_in<=32'h11111111;
    #10 rst<=1;
    rw<=0;
    wr<=0;
    
    #20 rst<=0;
    Ad_rs1<=5'd0;
    Ad_rs2<=5'd0;
    Ad_rd<=5'd1;
    
    #20 
    wr<=1;
    #5
    wr<=0;
    
   #10 Ad_rs1<=5'd1;
   rw<=1;
   #5
   rw<=0;
    
 
    
    
    end
    
    
    
endmodule
