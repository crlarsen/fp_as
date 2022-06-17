module hex2_7seg(in, out);
  input [3:0] in; /*3210 */
  output [6:0] out; /* abcdefg */
  reg [6:0] out;
 
  always @(*)
    begin
      case (in)
        /*3210*/ /*abcdefg */
         0: out = 7'b0000001;
         1: out = 7'b1001111;
         2: out = 7'b0010010;
         3: out = 7'b0000110;
         4: out = 7'b1001100;
         5: out = 7'b0100100;
         6: out = 7'b0100000;
         7: out = 7'b0001111;
         8: out = 7'b0000000;
         9: out = 7'b0000100;
        10: out = 7'b0001000;
        11: out = 7'b1100000;
        12: out = 7'b0110001;
        13: out = 7'b1000010;
        14: out = 7'b0110000;
        15: out = 7'b0111000;
        default: out = 7'bx;
      endcase
    end
  endmodule

module hex2_7seg_status(in, s, err, good, out);
  input [3:0] in; /*3210 */
  input [1:0] s;
  input err, good;
  output [6:0] out; /* abcdefg */
  reg [6:0] out;
 
  always @(*)
    begin
      if (err) // "Err "
        if (s == 3)
          out = 7'b0110000;
        else if (s == 0)
          out = 7'b1111111;
        else
          out = 7'b1111010;
      else if (good) // "good"
        if (s == 3)
          out = 7'b0000100;
        else if (s == 0)
          out = 7'b1000010;
        else
          out = 7'b1100010;
      else
        case (in)
          /*3210*/ /*abcdefg */
           0: out = 7'b0000001;
           1: out = 7'b1001111;
           2: out = 7'b0010010;
           3: out = 7'b0000110;
           4: out = 7'b1001100;
           5: out = 7'b0100100;
           6: out = 7'b0100000;
           7: out = 7'b0001111;
           8: out = 7'b0000000;
           9: out = 7'b0000100;
          10: out = 7'b0001000;
          11: out = 7'b1100000;
          12: out = 7'b0110001;
          13: out = 7'b1000010;
          14: out = 7'b0110000;
          15: out = 7'b0111000;
          default: out = 7'bx;
        endcase
    end
  endmodule
