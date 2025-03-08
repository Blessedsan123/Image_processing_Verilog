`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2025 00:30:12
// Design Name: 
// Module Name: bright_reduce
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


module bright_reduce(
input clk,
input rst,
input [7:0] pixel_in,       // Input pixel data
input valid_in,             // Input valid signal
input [7:0] brightness_value, // Brightness reduction value
output reg [7:0] pixel_out,  // Output pixel data
output reg valid_out        // Output valid signal
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        pixel_out <= 8'b0;
        valid_out <= 0;
    end else if (valid_in) begin
        if (pixel_in > brightness_value)
            pixel_out <= pixel_in - brightness_value;  // Reduce brightness
        else
            pixel_out <= 8'b0;  // Clamp to 0 if subtraction goes negative
        valid_out <= 1;
    end else begin
        valid_out <= 0;
    end
end

endmodule