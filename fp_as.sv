`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Copyright: Chris Larsen 2022 
// Engineer: 
//
// Create Date: 06/09/2022 09:02:00 PM
// Design Name: 
// Module Name: fp_as
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Floating Point Add/Subtraction Module
//              Uses "subtract?" flag to control whether the module adds or
//              subtracts. When flag is false the circuit adds. When the flag is
//              true the circuit subtracts.
//
// Dependencies: 
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module fp_as(a, b, \subtract? , ra, s, sFlags, exception);
  parameter NEXP = 5;
  parameter NSIG = 10;
  `include "ieee-754-flags.vh"
  localparam CLOG2_NSIG = $clog2(NSIG+1);
  input [NEXP+NSIG:0] a, b;   // Operands
  input \subtract? ;          // Flag to control addition/subtraction
  input [NRAS:0] ra;          // Rounding Attribute
  output [NEXP+NSIG:0] s;     // Sum/Difference
  output [NTYPES-1:0] sFlags; // Type of return value: sNaN, qNaN, Infinity,
  reg [NTYPES-1:0] sFlags;    // Zero, Normal, or Subnormal.
  output [NEXCEPTIONS-1:0] exception; // Which exceptions were signalled?
  reg [NEXCEPTIONS-1:0] exception;

  wire inexact; // Returned by round module. Used to set corresponding
                // flag in the exception vector.

  wire aSign = a[NEXP+NSIG];
  wire bSign = b[NEXP+NSIG] ^ \subtract? ;
  wire signed [NEXP+1:0] aExp, bExp;
  wire [NSIG:0] aSig, bSig;
  wire [NTYPES-1:0] aFlags, bFlags;

  wire signed [NEXP+1:0] expIn, expOut;
  wire [NSIG:0] sigOut;

  fp_class #(NEXP,NSIG) aClass(a, aExp, aSig, aFlags);
  fp_class #(NEXP,NSIG) bClass(b, bExp, bSig, bFlags);

  reg signed [NSIG+1:0] shiftAmt;
  // augendSig: Significand of the operand with the larger exponent
  // addendSig: Significand of the operand with the smaller exponent
  // Note: The exponent of the augend may not be strictly larger than
  //       the exponent of the addend. The two exponents may be equal
  //       but the exponent of the augend will never be smaller than
  //       the exponent of the addend.
  // sumSig:    Significand of the augend/addend significands.
  //            ***** This value may be negative!
  // absSig:    Absolute value of sumSig.
  // bigSig:    If adding augendSig and addendSig caused a carry out
  //            bigSig is right shifted so that the MSB of the significand
  //            sum will never be farther to the left than bit NSIG.
  //            ***** See bigExp below.
  // normSig:   If one of the numbers being added is negative, and the
  //            other is positive then it's likely the MSB of the sum
  //            isn't in bit NSIG. This means that we need to left shift
  //            the sum until the MSB is in bit NSIG. We then use the
  //            shift amount to adjust the corresponding exponent value.
  //            ***** See normExp below.
  reg signed [NSIG+2:-NSIG-3] augendSig, addendSig, sumSig, absSig, bigSig,
             normSig;

  // adjExp:  max(aExp, bExp)
  // bigExp:  Renormalized exponent if adding the augend/addend
  //          significands caused the MSB to be left of bit NSIG.
  //          ***** See bigSig above.
  // normExp: Renormalized exponent if the augend/addend have opposite
  //          signs.
  //          ***** See normSig above.
  // biasExp: Sum significand after adding the BIAS value into normExp.
  reg signed [NEXP+1:0] adjExp, bigExp, normExp, biasExp;

  // Sign of significand sum before taking the absolute value of sumSig.
  reg sumSign;
  // Adjusted sumSign after taking absolute value of sumSig.
  wire absSign;

  // na is the shift count to renormalize after adding two numbers with
  // opposite signs.
  reg [CLOG2_NSIG-1:0] na;
  reg [NSIG+2:-NSIG-3] mask = ~0;

  wire Cout1;
  reg subtract, e0, si;

  reg [NEXP+NSIG:0] alwaysS; // Sum/Difference generated inside the
                             // always block.

  integer i;

  always @(*)
  begin
    sFlags = 0;
    exception = 0;
    subtract = aSign ^ bSign;

    if (aFlags[SNAN] | bFlags[SNAN])
      begin
        {alwaysS, sFlags} = aFlags[SNAN] ? {a, aFlags} : {b, bFlags};
      end
    else if (aFlags[QNAN] | bFlags[QNAN])
      begin
        {alwaysS, sFlags} = aFlags[QNAN] ? {a, aFlags} : {b, bFlags};
      end
    else if (aFlags[ZERO] | bFlags[ZERO])
      begin
        {alwaysS, sFlags} = bFlags[ZERO] ?
                             {a, aFlags} :
                             {{bSign, b[NEXP+NSIG-1:0]}, bFlags};
      end
    else if (aFlags[INFINITY] & bFlags[INFINITY])
      begin
        e0 =  ra[roundTiesToEven] |
             (ra[roundTowardPositive] & ~aSign) |
             (ra[roundTowardNegative] &  aSign) |
              subtract;
        si =  ra[roundTowardZero] |
             (ra[roundTowardPositive] &  aSign) |
             (ra[roundTowardNegative] & ~aSign) |
              subtract;
        exception[INVALID] =  subtract;
        sFlags[INFINITY]   = ~si;
        sFlags[QNAN]       =  subtract;
        sFlags[NORMAL]     = ~e0;
        alwaysS = {aSign, {{NEXP-1{1'b1}}, e0},{NSIG{si}}};
      end
    else if (aFlags[INFINITY] | bFlags[INFINITY])
      begin
        {alwaysS, sFlags} = aFlags[INFINITY] ?
                                 {a, aFlags} :
                                 {{bSign, b[NEXP+NSIG-1:0]}, bFlags};
      end
    else // a and b are both (sub-)normal numbers
      begin
        augendSig = 0;
        addendSig = 0;
        na = 0;

        if (aExp < bExp)
          begin
            sumSign = bSign;
            shiftAmt = bExp - aExp;
            augendSig[NSIG:0] = bSig;
            addendSig[NSIG:0] = aSig;
            adjExp = bExp;
          end
        else
          begin
            sumSign = aSign;
            shiftAmt = aExp - bExp;
            augendSig[NSIG:0] = aSig;
            addendSig[NSIG:0] = bSig;
            adjExp = aExp;
          end

        addendSig = addendSig >> ((shiftAmt > NSIG+3) ? NSIG+3 : shiftAmt);

        // Check to see if we actually calculated a difference, and, if so,
        // renormalize the significand, and adjust the exponent accordingly.
        normSig = bigSig;

        for (i = (1 << (CLOG2_NSIG - 1)); i > 0; i = i >> 1)
          begin
            if ((normSig & (mask << (2*NSIG+4 - i))) == 0)
              begin
                normSig = normSig << i;
                na = na | i;
              end
          end

        normExp = bigExp - na;

        // Control should return to the rounding logic from here.

        if (&na)
          begin
            sFlags[ZERO] = 1;
            alwaysS = {ra[roundTowardNegative], {NEXP+NSIG{1'b0}}};
          end
        else if (expOut < EMIN)
          begin
            sFlags[SUBNORMAL] = 1;
            alwaysS = {absSign, {NEXP{1'b0}}, sigOut[NSIG:1]};
          end
        else if (expOut > EMAX)
          begin
            si = ra[roundTowardZero] |
                (ra[roundTowardNegative] & ~absSign) |
                (ra[roundTowardPositive] &  absSign);
            alwaysS = {absSign, {NEXP-1{1'b1}}, ~si, {NSIG{si}}};
            sFlags[INFINITY] = ~si;
            sFlags[NORMAL]   =  si;
            exception[OVERFLOW] = 1;
          end
        else
          begin
            sFlags[NORMAL] = 1;
            biasExp = expOut + BIAS;

            alwaysS = {absSign, biasExp[NEXP-1:0], sigOut[NSIG-1:0]};
          end

        exception[INEXACT] = inexact;
      end
  end

  // Compute sum/difference of significands
  if (NSIG == 10)
    padder26 U0(augendSig, addendSig^{2*NSIG+6{subtract}},
                subtract, sumSig, Cout1);
  else if (NSIG == 23)
    padder52 U1(augendSig, addendSig^{2*NSIG+6{subtract}},
                subtract, sumSig, Cout1);
  else if (NSIG == 52)
    padder110 U2(augendSig, addendSig^{2*NSIG+6{subtract}},
                 subtract, sumSig, Cout1);
  else if (NSIG == 112)
    padder230 U3(augendSig, addendSig^{2*NSIG+6{subtract}},
                 subtract, sumSig, Cout1);

  // Adjusted sign if absSum = -sigSum:
  assign absSign = sumSign ^ sumSig[NSIG+2];

  // Compute abs(sumSig):
  // If sumSig is negative then sumSig[NSIG+2] (the sign bit) will be 1.
  // If sumSig is negative then "sumSig^{2*NSIG+6{sumSig[NSIG+2]}}" is the
  // 1's complement of sumSig. Otherwise this value is just sumSig.
  // By using the sign bit of sumSig as the carry in value when sumSig is
  // negative we compute the 2's complement of sumSig, i.e., we find sumSig's
  // absolute value. If sumSig is positive, or zero, the output from this
  // adder is sumSig.
  if (NSIG == 10)
    abs26 U26(sumSig, absSig);
  else if (NSIG == 23)
    abs52 U52(sumSig, absSig);
  else if (NSIG == 52)
    abs110 U110(sumSig, absSig);
  else if (NSIG == 112)
    abs230 U230(sumSig, absSig);

  // See if the addition caused a carry-out. If so, adjust the significand
  // and the exponent.
  assign bigSig = absSig >> absSig[NSIG+1];
  assign bigExp = adjExp + absSig[NSIG+1];

  // Control returns to the "always" block above so we can renormalize if
  // what we're really calculating is a difference.

  // Round the significand.
  round #(2*NSIG+4, NEXP, NSIG) U2((absSign), normExp,
                                   normSig[NSIG:-NSIG-3], ra,
                                   expOut, sigOut, inexact);
  assign s = alwaysS;

endmodule
