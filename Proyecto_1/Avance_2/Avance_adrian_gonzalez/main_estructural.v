/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 6.2.0-11ubuntu1 -O2 -fdebug-prefix-map=/build/yosys-OIL3SR/yosys-0.7=. -fstack-protector-strong -fPIC -Os) */

(* src = "com.v:1" *)
module com_valid(cclk, dclk, valid, data_in, data_out);
  (* src = "com.v:13" *)
  wire [7:0] _00_;
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
  (* src = "com.v:2" *)
  input cclk;
  (* src = "com.v:5" *)
  input [7:0] data_in;
  (* src = "com.v:6" *)
  output [7:0] data_out;
  (* src = "com.v:3" *)
  input dclk;
  (* src = "com.v:4" *)
  input valid;
  NOT _27_ (
    .A(_01_),
    .Y(_11_)
  );
  NOT _28_ (
    .A(_13_),
    .Y(_12_)
  );
  NOR _29_ (
    .A(_12_),
    .B(_11_),
    .Y(_19_)
  );
  NOT _30_ (
    .A(_22_),
    .Y(_14_)
  );
  NAND _31_ (
    .A(_14_),
    .B(_13_),
    .Y(_23_)
  );
  NOT _32_ (
    .A(_24_),
    .Y(_15_)
  );
  NAND _33_ (
    .A(_15_),
    .B(_13_),
    .Y(_25_)
  );
  NOT _34_ (
    .A(_26_),
    .Y(_16_)
  );
  NAND _35_ (
    .A(_16_),
    .B(_13_),
    .Y(_02_)
  );
  NOT _36_ (
    .A(_03_),
    .Y(_17_)
  );
  NAND _37_ (
    .A(_17_),
    .B(_13_),
    .Y(_04_)
  );
  NOT _38_ (
    .A(_05_),
    .Y(_18_)
  );
  NOR _39_ (
    .A(_18_),
    .B(_12_),
    .Y(_06_)
  );
  NOT _40_ (
    .A(_07_),
    .Y(_20_)
  );
  NAND _41_ (
    .A(_20_),
    .B(_13_),
    .Y(_08_)
  );
  NOT _42_ (
    .A(_09_),
    .Y(_21_)
  );
  NOR _43_ (
    .A(_21_),
    .B(_12_),
    .Y(_10_)
  );
  DFF _44_ (
    .C(cclk),
    .D(_00_[0]),
    .Q(data_out[0])
  );
  DFF _45_ (
    .C(cclk),
    .D(_00_[1]),
    .Q(data_out[1])
  );
  DFF _46_ (
    .C(cclk),
    .D(_00_[2]),
    .Q(data_out[2])
  );
  DFF _47_ (
    .C(cclk),
    .D(_00_[3]),
    .Q(data_out[3])
  );
  DFF _48_ (
    .C(cclk),
    .D(_00_[4]),
    .Q(data_out[4])
  );
  DFF _49_ (
    .C(cclk),
    .D(_00_[5]),
    .Q(data_out[5])
  );
  DFF _50_ (
    .C(cclk),
    .D(_00_[6]),
    .Q(data_out[6])
  );
  DFF _51_ (
    .C(cclk),
    .D(_00_[7]),
    .Q(data_out[7])
  );
  assign _01_ = data_in[1];
  assign _13_ = valid;
  assign _00_[1] = _19_;
  assign _22_ = data_in[2];
  assign _00_[2] = _23_;
  assign _24_ = data_in[3];
  assign _00_[3] = _25_;
  assign _26_ = data_in[4];
  assign _00_[4] = _02_;
  assign _03_ = data_in[5];
  assign _00_[5] = _04_;
  assign _05_ = data_in[6];
  assign _00_[6] = _06_;
  assign _07_ = data_in[7];
  assign _00_[7] = _08_;
  assign _09_ = data_in[0];
  assign _00_[0] = _10_;
endmodule

(* src = "8_to_1_bits.v:1" *)
module converter_bits(cclk, dclk, data_in, data_out);
  (* src = "8_to_1_bits.v:2" *)
  input cclk;
  (* src = "8_to_1_bits.v:4" *)
  input [7:0] data_in;
  (* src = "8_to_1_bits.v:5" *)
  output data_out;
  (* src = "8_to_1_bits.v:3" *)
  input dclk;
  DFF _0_ (
    .C(dclk),
    .D(data_in[7]),
    .Q(data_out)
  );
endmodule

(* top =  1  *)
(* src = "main.v:5" *)
module main(cclk, dclk, valid, data_in, data_between, data_out);
  (* src = "main.v:6" *)
  input cclk;
  (* src = "main.v:10" *)
  output [7:0] data_between;
  (* src = "main.v:9" *)
  input [7:0] data_in;
  (* src = "main.v:11" *)
  output data_out;
  (* src = "main.v:7" *)
  input dclk;
  (* src = "main.v:8" *)
  input valid;
  (* src = "main.v:15" *)
  com_valid com_valid (
    .cclk(cclk),
    .data_in(data_in),
    .data_out(data_between),
    .dclk(dclk),
    .valid(valid)
  );
  (* src = "main.v:23" *)
  converter_bits converter_bits (
    .cclk(cclk),
    .data_in(data_between),
    .data_out(data_out),
    .dclk(dclk)
  );
endmodule
