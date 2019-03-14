_main:
;touch.c,21 :: 		void main()
;touch.c,27 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;touch.c,28 :: 		TFT_Init_ILI9341_8bit(320,240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;touch.c,29 :: 		TFT_Fill_Screen(CL_RED);
MOVW	R0, #63488
BL	_TFT_Fill_Screen+0
;touch.c,30 :: 		ADC1_Init();
BL	_ADC1_Init+0
;touch.c,31 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8|_ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;touch.c,32 :: 		TP_TFT_Init(320,240,8,9);
MOVS	R3, #9
MOVS	R2, #8
MOVS	R1, #240
MOVW	R0, #320
BL	_TP_TFT_Init+0
;touch.c,33 :: 		TP_TFT_Set_ADC_Threshold(750);
MOVW	R0, #750
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;touch.c,35 :: 		while(1)
L_main0:
;touch.c,39 :: 		if( TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
;touch.c,41 :: 		TFT_Fill_Screen(CL_Blue);
MOVW	R0, #31
BL	_TFT_Fill_Screen+0
;touch.c,42 :: 		}
L_main2:
;touch.c,43 :: 		}
IT	AL
BAL	L_main0
;touch.c,46 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
