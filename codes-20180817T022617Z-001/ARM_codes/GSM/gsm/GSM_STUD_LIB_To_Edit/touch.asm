_Calibrate:
;touch.c,1 :: 		void Calibrate(void) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;touch.c,2 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;touch.c,3 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;touch.c,4 :: 		TFT_Write_Text("Touch selected corners for calibration", 50, 80);
MOVW	R0, #lo_addr(?lstr1_touch+0)
MOVT	R0, #hi_addr(?lstr1_touch+0)
MOVS	R2, #80
MOVS	R1, #50
BL	_TFT_Write_Text+0
;touch.c,5 :: 		TFT_Line(315, 239, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #239
SXTH	R1, R1
MOVW	R0, #315
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,6 :: 		TFT_Line(309, 229, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #229
SXTH	R1, R1
MOVW	R0, #309
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,7 :: 		TFT_Line(319, 234, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #234
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,8 :: 		TFT_Write_Text("first here",235,220);
MOVW	R0, #lo_addr(?lstr2_touch+0)
MOVT	R0, #hi_addr(?lstr2_touch+0)
MOVS	R2, #220
MOVS	R1, #235
BL	_TFT_Write_Text+0
;touch.c,10 :: 		TP_TFT_Calibrate_Min();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Min+0
;touch.c,11 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Calibrate0:
SUBS	R7, R7, #1
BNE	L_Calibrate0
NOP
NOP
;touch.c,12 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;touch.c,13 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;touch.c,14 :: 		TFT_Line(315, 239, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #239
SXTH	R1, R1
MOVW	R0, #315
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,15 :: 		TFT_Line(309, 229, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #229
SXTH	R1, R1
MOVW	R0, #309
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,16 :: 		TFT_Line(319, 234, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #234
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,17 :: 		TFT_Write_Text("first here",235,220);
MOVW	R0, #lo_addr(?lstr3_touch+0)
MOVT	R0, #hi_addr(?lstr3_touch+0)
MOVS	R2, #220
MOVS	R1, #235
BL	_TFT_Write_Text+0
;touch.c,19 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;touch.c,20 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;touch.c,21 :: 		TFT_Write_Text("now here ", 20, 5);
MOVW	R0, #lo_addr(?lstr4_touch+0)
MOVT	R0, #hi_addr(?lstr4_touch+0)
MOVS	R2, #5
MOVS	R1, #20
BL	_TFT_Write_Text+0
;touch.c,22 :: 		TFT_Line(0, 0, 5, 0);
MOVS	R3, #0
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,23 :: 		TFT_Line(0, 0, 0, 5);
MOVS	R3, #5
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,24 :: 		TFT_Line(0, 0, 10, 10);
MOVS	R3, #10
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,26 :: 		TP_TFT_Calibrate_Max();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Max+0
;touch.c,27 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Calibrate2:
SUBS	R7, R7, #1
BNE	L_Calibrate2
NOP
NOP
;touch.c,28 :: 		}
L_end_Calibrate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate
_Init_ADC:
;touch.c,30 :: 		void Init_ADC(void) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;touch.c,31 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;touch.c,32 :: 		ADC1_Init();
BL	_ADC1_Init+0
;touch.c,33 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_Init_ADC4:
SUBS	R7, R7, #1
BNE	L_Init_ADC4
NOP
NOP
NOP
NOP
;touch.c,34 :: 		}
L_end_Init_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_ADC
_module_layout:
;touch.c,35 :: 		void module_layout()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;touch.c,39 :: 		TFT_H_Line(0,320,48);
MOVS	R2, #48
SXTH	R2, R2
MOVW	R1, #320
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_H_Line+0
;touch.c,40 :: 		TFT_H_Line(0,320,96);
MOVS	R2, #96
SXTH	R2, R2
MOVW	R1, #320
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_H_Line+0
;touch.c,41 :: 		TFT_H_Line(0,320,144);
MOVS	R2, #144
SXTH	R2, R2
MOVW	R1, #320
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_H_Line+0
;touch.c,42 :: 		TFT_H_Line(0,320,192);
MOVS	R2, #192
SXTH	R2, R2
MOVW	R1, #320
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_H_Line+0
;touch.c,45 :: 		TFT_V_Line(48,96,32);
MOVS	R2, #32
SXTH	R2, R2
MOVS	R1, #96
SXTH	R1, R1
MOVS	R0, #48
SXTH	R0, R0
BL	_TFT_V_Line+0
;touch.c,46 :: 		TFT_V_Line(48,96,64);
MOVS	R2, #64
SXTH	R2, R2
MOVS	R1, #96
SXTH	R1, R1
MOVS	R0, #48
SXTH	R0, R0
BL	_TFT_V_Line+0
;touch.c,47 :: 		TFT_V_Line(48,96,96);
MOVS	R2, #96
SXTH	R2, R2
MOVS	R1, #96
SXTH	R1, R1
MOVS	R0, #48
SXTH	R0, R0
BL	_TFT_V_Line+0
;touch.c,48 :: 		TFT_V_Line(48,96,128);
MOVS	R2, #128
SXTH	R2, R2
MOVS	R1, #96
SXTH	R1, R1
MOVS	R0, #48
SXTH	R0, R0
BL	_TFT_V_Line+0
;touch.c,49 :: 		TFT_V_Line(48,96,160);
MOVS	R2, #160
SXTH	R2, R2
MOVS	R1, #96
SXTH	R1, R1
MOVS	R0, #48
SXTH	R0, R0
BL	_TFT_V_Line+0
;touch.c,50 :: 		TFT_V_Line(48,96,192);
MOVS	R2, #192
SXTH	R2, R2
MOVS	R1, #96
SXTH	R1, R1
MOVS	R0, #48
SXTH	R0, R0
BL	_TFT_V_Line+0
;touch.c,51 :: 		TFT_V_Line(48,96,224);
MOVS	R2, #224
SXTH	R2, R2
MOVS	R1, #96
SXTH	R1, R1
MOVS	R0, #48
SXTH	R0, R0
BL	_TFT_V_Line+0
;touch.c,52 :: 		TFT_V_Line(48,96,256);
MOVW	R2, #256
SXTH	R2, R2
MOVS	R1, #96
SXTH	R1, R1
MOVS	R0, #48
SXTH	R0, R0
BL	_TFT_V_Line+0
;touch.c,53 :: 		TFT_V_Line(48,96,288);
MOVW	R2, #288
SXTH	R2, R2
MOVS	R1, #96
SXTH	R1, R1
MOVS	R0, #48
SXTH	R0, R0
BL	_TFT_V_Line+0
;touch.c,54 :: 		TFT_V_Line(0,48,256);
MOVW	R2, #256
SXTH	R2, R2
MOVS	R1, #48
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_V_Line+0
;touch.c,58 :: 		TFT_Write_Text("Please Call Me Later",70,120);
MOVW	R0, #lo_addr(?lstr5_touch+0)
MOVT	R0, #hi_addr(?lstr5_touch+0)
MOVS	R2, #120
MOVS	R1, #70
BL	_TFT_Write_Text+0
;touch.c,59 :: 		TFT_Write_Text("I'm at a Meeting",70,168);
MOVW	R0, #lo_addr(?lstr6_touch+0)
MOVT	R0, #hi_addr(?lstr6_touch+0)
MOVS	R2, #168
MOVS	R1, #70
BL	_TFT_Write_Text+0
;touch.c,60 :: 		TFT_Write_Text("Can't take your call now!",70,216);
MOVW	R0, #lo_addr(?lstr7_touch+0)
MOVT	R0, #hi_addr(?lstr7_touch+0)
MOVS	R2, #216
MOVS	R1, #70
BL	_TFT_Write_Text+0
;touch.c,63 :: 		TFT_Write_Text("0",16,72);
MOVW	R0, #lo_addr(?lstr8_touch+0)
MOVT	R0, #hi_addr(?lstr8_touch+0)
MOVS	R2, #72
MOVS	R1, #16
BL	_TFT_Write_Text+0
;touch.c,64 :: 		TFT_Write_Text("1",48,72);
MOVW	R0, #lo_addr(?lstr9_touch+0)
MOVT	R0, #hi_addr(?lstr9_touch+0)
MOVS	R2, #72
MOVS	R1, #48
BL	_TFT_Write_Text+0
;touch.c,65 :: 		TFT_Write_Text("2",80,72);
MOVW	R0, #lo_addr(?lstr10_touch+0)
MOVT	R0, #hi_addr(?lstr10_touch+0)
MOVS	R2, #72
MOVS	R1, #80
BL	_TFT_Write_Text+0
;touch.c,66 :: 		TFT_Write_Text("3",112,72);
MOVW	R0, #lo_addr(?lstr11_touch+0)
MOVT	R0, #hi_addr(?lstr11_touch+0)
MOVS	R2, #72
MOVS	R1, #112
BL	_TFT_Write_Text+0
;touch.c,67 :: 		TFT_Write_Text("4",144,72);
MOVW	R0, #lo_addr(?lstr12_touch+0)
MOVT	R0, #hi_addr(?lstr12_touch+0)
MOVS	R2, #72
MOVS	R1, #144
BL	_TFT_Write_Text+0
;touch.c,68 :: 		TFT_Write_Text("5",176,72);
MOVW	R0, #lo_addr(?lstr13_touch+0)
MOVT	R0, #hi_addr(?lstr13_touch+0)
MOVS	R2, #72
MOVS	R1, #176
BL	_TFT_Write_Text+0
;touch.c,69 :: 		TFT_Write_Text("6",208,72);
MOVW	R0, #lo_addr(?lstr14_touch+0)
MOVT	R0, #hi_addr(?lstr14_touch+0)
MOVS	R2, #72
MOVS	R1, #208
BL	_TFT_Write_Text+0
;touch.c,70 :: 		TFT_Write_Text("7",244,72);
MOVW	R0, #lo_addr(?lstr15_touch+0)
MOVT	R0, #hi_addr(?lstr15_touch+0)
MOVS	R2, #72
MOVS	R1, #244
BL	_TFT_Write_Text+0
;touch.c,71 :: 		TFT_Write_Text("8",276,72);
MOVW	R0, #lo_addr(?lstr16_touch+0)
MOVT	R0, #hi_addr(?lstr16_touch+0)
MOVS	R2, #72
MOVW	R1, #276
BL	_TFT_Write_Text+0
;touch.c,72 :: 		TFT_Write_Text("9",308,72);
MOVW	R0, #lo_addr(?lstr17_touch+0)
MOVT	R0, #hi_addr(?lstr17_touch+0)
MOVS	R2, #72
MOVW	R1, #308
BL	_TFT_Write_Text+0
;touch.c,75 :: 		TFT_Write_Text("UNDO",270,18);
MOVW	R0, #lo_addr(?lstr18_touch+0)
MOVT	R0, #hi_addr(?lstr18_touch+0)
MOVS	R2, #18
MOVW	R1, #270
BL	_TFT_Write_Text+0
;touch.c,79 :: 		}
L_end_module_layout:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _module_layout
