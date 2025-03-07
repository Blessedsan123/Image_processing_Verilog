`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2025 18:12:15
// Design Name: 
// Module Name: image_inversion
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


module image_inversion(
input clk,
input rst,
input [7:0] pixel_in,    
input valid_in,         
output reg [7:0] pixel_out, 
output reg valid_out 
    );
    
    always @(posedge clk or posedge rst) begin
    if (rst) begin
        pixel_out <= 8'b0;
        valid_out <= 0;
    end else if (valid_in) begin
        pixel_out <= ~pixel_in;  // Color Inversion Operation
        valid_out <= 1;
    end else begin
        valid_out <= 0;
    end
end
endmodule
