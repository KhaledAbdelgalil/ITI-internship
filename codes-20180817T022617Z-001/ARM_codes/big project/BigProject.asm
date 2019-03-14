_main:
;BigProject.c,40 :: 		void main() {
;BigProject.c,42 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;BigProject.c,43 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;BigProject.c,44 :: 		GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_GPIO_Digital_Output+0
;BigProject.c,45 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;BigProject.c,47 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;BigProject.c,48 :: 		TFT_Init_ILI9341_8bit(320,240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;BigProject.c,49 :: 		TFT_Fill_Screen(CL_Red);
MOVW	R0, #63488
BL	_TFT_Fill_Screen+0
;BigProject.c,50 :: 		TFT_Write_Text("First calibration of our touch screen",90,120);
MOVW	R0, #lo_addr(?lstr1_BigProject+0)
MOVT	R0, #hi_addr(?lstr1_BigProject+0)
MOVS	R2, #120
MOVS	R1, #90
BL	_TFT_Write_Text+0
;BigProject.c,51 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
;BigProject.c,52 :: 		TFT_Fill_Screen(CL_GREEN);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;BigProject.c,53 :: 		TFT_Set_Pen(CL_Blue,20);
MOVS	R1, #20
MOVW	R0, #31
BL	_TFT_Set_Pen+0
;BigProject.c,54 :: 		ADC_Set_Input_Channel(3);
MOVS	R0, #3
BL	_ADC_Set_Input_Channel+0
;BigProject.c,55 :: 		Init_ADC();
BL	_Init_ADC+0
;BigProject.c,56 :: 		TP_TFT_Init(320, 240, 8, 9);
MOVS	R3, #9
MOVS	R2, #8
MOVS	R1, #240
MOVW	R0, #320
BL	_TP_TFT_Init+0
;BigProject.c,57 :: 		TP_TFT_Set_ADC_Threshold(750);
MOVW	R0, #750
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;BigProject.c,58 :: 		Calibrate();
BL	_Calibrate+0
;BigProject.c,59 :: 		TFT_Fill_Screen(CL_GREEN);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;BigProject.c,60 :: 		module1 ();
BL	_module1+0
;BigProject.c,61 :: 		while(1)
L_main2:
;BigProject.c,63 :: 		if(TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_main4
;BigProject.c,66 :: 		TP_TFT_Get_Coordinates(&x_tft,&y_tft);
MOVW	R1, #lo_addr(_y_tft+0)
MOVT	R1, #hi_addr(_y_tft+0)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
BL	_TP_TFT_Get_Coordinates+0
;BigProject.c,68 :: 		if(y_tft<=70&&y_tft>=0)
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRH	R0, [R0, #0]
CMP	R0, #70
IT	HI
BHI	L__main42
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__main41
L__main36:
;BigProject.c,70 :: 		y_tft=500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
STRH	R1, [R0, #0]
;BigProject.c,71 :: 		x_tft=500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
STRH	R1, [R0, #0]
;BigProject.c,72 :: 		Games_Module();
BL	_Games_Module+0
;BigProject.c,73 :: 		flag_games=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_flag_games+0)
MOVT	R0, #hi_addr(_flag_games+0)
STRB	R1, [R0, #0]
;BigProject.c,74 :: 		while(flag_games==1)
L_main8:
MOVW	R0, #lo_addr(_flag_games+0)
MOVT	R0, #hi_addr(_flag_games+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main9
;BigProject.c,77 :: 		if (TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_main10
;BigProject.c,78 :: 		TP_TFT_Get_Coordinates(&x_tft,&y_tft);
MOVW	R1, #lo_addr(_y_tft+0)
MOVT	R1, #hi_addr(_y_tft+0)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
BL	_TP_TFT_Get_Coordinates+0
L_main10:
;BigProject.c,80 :: 		if((x_tft<=320 &&x_tft>=235) || ( y_tft<=220 &&y_tft>=240))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRH	R0, [R0, #0]
CMP	R0, #320
IT	HI
BHI	L__main38
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRH	R0, [R0, #0]
CMP	R0, #235
IT	CC
BCC	L__main37
IT	AL
BAL	L__main33
L__main38:
L__main37:
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRH	R0, [R0, #0]
CMP	R0, #220
IT	HI
BHI	L__main40
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRH	R0, [R0, #0]
CMP	R0, #240
IT	CC
BCC	L__main39
IT	AL
BAL	L__main33
L__main40:
L__main39:
IT	AL
BAL	L_main17
L__main33:
;BigProject.c,82 :: 		TFT_Fill_Screen(CL_GREEN);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;BigProject.c,83 :: 		module1 ();
BL	_module1+0
;BigProject.c,84 :: 		flag_games=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_flag_games+0)
MOVT	R0, #hi_addr(_flag_games+0)
STRB	R1, [R0, #0]
;BigProject.c,85 :: 		y_tft=500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
STRH	R1, [R0, #0]
;BigProject.c,86 :: 		x_tft=500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
STRH	R1, [R0, #0]
;BigProject.c,87 :: 		}
IT	AL
BAL	L_main18
L_main17:
;BigProject.c,89 :: 		else if(y_tft<120)
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRH	R0, [R0, #0]
CMP	R0, #120
IT	CS
BCS	L_main19
;BigProject.c,91 :: 		dofd3_flag=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
STRB	R1, [R0, #0]
;BigProject.c,92 :: 		snake();
BL	_snake+0
;BigProject.c,93 :: 		x_tft=500,
MOVW	R1, #500
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
STRH	R1, [R0, #0]
;BigProject.c,94 :: 		y_tft=500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
STRH	R1, [R0, #0]
;BigProject.c,96 :: 		}
L_main19:
L_main18:
;BigProject.c,98 :: 		}
IT	AL
BAL	L_main8
L_main9:
;BigProject.c,99 :: 		}
IT	AL
BAL	L_main20
;BigProject.c,68 :: 		if(y_tft<=70&&y_tft>=0)
L__main42:
L__main41:
;BigProject.c,103 :: 		else if(y_tft>=160&&y_tft<=240)
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRH	R0, [R0, #0]
CMP	R0, #160
IT	CC
BCC	L__main44
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRH	R0, [R0, #0]
CMP	R0, #240
IT	HI
BHI	L__main43
L__main32:
;BigProject.c,105 :: 		if(tany_mara==0)
MOVW	R0, #lo_addr(_tany_mara+0)
MOVT	R0, #hi_addr(_tany_mara+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main24
;BigProject.c,107 :: 		y_tft=500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
STRH	R1, [R0, #0]
;BigProject.c,108 :: 		x_tft=500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
STRH	R1, [R0, #0]
;BigProject.c,109 :: 		paint_module();
BL	_paint_module+0
;BigProject.c,110 :: 		paint_flag=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_paint_flag+0)
MOVT	R0, #hi_addr(_paint_flag+0)
STRB	R1, [R0, #0]
;BigProject.c,111 :: 		paint();
BL	_paint+0
;BigProject.c,112 :: 		tany_mara=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_tany_mara+0)
MOVT	R0, #hi_addr(_tany_mara+0)
STRB	R1, [R0, #0]
;BigProject.c,113 :: 		}
IT	AL
BAL	L_main25
L_main24:
;BigProject.c,114 :: 		else if(tany_mara==1)
MOVW	R0, #lo_addr(_tany_mara+0)
MOVT	R0, #hi_addr(_tany_mara+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main26
;BigProject.c,116 :: 		y_tft=500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
STRH	R1, [R0, #0]
;BigProject.c,117 :: 		x_tft=500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
STRH	R1, [R0, #0]
;BigProject.c,118 :: 		paint_module2();
BL	_paint_module2+0
;BigProject.c,119 :: 		paint_flag=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_paint_flag+0)
MOVT	R0, #hi_addr(_paint_flag+0)
STRB	R1, [R0, #0]
;BigProject.c,120 :: 		paint2();
BL	_paint2+0
;BigProject.c,121 :: 		}
L_main26:
L_main25:
;BigProject.c,122 :: 		}
IT	AL
BAL	L_main27
;BigProject.c,103 :: 		else if(y_tft>=160&&y_tft<=240)
L__main44:
L__main43:
;BigProject.c,125 :: 		else if(y_tft<=160&&y_tft>=80)
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRH	R0, [R0, #0]
CMP	R0, #160
IT	HI
BHI	L__main46
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRH	R0, [R0, #0]
CMP	R0, #80
IT	CC
BCC	L__main45
L__main31:
;BigProject.c,127 :: 		y_tft=500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
STRH	R1, [R0, #0]
;BigProject.c,128 :: 		x_tft=500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
STRH	R1, [R0, #0]
;BigProject.c,129 :: 		comm_module();
BL	_comm_module+0
;BigProject.c,130 :: 		UART_flag=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_UART_flag+0)
MOVT	R0, #hi_addr(_UART_flag+0)
STRB	R1, [R0, #0]
;BigProject.c,131 :: 		comm();
BL	_comm+0
;BigProject.c,125 :: 		else if(y_tft<=160&&y_tft>=80)
L__main46:
L__main45:
;BigProject.c,132 :: 		}
L_main27:
L_main20:
;BigProject.c,135 :: 		}
L_main4:
;BigProject.c,138 :: 		}
IT	AL
BAL	L_main2
;BigProject.c,140 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
