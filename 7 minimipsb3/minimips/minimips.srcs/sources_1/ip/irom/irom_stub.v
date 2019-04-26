// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Sat Mar 30 13:08:29 2019
// Host        : DESKTOP-BRS6M9C running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub F:/minimipsb3/minimips/minimips.srcs/sources_1/ip/irom/irom_stub.v
// Design      : irom
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0,Vivado 2014.4" *)
module irom(a, spo)
/* synthesis syn_black_box black_box_pad_pin="a[9:0],spo[31:0]" */;
  input [9:0]a;
  output [31:0]spo;
endmodule
