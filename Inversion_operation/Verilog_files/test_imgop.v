`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2025 18:55:12
// Design Name: 
// Module Name: test_imgop
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


module test_imgop;
reg clk;
reg rst;
reg [7:0] data_in;
wire [7:0] data_out;

reg [7:0] input_memory [16383:0];
reg [7:0] output_memory [16383:0];

imgop DUT (
.clk(clk),
.rst(rst),
.data_in(data_in),
.data_out(data_out)
);

integer i;

initial
  begin
  clk = 1'b0;
  forever #0.01 clk = ~clk; // for continuing the clock cycle
  end
  
  initial 
   begin
     rst = 1'b1;
     data_in = 1'b0;
     
     #1;
     rst = 1'b0;
     
     $readmemh("input128.hex", input_memory);
     
     for(i = 0 ; i<16384; i = i+1)
     begin
     data_in = input_memory[i];
     #0.01;
     output_memory[i] = data_out;
     end
     
     $writememh("output128.hex" , output_memory);
     
     #1;
     
     $display("Inversion operation completed and stored in output.hex file");
     $finish;
   end
endmodule
