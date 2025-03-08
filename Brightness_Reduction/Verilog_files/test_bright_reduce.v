`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2025 00:31:49
// Design Name: 
// Module Name: test_bright_reduce
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


module test_bright_reduce;
reg clk, rst;
reg [7:0] pixel_in;
reg valid_in;
reg [7:0] brightness_value;
wire [7:0] pixel_out;
wire valid_out;

integer infile, outfile, i;
reg [7:0] mem [0:63]; // 8x8 Image (64 Pixels)

bright_reduce DUT (
    .clk(clk),
    .rst(rst),
    .pixel_in(pixel_in),
    .valid_in(valid_in),
    .brightness_value(brightness_value),
    .pixel_out(pixel_out),
    .valid_out(valid_out)
);

always #5 clk = ~clk;  // Clock Generation

initial begin
    clk = 0;
    rst = 1;
    valid_in = 0;
    brightness_value = 8'd50;  // Reduce brightness by 50
    #10 rst = 0;

    // Read Input HEX File
    infile = $fopen("input.hex", "r");
    outfile = $fopen("output_brightness.hex", "w");

    if (infile) begin
        $display("Input file opened successfully.");
        for (i = 0; i < 64; i = i + 1) begin
            $fscanf(infile, "%h\n", mem[i]);
        end
        $fclose(infile);
    end else begin
        $display("Error opening input file.");
        $finish;
    end

    // Processing Pixels
    for (i = 0; i < 64; i = i + 1) begin
        pixel_in = mem[i];
        valid_in = 1;
        #10;  // Wait for processing
        if (valid_out) begin
            $fwrite(outfile, "%h\n", pixel_out);
        end
    end

    $fclose(outfile);
    $display("Brightness reduction done successfully.");
    $stop;
end

endmodule