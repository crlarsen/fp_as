`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2022 01:12:33 PM
// Design Name: 
// Module Name: cmpadd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Test harness to compare binary16 addition using exact
//              intermediate results vs. minimal length intermediate results.
//              Final sums for both cases need to be equal. The fp_as module
//              performs both addition and subtraction. The \subtract? flag
//              selects addition when false/0, and subtraction when true/1.
//
//              Switches 0-3 select the rounding mode. Only one of these switches
//              should be in the ON position at any given time.
//              SW 0: roundTiesToEven
//              SW 1: roundTowardZero
//              SW 2: roundTowardPositive
//              SW 3: roundTowardNegative
//
//              Switches 13-15 select debugging information.
//              | SW 13 | SW 14 | SW 15
//              +-------+-------+-------+-----------------------------------------
//              |   1   |   x   |   x   | Show rounding mode on LEDs 0-4, and
//              |       |       |       | value of \subtract? on LED 5.
//              +-------+-------+-------+-----------------------------------------
//              |   0   |   0   |   0   | Display 'b' on LEDs
//              +-------+-------+-------+-----------------------------------------
//              |   0   |   0   |   1   | Display 'a' on LEDs
//              +-------+-------+-------+-----------------------------------------
//              |   0   |   1   |   0   | Display sum from fp_add_exact on LEDs
//              +-------+-------+-------+-----------------------------------------
//              |   0   |   1   |   1   | Display sum/difference from fp_as on
//              |       |       |       | LEDs
//              +-------+-------+-------+-----------------------------------------
//
//              Use the right button to reset the test.
//
//              When there is an error "Err " is displayed on the 7-segment
//              display and the test halts.
//
//              If the test completes successfully "good" is displayed on the
//              7-segment display.
//
//              While the test is running 'a' is displayed on the 7-segment
//              display by default. 'b' may be displayed by pressing and holding
//              the left button.
//
//              When adding 'a' is the augend, and 'b' is the addend.
//              When subtracting 'a' is the minuend, and 'b' is the subtrahend.
//              Internal to fp_add_exact/fp_as the logic may swap these roles but
//              from the higher level logic that is how the inputs 'a' and 'b' are
//              are regarded.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module cmpadd(clk, btnL, btnR, sw, seg, an, led);
  localparam NEXP =  5;
  localparam NSIG = 10;
  `include "ieee-754-flags.vh"
  input clk, btnL, btnR;
  input [NEXP+NSIG:0] sw;
  output [0:6] seg;
  output [3:0] an;
  output [15:0] led;
  
  reg [15:0] a, b, bPrime;
  reg \subtract? ;
  reg stopped, error;
  reg [30:0] counter = 30'h00000000;
  wire clk190;
  localparam DR = 1; // Divided clock selector
  
  wire [15:0] hexdigits;
  wire [15:0] s;
  
  wire [NTYPES-1:0] sFlags, seFlags;
  wire [NEXCEPTIONS-1:0] exception, eException;
  
 // Generate 190 Hz clock signal
  always @(posedge clk)
    begin
      if (clk)
        counter = counter + 1;
    end
  assign clk190 = counter[18];
    
  wire select, clr;
  
  wire [NRAS-1:0] ra = sw[NRAS-1:0];
  
  initial
  begin
    a = 16'h0000;
    b = 16'h0000;
    bPrime = 16'h0000;
    \subtract? = 0;
    stopped = 1'b0;
    error = 1'b0;
  end
  
  wire [15:0] checkS;

  always @(posedge counter[DR] or posedge clr)
  begin
    if (clr)
      begin
        a = 16'h0000;
        b = 16'h0000;
        bPrime = 16'h0000;
        \subtract? = 0;
        stopped = 1'b0;
        error = 1'b0;
      end
    else if (counter[DR])
      begin
        if (~stopped)
          begin
            if (s != checkS)
              begin
                stopped = 1'b1;
                error = 1'b1;
              end
            else if (b == 16'hFBFF)
              begin
                if (a == 16'hFBFF & \subtract? )
                  begin
                    stopped = 1'b1;
                  end
                else
                  begin
                    b = 16'h0000;
                    if (a == 16'hFBFF)
                      begin
                        a = 16'h0000;
                        \subtract? = 1;
                      end
                    else
                      begin
                        a = (a == 16'h7BFF) ? 16'h8000 : (a + 1);
                      end
                  end
              end
            else
              b = (b == 16'h7BFF) ? 16'h8000 : (b + 1);
              bPrime = {b[NEXP+NSIG] ^ \subtract? , b[NEXP+NSIG-1:0]};
          end
      end
  end
  
  debounce U0(clk190, btnL, select);
  
  // Debounce btnR to generate "clear" signal
  debounce U1(clk190, btnR, clr);

  assign led = sw[13] ? ({{15-NRAS{1'b0}}, \subtract? , ra}) : (sw[15] ? (sw[14] ? s : checkS) : (sw[14] ? a : b));
  assign hexdigits = select ? b : a;
  x7seg_status U2(hexdigits, error, /*Good*/stopped&~error, clk, clr, seg, an);
  
  fp_as #(NEXP,NSIG)        U3(a, bPrime, \subtract? , ra, s,       sFlags,  exception);
  fp_add_exact #(NEXP,NSIG) U4(a, b,              ra, checkS, seFlags, eException);
endmodule
