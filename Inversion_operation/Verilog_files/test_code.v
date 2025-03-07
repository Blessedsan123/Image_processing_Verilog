`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2025 18:14:46
// Design Name: 
// Module Name: test_code
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


module test_code;

reg clk, rst;
reg [7:0] pixel_in;
reg valid_in;
wire [7:0] pixel_out;
wire valid_out;

integer infile, outfile, i;
reg [7:0] mem [0:63]; // 8x8 Image (64 Pixels)

image_inversion DUT (
    .clk(clk),
    .rst(rst),
    .pixel_in(pixel_in),
    .valid_in(valid_in),
    .pixel_out(pixel_out),
    .valid_out(valid_out)
);

always #5 clk = ~clk;  // Clock Generation (100MHz => 10ns Period)

initial begin
    clk = 0;
    rst = 1;
    valid_in = 0;
    #10 rst = 0;

    // Reading input HEX file
    infile = $fopen("image.hex", "r");
    outfile = $fopen("output.hex", "w");

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

    // Start processing pixels
    for (i = 0; i < 64; i = i + 1) begin
        pixel_in = mem[i];
        valid_in = 1;
        #10;  // Wait for processing
        if (valid_out) begin
            $fwrite(outfile, "%h\n", pixel_out);
        end
    end

    $fclose(outfile);
    $display("Output file generated successfully.");
    $stop;
end

endmodule
