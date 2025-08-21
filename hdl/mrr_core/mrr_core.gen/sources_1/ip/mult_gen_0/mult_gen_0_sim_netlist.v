// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Fri Aug 30 12:54:02 2024
// Host        : DESKTOP-GH6A8S7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/hansg/Documents/MIT/Hanlab/MR-Core/hdl/mrr_core/mrr_core.gen/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tftg256-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_21,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_21,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [15:0]P;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [15:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [47:0]NLW_U0_PCASC_EXT_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "16" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  mult_gen_0_mult_gen_v12_0_21 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .PCASC_EXT(NLW_U0_PCASC_EXT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
GldLassLiODVgwPWl5GtUvNFVA+ZFVCFDhi7OrBop0rEIGOD7pGMQGd2XL5uXmDjnBa10M9DWskh
bTmllY5ovkWmM+NjjKYtf65BTGkYfwgKQ0A0l0q2oaCRiZEI98rgXRzWg4blHjn3F8mvlotras3b
gty58LDcqChRb34tHz4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YcKo5o/69htYDEreuDNtMbaQmtugz53TAiA3xMek1XTrggXZnceDK+Oacp9AwNeiNftWOxMl66sc
GrZixCPC4jC03qefsJitE5tQCfx9LEom/ln0gke2S5U676zqGFFkGD4igDSppP9+7smsit0JMNFB
3d9nJDwNXaerv07edmo26kGx6IsxHNmGjsmUd8FYgoMDNNDiTN40UA7rfTR1c5FwRoOUAPNW8x7l
lmsL+1mbpRU3rvmnc+tPlMZ9USQRFaWSLPznAatOpRgaHOa1J4DFd6nwIAGf3cDLilhq3YGA2oUb
qXHyz/+dnLIidWUJj1UPrzhk+3OEiFNdeXBKsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
g4qhHdak8eXxEqdympBtDM13xMJwZUSekBKApv5XlolRI2rR14IEYNQEcKRGlZyuFCmDRJDrEYWf
Eokybg18xq2N2hsq8nA4pvk6H9PXJmnhKoFcPeZ1j9mOnXNuEaOZnL6sA21bsPP7tTakNFG0eaXB
2vlDGYPDupMpXlylpEQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YIONylalBSo3oXqXlsOxHxbPAKbTQFLUkNcqhxYuBHSYbie+16iUZHVqekHM1nIPQ8A+NqZHT/Cn
bM+AOf7At893GAAiJmLAoJJQdHh7oO33naeJX4XJ6I+8adw4O4AucHf+iXdDTh+vT4ToH3pNI1H/
fg7BSszZg69zgY/QsPHraQkyFn3n6Pi12TK4KdE5CdqP1IapEJzDzFftP3QIdgztNEm32O7R9UAV
Qu6VW5iu2mw976oaaPRS7xQkeSuh8v3dIBFLuXEUwqgjFtQ1YItY1vsqSSX+qAtcmYqxSAn3rSTu
J315oxld+eYjvTtO32Qn2VPHVzfXPLCqIWAfbA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ggUMon3tDyL18D99zI+gQo2KEmq86nD/UnuCl2KfpNz4G8UqOi9eijpYl6B8kVrp4KbnZWqTmMMF
z/O87hlmFpp4opDcOruJ+qiiTBWsOzFIQR4QZlanEjh8iO0cwSFSAz5sXdE77BCjzgHI7D4UD4Mp
5DA2KyFTsWztU8ricXXTuH6tZLNTLcTvHzJkt/DfkjmJrDlkm0eRAXhG0MUvkNsk32qCBY9RY9AF
1rJxG2dj5ZCJ2l/vueboa3iQZt2OeB1EloxrJDFuQtvPAvA65BsTM387sUTttprjm7eb5Tm0FQU5
vVHNxCllfsk9jW0rLIKm7dBRCgOntC9jDiJa0g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
q5sQqbKwLxjG5mFk9qs+sD0CQg8/2B7KTHpwf62hzJF+1CFbVJUQ6go3DO5L0L1mUNINJPIKzaAD
66tkeRifjCdb0XYOSTAxArc1zlCtOMwOn0aTyha/Uq8sc44kv2JFuUoIsn/Tl15lAT4q5PGV1fNq
fyS1evlpX2NGjZCT9kx21/uYFVn1ltB09OkXy1tz0sskN2eMyg54gf1l6cTR+xsVdY2hIoYfIVN9
H8DudSxoFGmVq3nTkLEuIBwpOzIdlqxG/+zUbvpOhAOprRojoI7OuuNVnv8kqbudzrZrZDK0HX1J
I5lc8/JLEOTV1hKGDSaSt1UBFUvr7e8cCqERRg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dpec57YobDtonbQ0UO1SM8G+H4LNYxSkwZ+IOdocIPgFV2eNfdKVGLe5M3kGiFH8cY+OBkva9enL
/OWjF9TA2LAxTndxgG5J0pfUvCDOVC48MZgZnIR8dOHrP7D6LGWfbebBGB9V1IoBt63/ke8Gi6uZ
oukujbRqqhLpZtf77LbVOpOjZYXM0v1IplnrAPnLmHL9Auh/wBXbYFGVV+VhmRndax/hdT5NuXTd
OGVqvHjKXMT4qzPWpaROPHYFYtTWznHqjj27TLk/z5Hdp0nlp4+Ebp4zIwYMnSpg5MVSetpPiSCZ
031Hd1PlF/YfYwbU1r9lJTGrVWMqi/+gd8KaCQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HlE05c2aGsR6rjiuATQqbaTq27Z8ZtyCoeTKodnH2OaArT49PLi5ZL6waWhdrvL68et08IAUs9t+
8aQnVdhvb/0fNHwtevhkpK8kJCPhJmdNdN0DS60RUdlb5/sgSQWjlxx4Yz5wWXrD3w3dhNQaJbzb
PdLh3ZWUZ+ldIzf3OmxXqghMZwvXkPIkeVkEZK5rBVF4df5DItd6+GOemFxXJmppL3ChWMcSlJD6
hgFBtCxft+usPb88sDNxtsPNBhH8Yeq+nZ3gc7A2wXdVKQugUXMV+/6MH4QJagSTzkjs2wVuXfk8
YQcZf8t0t2eS3XkCFdUszXwMtQ8YgrBWqnZp6aSas1JlXWWMk1d316/ym9sdD+dt36sxmIOjr/mr
lNnHAn9fdTEGDWsaXok7ujwI96+Jo6VVX3h+8Qo/6f9dvmB+j9wX01yLiteRc/klH0QWWPFrckTr
rxvZC+0DnkSyRPCISuHF9Op/7iDXfrGDXOIKpGzdPMaHMsKqIpG+QnAb

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fff66ZCQIGGWn4BfihDr7MvimxiiOWXc0eZBNa52g6soH+VWc7Xx3RJ4fuq721E6hCeRxrTK72LX
i9jipHmkI+YxSSUZyntNbeuF7P38Z8QWyEXrCSRJqnLKUeNwU2D2v692GIbbkPNs3o1/p6bS+PZV
fy4p7pkkxRTdZGKmGNuXlDtPr5DhZ0zFptZiF4rQKB5ebp50U6h6HWEJapeIaJRVwy77CM+u0fDT
4A/3o3rPHumuUTiliaQcm/1jofwW8Wyt/fEyoDeskyKFiJxA7nvXRFcO7dw8hnBN2by3mEq8uvFc
fsXjl6FQ6E8njLb3YPebcEhF2fiQl6tfqv3Xsw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TPuKSC49PXr1CyJdt/9jlK1AKgl9KP/2WJFt/Z7vtljlmD6IwyvQTKF40mFUq27M5Fuz/W4X5INe
/y1uccitx3VcJsarTiaoGT9S3DEmWfAhW9Z3EJmLNoB5WF+Gt3VSrbcIFx4bRg1NbAvCsu35cwJ8
qIEuedLHAD9VsRvFu3kQcKMgbKlMKJWQKJUShZN0gC0lrTnoVAzLqEKMNA0qhQg6q9MlU0GGAeTU
4OAGi9IXN69mtGYQcFgRHTN2cuQvbBPQfXj7zjLG/WzUgoqFUvAhtN5JMPKijnF83gwj845lsPtD
BdmC4FzXoM7Od2ck/qbMAIXHv6TTsjznVFUQBg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dz0VP1CnlNHH+A6VEdv/MzTzitzJy9mXlBCOCHhiN+w9HtFx0dUiXe3p32oSt/JL5Z+78HPWFZNr
norYJdshbBxv2VA+Qb4W2FkhsUt+nbeUxZGkOXoHhhGec2Yij8F+xw2PzGlLK+EcjoVFUGoblbgy
lZxtUK/qPijjN/wQqhHPSvrKrho4ht3zcjZjVg8ZVfzx3x04m5pTyiTrTQecuIFEiVC5ZAhCQMxN
lUXGjCmiY2z772Cy8Zi5NhUXuo2561aTzEHBTJmriI9CVs50fIl0kofkrrA0OdX5CS5GkPv09EPz
ZPD7/ZAVOXqA3AlDcqAsaheUQnXkFpEPunVR0w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 5728)
`pragma protect data_block
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
e/J0J7x3LWiWF4+A1i0B7LboLiqA8DJhCyi/tg==
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
GldLassLiODVgwPWl5GtUvNFVA+ZFVCFDhi7OrBop0rEIGOD7pGMQGd2XL5uXmDjnBa10M9DWskh
bTmllY5ovkWmM+NjjKYtf65BTGkYfwgKQ0A0l0q2oaCRiZEI98rgXRzWg4blHjn3F8mvlotras3b
gty58LDcqChRb34tHz4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YcKo5o/69htYDEreuDNtMbaQmtugz53TAiA3xMek1XTrggXZnceDK+Oacp9AwNeiNftWOxMl66sc
GrZixCPC4jC03qefsJitE5tQCfx9LEom/ln0gke2S5U676zqGFFkGD4igDSppP9+7smsit0JMNFB
3d9nJDwNXaerv07edmo26kGx6IsxHNmGjsmUd8FYgoMDNNDiTN40UA7rfTR1c5FwRoOUAPNW8x7l
lmsL+1mbpRU3rvmnc+tPlMZ9USQRFaWSLPznAatOpRgaHOa1J4DFd6nwIAGf3cDLilhq3YGA2oUb
qXHyz/+dnLIidWUJj1UPrzhk+3OEiFNdeXBKsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
g4qhHdak8eXxEqdympBtDM13xMJwZUSekBKApv5XlolRI2rR14IEYNQEcKRGlZyuFCmDRJDrEYWf
Eokybg18xq2N2hsq8nA4pvk6H9PXJmnhKoFcPeZ1j9mOnXNuEaOZnL6sA21bsPP7tTakNFG0eaXB
2vlDGYPDupMpXlylpEQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YIONylalBSo3oXqXlsOxHxbPAKbTQFLUkNcqhxYuBHSYbie+16iUZHVqekHM1nIPQ8A+NqZHT/Cn
bM+AOf7At893GAAiJmLAoJJQdHh7oO33naeJX4XJ6I+8adw4O4AucHf+iXdDTh+vT4ToH3pNI1H/
fg7BSszZg69zgY/QsPHraQkyFn3n6Pi12TK4KdE5CdqP1IapEJzDzFftP3QIdgztNEm32O7R9UAV
Qu6VW5iu2mw976oaaPRS7xQkeSuh8v3dIBFLuXEUwqgjFtQ1YItY1vsqSSX+qAtcmYqxSAn3rSTu
J315oxld+eYjvTtO32Qn2VPHVzfXPLCqIWAfbA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ggUMon3tDyL18D99zI+gQo2KEmq86nD/UnuCl2KfpNz4G8UqOi9eijpYl6B8kVrp4KbnZWqTmMMF
z/O87hlmFpp4opDcOruJ+qiiTBWsOzFIQR4QZlanEjh8iO0cwSFSAz5sXdE77BCjzgHI7D4UD4Mp
5DA2KyFTsWztU8ricXXTuH6tZLNTLcTvHzJkt/DfkjmJrDlkm0eRAXhG0MUvkNsk32qCBY9RY9AF
1rJxG2dj5ZCJ2l/vueboa3iQZt2OeB1EloxrJDFuQtvPAvA65BsTM387sUTttprjm7eb5Tm0FQU5
vVHNxCllfsk9jW0rLIKm7dBRCgOntC9jDiJa0g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
q5sQqbKwLxjG5mFk9qs+sD0CQg8/2B7KTHpwf62hzJF+1CFbVJUQ6go3DO5L0L1mUNINJPIKzaAD
66tkeRifjCdb0XYOSTAxArc1zlCtOMwOn0aTyha/Uq8sc44kv2JFuUoIsn/Tl15lAT4q5PGV1fNq
fyS1evlpX2NGjZCT9kx21/uYFVn1ltB09OkXy1tz0sskN2eMyg54gf1l6cTR+xsVdY2hIoYfIVN9
H8DudSxoFGmVq3nTkLEuIBwpOzIdlqxG/+zUbvpOhAOprRojoI7OuuNVnv8kqbudzrZrZDK0HX1J
I5lc8/JLEOTV1hKGDSaSt1UBFUvr7e8cCqERRg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dpec57YobDtonbQ0UO1SM8G+H4LNYxSkwZ+IOdocIPgFV2eNfdKVGLe5M3kGiFH8cY+OBkva9enL
/OWjF9TA2LAxTndxgG5J0pfUvCDOVC48MZgZnIR8dOHrP7D6LGWfbebBGB9V1IoBt63/ke8Gi6uZ
oukujbRqqhLpZtf77LbVOpOjZYXM0v1IplnrAPnLmHL9Auh/wBXbYFGVV+VhmRndax/hdT5NuXTd
OGVqvHjKXMT4qzPWpaROPHYFYtTWznHqjj27TLk/z5Hdp0nlp4+Ebp4zIwYMnSpg5MVSetpPiSCZ
031Hd1PlF/YfYwbU1r9lJTGrVWMqi/+gd8KaCQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HlE05c2aGsR6rjiuATQqbaTq27Z8ZtyCoeTKodnH2OaArT49PLi5ZL6waWhdrvL68et08IAUs9t+
8aQnVdhvb/0fNHwtevhkpK8kJCPhJmdNdN0DS60RUdlb5/sgSQWjlxx4Yz5wWXrD3w3dhNQaJbzb
PdLh3ZWUZ+ldIzf3OmxXqghMZwvXkPIkeVkEZK5rBVF4df5DItd6+GOemFxXJmppL3ChWMcSlJD6
hgFBtCxft+usPb88sDNxtsPNBhH8Yeq+nZ3gc7A2wXdVKQugUXMV+/6MH4QJagSTzkjs2wVuXfk8
YQcZf8t0t2eS3XkCFdUszXwMtQ8YgrBWqnZp6aSas1JlXWWMk1d316/ym9sdD+dt36sxmIOjr/mr
lNnHAn9fdTEGDWsaXok7ujwI96+Jo6VVX3h+8Qo/6f9dvmB+j9wX01yLiteRc/klH0QWWPFrckTr
rxvZC+0DnkSyRPCISuHF9Op/7iDXfrGDXOIKpGzdPMaHMsKqIpG+QnAb

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fff66ZCQIGGWn4BfihDr7MvimxiiOWXc0eZBNa52g6soH+VWc7Xx3RJ4fuq721E6hCeRxrTK72LX
i9jipHmkI+YxSSUZyntNbeuF7P38Z8QWyEXrCSRJqnLKUeNwU2D2v692GIbbkPNs3o1/p6bS+PZV
fy4p7pkkxRTdZGKmGNuXlDtPr5DhZ0zFptZiF4rQKB5ebp50U6h6HWEJapeIaJRVwy77CM+u0fDT
4A/3o3rPHumuUTiliaQcm/1jofwW8Wyt/fEyoDeskyKFiJxA7nvXRFcO7dw8hnBN2by3mEq8uvFc
fsXjl6FQ6E8njLb3YPebcEhF2fiQl6tfqv3Xsw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TPuKSC49PXr1CyJdt/9jlK1AKgl9KP/2WJFt/Z7vtljlmD6IwyvQTKF40mFUq27M5Fuz/W4X5INe
/y1uccitx3VcJsarTiaoGT9S3DEmWfAhW9Z3EJmLNoB5WF+Gt3VSrbcIFx4bRg1NbAvCsu35cwJ8
qIEuedLHAD9VsRvFu3kQcKMgbKlMKJWQKJUShZN0gC0lrTnoVAzLqEKMNA0qhQg6q9MlU0GGAeTU
4OAGi9IXN69mtGYQcFgRHTN2cuQvbBPQfXj7zjLG/WzUgoqFUvAhtN5JMPKijnF83gwj845lsPtD
BdmC4FzXoM7Od2ck/qbMAIXHv6TTsjznVFUQBg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dz0VP1CnlNHH+A6VEdv/MzTzitzJy9mXlBCOCHhiN+w9HtFx0dUiXe3p32oSt/JL5Z+78HPWFZNr
norYJdshbBxv2VA+Qb4W2FkhsUt+nbeUxZGkOXoHhhGec2Yij8F+xw2PzGlLK+EcjoVFUGoblbgy
lZxtUK/qPijjN/wQqhHPSvrKrho4ht3zcjZjVg8ZVfzx3x04m5pTyiTrTQecuIFEiVC5ZAhCQMxN
lUXGjCmiY2z772Cy8Zi5NhUXuo2561aTzEHBTJmriI9CVs50fIl0kofkrrA0OdX5CS5GkPv09EPz
ZPD7/ZAVOXqA3AlDcqAsaheUQnXkFpEPunVR0w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10496)
`pragma protect data_block
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
2dwjUOEmDZg=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
