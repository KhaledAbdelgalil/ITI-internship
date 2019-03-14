_Calibrate:
;touch.c,2 :: 		void Calibrate(void) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;touch.c,3 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;touch.c,4 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;touch.c,5 :: 		TFT_Write_Text("Touch selected corners for calibration", 50, 80);
MOVW	R0, #lo_addr(?lstr1_touch+0)
MOVT	R0, #hi_addr(?lstr1_touch+0)
MOVS	R2, #80
MOVS	R1, #50
BL	_TFT_Write_Text+0
;touch.c,6 :: 		TFT_Line(315, 239, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #239
SXTH	R1, R1
MOVW	R0, #315
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,7 :: 		TFT_Line(309, 229, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #229
SXTH	R1, R1
MOVW	R0, #309
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,8 :: 		TFT_Line(319, 234, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #234
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,9 :: 		TFT_Write_Text("first here",235,220);
MOVW	R0, #lo_addr(?lstr2_touch+0)
MOVT	R0, #hi_addr(?lstr2_touch+0)
MOVS	R2, #220
MOVS	R1, #235
BL	_TFT_Write_Text+0
;touch.c,11 :: 		TP_TFT_Calibrate_Min();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Min+0
;touch.c,12 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Calibrate0:
SUBS	R7, R7, #1
BNE	L_Calibrate0
NOP
NOP
;touch.c,13 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;touch.c,14 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;touch.c,15 :: 		TFT_Line(315, 239, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #239
SXTH	R1, R1
MOVW	R0, #315
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,16 :: 		TFT_Line(309, 229, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #229
SXTH	R1, R1
MOVW	R0, #309
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,17 :: 		TFT_Line(319, 234, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #234
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,18 :: 		TFT_Write_Text("first here",235,220);
MOVW	R0, #lo_addr(?lstr3_touch+0)
MOVT	R0, #hi_addr(?lstr3_touch+0)
MOVS	R2, #220
MOVS	R1, #235
BL	_TFT_Write_Text+0
;touch.c,20 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;touch.c,21 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;touch.c,22 :: 		TFT_Write_Text("now here ", 20, 5);
MOVW	R0, #lo_addr(?lstr4_touch+0)
MOVT	R0, #hi_addr(?lstr4_touch+0)
MOVS	R2, #5
MOVS	R1, #20
BL	_TFT_Write_Text+0
;touch.c,23 :: 		TFT_Line(0, 0, 5, 0);
MOVS	R3, #0
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,24 :: 		TFT_Line(0, 0, 0, 5);
MOVS	R3, #5
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,25 :: 		TFT_Line(0, 0, 10, 10);
MOVS	R3, #10
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;touch.c,27 :: 		TP_TFT_Calibrate_Max();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Max+0
;touch.c,28 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Calibrate2:
SUBS	R7, R7, #1
BNE	L_Calibrate2
NOP
NOP
;touch.c,29 :: 		}
L_end_Calibrate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate
_Init_ADC:
;touch.c,31 :: 		void Init_ADC(void) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;touch.c,32 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;touch.c,33 :: 		ADC1_Init();
BL	_ADC1_Init+0
;touch.c,34 :: 		Delay_ms(100);
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
;touch.c,35 :: 		}
L_end_Init_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_ADC
