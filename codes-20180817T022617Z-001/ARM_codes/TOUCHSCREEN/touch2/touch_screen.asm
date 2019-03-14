_main:
;touch_screen.c,21 :: 		void main()
;touch_screen.c,27 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;touch_screen.c,28 :: 		TFT_Init_ILI9341_8bit(320,240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;touch_screen.c,29 :: 		TFT_Fill_Screen(CL_RED);
MOVW	R0, #63488
BL	_TFT_Fill_Screen+0
;touch_screen.c,35 :: 		while(1)
L_main0:
;touch_screen.c,39 :: 		if( TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
;touch_screen.c,41 :: 		TFT_Fill_Screen(CL_Blue);
MOVW	R0, #31
BL	_TFT_Fill_Screen+0
;touch_screen.c,42 :: 		}
L_main2:
;touch_screen.c,43 :: 		}
IT	AL
BAL	L_main0
;touch_screen.c,46 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
