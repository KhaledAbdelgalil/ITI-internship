_main:
;bluetooth.c,21 :: 		void main() {
SUB	SP, SP, #24
;bluetooth.c,23 :: 		char i=0;
MOVS	R0, #0
STRB	R0, [SP, #5]
;bluetooth.c,24 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;bluetooth.c,25 :: 		TFT_Init_ILI9341_8bit(320,240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;bluetooth.c,26 :: 		TFT_Fill_Screen(CL_Red);
MOVW	R0, #63488
BL	_TFT_Fill_Screen+0
;bluetooth.c,27 :: 		TFT_Write_Text("First calibration of our touch screen",90,120);
MOVW	R0, #lo_addr(?lstr1_bluetooth+0)
MOVT	R0, #hi_addr(?lstr1_bluetooth+0)
MOVS	R2, #120
MOVS	R1, #90
BL	_TFT_Write_Text+0
;bluetooth.c,28 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
;bluetooth.c,29 :: 		TFT_Fill_Screen(CL_GREEN);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;bluetooth.c,30 :: 		TFT_Set_Pen(CL_Blue,20);
MOVS	R1, #20
MOVW	R0, #31
BL	_TFT_Set_Pen+0
;bluetooth.c,31 :: 		ADC_Set_Input_Channel(3);
MOVS	R0, #3
BL	_ADC_Set_Input_Channel+0
;bluetooth.c,32 :: 		Init_ADC();
BL	_Init_ADC+0
;bluetooth.c,33 :: 		TP_TFT_Init(320, 240, 8, 9);
MOVS	R3, #9
MOVS	R2, #8
MOVS	R1, #240
MOVW	R0, #320
BL	_TP_TFT_Init+0
;bluetooth.c,34 :: 		TP_TFT_Set_ADC_Threshold(750);
MOVW	R0, #750
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;bluetooth.c,35 :: 		Calibrate();
BL	_Calibrate+0
;bluetooth.c,36 :: 		TFT_Fill_Screen(CL_GREEN);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;bluetooth.c,37 :: 		UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PD89);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART3_PD89+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART3_PD89+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOV	R0, #115200
BL	_UART3_Init_Advanced+0
ADD	SP, SP, #4
;bluetooth.c,38 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
NOP
;bluetooth.c,39 :: 		BT_Configure();
BL	_BT_Configure+0
;bluetooth.c,40 :: 		Delay_ms(4000);
MOVW	R7, #34131
MOVT	R7, #325
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
NOP
;bluetooth.c,41 :: 		while(1)
L_main6:
;bluetooth.c,43 :: 		if(UART3_Data_Ready())
BL	_UART3_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_main8
;bluetooth.c,45 :: 		a[i]=UART3_Read();
ADD	R1, SP, #0
STR	R1, [SP, #20]
LDRB	R0, [SP, #5]
ADDS	R0, R1, R0
STR	R0, [SP, #16]
BL	_UART3_Read+0
LDR	R1, [SP, #16]
STRB	R0, [R1, #0]
;bluetooth.c,46 :: 		TFT_Write_Char(a,22+i*10,23);
LDRB	R1, [SP, #5]
MOVS	R0, #10
SXTH	R0, R0
MULS	R0, R1, R0
SXTH	R0, R0
ADDW	R1, R0, #22
LDR	R0, [SP, #20]
MOVS	R2, #23
UXTH	R1, R1
UXTH	R0, R0
BL	_TFT_Write_Char+0
;bluetooth.c,47 :: 		i+=1;
LDRB	R0, [SP, #5]
ADDS	R0, R0, #1
STRB	R0, [SP, #5]
;bluetooth.c,48 :: 		if(i==5)
UXTB	R0, R0
CMP	R0, #5
IT	NE
BNE	L_main9
;bluetooth.c,49 :: 		UART3_Write_Text(a);
ADD	R0, SP, #0
BL	_UART3_Write_Text+0
L_main9:
;bluetooth.c,50 :: 		}
L_main8:
;bluetooth.c,51 :: 		}
IT	AL
BAL	L_main6
;bluetooth.c,53 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_BT_Configure:
;bluetooth.c,59 :: 		void  BT_Configure() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;bluetooth.c,61 :: 		UART3_Write_Text("$$$");                  // Enter command mode
MOVW	R0, #lo_addr(?lstr2_bluetooth+0)
MOVT	R0, #hi_addr(?lstr2_bluetooth+0)
BL	_UART3_Write_Text+0
;bluetooth.c,62 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure10:
SUBS	R7, R7, #1
BNE	L_BT_Configure10
NOP
NOP
;bluetooth.c,63 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure12:
SUBS	R7, R7, #1
BNE	L_BT_Configure12
NOP
NOP
;bluetooth.c,65 :: 		UART3_Write_Text("SN,BlueTooth-LOODA");   // Name of device
MOVW	R0, #lo_addr(?lstr3_bluetooth+0)
MOVT	R0, #hi_addr(?lstr3_bluetooth+0)
BL	_UART3_Write_Text+0
;bluetooth.c,66 :: 		UART3_Write(13);                          // CR
MOVS	R0, #13
BL	_UART3_Write+0
;bluetooth.c,67 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure14:
SUBS	R7, R7, #1
BNE	L_BT_Configure14
NOP
NOP
;bluetooth.c,68 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure16:
SUBS	R7, R7, #1
BNE	L_BT_Configure16
NOP
NOP
;bluetooth.c,70 :: 		UART3_Write_Text("SO,Slave");             // Extended status string
MOVW	R0, #lo_addr(?lstr4_bluetooth+0)
MOVT	R0, #hi_addr(?lstr4_bluetooth+0)
BL	_UART3_Write_Text+0
;bluetooth.c,71 :: 		UART3_Write(13);                          // CR
MOVS	R0, #13
BL	_UART3_Write+0
;bluetooth.c,72 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure18:
SUBS	R7, R7, #1
BNE	L_BT_Configure18
NOP
NOP
;bluetooth.c,73 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure20:
SUBS	R7, R7, #1
BNE	L_BT_Configure20
NOP
NOP
;bluetooth.c,75 :: 		UART3_Write_Text("SM,0");                 // Set mode (0 = slave, 1 = master, 2 = trigger, 3 = auto, 4 = DTR, 5 = ANY)
MOVW	R0, #lo_addr(?lstr5_bluetooth+0)
MOVT	R0, #hi_addr(?lstr5_bluetooth+0)
BL	_UART3_Write_Text+0
;bluetooth.c,76 :: 		UART3_Write(13);                          // CR
MOVS	R0, #13
BL	_UART3_Write+0
;bluetooth.c,77 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure22:
SUBS	R7, R7, #1
BNE	L_BT_Configure22
NOP
NOP
;bluetooth.c,78 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure24:
SUBS	R7, R7, #1
BNE	L_BT_Configure24
NOP
NOP
;bluetooth.c,80 :: 		UART3_Write_Text("SA,1");                 // Authentication (1 to enable, 0 to disable)
MOVW	R0, #lo_addr(?lstr6_bluetooth+0)
MOVT	R0, #hi_addr(?lstr6_bluetooth+0)
BL	_UART3_Write_Text+0
;bluetooth.c,81 :: 		UART3_Write(13);                          // CR
MOVS	R0, #13
BL	_UART3_Write+0
;bluetooth.c,82 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure26:
SUBS	R7, R7, #1
BNE	L_BT_Configure26
NOP
NOP
;bluetooth.c,83 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure28:
SUBS	R7, R7, #1
BNE	L_BT_Configure28
NOP
NOP
;bluetooth.c,86 :: 		UART3_Write_Text("SP,1234");              // Security pin code (mikroe)
MOVW	R0, #lo_addr(?lstr7_bluetooth+0)
MOVT	R0, #hi_addr(?lstr7_bluetooth+0)
BL	_UART3_Write_Text+0
;bluetooth.c,87 :: 		UART3_Write(13);                          // CR
MOVS	R0, #13
BL	_UART3_Write+0
;bluetooth.c,88 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure30:
SUBS	R7, R7, #1
BNE	L_BT_Configure30
NOP
NOP
;bluetooth.c,89 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure32:
SUBS	R7, R7, #1
BNE	L_BT_Configure32
NOP
NOP
;bluetooth.c,92 :: 		UART3_Write_Text("---");                  // Security pin code (mikroe)
MOVW	R0, #lo_addr(?lstr8_bluetooth+0)
MOVT	R0, #hi_addr(?lstr8_bluetooth+0)
BL	_UART3_Write_Text+0
;bluetooth.c,93 :: 		UART3_Write(13);                          // CR
MOVS	R0, #13
BL	_UART3_Write+0
;bluetooth.c,94 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure34:
SUBS	R7, R7, #1
BNE	L_BT_Configure34
NOP
NOP
;bluetooth.c,95 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure36:
SUBS	R7, R7, #1
BNE	L_BT_Configure36
NOP
NOP
;bluetooth.c,96 :: 		}
L_end_BT_Configure:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BT_Configure
_Calibrate:
;bluetooth.c,97 :: 		void Calibrate(void) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;bluetooth.c,98 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;bluetooth.c,99 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;bluetooth.c,100 :: 		TFT_Write_Text("Touch selected corners for calibration", 50, 80);
MOVW	R0, #lo_addr(?lstr9_bluetooth+0)
MOVT	R0, #hi_addr(?lstr9_bluetooth+0)
MOVS	R2, #80
MOVS	R1, #50
BL	_TFT_Write_Text+0
;bluetooth.c,101 :: 		TFT_Line(315, 239, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #239
SXTH	R1, R1
MOVW	R0, #315
SXTH	R0, R0
BL	_TFT_Line+0
;bluetooth.c,102 :: 		TFT_Line(309, 229, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #229
SXTH	R1, R1
MOVW	R0, #309
SXTH	R0, R0
BL	_TFT_Line+0
;bluetooth.c,103 :: 		TFT_Line(319, 234, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #234
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_TFT_Line+0
;bluetooth.c,104 :: 		TFT_Write_Text("first here",235,220);
MOVW	R0, #lo_addr(?lstr10_bluetooth+0)
MOVT	R0, #hi_addr(?lstr10_bluetooth+0)
MOVS	R2, #220
MOVS	R1, #235
BL	_TFT_Write_Text+0
;bluetooth.c,106 :: 		TP_TFT_Calibrate_Min();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Min+0
;bluetooth.c,107 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Calibrate38:
SUBS	R7, R7, #1
BNE	L_Calibrate38
NOP
NOP
;bluetooth.c,108 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;bluetooth.c,109 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;bluetooth.c,110 :: 		TFT_Line(315, 239, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #239
SXTH	R1, R1
MOVW	R0, #315
SXTH	R0, R0
BL	_TFT_Line+0
;bluetooth.c,111 :: 		TFT_Line(309, 229, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #229
SXTH	R1, R1
MOVW	R0, #309
SXTH	R0, R0
BL	_TFT_Line+0
;bluetooth.c,112 :: 		TFT_Line(319, 234, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #234
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_TFT_Line+0
;bluetooth.c,113 :: 		TFT_Write_Text("first here",235,220);
MOVW	R0, #lo_addr(?lstr11_bluetooth+0)
MOVT	R0, #hi_addr(?lstr11_bluetooth+0)
MOVS	R2, #220
MOVS	R1, #235
BL	_TFT_Write_Text+0
;bluetooth.c,115 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;bluetooth.c,116 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;bluetooth.c,117 :: 		TFT_Write_Text("now here ", 20, 5);
MOVW	R0, #lo_addr(?lstr12_bluetooth+0)
MOVT	R0, #hi_addr(?lstr12_bluetooth+0)
MOVS	R2, #5
MOVS	R1, #20
BL	_TFT_Write_Text+0
;bluetooth.c,118 :: 		TFT_Line(0, 0, 5, 0);
MOVS	R3, #0
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;bluetooth.c,119 :: 		TFT_Line(0, 0, 0, 5);
MOVS	R3, #5
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;bluetooth.c,120 :: 		TFT_Line(0, 0, 10, 10);
MOVS	R3, #10
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;bluetooth.c,122 :: 		TP_TFT_Calibrate_Max();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Max+0
;bluetooth.c,123 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Calibrate40:
SUBS	R7, R7, #1
BNE	L_Calibrate40
NOP
NOP
;bluetooth.c,124 :: 		}
L_end_Calibrate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate
_Init_ADC:
;bluetooth.c,126 :: 		void Init_ADC(void) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;bluetooth.c,127 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;bluetooth.c,128 :: 		ADC1_Init();
BL	_ADC1_Init+0
;bluetooth.c,129 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_Init_ADC42:
SUBS	R7, R7, #1
BNE	L_Init_ADC42
NOP
NOP
NOP
NOP
;bluetooth.c,130 :: 		}
L_end_Init_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_ADC
