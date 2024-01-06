`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Copyright: Chris Larsen, 2024
// Engineer: Chris Larsen
//
// Create Date: 01/05/2024 11:21:25 PM
// Design Name:
// Module Name: abs52
// Project Name:
// Target Devices:
// Tool Versions:
// Description: Find absolute value of 52-bit Signed Integer
//
//       This module was generated by a Python script written by Chris Larsen.
//       Since this code was machine generated, in general you shouldn't be
//       editing this code by hand.
//
//       If the input value is the most negative value then the module will
//       return the most negative value as its output. This is the overflow
//       condition. To test for this an overflow AND together the most
//       significant bits (that is the sign bits of input and the output)
//       of the input and output values. If the AND is true then there was an
//       overflow.
//
//       If bugs are found in the script I (Chris Larsen) would ask that you
//       send your bug fixes, and or other improvements, back so I can include
//       them in the git repository for the abs.py script.
//
//       The Python script used to generate this code can be downloaded from
//       https://github.com/crlarsen/abs/
//
// Dependencies: None
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module abs52(A, S);
  localparam N = 52;
  input [N-1:0] A;
  output [N-1:0] S;
  // All Pi:i values are equal to xorA[i]
  wire [N-1:0] xorA = A ^ {N{A[N-1]}};
  // G[i] is an alias for Gi:i
  wire [-1:-1] G;

  assign G[-1] = A[N-1];

  assign S[0] = xorA[0] ^ G[-1];

  wire \G0:-1 ;

  assign \G0:-1  = xorA[0]  & G[-1] ;

  assign S[1] = xorA[1] ^ \G0:-1 ;

  wire \G1:-1 ;

  assign \G1:-1  = xorA[1]  & \G0:-1  ;

  assign S[2] = xorA[2] ^ \G1:-1 ;

  wire \P2:1 ;

  assign \P2:1  = xorA[2] & xorA[1] ;

  wire \G2:-1 ;

  assign \G2:-1  = \P2:1   & \G0:-1  ;

  assign S[3] = xorA[3] ^ \G2:-1 ;

  wire \G3:-1 ;

  assign \G3:-1  = xorA[3]  & \G2:-1  ;

  assign S[4] = xorA[4] ^ \G3:-1 ;

  wire \P4:3 ;

  assign \P4:3  = xorA[4] & xorA[3] ;

  wire \G4:-1 ;

  assign \G4:-1  = \P4:3   & \G2:-1  ;

  assign S[5] = xorA[5] ^ \G4:-1 ;

  wire \P5:3 ;

  assign \P5:3  = xorA[5] & \P4:3  ;

  wire \G5:-1 ;

  assign \G5:-1  = \P5:3   & \G2:-1  ;

  assign S[6] = xorA[6] ^ \G5:-1 ;

  wire \P6:5 ;

  assign \P6:5  = xorA[6] & xorA[5] ;

  wire \P6:3 ;

  assign \P6:3  = \P6:5  & \P4:3  ;

  wire \G6:-1 ;

  assign \G6:-1  = \P6:3   & \G2:-1  ;

  assign S[7] = xorA[7] ^ \G6:-1 ;

  wire \G7:-1 ;

  assign \G7:-1  = xorA[7]  & \G6:-1  ;

  assign S[8] = xorA[8] ^ \G7:-1 ;

  wire \P8:7 ;

  assign \P8:7  = xorA[8] & xorA[7] ;

  wire \G8:-1 ;

  assign \G8:-1  = \P8:7   & \G6:-1  ;

  assign S[9] = xorA[9] ^ \G8:-1 ;

  wire \P9:7 ;

  assign \P9:7  = xorA[9] & \P8:7  ;

  wire \G9:-1 ;

  assign \G9:-1  = \P9:7   & \G6:-1  ;

  assign S[10] = xorA[10] ^ \G9:-1 ;

  wire \P10:9 ;

  assign \P10:9  = xorA[10] & xorA[9] ;

  wire \P10:7 ;

  assign \P10:7  = \P10:9  & \P8:7  ;

  wire \G10:-1 ;

  assign \G10:-1  = \P10:7   & \G6:-1  ;

  assign S[11] = xorA[11] ^ \G10:-1 ;

  wire \P11:7 ;

  assign \P11:7  = xorA[11] & \P10:7  ;

  wire \G11:-1 ;

  assign \G11:-1  = \P11:7   & \G6:-1  ;

  assign S[12] = xorA[12] ^ \G11:-1 ;

  wire \P12:11 ;

  assign \P12:11  = xorA[12] & xorA[11] ;

  wire \P12:7 ;

  assign \P12:7  = \P12:11  & \P10:7  ;

  wire \G12:-1 ;

  assign \G12:-1  = \P12:7   & \G6:-1  ;

  assign S[13] = xorA[13] ^ \G12:-1 ;

  wire \P13:11 ;

  assign \P13:11  = xorA[13] & \P12:11  ;

  wire \P13:7 ;

  assign \P13:7  = \P13:11  & \P10:7  ;

  wire \G13:-1 ;

  assign \G13:-1  = \P13:7   & \G6:-1  ;

  assign S[14] = xorA[14] ^ \G13:-1 ;

  wire \P14:13 ;

  assign \P14:13  = xorA[14] & xorA[13] ;

  wire \P14:11 ;

  assign \P14:11  = \P14:13  & \P12:11  ;

  wire \P14:7 ;

  assign \P14:7  = \P14:11  & \P10:7  ;

  wire \G14:-1 ;

  assign \G14:-1  = \P14:7   & \G6:-1  ;

  assign S[15] = xorA[15] ^ \G14:-1 ;

  wire \G15:-1 ;

  assign \G15:-1  = xorA[15]  & \G14:-1  ;

  assign S[16] = xorA[16] ^ \G15:-1 ;

  wire \P16:15 ;

  assign \P16:15  = xorA[16] & xorA[15] ;

  wire \G16:-1 ;

  assign \G16:-1  = \P16:15   & \G14:-1  ;

  assign S[17] = xorA[17] ^ \G16:-1 ;

  wire \P17:15 ;

  assign \P17:15  = xorA[17] & \P16:15  ;

  wire \G17:-1 ;

  assign \G17:-1  = \P17:15   & \G14:-1  ;

  assign S[18] = xorA[18] ^ \G17:-1 ;

  wire \P18:17 ;

  assign \P18:17  = xorA[18] & xorA[17] ;

  wire \P18:15 ;

  assign \P18:15  = \P18:17  & \P16:15  ;

  wire \G18:-1 ;

  assign \G18:-1  = \P18:15   & \G14:-1  ;

  assign S[19] = xorA[19] ^ \G18:-1 ;

  wire \P19:15 ;

  assign \P19:15  = xorA[19] & \P18:15  ;

  wire \G19:-1 ;

  assign \G19:-1  = \P19:15   & \G14:-1  ;

  assign S[20] = xorA[20] ^ \G19:-1 ;

  wire \P20:19 ;

  assign \P20:19  = xorA[20] & xorA[19] ;

  wire \P20:15 ;

  assign \P20:15  = \P20:19  & \P18:15  ;

  wire \G20:-1 ;

  assign \G20:-1  = \P20:15   & \G14:-1  ;

  assign S[21] = xorA[21] ^ \G20:-1 ;

  wire \P21:19 ;

  assign \P21:19  = xorA[21] & \P20:19  ;

  wire \P21:15 ;

  assign \P21:15  = \P21:19  & \P18:15  ;

  wire \G21:-1 ;

  assign \G21:-1  = \P21:15   & \G14:-1  ;

  assign S[22] = xorA[22] ^ \G21:-1 ;

  wire \P22:21 ;

  assign \P22:21  = xorA[22] & xorA[21] ;

  wire \P22:19 ;

  assign \P22:19  = \P22:21  & \P20:19  ;

  wire \P22:15 ;

  assign \P22:15  = \P22:19  & \P18:15  ;

  wire \G22:-1 ;

  assign \G22:-1  = \P22:15   & \G14:-1  ;

  assign S[23] = xorA[23] ^ \G22:-1 ;

  wire \P23:15 ;

  assign \P23:15  = xorA[23] & \P22:15  ;

  wire \G23:-1 ;

  assign \G23:-1  = \P23:15   & \G14:-1  ;

  assign S[24] = xorA[24] ^ \G23:-1 ;

  wire \P24:23 ;

  assign \P24:23  = xorA[24] & xorA[23] ;

  wire \P24:15 ;

  assign \P24:15  = \P24:23  & \P22:15  ;

  wire \G24:-1 ;

  assign \G24:-1  = \P24:15   & \G14:-1  ;

  assign S[25] = xorA[25] ^ \G24:-1 ;

  wire \P25:23 ;

  assign \P25:23  = xorA[25] & \P24:23  ;

  wire \P25:15 ;

  assign \P25:15  = \P25:23  & \P22:15  ;

  wire \G25:-1 ;

  assign \G25:-1  = \P25:15   & \G14:-1  ;

  assign S[26] = xorA[26] ^ \G25:-1 ;

  wire \P26:25 ;

  assign \P26:25  = xorA[26] & xorA[25] ;

  wire \P26:23 ;

  assign \P26:23  = \P26:25  & \P24:23  ;

  wire \P26:15 ;

  assign \P26:15  = \P26:23  & \P22:15  ;

  wire \G26:-1 ;

  assign \G26:-1  = \P26:15   & \G14:-1  ;

  assign S[27] = xorA[27] ^ \G26:-1 ;

  wire \P27:23 ;

  assign \P27:23  = xorA[27] & \P26:23  ;

  wire \P27:15 ;

  assign \P27:15  = \P27:23  & \P22:15  ;

  wire \G27:-1 ;

  assign \G27:-1  = \P27:15   & \G14:-1  ;

  assign S[28] = xorA[28] ^ \G27:-1 ;

  wire \P28:27 ;

  assign \P28:27  = xorA[28] & xorA[27] ;

  wire \P28:23 ;

  assign \P28:23  = \P28:27  & \P26:23  ;

  wire \P28:15 ;

  assign \P28:15  = \P28:23  & \P22:15  ;

  wire \G28:-1 ;

  assign \G28:-1  = \P28:15   & \G14:-1  ;

  assign S[29] = xorA[29] ^ \G28:-1 ;

  wire \P29:27 ;

  assign \P29:27  = xorA[29] & \P28:27  ;

  wire \P29:23 ;

  assign \P29:23  = \P29:27  & \P26:23  ;

  wire \P29:15 ;

  assign \P29:15  = \P29:23  & \P22:15  ;

  wire \G29:-1 ;

  assign \G29:-1  = \P29:15   & \G14:-1  ;

  assign S[30] = xorA[30] ^ \G29:-1 ;

  wire \P30:29 ;

  assign \P30:29  = xorA[30] & xorA[29] ;

  wire \P30:27 ;

  assign \P30:27  = \P30:29  & \P28:27  ;

  wire \P30:23 ;

  assign \P30:23  = \P30:27  & \P26:23  ;

  wire \P30:15 ;

  assign \P30:15  = \P30:23  & \P22:15  ;

  wire \G30:-1 ;

  assign \G30:-1  = \P30:15   & \G14:-1  ;

  assign S[31] = xorA[31] ^ \G30:-1 ;

  wire \G31:-1 ;

  assign \G31:-1  = xorA[31]  & \G30:-1  ;

  assign S[32] = xorA[32] ^ \G31:-1 ;

  wire \P32:31 ;

  assign \P32:31  = xorA[32] & xorA[31] ;

  wire \G32:-1 ;

  assign \G32:-1  = \P32:31   & \G30:-1  ;

  assign S[33] = xorA[33] ^ \G32:-1 ;

  wire \P33:31 ;

  assign \P33:31  = xorA[33] & \P32:31  ;

  wire \G33:-1 ;

  assign \G33:-1  = \P33:31   & \G30:-1  ;

  assign S[34] = xorA[34] ^ \G33:-1 ;

  wire \P34:33 ;

  assign \P34:33  = xorA[34] & xorA[33] ;

  wire \P34:31 ;

  assign \P34:31  = \P34:33  & \P32:31  ;

  wire \G34:-1 ;

  assign \G34:-1  = \P34:31   & \G30:-1  ;

  assign S[35] = xorA[35] ^ \G34:-1 ;

  wire \P35:31 ;

  assign \P35:31  = xorA[35] & \P34:31  ;

  wire \G35:-1 ;

  assign \G35:-1  = \P35:31   & \G30:-1  ;

  assign S[36] = xorA[36] ^ \G35:-1 ;

  wire \P36:35 ;

  assign \P36:35  = xorA[36] & xorA[35] ;

  wire \P36:31 ;

  assign \P36:31  = \P36:35  & \P34:31  ;

  wire \G36:-1 ;

  assign \G36:-1  = \P36:31   & \G30:-1  ;

  assign S[37] = xorA[37] ^ \G36:-1 ;

  wire \P37:35 ;

  assign \P37:35  = xorA[37] & \P36:35  ;

  wire \P37:31 ;

  assign \P37:31  = \P37:35  & \P34:31  ;

  wire \G37:-1 ;

  assign \G37:-1  = \P37:31   & \G30:-1  ;

  assign S[38] = xorA[38] ^ \G37:-1 ;

  wire \P38:37 ;

  assign \P38:37  = xorA[38] & xorA[37] ;

  wire \P38:35 ;

  assign \P38:35  = \P38:37  & \P36:35  ;

  wire \P38:31 ;

  assign \P38:31  = \P38:35  & \P34:31  ;

  wire \G38:-1 ;

  assign \G38:-1  = \P38:31   & \G30:-1  ;

  assign S[39] = xorA[39] ^ \G38:-1 ;

  wire \P39:31 ;

  assign \P39:31  = xorA[39] & \P38:31  ;

  wire \G39:-1 ;

  assign \G39:-1  = \P39:31   & \G30:-1  ;

  assign S[40] = xorA[40] ^ \G39:-1 ;

  wire \P40:39 ;

  assign \P40:39  = xorA[40] & xorA[39] ;

  wire \P40:31 ;

  assign \P40:31  = \P40:39  & \P38:31  ;

  wire \G40:-1 ;

  assign \G40:-1  = \P40:31   & \G30:-1  ;

  assign S[41] = xorA[41] ^ \G40:-1 ;

  wire \P41:39 ;

  assign \P41:39  = xorA[41] & \P40:39  ;

  wire \P41:31 ;

  assign \P41:31  = \P41:39  & \P38:31  ;

  wire \G41:-1 ;

  assign \G41:-1  = \P41:31   & \G30:-1  ;

  assign S[42] = xorA[42] ^ \G41:-1 ;

  wire \P42:41 ;

  assign \P42:41  = xorA[42] & xorA[41] ;

  wire \P42:39 ;

  assign \P42:39  = \P42:41  & \P40:39  ;

  wire \P42:31 ;

  assign \P42:31  = \P42:39  & \P38:31  ;

  wire \G42:-1 ;

  assign \G42:-1  = \P42:31   & \G30:-1  ;

  assign S[43] = xorA[43] ^ \G42:-1 ;

  wire \P43:39 ;

  assign \P43:39  = xorA[43] & \P42:39  ;

  wire \P43:31 ;

  assign \P43:31  = \P43:39  & \P38:31  ;

  wire \G43:-1 ;

  assign \G43:-1  = \P43:31   & \G30:-1  ;

  assign S[44] = xorA[44] ^ \G43:-1 ;

  wire \P44:43 ;

  assign \P44:43  = xorA[44] & xorA[43] ;

  wire \P44:39 ;

  assign \P44:39  = \P44:43  & \P42:39  ;

  wire \P44:31 ;

  assign \P44:31  = \P44:39  & \P38:31  ;

  wire \G44:-1 ;

  assign \G44:-1  = \P44:31   & \G30:-1  ;

  assign S[45] = xorA[45] ^ \G44:-1 ;

  wire \P45:43 ;

  assign \P45:43  = xorA[45] & \P44:43  ;

  wire \P45:39 ;

  assign \P45:39  = \P45:43  & \P42:39  ;

  wire \P45:31 ;

  assign \P45:31  = \P45:39  & \P38:31  ;

  wire \G45:-1 ;

  assign \G45:-1  = \P45:31   & \G30:-1  ;

  assign S[46] = xorA[46] ^ \G45:-1 ;

  wire \P46:45 ;

  assign \P46:45  = xorA[46] & xorA[45] ;

  wire \P46:43 ;

  assign \P46:43  = \P46:45  & \P44:43  ;

  wire \P46:39 ;

  assign \P46:39  = \P46:43  & \P42:39  ;

  wire \P46:31 ;

  assign \P46:31  = \P46:39  & \P38:31  ;

  wire \G46:-1 ;

  assign \G46:-1  = \P46:31   & \G30:-1  ;

  assign S[47] = xorA[47] ^ \G46:-1 ;

  wire \P47:31 ;

  assign \P47:31  = xorA[47] & \P46:31  ;

  wire \G47:-1 ;

  assign \G47:-1  = \P47:31   & \G30:-1  ;

  assign S[48] = xorA[48] ^ \G47:-1 ;

  wire \P48:47 ;

  assign \P48:47  = xorA[48] & xorA[47] ;

  wire \P48:31 ;

  assign \P48:31  = \P48:47  & \P46:31  ;

  wire \G48:-1 ;

  assign \G48:-1  = \P48:31   & \G30:-1  ;

  assign S[49] = xorA[49] ^ \G48:-1 ;

  wire \P49:47 ;

  assign \P49:47  = xorA[49] & \P48:47  ;

  wire \P49:31 ;

  assign \P49:31  = \P49:47  & \P46:31  ;

  wire \G49:-1 ;

  assign \G49:-1  = \P49:31   & \G30:-1  ;

  assign S[50] = xorA[50] ^ \G49:-1 ;

  wire \P50:49 ;

  assign \P50:49  = xorA[50] & xorA[49] ;

  wire \P50:47 ;

  assign \P50:47  = \P50:49  & \P48:47  ;

  wire \P50:31 ;

  assign \P50:31  = \P50:47  & \P46:31  ;

  wire \G50:-1 ;

  assign \G50:-1  = \P50:31   & \G30:-1  ;

  assign S[51] = xorA[51] ^ \G50:-1 ;

endmodule
