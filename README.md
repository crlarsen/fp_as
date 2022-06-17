# Verilog IEEE 754 Addition/Subtraction Module

## Description

Updated circuit to perform both addition and subtraction. Module also supports all binary formats.

Simulation testbench code fp_as_tb.v to test exception cases (NaNs, Infinities, and Zeroes).

Updated version of cmpadd.v to test both addition and subtraction.

Only one DIP switch in the range of 0 through 4 is allowed in the ON position at a time. All other DIP switches in this range must be in the OFF position.

| DIP Switch   | Rounding Attribute  |
|--------------|---------------------|
| DIP Switch 0 | roundTiesToEven     |
| DIP Switch 1 | roundTowardZero     |
| DIP Switch 2 | roundTowardPositive |
| DIP Switch 2 | roundTowardNegative |

| SW 15 | SW 14 | SW 13 | Switches 13-15 select debugging information. |
|-------|-------|-------|----------------------------------------------|
|   x   |   x   |   1   | Show rounding mode on LEDs 0-4, and value of \subtract? on LED 5. |
|   0   |   0   |   0   | Display 'b' on LEDs
|   0   |   1   |   0   | Display 'a' on LEDs
|   1   |   0   |   0   | Display sum from fp_add_exact on LEDs
|   1   |   1   |   0   | Display sum/difference from fp_as on LEDs. |

The code is explained in the video series [Building an FPU in Verilog](https://www.youtube.com/watch?v=rYkVdJnVJFQ&list=PLlO9sSrh8HrwcDHAtwec1ycV-m50nfUVs).
See the video *Building an FPU in Verilog: Adding Floating Point Numbers, Part 3*.

The BASYS 3 board can be purchased at [digilent.com](https://store.digilentinc.com/basys-3-artix-7-fpga-beginner-board-recommended-for-introductory-users/)

## Manifest

|   Filename        |                        Description                           |
|-------------------|--------------------------------------------------------------|
| README.md         | This file.                                                   |
| cmpadd.v          | Test harness for fp_add_exact and fp_as.                    |
| debounce.v        | Module to debounce signals from the push buttons on the Digilent BASYS 3 board. |
| fp_as.sv          | Addition/Subtraction circuit for the IEEE 754 binary16 data type using inexact intermediate results. |
| fp_as_tb.v        | Simulation testbench for NaNs, Infinities, and Zeroes. |
| fp_add_exact.sv   | Addition circuit for the IEEE 754 binary16 data type.        |
| fp_class.sv       | Utility module to identify the type of the IEEE 754 value passed in, and extract the exponent & significand fields for use by other modules. |
| hex2_7seg.v       | Utility module to output 4 digit hexadecimal value on 7-segment display. |
| ieee-754-flags.vh | Verilog header file to define constants for datum type (NaN, Infinity, Zero, Subnormal, and Normal), rounding attributes, and IEEE exceptions. |
| padder11.v        | Prefix adder used by round module.                           |
| padder110.v       | Prefix adder used by fp_as module.                          |
| padder113.v       | Prefix adder used by round module.                           |
| padder230.v       | Prefix adder used by fp_as module.                          |
| padder24.v        | Prefix adder used by round module.                           |
| padder26.v        | Prefix adder used by fp_as module.                          |
| padder42.v        | Prefix adder used by fp_as module.                    |
| padder52.v        | Prefix adder used by fp_as module.                    |
| padder53.v        | Prefix adder used by fp_as module.                    |
| PijGij.v          | Utility routines needed by the various prefix adder modules. |
| round.v           | Parameterized rounding module.                               |
| x7seg.v           | Miscellaneous utility routines for formatting data for output to the 7-segment display. |
| simulate.roundTiesToEven-16 | Test bench results for binary16, roundTiesToEven. |
| simulate.roundTiesToEven-32 | Test bench results for binary32, roundTiesToEven. |
| simulate.roundTiesToEven-64 | Test bench results for binary64, roundTiesToEven. |
| simulate.roundTiesToEven-128 | Test bench results for binary128, roundTiesToEven. |
| simulate.roundTowardNegative-16 | Test bench results for binary16, roundTowardNegative. |
| simulate.roundTowardNegative-32 | Test bench results for binary32, roundTowardNegative. |
| simulate.roundTowardNegative-64 | Test bench results for binary64, roundTowardNegative. |
| simulate.roundTowardNegative-128 | Test bench results for binary128, roundTowardNegative. |
| simulate.roundTowardPositive-16 | Test bench results for binary16, roundTowardPositive. |
| simulate.roundTowardPositive-32 | Test bench results for binary32,  roundTowardPositive. |
| simulate.roundTowardPositive-64 | Test bench results for binary64,  roundTowardPositive. |
| simulate.roundTowardPositive-128 | Test bench results for binary128,  roundTowardPositive. |
| simulate.roundTowardZero-16 | Test bench results for binary16, roundTowardZero. |
| simulate.roundTowardZero-32 | Test bench results for binary32,  roundTowardZero. |
| simulate.roundTowardZero-64 | Test bench results for binary64,  roundTowardZero. |
| simulate.roundTowardZero-128 | Test bench results for binary128,  roundTowardZero. |

## Copyright

:copyright: Chris Larsen, 2019-2022
