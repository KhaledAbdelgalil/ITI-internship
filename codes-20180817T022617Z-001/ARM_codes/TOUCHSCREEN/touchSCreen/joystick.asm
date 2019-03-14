_main:
;joystick.c,21 :: 		void main() {
SUB	SP, SP, #16
;joystick.c,24 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;joystick.c,25 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;joystick.c,26 :: 		GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_GPIO_Digital_Output+0
;joystick.c,27 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;joystick.c,28 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;joystick.c,29 :: 		TFT_Init_ILI9341_8bit(320,240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;joystick.c,30 :: 		TFT_Fill_Screen(CL_GREEN);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;joystick.c,31 :: 		TFT_Set_Pen(CL_Blue,20);
MOVS	R1, #20
MOVW	R0, #31
BL	_TFT_Set_Pen+0
;joystick.c,32 :: 		ADC_Set_Input_Channel(3);
MOVS	R0, #3
BL	_ADC_Set_Input_Channel+0
;joystick.c,33 :: 		Init_ADC();
BL	_Init_ADC+0
;joystick.c,34 :: 		TP_TFT_Init(320, 240, 8, 9);
MOVS	R3, #9
MOVS	R2, #8
MOVS	R1, #240
MOVW	R0, #320
BL	_TP_TFT_Init+0
;joystick.c,35 :: 		TP_TFT_Set_ADC_Threshold(750);
MOVW	R0, #750
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;joystick.c,36 :: 		Calibrate();
BL	_Calibrate+0
;joystick.c,37 :: 		TFT_Fill_Screen(CL_GREEN);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;joystick.c,38 :: 		while(1)
L_main0:
;joystick.c,40 :: 		if(TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
;joystick.c,42 :: 		TP_TFT_Get_Coordinates(&x,&y);
MOVW	R1, #lo_addr(_y+0)
MOVT	R1, #hi_addr(_y+0)
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
BL	_TP_TFT_Get_Coordinates+0
;joystick.c,43 :: 		IntToStr(x,strX);
ADD	R1, SP, #0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;joystick.c,44 :: 		IntToStr(y,strY);
ADD	R1, SP, #7
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;joystick.c,45 :: 		TFT_Write_Text(strX,120,140);
ADD	R0, SP, #0
MOVS	R2, #140
MOVS	R1, #120
BL	_TFT_Write_Text+0
;joystick.c,46 :: 		TFT_Write_Text(strY,120,120);
ADD	R0, SP, #7
MOVS	R2, #120
MOVS	R1, #120
BL	_TFT_Write_Text+0
;joystick.c,47 :: 		delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_main3:
SUBS	R7, R7, #1
BNE	L_main3
NOP
NOP
;joystick.c,48 :: 		TFT_Fill_Screen(CL_GREEN);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;joystick.c,50 :: 		}
L_main2:
;joystick.c,53 :: 		}
IT	AL
BAL	L_main0
;joystick.c,55 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Calibrate:
;joystick.c,57 :: 		void Calibrate(void) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;joystick.c,58 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;joystick.c,59 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;joystick.c,60 :: 		TFT_Write_Text("Touch selected corners for calibration", 50, 80);
MOVW	R0, #lo_addr(?lstr1_joystick+0)
MOVT	R0, #hi_addr(?lstr1_joystick+0)
MOVS	R2, #80
MOVS	R1, #50
BL	_TFT_Write_Text+0
;joystick.c,61 :: 		TFT_Line(315, 239, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #239
SXTH	R1, R1
MOVW	R0, #315
SXTH	R0, R0
BL	_TFT_Line+0
;joystick.c,62 :: 		TFT_Line(309, 229, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #229
SXTH	R1, R1
MOVW	R0, #309
SXTH	R0, R0
BL	_TFT_Line+0
;joystick.c,63 :: 		TFT_Line(319, 234, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #234
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_TFT_Line+0
;joystick.c,64 :: 		TFT_Write_Text("first here",235,220);
MOVW	R0, #lo_addr(?lstr2_joystick+0)
MOVT	R0, #hi_addr(?lstr2_joystick+0)
MOVS	R2, #220
MOVS	R1, #235
BL	_TFT_Write_Text+0
;joystick.c,66 :: 		TP_TFT_Calibrate_Min();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Min+0
;joystick.c,67 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Calibrate5:
SUBS	R7, R7, #1
BNE	L_Calibrate5
NOP
NOP
;joystick.c,68 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;joystick.c,69 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;joystick.c,70 :: 		TFT_Line(315, 239, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #239
SXTH	R1, R1
MOVW	R0, #315
SXTH	R0, R0
BL	_TFT_Line+0
;joystick.c,71 :: 		TFT_Line(309, 229, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #229
SXTH	R1, R1
MOVW	R0, #309
SXTH	R0, R0
BL	_TFT_Line+0
;joystick.c,72 :: 		TFT_Line(319, 234, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #234
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_TFT_Line+0
;joystick.c,73 :: 		TFT_Write_Text("first here",235,220);
MOVW	R0, #lo_addr(?lstr3_joystick+0)
MOVT	R0, #hi_addr(?lstr3_joystick+0)
MOVS	R2, #220
MOVS	R1, #235
BL	_TFT_Write_Text+0
;joystick.c,75 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;joystick.c,76 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;joystick.c,77 :: 		TFT_Write_Text("now here ", 20, 5);
MOVW	R0, #lo_addr(?lstr4_joystick+0)
MOVT	R0, #hi_addr(?lstr4_joystick+0)
MOVS	R2, #5
MOVS	R1, #20
BL	_TFT_Write_Text+0
;joystick.c,78 :: 		TFT_Line(0, 0, 5, 0);
MOVS	R3, #0
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;joystick.c,79 :: 		TFT_Line(0, 0, 0, 5);
MOVS	R3, #5
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;joystick.c,80 :: 		TFT_Line(0, 0, 10, 10);
MOVS	R3, #10
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;joystick.c,82 :: 		TP_TFT_Calibrate_Max();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Max+0
;joystick.c,83 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Calibrate7:
SUBS	R7, R7, #1
BNE	L_Calibrate7
NOP
NOP
;joystick.c,84 :: 		}
L_end_Calibrate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate
_Init_ADC:
;joystick.c,86 :: 		void Init_ADC(void) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;joystick.c,87 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;joystick.c,88 :: 		ADC1_Init();
BL	_ADC1_Init+0
;joystick.c,89 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_Init_ADC9:
SUBS	R7, R7, #1
BNE	L_Init_ADC9
NOP
NOP
NOP
NOP
;joystick.c,90 :: 		}
L_end_Init_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_ADC
