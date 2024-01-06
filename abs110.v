`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Copyright: Chris Larsen, 2024
// Engineer: Chris Larsen
//
// Create Date: 01/05/2024 11:21:39 PM
// Design Name:
// Module Name: abs110
// Project Name:
// Target Devices:
// Tool Versions:
// Description: Find absolute value of 110-bit Signed Integer
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

module abs110(A, S);
  localparam N = 110;
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

  wire \P51:47 ;

  assign \P51:47  = xorA[51] & \P50:47  ;

  wire \P51:31 ;

  assign \P51:31  = \P51:47  & \P46:31  ;

  wire \G51:-1 ;

  assign \G51:-1  = \P51:31   & \G30:-1  ;

  assign S[52] = xorA[52] ^ \G51:-1 ;

  wire \P52:51 ;

  assign \P52:51  = xorA[52] & xorA[51] ;

  wire \P52:47 ;

  assign \P52:47  = \P52:51  & \P50:47  ;

  wire \P52:31 ;

  assign \P52:31  = \P52:47  & \P46:31  ;

  wire \G52:-1 ;

  assign \G52:-1  = \P52:31   & \G30:-1  ;

  assign S[53] = xorA[53] ^ \G52:-1 ;

  wire \P53:51 ;

  assign \P53:51  = xorA[53] & \P52:51  ;

  wire \P53:47 ;

  assign \P53:47  = \P53:51  & \P50:47  ;

  wire \P53:31 ;

  assign \P53:31  = \P53:47  & \P46:31  ;

  wire \G53:-1 ;

  assign \G53:-1  = \P53:31   & \G30:-1  ;

  assign S[54] = xorA[54] ^ \G53:-1 ;

  wire \P54:53 ;

  assign \P54:53  = xorA[54] & xorA[53] ;

  wire \P54:51 ;

  assign \P54:51  = \P54:53  & \P52:51  ;

  wire \P54:47 ;

  assign \P54:47  = \P54:51  & \P50:47  ;

  wire \P54:31 ;

  assign \P54:31  = \P54:47  & \P46:31  ;

  wire \G54:-1 ;

  assign \G54:-1  = \P54:31   & \G30:-1  ;

  assign S[55] = xorA[55] ^ \G54:-1 ;

  wire \P55:47 ;

  assign \P55:47  = xorA[55] & \P54:47  ;

  wire \P55:31 ;

  assign \P55:31  = \P55:47  & \P46:31  ;

  wire \G55:-1 ;

  assign \G55:-1  = \P55:31   & \G30:-1  ;

  assign S[56] = xorA[56] ^ \G55:-1 ;

  wire \P56:55 ;

  assign \P56:55  = xorA[56] & xorA[55] ;

  wire \P56:47 ;

  assign \P56:47  = \P56:55  & \P54:47  ;

  wire \P56:31 ;

  assign \P56:31  = \P56:47  & \P46:31  ;

  wire \G56:-1 ;

  assign \G56:-1  = \P56:31   & \G30:-1  ;

  assign S[57] = xorA[57] ^ \G56:-1 ;

  wire \P57:55 ;

  assign \P57:55  = xorA[57] & \P56:55  ;

  wire \P57:47 ;

  assign \P57:47  = \P57:55  & \P54:47  ;

  wire \P57:31 ;

  assign \P57:31  = \P57:47  & \P46:31  ;

  wire \G57:-1 ;

  assign \G57:-1  = \P57:31   & \G30:-1  ;

  assign S[58] = xorA[58] ^ \G57:-1 ;

  wire \P58:57 ;

  assign \P58:57  = xorA[58] & xorA[57] ;

  wire \P58:55 ;

  assign \P58:55  = \P58:57  & \P56:55  ;

  wire \P58:47 ;

  assign \P58:47  = \P58:55  & \P54:47  ;

  wire \P58:31 ;

  assign \P58:31  = \P58:47  & \P46:31  ;

  wire \G58:-1 ;

  assign \G58:-1  = \P58:31   & \G30:-1  ;

  assign S[59] = xorA[59] ^ \G58:-1 ;

  wire \P59:55 ;

  assign \P59:55  = xorA[59] & \P58:55  ;

  wire \P59:47 ;

  assign \P59:47  = \P59:55  & \P54:47  ;

  wire \P59:31 ;

  assign \P59:31  = \P59:47  & \P46:31  ;

  wire \G59:-1 ;

  assign \G59:-1  = \P59:31   & \G30:-1  ;

  assign S[60] = xorA[60] ^ \G59:-1 ;

  wire \P60:59 ;

  assign \P60:59  = xorA[60] & xorA[59] ;

  wire \P60:55 ;

  assign \P60:55  = \P60:59  & \P58:55  ;

  wire \P60:47 ;

  assign \P60:47  = \P60:55  & \P54:47  ;

  wire \P60:31 ;

  assign \P60:31  = \P60:47  & \P46:31  ;

  wire \G60:-1 ;

  assign \G60:-1  = \P60:31   & \G30:-1  ;

  assign S[61] = xorA[61] ^ \G60:-1 ;

  wire \P61:59 ;

  assign \P61:59  = xorA[61] & \P60:59  ;

  wire \P61:55 ;

  assign \P61:55  = \P61:59  & \P58:55  ;

  wire \P61:47 ;

  assign \P61:47  = \P61:55  & \P54:47  ;

  wire \P61:31 ;

  assign \P61:31  = \P61:47  & \P46:31  ;

  wire \G61:-1 ;

  assign \G61:-1  = \P61:31   & \G30:-1  ;

  assign S[62] = xorA[62] ^ \G61:-1 ;

  wire \P62:61 ;

  assign \P62:61  = xorA[62] & xorA[61] ;

  wire \P62:59 ;

  assign \P62:59  = \P62:61  & \P60:59  ;

  wire \P62:55 ;

  assign \P62:55  = \P62:59  & \P58:55  ;

  wire \P62:47 ;

  assign \P62:47  = \P62:55  & \P54:47  ;

  wire \P62:31 ;

  assign \P62:31  = \P62:47  & \P46:31  ;

  wire \G62:-1 ;

  assign \G62:-1  = \P62:31   & \G30:-1  ;

  assign S[63] = xorA[63] ^ \G62:-1 ;

  wire \G63:-1 ;

  assign \G63:-1  = xorA[63]  & \G62:-1  ;

  assign S[64] = xorA[64] ^ \G63:-1 ;

  wire \P64:63 ;

  assign \P64:63  = xorA[64] & xorA[63] ;

  wire \G64:-1 ;

  assign \G64:-1  = \P64:63   & \G62:-1  ;

  assign S[65] = xorA[65] ^ \G64:-1 ;

  wire \P65:63 ;

  assign \P65:63  = xorA[65] & \P64:63  ;

  wire \G65:-1 ;

  assign \G65:-1  = \P65:63   & \G62:-1  ;

  assign S[66] = xorA[66] ^ \G65:-1 ;

  wire \P66:65 ;

  assign \P66:65  = xorA[66] & xorA[65] ;

  wire \P66:63 ;

  assign \P66:63  = \P66:65  & \P64:63  ;

  wire \G66:-1 ;

  assign \G66:-1  = \P66:63   & \G62:-1  ;

  assign S[67] = xorA[67] ^ \G66:-1 ;

  wire \P67:63 ;

  assign \P67:63  = xorA[67] & \P66:63  ;

  wire \G67:-1 ;

  assign \G67:-1  = \P67:63   & \G62:-1  ;

  assign S[68] = xorA[68] ^ \G67:-1 ;

  wire \P68:67 ;

  assign \P68:67  = xorA[68] & xorA[67] ;

  wire \P68:63 ;

  assign \P68:63  = \P68:67  & \P66:63  ;

  wire \G68:-1 ;

  assign \G68:-1  = \P68:63   & \G62:-1  ;

  assign S[69] = xorA[69] ^ \G68:-1 ;

  wire \P69:67 ;

  assign \P69:67  = xorA[69] & \P68:67  ;

  wire \P69:63 ;

  assign \P69:63  = \P69:67  & \P66:63  ;

  wire \G69:-1 ;

  assign \G69:-1  = \P69:63   & \G62:-1  ;

  assign S[70] = xorA[70] ^ \G69:-1 ;

  wire \P70:69 ;

  assign \P70:69  = xorA[70] & xorA[69] ;

  wire \P70:67 ;

  assign \P70:67  = \P70:69  & \P68:67  ;

  wire \P70:63 ;

  assign \P70:63  = \P70:67  & \P66:63  ;

  wire \G70:-1 ;

  assign \G70:-1  = \P70:63   & \G62:-1  ;

  assign S[71] = xorA[71] ^ \G70:-1 ;

  wire \P71:63 ;

  assign \P71:63  = xorA[71] & \P70:63  ;

  wire \G71:-1 ;

  assign \G71:-1  = \P71:63   & \G62:-1  ;

  assign S[72] = xorA[72] ^ \G71:-1 ;

  wire \P72:71 ;

  assign \P72:71  = xorA[72] & xorA[71] ;

  wire \P72:63 ;

  assign \P72:63  = \P72:71  & \P70:63  ;

  wire \G72:-1 ;

  assign \G72:-1  = \P72:63   & \G62:-1  ;

  assign S[73] = xorA[73] ^ \G72:-1 ;

  wire \P73:71 ;

  assign \P73:71  = xorA[73] & \P72:71  ;

  wire \P73:63 ;

  assign \P73:63  = \P73:71  & \P70:63  ;

  wire \G73:-1 ;

  assign \G73:-1  = \P73:63   & \G62:-1  ;

  assign S[74] = xorA[74] ^ \G73:-1 ;

  wire \P74:73 ;

  assign \P74:73  = xorA[74] & xorA[73] ;

  wire \P74:71 ;

  assign \P74:71  = \P74:73  & \P72:71  ;

  wire \P74:63 ;

  assign \P74:63  = \P74:71  & \P70:63  ;

  wire \G74:-1 ;

  assign \G74:-1  = \P74:63   & \G62:-1  ;

  assign S[75] = xorA[75] ^ \G74:-1 ;

  wire \P75:71 ;

  assign \P75:71  = xorA[75] & \P74:71  ;

  wire \P75:63 ;

  assign \P75:63  = \P75:71  & \P70:63  ;

  wire \G75:-1 ;

  assign \G75:-1  = \P75:63   & \G62:-1  ;

  assign S[76] = xorA[76] ^ \G75:-1 ;

  wire \P76:75 ;

  assign \P76:75  = xorA[76] & xorA[75] ;

  wire \P76:71 ;

  assign \P76:71  = \P76:75  & \P74:71  ;

  wire \P76:63 ;

  assign \P76:63  = \P76:71  & \P70:63  ;

  wire \G76:-1 ;

  assign \G76:-1  = \P76:63   & \G62:-1  ;

  assign S[77] = xorA[77] ^ \G76:-1 ;

  wire \P77:75 ;

  assign \P77:75  = xorA[77] & \P76:75  ;

  wire \P77:71 ;

  assign \P77:71  = \P77:75  & \P74:71  ;

  wire \P77:63 ;

  assign \P77:63  = \P77:71  & \P70:63  ;

  wire \G77:-1 ;

  assign \G77:-1  = \P77:63   & \G62:-1  ;

  assign S[78] = xorA[78] ^ \G77:-1 ;

  wire \P78:77 ;

  assign \P78:77  = xorA[78] & xorA[77] ;

  wire \P78:75 ;

  assign \P78:75  = \P78:77  & \P76:75  ;

  wire \P78:71 ;

  assign \P78:71  = \P78:75  & \P74:71  ;

  wire \P78:63 ;

  assign \P78:63  = \P78:71  & \P70:63  ;

  wire \G78:-1 ;

  assign \G78:-1  = \P78:63   & \G62:-1  ;

  assign S[79] = xorA[79] ^ \G78:-1 ;

  wire \P79:63 ;

  assign \P79:63  = xorA[79] & \P78:63  ;

  wire \G79:-1 ;

  assign \G79:-1  = \P79:63   & \G62:-1  ;

  assign S[80] = xorA[80] ^ \G79:-1 ;

  wire \P80:79 ;

  assign \P80:79  = xorA[80] & xorA[79] ;

  wire \P80:63 ;

  assign \P80:63  = \P80:79  & \P78:63  ;

  wire \G80:-1 ;

  assign \G80:-1  = \P80:63   & \G62:-1  ;

  assign S[81] = xorA[81] ^ \G80:-1 ;

  wire \P81:79 ;

  assign \P81:79  = xorA[81] & \P80:79  ;

  wire \P81:63 ;

  assign \P81:63  = \P81:79  & \P78:63  ;

  wire \G81:-1 ;

  assign \G81:-1  = \P81:63   & \G62:-1  ;

  assign S[82] = xorA[82] ^ \G81:-1 ;

  wire \P82:81 ;

  assign \P82:81  = xorA[82] & xorA[81] ;

  wire \P82:79 ;

  assign \P82:79  = \P82:81  & \P80:79  ;

  wire \P82:63 ;

  assign \P82:63  = \P82:79  & \P78:63  ;

  wire \G82:-1 ;

  assign \G82:-1  = \P82:63   & \G62:-1  ;

  assign S[83] = xorA[83] ^ \G82:-1 ;

  wire \P83:79 ;

  assign \P83:79  = xorA[83] & \P82:79  ;

  wire \P83:63 ;

  assign \P83:63  = \P83:79  & \P78:63  ;

  wire \G83:-1 ;

  assign \G83:-1  = \P83:63   & \G62:-1  ;

  assign S[84] = xorA[84] ^ \G83:-1 ;

  wire \P84:83 ;

  assign \P84:83  = xorA[84] & xorA[83] ;

  wire \P84:79 ;

  assign \P84:79  = \P84:83  & \P82:79  ;

  wire \P84:63 ;

  assign \P84:63  = \P84:79  & \P78:63  ;

  wire \G84:-1 ;

  assign \G84:-1  = \P84:63   & \G62:-1  ;

  assign S[85] = xorA[85] ^ \G84:-1 ;

  wire \P85:83 ;

  assign \P85:83  = xorA[85] & \P84:83  ;

  wire \P85:79 ;

  assign \P85:79  = \P85:83  & \P82:79  ;

  wire \P85:63 ;

  assign \P85:63  = \P85:79  & \P78:63  ;

  wire \G85:-1 ;

  assign \G85:-1  = \P85:63   & \G62:-1  ;

  assign S[86] = xorA[86] ^ \G85:-1 ;

  wire \P86:85 ;

  assign \P86:85  = xorA[86] & xorA[85] ;

  wire \P86:83 ;

  assign \P86:83  = \P86:85  & \P84:83  ;

  wire \P86:79 ;

  assign \P86:79  = \P86:83  & \P82:79  ;

  wire \P86:63 ;

  assign \P86:63  = \P86:79  & \P78:63  ;

  wire \G86:-1 ;

  assign \G86:-1  = \P86:63   & \G62:-1  ;

  assign S[87] = xorA[87] ^ \G86:-1 ;

  wire \P87:79 ;

  assign \P87:79  = xorA[87] & \P86:79  ;

  wire \P87:63 ;

  assign \P87:63  = \P87:79  & \P78:63  ;

  wire \G87:-1 ;

  assign \G87:-1  = \P87:63   & \G62:-1  ;

  assign S[88] = xorA[88] ^ \G87:-1 ;

  wire \P88:87 ;

  assign \P88:87  = xorA[88] & xorA[87] ;

  wire \P88:79 ;

  assign \P88:79  = \P88:87  & \P86:79  ;

  wire \P88:63 ;

  assign \P88:63  = \P88:79  & \P78:63  ;

  wire \G88:-1 ;

  assign \G88:-1  = \P88:63   & \G62:-1  ;

  assign S[89] = xorA[89] ^ \G88:-1 ;

  wire \P89:87 ;

  assign \P89:87  = xorA[89] & \P88:87  ;

  wire \P89:79 ;

  assign \P89:79  = \P89:87  & \P86:79  ;

  wire \P89:63 ;

  assign \P89:63  = \P89:79  & \P78:63  ;

  wire \G89:-1 ;

  assign \G89:-1  = \P89:63   & \G62:-1  ;

  assign S[90] = xorA[90] ^ \G89:-1 ;

  wire \P90:89 ;

  assign \P90:89  = xorA[90] & xorA[89] ;

  wire \P90:87 ;

  assign \P90:87  = \P90:89  & \P88:87  ;

  wire \P90:79 ;

  assign \P90:79  = \P90:87  & \P86:79  ;

  wire \P90:63 ;

  assign \P90:63  = \P90:79  & \P78:63  ;

  wire \G90:-1 ;

  assign \G90:-1  = \P90:63   & \G62:-1  ;

  assign S[91] = xorA[91] ^ \G90:-1 ;

  wire \P91:87 ;

  assign \P91:87  = xorA[91] & \P90:87  ;

  wire \P91:79 ;

  assign \P91:79  = \P91:87  & \P86:79  ;

  wire \P91:63 ;

  assign \P91:63  = \P91:79  & \P78:63  ;

  wire \G91:-1 ;

  assign \G91:-1  = \P91:63   & \G62:-1  ;

  assign S[92] = xorA[92] ^ \G91:-1 ;

  wire \P92:91 ;

  assign \P92:91  = xorA[92] & xorA[91] ;

  wire \P92:87 ;

  assign \P92:87  = \P92:91  & \P90:87  ;

  wire \P92:79 ;

  assign \P92:79  = \P92:87  & \P86:79  ;

  wire \P92:63 ;

  assign \P92:63  = \P92:79  & \P78:63  ;

  wire \G92:-1 ;

  assign \G92:-1  = \P92:63   & \G62:-1  ;

  assign S[93] = xorA[93] ^ \G92:-1 ;

  wire \P93:91 ;

  assign \P93:91  = xorA[93] & \P92:91  ;

  wire \P93:87 ;

  assign \P93:87  = \P93:91  & \P90:87  ;

  wire \P93:79 ;

  assign \P93:79  = \P93:87  & \P86:79  ;

  wire \P93:63 ;

  assign \P93:63  = \P93:79  & \P78:63  ;

  wire \G93:-1 ;

  assign \G93:-1  = \P93:63   & \G62:-1  ;

  assign S[94] = xorA[94] ^ \G93:-1 ;

  wire \P94:93 ;

  assign \P94:93  = xorA[94] & xorA[93] ;

  wire \P94:91 ;

  assign \P94:91  = \P94:93  & \P92:91  ;

  wire \P94:87 ;

  assign \P94:87  = \P94:91  & \P90:87  ;

  wire \P94:79 ;

  assign \P94:79  = \P94:87  & \P86:79  ;

  wire \P94:63 ;

  assign \P94:63  = \P94:79  & \P78:63  ;

  wire \G94:-1 ;

  assign \G94:-1  = \P94:63   & \G62:-1  ;

  assign S[95] = xorA[95] ^ \G94:-1 ;

  wire \P95:63 ;

  assign \P95:63  = xorA[95] & \P94:63  ;

  wire \G95:-1 ;

  assign \G95:-1  = \P95:63   & \G62:-1  ;

  assign S[96] = xorA[96] ^ \G95:-1 ;

  wire \P96:95 ;

  assign \P96:95  = xorA[96] & xorA[95] ;

  wire \P96:63 ;

  assign \P96:63  = \P96:95  & \P94:63  ;

  wire \G96:-1 ;

  assign \G96:-1  = \P96:63   & \G62:-1  ;

  assign S[97] = xorA[97] ^ \G96:-1 ;

  wire \P97:95 ;

  assign \P97:95  = xorA[97] & \P96:95  ;

  wire \P97:63 ;

  assign \P97:63  = \P97:95  & \P94:63  ;

  wire \G97:-1 ;

  assign \G97:-1  = \P97:63   & \G62:-1  ;

  assign S[98] = xorA[98] ^ \G97:-1 ;

  wire \P98:97 ;

  assign \P98:97  = xorA[98] & xorA[97] ;

  wire \P98:95 ;

  assign \P98:95  = \P98:97  & \P96:95  ;

  wire \P98:63 ;

  assign \P98:63  = \P98:95  & \P94:63  ;

  wire \G98:-1 ;

  assign \G98:-1  = \P98:63   & \G62:-1  ;

  assign S[99] = xorA[99] ^ \G98:-1 ;

  wire \P99:95 ;

  assign \P99:95  = xorA[99] & \P98:95  ;

  wire \P99:63 ;

  assign \P99:63  = \P99:95  & \P94:63  ;

  wire \G99:-1 ;

  assign \G99:-1  = \P99:63   & \G62:-1  ;

  assign S[100] = xorA[100] ^ \G99:-1 ;

  wire \P100:99 ;

  assign \P100:99  = xorA[100] & xorA[99] ;

  wire \P100:95 ;

  assign \P100:95  = \P100:99  & \P98:95  ;

  wire \P100:63 ;

  assign \P100:63  = \P100:95  & \P94:63  ;

  wire \G100:-1 ;

  assign \G100:-1  = \P100:63   & \G62:-1  ;

  assign S[101] = xorA[101] ^ \G100:-1 ;

  wire \P101:99 ;

  assign \P101:99  = xorA[101] & \P100:99  ;

  wire \P101:95 ;

  assign \P101:95  = \P101:99  & \P98:95  ;

  wire \P101:63 ;

  assign \P101:63  = \P101:95  & \P94:63  ;

  wire \G101:-1 ;

  assign \G101:-1  = \P101:63   & \G62:-1  ;

  assign S[102] = xorA[102] ^ \G101:-1 ;

  wire \P102:101 ;

  assign \P102:101  = xorA[102] & xorA[101] ;

  wire \P102:99 ;

  assign \P102:99  = \P102:101  & \P100:99  ;

  wire \P102:95 ;

  assign \P102:95  = \P102:99  & \P98:95  ;

  wire \P102:63 ;

  assign \P102:63  = \P102:95  & \P94:63  ;

  wire \G102:-1 ;

  assign \G102:-1  = \P102:63   & \G62:-1  ;

  assign S[103] = xorA[103] ^ \G102:-1 ;

  wire \P103:95 ;

  assign \P103:95  = xorA[103] & \P102:95  ;

  wire \P103:63 ;

  assign \P103:63  = \P103:95  & \P94:63  ;

  wire \G103:-1 ;

  assign \G103:-1  = \P103:63   & \G62:-1  ;

  assign S[104] = xorA[104] ^ \G103:-1 ;

  wire \P104:103 ;

  assign \P104:103  = xorA[104] & xorA[103] ;

  wire \P104:95 ;

  assign \P104:95  = \P104:103  & \P102:95  ;

  wire \P104:63 ;

  assign \P104:63  = \P104:95  & \P94:63  ;

  wire \G104:-1 ;

  assign \G104:-1  = \P104:63   & \G62:-1  ;

  assign S[105] = xorA[105] ^ \G104:-1 ;

  wire \P105:103 ;

  assign \P105:103  = xorA[105] & \P104:103  ;

  wire \P105:95 ;

  assign \P105:95  = \P105:103  & \P102:95  ;

  wire \P105:63 ;

  assign \P105:63  = \P105:95  & \P94:63  ;

  wire \G105:-1 ;

  assign \G105:-1  = \P105:63   & \G62:-1  ;

  assign S[106] = xorA[106] ^ \G105:-1 ;

  wire \P106:105 ;

  assign \P106:105  = xorA[106] & xorA[105] ;

  wire \P106:103 ;

  assign \P106:103  = \P106:105  & \P104:103  ;

  wire \P106:95 ;

  assign \P106:95  = \P106:103  & \P102:95  ;

  wire \P106:63 ;

  assign \P106:63  = \P106:95  & \P94:63  ;

  wire \G106:-1 ;

  assign \G106:-1  = \P106:63   & \G62:-1  ;

  assign S[107] = xorA[107] ^ \G106:-1 ;

  wire \P107:103 ;

  assign \P107:103  = xorA[107] & \P106:103  ;

  wire \P107:95 ;

  assign \P107:95  = \P107:103  & \P102:95  ;

  wire \P107:63 ;

  assign \P107:63  = \P107:95  & \P94:63  ;

  wire \G107:-1 ;

  assign \G107:-1  = \P107:63   & \G62:-1  ;

  assign S[108] = xorA[108] ^ \G107:-1 ;

  wire \P108:107 ;

  assign \P108:107  = xorA[108] & xorA[107] ;

  wire \P108:103 ;

  assign \P108:103  = \P108:107  & \P106:103  ;

  wire \P108:95 ;

  assign \P108:95  = \P108:103  & \P102:95  ;

  wire \P108:63 ;

  assign \P108:63  = \P108:95  & \P94:63  ;

  wire \G108:-1 ;

  assign \G108:-1  = \P108:63   & \G62:-1  ;

  assign S[109] = xorA[109] ^ \G108:-1 ;

endmodule