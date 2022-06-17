`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 08:47:48 AM
// Design Name: 
// Module Name: debounce
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

module debounce(clk, btnin, btnout);
  input clk, btnin;
  output btnout;

  reg [2:0] delay;

  initial
    begin
      delay = 3'b000;
    end

  always @(posedge clk)
    begin
      if (clk)
        begin
          delay = {btnin, delay[2:1]};
        end
    end

  assign btnout = &delay;

endmodule