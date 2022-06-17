`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2022 07:51:54 AM
// Design Name: 
// Module Name: fp_as_tb
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


module fp_as_tb;
  `define BINARY16 1
    // {NEXP, NSIG} = {5, 10} | {8, 23} | {11, 52} | {15, 112}
  `ifdef BINARY16
    parameter NEXP =   5;
    parameter NSIG =  10;
  `elsif BINARY32
    parameter NEXP =   8;
    parameter NSIG =  23;
  `elsif BINARY64
    parameter NEXP =  11;
    parameter NSIG =  52;
  `elsif BINARY128
    parameter NEXP =  15;
    parameter NSIG = 112;
  `else
    No valid IEEE type
  `endif
  `include "ieee-754-flags.vh"
  // a, b, \subtract? , ra, s, sFlags, exception
  reg [NEXP+NSIG:0] a, b;
  // For now, make subtract false. It isn't used by the add/subtract circuit
  // When operating on sNaNs and qNaNs but it's not good to leave variables
  // uninitialized.
  reg subtract; // When subtract is 0 perform addition.
                // When subtract is 1 perform subtraction. 
  // roundTiesToEven roundTowardZero roundTowardPositive roundTowardNegative
  reg [NRAS-1:0] ra = 1 << roundTiesToEven;
  wire [NEXP+NSIG:0] s;
  wire [NTYPES-1:0] sFlags;
  wire [NEXCEPTIONS-1:0] exception;
  
  reg [NEXP-1:0] exp;

  integer i, j, k, l, m, n;

  initial
  begin
    $display("Test addition/subtraction circuit for binary%0d, %0s:", NEXP+NSIG+1,
              ra[roundTiesToEven] ? "roundTiesToEven" :
                (ra[roundTowardZero] ? "roundTowardZero" :
                  (ra[roundTowardPositive] ? "roundTowardPositive" :
                    (ra[roundTowardNegative] ? "roundTowardNegative" :
                      (ra[roundTiesToAway] ? "roundTiesToAway" : "NO VALID ROUNDING MODE")))));
                      
    for (k = 0; k < 2; k = k + 1)
      begin
        subtract = k;
        
        // For these tests a is always a signalling NaN.
        $display("\nsNaN %s {sNaN, qNaN, infinity, zero, subnormal, normal}:",
                 subtract ? "-" : "+");
        #0  assign a = {1'b0, {NEXP{1'b1}}, 1'b0, ({NSIG-1{1'b0}} | 4'hA)};
        assign b = {1'b0, {NEXP{1'b1}}, 1'b0, ({NSIG-1{1'b0}} | 4'hB)};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign b = {1'b0, {NEXP{1'b1}}, 1'b1, ({NSIG-1{1'b0}} | 4'hB)};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign b = {1'b0, {NEXP{1'b1}}, {NSIG{1'b0}}};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign b = {1'b0, {NEXP{1'b0}}, {NSIG{1'b0}}};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign b = {1'b0, {NEXP{1'b0}}, ({NSIG{1'b0}} | 4'hB)};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign b = {1'b0, 1'b0, {NEXP-1{1'b1}}, ({NSIG{1'b0}} | 4'hB)};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);

        // For these tests b is always a signalling NaN.
        $display("\n{qNaN, infinity, zero, subnormal, normal} %s sNaN:",
                 subtract ? "-" : "+");
        assign b = {1'b0, {NEXP{1'b1}}, 1'b0, ({NSIG-1{1'b0}} | 4'hB)};
        assign a = {1'b0, {NEXP{1'b1}}, 1'b1, ({NSIG-1{1'b0}} | 4'hA)};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign a = {1'b0, {NEXP{1'b1}}, {NSIG{1'b0}}};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign a = {1'b0, {NEXP{1'b0}}, {NSIG{1'b0}}};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign a = {1'b0, {NEXP{1'b0}}, ({NSIG{1'b0}} | 4'hA)};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign a = {1'b0, 1'b0, {NEXP-1{1'b1}}, ({NSIG{1'b0}} | 4'hA)};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);

        // For these tests a is always a quiet NaN.
        $display("\nqNaN %s {qNaN, infinity, zero, subnormal, normal}:",
                 subtract ? "-" : "+");
        assign a = {1'b0, {NEXP{1'b1}}, 1'b1, ({NSIG-1{1'b0}} | 4'hA)};
        assign b = {1'b0, {NEXP{1'b1}}, 1'b1, ({NSIG-1{1'b0}} | 4'hB)};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign b = {1'b0, {NEXP{1'b1}}, {NSIG{1'b0}}};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign b = {1'b0, {NEXP{1'b0}}, {NSIG{1'b0}}};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign b = {1'b0, {NEXP{1'b0}}, ({NSIG{1'b0}} | 4'hB)};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        assign b = {1'b0, 1'b0, {NEXP-1{1'b1}}, ({NSIG{1'b0}} | 4'hB)};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);

        // For these tests b is always a quiet NaN.
        $display("\n{infinity, zero, subnormal, normal} %s qNaN:",
                 subtract ? "-" : "+");
        assign b = {1'b0, {NEXP{1'b1}}, 1'b1, ({NSIG-1{1'b0}} | 4'hB)};
        assign a = {1'b0, {NEXP{1'b1}}, {NSIG{1'b0}}};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        #10  assign a = {1'b0, {NEXP{1'b0}}, {NSIG{1'b0}}};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        #10  assign a = {1'b0, {NEXP{1'b0}}, ({NSIG{1'b0}} | 4'hA)};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
        #10  assign a = {1'b0, 1'b0, {NEXP-1{1'b1}}, ({NSIG{1'b0}} | 4'hA)};
        #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                     s, sFlags, exception, a, (subtract ? "-" : "+"), b);
                     
        // Test signed addition/subtraction of Zero:
        for (i = 0; i < 2; i = i + 1)
          for (j = 0; j < 2; j = j + 1)
            begin
             // For these tests a is always Zero.
              $display("\n%szero %s {%sinfinity, %szero, %ssubnormal, %snormal}:",
                      (i ? "-" : "+"), (subtract ? "-" : "+"), (j ? "-" : "+"),
                      (j ? "-" : "+"), (j ? "-" : "+"), (j ? "-" : "+"));
              assign a = {1'b0, {NEXP{1'b0}}, {NSIG{1'b0}}} | (i << NEXP+NSIG);
              assign b = {1'b0, {NEXP{1'b1}}, {NSIG{1'b0}}} | (j << NEXP+NSIG);
              #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                           s, sFlags, exception, a, (subtract ? "-" : "+"), b);
              assign b = {1'b0, {NEXP{1'b0}}, {NSIG{1'b0}}} | (j << NEXP+NSIG);
              #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                           s, sFlags, exception, a, (subtract ? "-" : "+"), b);
              assign b = {1'b0, {NEXP{1'b0}}, ({NSIG{1'b0}} | 4'hB)} | (j << NEXP+NSIG);
              #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                           s, sFlags, exception, a, (subtract ? "-" : "+"), b);
              assign b = {1'b0, 1'b0, {NEXP-1{1'b1}}, ({NSIG{1'b0}} | 4'hB)} | (j << NEXP+NSIG);
              #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                           s, sFlags, exception, a, (subtract ? "-" : "+"), b);

              // For these tests b is always Zero.
              $display("\n{%sinfinity, %ssubnormal, %snormal} %s %szero:",
                      (i ? "-" : "+"), (i ? "-" : "+"), (i ? "-" : "+"),
                      (subtract ? "-" : "+"), (j ? "-" : "+"));
              assign b = {1'b0, {NEXP{1'b0}}, {NSIG{1'b0}}} | (j << NEXP+NSIG);
              assign a = {1'b0, {NEXP{1'b1}}, {NSIG{1'b0}}} | (i << NEXP+NSIG);
              #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                           s, sFlags, exception, a, (subtract ? "-" : "+"), b);
              assign a = {1'b0, {NEXP{1'b0}}, ({NSIG{1'b0}} | 4'hA)} | (i << NEXP+NSIG);
              #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                           s, sFlags, exception, a, (subtract ? "-" : "+"), b);
              assign a = {1'b0, 1'b0, {NEXP-1{1'b1}}, ({NSIG{1'b0}} | 4'hA)} | (i << NEXP+NSIG);
              #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                           s, sFlags, exception, a, (subtract ? "-" : "+"), b);
            end

        // Test signed addition/subtraction of Infinity:
        for (i = 0; i < 2; i = i + 1)
          for (j = 0; j < 2; j = j + 1)
            begin
             // For these tests a is always Infinity.
              $display("\n%sinfinity %s {%sinfinity, %ssubnormal, %snormal}:",
                      (i ? "-" : "+"), (subtract ? "-" : "+"),
                      (j ? "-" : "+"), (j ? "-" : "+"), (j ? "-" : "+"));
              assign a = {1'b0, {NEXP{1'b1}}, {NSIG{1'b0}}} | (i << NEXP+NSIG);
              assign b = {1'b0, {NEXP{1'b1}}, {NSIG{1'b0}}} | (j << NEXP+NSIG);
              #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                           s, sFlags, exception, a, (subtract ? "-" : "+"), b);
              assign b = {1'b0, {NEXP{1'b0}}, ({NSIG{1'b0}} | 4'hB)} | (j << NEXP+NSIG);
              #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                           s, sFlags, exception, a, (subtract ? "-" : "+"), b);
              assign b = {1'b0, 1'b0, {NEXP-1{1'b1}}, ({NSIG{1'b0}} | 4'hB)} | (j << NEXP+NSIG);
              #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                           s, sFlags, exception, a, (subtract ? "-" : "+"), b);

              // For these tests b is always Infinity.
              $display("\n{%ssubnormal, %snormal} %s %sinfinity:",
                      (i ? "-" : "+"), (i ? "-" : "+"),
                      (subtract ? "-" : "+"), (j ? "-" : "+"));
              assign b = {1'b0, {NEXP{1'b1}}, {NSIG{1'b0}}} | (j << NEXP+NSIG);
              assign a = {1'b0, {NEXP{1'b0}}, ({NSIG{1'b0}} | 4'hA)} | (i << NEXP+NSIG);
              #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                           s, sFlags, exception, a, (subtract ? "-" : "+"), b);
              assign a = {1'b0, 1'b0, {NEXP-1{1'b1}}, ({NSIG{1'b0}} | 4'hA)} | (i << NEXP+NSIG);
              #10 $display("s (%x %b %b) = a (%x) %s b (%x)",
                           s, sFlags, exception, a, (subtract ? "-" : "+"), b);
            end
      end
      
  `ifdef BINARY16
    $display("\nCalculate Fibonacci Series:");
    subtract = 0;
    $display("1 + 1:");
    assign a = 16'h3C00; assign b = 16'h3C00; // 1 + 1
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n1 + 2:");
    assign a = 16'h3C00; assign b = 16'h4000; // 1 + 2
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("2 + 1:");
    assign a = 16'h4000; assign b = 16'h3C00; // 2 + 1
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n2 + 3:");
    assign a = 16'h4000; assign b = 16'h4200; // 2 + 3
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("3 + 2:");
    assign a = 16'h4200; assign b = 16'h4000; // 3 + 2
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n3 + 5:");
    assign a = 16'h4200; assign b = 16'h4500; // 3 + 5
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("5 + 3:");
    assign a = 16'h4500; assign b = 16'h4200; // 5 + 3
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n5 + 8:");
    assign a = 16'h4500; assign b = 16'h4800; // 5 + 8
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("8 + 5:");
    assign a = 16'h4800; assign b = 16'h4500; // 8 + 5
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n8 + 13:");
    assign a = 16'h4800; assign b = 16'h4A80; // 8 + 13
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("13 + 8:");
    assign a = 16'h4A80; assign b = 16'h4800; // 13 + 8
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n13 + 21:");
    assign a = 16'h4A80; assign b = 16'h4D40; // 13 + 21
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("21 + 13:");
    assign a = 16'h4D40; assign b = 16'h4A80; // 21 + 13
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n21 + 34:");
    assign a = 16'h4D40; assign b = 16'h5040; // 21 + 34
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("34 + 21:");
    assign a = 16'h5040; assign b = 16'h4D40; // 34 + 21
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n34 + 55:");
    assign a = 16'h5040; assign b = 16'h52E0; // 34 + 55
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("55 + 34:");
    assign a = 16'h52E0; assign b = 16'h5040; // 55 + 34
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n55 + 89:");
    assign a = 16'h52E0; assign b = 16'h5590; // 55 + 89
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("89 + 55:");
    assign a = 16'h5590; assign b = 16'h52E0; // 89 + 55
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n89 + 144:");
    assign a = 16'h5590; assign b = 16'h5880; // 89 + 144
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("144 + 89:");
    assign a = 16'h5880; assign b = 16'h5590; // 144 + 89
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n144 + 233:");
    assign a = 16'h5880; assign b = 16'h5B48; // 144 + 233
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("233 + 144:");
    assign a = 16'h5B48; assign b = 16'h5880; // 233 + 144
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n233 + 377:");
    assign a = 16'h5B48; assign b = 16'h5DE4; // 233 + 377
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("377 + 233:");
    assign a = 16'h5DE4; assign b = 16'h5B48; // 377 + 233
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n377 + 610:");
    assign a = 16'h5DE4; assign b = 16'h60C4; // 377 + 610
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("610 + 377:");
    assign a = 16'h60C4; assign b = 16'h5DE4; // 610 + 377
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n610 + 987:");
    assign a = 16'h60C4; assign b = 16'h63B6; // 610 + 987
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("987 + 610:");
    assign a = 16'h63B6; assign b = 16'h60C4; // 987 + 610
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);

    $display("\n987 + 1597:");
    assign a = 16'h63B6; assign b = 16'h663D; // 987 + 1597
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
    $display("1597 + 987:");
    assign a = 16'h663D; assign b = 16'h63B6; // 1597 + 987
    #10 $display("s (%x %b %b) = a (%x) + b (%x)", s, sFlags, exception, a, b);
  `endif

    #20 $display("\nEnd of tests : %t", $time);
    #20 $stop;
  end

  fp_as #(NEXP,NSIG) U0(a, b, subtract, ra, s, sFlags, exception);
endmodule
