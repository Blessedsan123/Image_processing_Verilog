`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2025 09:47:40
// Design Name: 
// Module Name: test_sameimage
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


module test_sameimage;

reg clk;
reg rst;
reg [7:0] data_in;
wire [7:0] data_out;

reg [7:0] in_mem [0:16383];
reg [7:0] out_mem [0:16383];

integer i;

sameimage DUT(
.clk(clk),
.rst(rst),
.data_in(data_in),
.data_out(data_out)
);

initial
begin
forever #0.01 clk = ~clk;
end

initial
begin
clk = 1'b0;
data_in = 1'b0;
rst = 1'b1;

#0.01;

rst = 1'b0;

$readmemh("input128.hex", in_mem);

for(i=0; i<16384; i= i+1)
  begin
  data_in = in_mem[i];
  #0.01;
  out_mem[i] = data_out;
  end

 $writememh("Output128.hex", out_mem);
 
 #1;
 $display("Image verified successfully");
 $finish;
 
end
endmodule
