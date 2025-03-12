`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2025 18:45:13
// Design Name: 
// Module Name: imgop
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


module imgop(
input clk,
input rst,
input [7:0] data_in, // for 8 bit data store for a pixel in greyscale
output reg [7:0] data_out // for 8bit data store after processing
);

always @ (posedge clk)
begin
  if(rst)
   begin
   data_out<=8'b0;
   end
  else
    begin
    data_out <= 8'hff - data_in;
    end
end

endmodule
