/* Generated by Yosys 0.9+4052 (git sha1 86a6ac76, clang 10.0.0-4ubuntu1 -fPIC -Os) */
`include "cmos_cells.v"

(* top =  1  *)
(* src = "contador_estructural.v:1.1-17.10" *)
module contador_estructural(clk, reset, data_in, count);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  (* src = "contador_estructural.v:2.13-2.16" *)
  input clk;
  (* src = "contador_estructural.v:5.19-5.24" *)
  output [2:0] count;
  (* src = "contador_estructural.v:4.19-4.26" *)
  input [9:0] data_in;
  (* src = "contador_estructural.v:3.13-3.18" *)
  input reset;
  NOT _29_ (
    .A(count[0]),
    .Y(_03_)
  );
  NOT _30_ (
    .A(reset),
    .Y(_04_)
  );
  NOT _31_ (
    .A(count[2]),
    .Y(_05_)
  );
  NOR _32_ (
    .A(data_in[6]),
    .B(data_in[7]),
    .Y(_06_)
  );
  NOR _33_ (
    .A(data_in[8]),
    .B(data_in[9]),
    .Y(_07_)
  );
  NAND _34_ (
    .A(_06_),
    .B(_07_),
    .Y(_08_)
  );
  NOR _35_ (
    .A(data_in[0]),
    .B(data_in[1]),
    .Y(_09_)
  );
  NOR _36_ (
    .A(data_in[3]),
    .B(data_in[4]),
    .Y(_10_)
  );
  NOR _37_ (
    .A(data_in[2]),
    .B(data_in[5]),
    .Y(_11_)
  );
  NAND _38_ (
    .A(_09_),
    .B(_11_),
    .Y(_12_)
  );
  NOR _39_ (
    .A(_08_),
    .B(_12_),
    .Y(_13_)
  );
  NAND _40_ (
    .A(_10_),
    .B(_13_),
    .Y(_14_)
  );
  NOT _41_ (
    .A(_14_),
    .Y(_15_)
  );
  NOR _42_ (
    .A(_03_),
    .B(_15_),
    .Y(_16_)
  );
  NAND _43_ (
    .A(count[1]),
    .B(_14_),
    .Y(_17_)
  );
  NOR _44_ (
    .A(_03_),
    .B(_17_),
    .Y(_18_)
  );
  NAND _45_ (
    .A(count[1]),
    .B(_16_),
    .Y(_19_)
  );
  NOR _46_ (
    .A(_04_),
    .B(_14_),
    .Y(_20_)
  );
  NAND _47_ (
    .A(reset),
    .B(_15_),
    .Y(_21_)
  );
  NOR _48_ (
    .A(_18_),
    .B(_20_),
    .Y(_22_)
  );
  NAND _49_ (
    .A(_19_),
    .B(_21_),
    .Y(_23_)
  );
  NOR _50_ (
    .A(count[1]),
    .B(_16_),
    .Y(_24_)
  );
  NOR _51_ (
    .A(_23_),
    .B(_24_),
    .Y(_01_)
  );
  NOR _52_ (
    .A(_03_),
    .B(reset),
    .Y(_25_)
  );
  NOR _53_ (
    .A(_14_),
    .B(_25_),
    .Y(_26_)
  );
  NOR _54_ (
    .A(_16_),
    .B(_26_),
    .Y(_00_)
  );
  NAND _55_ (
    .A(count[2]),
    .B(_22_),
    .Y(_27_)
  );
  NAND _56_ (
    .A(_05_),
    .B(_18_),
    .Y(_28_)
  );
  NAND _57_ (
    .A(_27_),
    .B(_28_),
    .Y(_02_)
  );
  (* src = "contador_estructural.v:8.2-15.5" *)
  DFF _58_ (
    .C(clk),
    .D(_00_),
    .Q(count[0])
  );
  (* src = "contador_estructural.v:8.2-15.5" *)
  DFF _59_ (
    .C(clk),
    .D(_01_),
    .Q(count[1])
  );
  (* src = "contador_estructural.v:8.2-15.5" *)
  DFF _60_ (
    .C(clk),
    .D(_02_),
    .Q(count[2])
  );
endmodule