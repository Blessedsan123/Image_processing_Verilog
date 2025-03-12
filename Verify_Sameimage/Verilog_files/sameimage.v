`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2025 09:43:44
// Design Name: 
// Module Name: sameimage
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


module sameimage(
input clk,
input rst,
input [7:0] data_in,
output reg [7:0] data_out
);

   always @(posedge clk)
     begin
       if(rst)
         begin
         data_out <= 8'b0;
         end
       else 
         begin
         data_out <= data_in;
         end
     end
endmodule
