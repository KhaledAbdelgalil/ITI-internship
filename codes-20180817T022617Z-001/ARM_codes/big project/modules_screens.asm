_module1:
;modules_screens.c,4 :: 		void module1 ()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;modules_screens.c,6 :: 		y_tft=500;
MOVW	R1, #500
SXTH	R1, R1
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
STRH	R1, [R0, #0]
;modules_screens.c,7 :: 		x_tft=500;
MOVW	R1, #500
SXTH	R1, R1
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
STRH	R1, [R0, #0]
;modules_screens.c,8 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;modules_screens.c,9 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;modules_screens.c,10 :: 		TFT_Write_Text("GAMES",120,60);
MOVW	R0, #lo_addr(?lstr1_modules_screens+0)
MOVT	R0, #hi_addr(?lstr1_modules_screens+0)
MOVS	R2, #60
MOVS	R1, #120
BL	_TFT_Write_Text+0
;modules_screens.c,11 :: 		TFT_Line(0,80,320,80);
MOVS	R3, #80
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #80
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;modules_screens.c,12 :: 		TFT_Write_Text("comm",120,120);
MOVW	R0, #lo_addr(?lstr2_modules_screens+0)
MOVT	R0, #hi_addr(?lstr2_modules_screens+0)
MOVS	R2, #120
MOVS	R1, #120
BL	_TFT_Write_Text+0
;modules_screens.c,13 :: 		TFT_Line(0,150,320,150);
MOVS	R3, #150
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #150
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;modules_screens.c,14 :: 		TFT_Write_Text("paint",120,180);
MOVW	R0, #lo_addr(?lstr3_modules_screens+0)
MOVT	R0, #hi_addr(?lstr3_modules_screens+0)
MOVS	R2, #180
MOVS	R1, #120
BL	_TFT_Write_Text+0
;modules_screens.c,17 :: 		}
L_end_module1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _module1
_Games_Module:
;modules_screens.c,18 :: 		void Games_Module()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;modules_screens.c,20 :: 		TFT_Fill_Screen(CL_Blue);
MOVW	R0, #31
BL	_TFT_Fill_Screen+0
;modules_screens.c,21 :: 		TFT_Write_Text("Dofd3",120,60);
MOVW	R0, #lo_addr(?lstr4_modules_screens+0)
MOVT	R0, #hi_addr(?lstr4_modules_screens+0)
MOVS	R2, #60
MOVS	R1, #120
BL	_TFT_Write_Text+0
;modules_screens.c,22 :: 		TFT_Write_Text("bouncing",120,180);
MOVW	R0, #lo_addr(?lstr5_modules_screens+0)
MOVT	R0, #hi_addr(?lstr5_modules_screens+0)
MOVS	R2, #180
MOVS	R1, #120
BL	_TFT_Write_Text+0
;modules_screens.c,23 :: 		TFT_Line(0,120,320,120);
MOVS	R3, #120
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #120
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;modules_screens.c,25 :: 		TFT_Write_Text("here to back",235,220);
MOVW	R0, #lo_addr(?lstr6_modules_screens+0)
MOVT	R0, #hi_addr(?lstr6_modules_screens+0)
MOVS	R2, #220
MOVS	R1, #235
BL	_TFT_Write_Text+0
;modules_screens.c,27 :: 		}
L_end_Games_Module:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Games_Module
_paint_module:
;modules_screens.c,28 :: 		void paint_module()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;modules_screens.c,30 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;modules_screens.c,31 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;modules_screens.c,32 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;modules_screens.c,35 :: 		TFT_Rectangle(0,0, 42, 21);
MOVS	R3, #21
SXTH	R3, R3
MOVS	R2, #42
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,36 :: 		TFT_Write_Text("Back", 2, 0);
MOVW	R0, #lo_addr(?lstr7_modules_screens+0)
MOVT	R0, #hi_addr(?lstr7_modules_screens+0)
MOVS	R2, #0
MOVS	R1, #2
BL	_TFT_Write_Text+0
;modules_screens.c,37 :: 		TFT_Rectangle(0,21, 42, 42);
MOVS	R3, #42
SXTH	R3, R3
MOVS	R2, #42
SXTH	R2, R2
MOVS	R1, #21
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,38 :: 		TFT_Write_Text("Erase", 2, 21);
MOVW	R0, #lo_addr(?lstr8_modules_screens+0)
MOVT	R0, #hi_addr(?lstr8_modules_screens+0)
MOVS	R2, #21
MOVS	R1, #2
BL	_TFT_Write_Text+0
;modules_screens.c,40 :: 		TFT_Set_Pen(CL_AQUA, 30);
MOVS	R1, #30
MOVW	R0, #4095
BL	_TFT_Set_Pen+0
;modules_screens.c,41 :: 		TFT_Rectangle(60,0, 95, 30);
MOVS	R3, #30
SXTH	R3, R3
MOVS	R2, #95
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #60
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,42 :: 		TFT_Set_Pen(CL_FUCHSIA, 30);
MOVS	R1, #30
MOVW	R0, #63519
BL	_TFT_Set_Pen+0
;modules_screens.c,43 :: 		TFT_Rectangle(115,0, 150, 30);
MOVS	R3, #30
SXTH	R3, R3
MOVS	R2, #150
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #115
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,44 :: 		TFT_Set_Pen(CL_GRAY,30);
MOVS	R1, #30
MOVW	R0, #33808
BL	_TFT_Set_Pen+0
;modules_screens.c,45 :: 		TFT_Rectangle(170,0, 205, 30);
MOVS	R3, #30
SXTH	R3, R3
MOVS	R2, #205
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #170
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,46 :: 		TFT_Set_Pen(CL_RED, 30);
MOVS	R1, #30
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;modules_screens.c,47 :: 		TFT_Rectangle(225,0, 260, 30);
MOVS	R3, #30
SXTH	R3, R3
MOVW	R2, #260
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #225
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,48 :: 		TFT_Set_Pen(CL_YELLOW, 30);
MOVS	R1, #30
MOVW	R0, #65504
BL	_TFT_Set_Pen+0
;modules_screens.c,49 :: 		TFT_Rectangle(280,0, 315, 30);
MOVS	R3, #30
SXTH	R3, R3
MOVW	R2, #315
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #280
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,52 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;modules_screens.c,53 :: 		TFT_Rectangle(0,42, 42,75);
MOVS	R3, #75
SXTH	R3, R3
MOVS	R2, #42
SXTH	R2, R2
MOVS	R1, #42
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,54 :: 		TFT_Set_Pen(CL_BLACK, 4);
MOVS	R1, #4
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;modules_screens.c,55 :: 		TFT_Circle(21,58, 2);
MOVS	R2, #2
SXTH	R2, R2
MOVS	R1, #58
SXTH	R1, R1
MOVS	R0, #21
SXTH	R0, R0
BL	_TFT_Circle+0
;modules_screens.c,56 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;modules_screens.c,57 :: 		TFT_Rectangle(0,75, 42,108);
MOVS	R3, #108
SXTH	R3, R3
MOVS	R2, #42
SXTH	R2, R2
MOVS	R1, #75
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,58 :: 		TFT_Set_Pen(CL_BLACK, 9);
MOVS	R1, #9
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;modules_screens.c,59 :: 		TFT_Circle(21,91, 4);
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #91
SXTH	R1, R1
MOVS	R0, #21
SXTH	R0, R0
BL	_TFT_Circle+0
;modules_screens.c,60 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;modules_screens.c,61 :: 		TFT_Rectangle(0,108, 42,141);
MOVS	R3, #141
SXTH	R3, R3
MOVS	R2, #42
SXTH	R2, R2
MOVS	R1, #108
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,62 :: 		TFT_Set_Pen(CL_BLACK, 10);
MOVS	R1, #10
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;modules_screens.c,63 :: 		TFT_Circle(21,124, 5);
MOVS	R2, #5
SXTH	R2, R2
MOVS	R1, #124
SXTH	R1, R1
MOVS	R0, #21
SXTH	R0, R0
BL	_TFT_Circle+0
;modules_screens.c,64 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;modules_screens.c,65 :: 		TFT_Rectangle(0,141, 42,174);
MOVS	R3, #174
SXTH	R3, R3
MOVS	R2, #42
SXTH	R2, R2
MOVS	R1, #141
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,67 :: 		TFT_Rectangle(10,150,30 ,160);
MOVS	R3, #160
SXTH	R3, R3
MOVS	R2, #30
SXTH	R2, R2
MOVS	R1, #150
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,69 :: 		TFT_Rectangle(0,174, 42,207);
MOVS	R3, #207
SXTH	R3, R3
MOVS	R2, #42
SXTH	R2, R2
MOVS	R1, #174
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,71 :: 		TFT_Line(10, 202, 30, 202);
MOVS	R3, #202
SXTH	R3, R3
MOVS	R2, #30
SXTH	R2, R2
MOVS	R1, #202
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_TFT_Line+0
;modules_screens.c,72 :: 		TFT_Line(10,202, 20, 180);
MOVS	R3, #180
SXTH	R3, R3
MOVS	R2, #20
SXTH	R2, R2
MOVS	R1, #202
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_TFT_Line+0
;modules_screens.c,73 :: 		TFT_Line(20, 180, 30, 202);
MOVS	R3, #202
SXTH	R3, R3
MOVS	R2, #30
SXTH	R2, R2
MOVS	R1, #180
SXTH	R1, R1
MOVS	R0, #20
SXTH	R0, R0
BL	_TFT_Line+0
;modules_screens.c,75 :: 		TFT_Rectangle(0,207, 42,240);
MOVS	R3, #240
SXTH	R3, R3
MOVS	R2, #42
SXTH	R2, R2
MOVS	R1, #207
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,76 :: 		TFT_Line(10, 210, 30, 232);
MOVS	R3, #232
SXTH	R3, R3
MOVS	R2, #30
SXTH	R2, R2
MOVS	R1, #210
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_TFT_Line+0
;modules_screens.c,78 :: 		}
L_end_paint_module:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _paint_module
_comm_module:
;modules_screens.c,79 :: 		void comm_module()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;modules_screens.c,83 :: 		TFT_Fill_Screen(CL_GRay);
MOVW	R0, #33808
BL	_TFT_Fill_Screen+0
;modules_screens.c,84 :: 		TFT_Rectangle(0,0, 42, 42);
MOVS	R3, #42
SXTH	R3, R3
MOVS	R2, #42
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,85 :: 		TFT_Write_Text("BACK", 2, 21);
MOVW	R0, #lo_addr(?lstr9_modules_screens+0)
MOVT	R0, #hi_addr(?lstr9_modules_screens+0)
MOVS	R2, #21
MOVS	R1, #2
BL	_TFT_Write_Text+0
;modules_screens.c,87 :: 		TFT_Rectangle(0,120, 50, 140);
MOVS	R3, #140
SXTH	R3, R3
MOVS	R2, #50
SXTH	R2, R2
MOVS	R1, #120
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,88 :: 		TFT_Write_Text("1", 1, 121);
MOVW	R0, #lo_addr(?lstr10_modules_screens+0)
MOVT	R0, #hi_addr(?lstr10_modules_screens+0)
MOVS	R2, #121
MOVS	R1, #1
BL	_TFT_Write_Text+0
;modules_screens.c,89 :: 		TFT_Rectangle(105,120, 150, 140);
MOVS	R3, #140
SXTH	R3, R3
MOVS	R2, #150
SXTH	R2, R2
MOVS	R1, #120
SXTH	R1, R1
MOVS	R0, #105
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,90 :: 		TFT_Write_Text("2",106 , 121);
MOVW	R0, #lo_addr(?lstr11_modules_screens+0)
MOVT	R0, #hi_addr(?lstr11_modules_screens+0)
MOVS	R2, #121
MOVS	R1, #106
BL	_TFT_Write_Text+0
;modules_screens.c,91 :: 		TFT_Rectangle(205,120, 250, 140);
MOVS	R3, #140
SXTH	R3, R3
MOVS	R2, #250
SXTH	R2, R2
MOVS	R1, #120
SXTH	R1, R1
MOVS	R0, #205
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,92 :: 		TFT_Write_Text("3",206 , 121);
MOVW	R0, #lo_addr(?lstr12_modules_screens+0)
MOVT	R0, #hi_addr(?lstr12_modules_screens+0)
MOVS	R2, #121
MOVS	R1, #206
BL	_TFT_Write_Text+0
;modules_screens.c,94 :: 		TFT_Rectangle(150,40, 200, 70);
MOVS	R3, #70
SXTH	R3, R3
MOVS	R2, #200
SXTH	R2, R2
MOVS	R1, #40
SXTH	R1, R1
MOVS	R0, #150
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,95 :: 		TFT_Write_Text("start", 151, 41);
MOVW	R0, #lo_addr(?lstr13_modules_screens+0)
MOVT	R0, #hi_addr(?lstr13_modules_screens+0)
MOVS	R2, #41
MOVS	R1, #151
BL	_TFT_Write_Text+0
;modules_screens.c,96 :: 		TFT_Rectangle(150,75, 200, 105);
MOVS	R3, #105
SXTH	R3, R3
MOVS	R2, #200
SXTH	R2, R2
MOVS	R1, #75
SXTH	R1, R1
MOVS	R0, #150
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,97 :: 		TFT_Write_Text("end",151 , 76);
MOVW	R0, #lo_addr(?lstr14_modules_screens+0)
MOVT	R0, #hi_addr(?lstr14_modules_screens+0)
MOVS	R2, #76
MOVS	R1, #151
BL	_TFT_Write_Text+0
;modules_screens.c,98 :: 		TFT_Rectangle(150,200, 200, 230);
MOVS	R3, #230
SXTH	R3, R3
MOVS	R2, #200
SXTH	R2, R2
MOVS	R1, #200
SXTH	R1, R1
MOVS	R0, #150
SXTH	R0, R0
BL	_TFT_Rectangle+0
;modules_screens.c,99 :: 		TFT_Write_Text("send",151 , 201);
MOVW	R0, #lo_addr(?lstr15_modules_screens+0)
MOVT	R0, #hi_addr(?lstr15_modules_screens+0)
MOVS	R2, #201
MOVS	R1, #151
BL	_TFT_Write_Text+0
;modules_screens.c,101 :: 		UART1_Init(115200);
MOV	R0, #115200
BL	_UART1_Init+0
;modules_screens.c,102 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_comm_module0:
SUBS	R7, R7, #1
BNE	L_comm_module0
NOP
NOP
NOP
NOP
;modules_screens.c,103 :: 		UART1_Write(13);
MOVS	R0, #13
BL	_UART1_Write+0
;modules_screens.c,104 :: 		UART1_Write(10);
MOVS	R0, #10
BL	_UART1_Write+0
;modules_screens.c,105 :: 		Init_ADC();
BL	_Init_ADC+0
;modules_screens.c,108 :: 		}
L_end_comm_module:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _comm_module
_paint_module2:
;modules_screens.c,109 :: 		void paint_module2()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;modules_screens.c,111 :: 		TFT_Fill_Screen(CL_Blue);
MOVW	R0, #31
BL	_TFT_Fill_Screen+0
;modules_screens.c,112 :: 		TFT_Write_Text("saved",120,60);
MOVW	R0, #lo_addr(?lstr16_modules_screens+0)
MOVT	R0, #hi_addr(?lstr16_modules_screens+0)
MOVS	R2, #60
MOVS	R1, #120
BL	_TFT_Write_Text+0
;modules_screens.c,113 :: 		TFT_Write_Text("continue",120,180);
MOVW	R0, #lo_addr(?lstr17_modules_screens+0)
MOVT	R0, #hi_addr(?lstr17_modules_screens+0)
MOVS	R2, #180
MOVS	R1, #120
BL	_TFT_Write_Text+0
;modules_screens.c,114 :: 		TFT_Line(0,120,320,120);
MOVS	R3, #120
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #120
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;modules_screens.c,116 :: 		TFT_Write_Text("here to back",235,220);
MOVW	R0, #lo_addr(?lstr18_modules_screens+0)
MOVT	R0, #hi_addr(?lstr18_modules_screens+0)
MOVS	R2, #220
MOVS	R1, #235
BL	_TFT_Write_Text+0
;modules_screens.c,118 :: 		}
L_end_paint_module2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _paint_module2
