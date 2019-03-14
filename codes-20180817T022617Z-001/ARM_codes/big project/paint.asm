_paint:
;paint.c,12 :: 		void paint (void)
SUB	SP, SP, #16
STR	LR, [SP, #0]
;paint.c,14 :: 		u8 erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
MOVS	R0, #2
STRB	R0, [SP, #5]
;paint.c,15 :: 		u8 askal=2;
;paint.c,16 :: 		count=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_count+0)
MOVT	R0, #hi_addr(_count+0)
STR	R1, [R0, #0]
;paint.c,17 :: 		while(paint_flag==1)
L_paint0:
MOVW	R0, #lo_addr(_paint_flag+0)
MOVT	R0, #hi_addr(_paint_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_paint1
;paint.c,20 :: 		if(TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_paint2
;paint.c,23 :: 		TP_TFT_Get_Coordinates(&x_tft,&y_tft);
MOVW	R1, #lo_addr(_y_tft+0)
MOVT	R1, #hi_addr(_y_tft+0)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
BL	_TP_TFT_Get_Coordinates+0
;paint.c,25 :: 		if((x_tft>=0)&&(x_tft<=42)&&(y_tft>=0)&&(y_tft<=21))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint103
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #42
IT	GT
BGT	L__paint102
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint101
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #21
IT	GT
BGT	L__paint100
L__paint99:
;paint.c,27 :: 		paint_flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_paint_flag+0)
MOVT	R0, #hi_addr(_paint_flag+0)
STRB	R1, [R0, #0]
;paint.c,28 :: 		TFT_Fill_Screen(CL_Green);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;paint.c,29 :: 		module1();
BL	_module1+0
;paint.c,30 :: 		x_tft=500;
MOVW	R1, #500
SXTH	R1, R1
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
STRH	R1, [R0, #0]
;paint.c,31 :: 		y_tft=500;
MOVW	R1, #500
SXTH	R1, R1
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
STRH	R1, [R0, #0]
;paint.c,33 :: 		}
IT	AL
BAL	L_paint6
;paint.c,25 :: 		if((x_tft>=0)&&(x_tft<=42)&&(y_tft>=0)&&(y_tft<=21))
L__paint103:
L__paint102:
L__paint101:
L__paint100:
;paint.c,35 :: 		else if((x_tft>=0)&&(x_tft<=42)&&(y_tft>=21)&&(y_tft<=42))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint107
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #42
IT	GT
BGT	L__paint106
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #21
IT	LT
BLT	L__paint105
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #42
IT	GT
BGT	L__paint104
L__paint98:
;paint.c,37 :: 		erase=1;
MOVS	R0, #1
STRB	R0, [SP, #4]
;paint.c,38 :: 		}
IT	AL
BAL	L_paint10
;paint.c,35 :: 		else if((x_tft>=0)&&(x_tft<=42)&&(y_tft>=21)&&(y_tft<=42))
L__paint107:
L__paint106:
L__paint105:
L__paint104:
;paint.c,40 :: 		else if((x_tft>=50)&&(x_tft<=105)&&(y_tft<=30)&&(y_tft>=0))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #50
IT	LT
BLT	L__paint111
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #105
IT	GT
BGT	L__paint110
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #30
IT	GT
BGT	L__paint109
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint108
L__paint97:
;paint.c,42 :: 		TFT_Set_Pen(CL_AQUA, size);
MOVW	R0, #lo_addr(_size+0)
MOVT	R0, #hi_addr(_size+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #4095
BL	_TFT_Set_Pen+0
;paint.c,43 :: 		erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;paint.c,44 :: 		indicator=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_indicator+0)
MOVT	R0, #hi_addr(_indicator+0)
STRB	R1, [R0, #0]
;paint.c,45 :: 		}
IT	AL
BAL	L_paint14
;paint.c,40 :: 		else if((x_tft>=50)&&(x_tft<=105)&&(y_tft<=30)&&(y_tft>=0))
L__paint111:
L__paint110:
L__paint109:
L__paint108:
;paint.c,46 :: 		else if((x_tft>=105)&&(x_tft<=160)&&(y_tft<=30)&&(y_tft>=0))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #105
IT	LT
BLT	L__paint115
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #160
IT	GT
BGT	L__paint114
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #30
IT	GT
BGT	L__paint113
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint112
L__paint96:
;paint.c,48 :: 		TFT_Set_Pen(CL_FUCHSIA, size);
MOVW	R0, #lo_addr(_size+0)
MOVT	R0, #hi_addr(_size+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #63519
BL	_TFT_Set_Pen+0
;paint.c,49 :: 		erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;paint.c,50 :: 		indicator=2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_indicator+0)
MOVT	R0, #hi_addr(_indicator+0)
STRB	R1, [R0, #0]
;paint.c,51 :: 		}
IT	AL
BAL	L_paint18
;paint.c,46 :: 		else if((x_tft>=105)&&(x_tft<=160)&&(y_tft<=30)&&(y_tft>=0))
L__paint115:
L__paint114:
L__paint113:
L__paint112:
;paint.c,52 :: 		else if((x_tft>=160)&&(x_tft<=215)&&(y_tft<=30)&&(y_tft>=0))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #160
IT	LT
BLT	L__paint119
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #215
IT	GT
BGT	L__paint118
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #30
IT	GT
BGT	L__paint117
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint116
L__paint95:
;paint.c,54 :: 		TFT_Set_Pen(CL_GRAY, size);
MOVW	R0, #lo_addr(_size+0)
MOVT	R0, #hi_addr(_size+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #33808
BL	_TFT_Set_Pen+0
;paint.c,55 :: 		erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;paint.c,56 :: 		indicator=3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_indicator+0)
MOVT	R0, #hi_addr(_indicator+0)
STRB	R1, [R0, #0]
;paint.c,57 :: 		}
IT	AL
BAL	L_paint22
;paint.c,52 :: 		else if((x_tft>=160)&&(x_tft<=215)&&(y_tft<=30)&&(y_tft>=0))
L__paint119:
L__paint118:
L__paint117:
L__paint116:
;paint.c,58 :: 		else if((x_tft>=215)&&(x_tft<=270)&&(y_tft<=30)&&(y_tft>=0))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #215
IT	LT
BLT	L__paint123
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #270
IT	GT
BGT	L__paint122
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #30
IT	GT
BGT	L__paint121
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint120
L__paint94:
;paint.c,60 :: 		TFT_Set_Pen(CL_RED, size);
MOVW	R0, #lo_addr(_size+0)
MOVT	R0, #hi_addr(_size+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;paint.c,61 :: 		erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;paint.c,62 :: 		indicator=4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_indicator+0)
MOVT	R0, #hi_addr(_indicator+0)
STRB	R1, [R0, #0]
;paint.c,63 :: 		}
IT	AL
BAL	L_paint26
;paint.c,58 :: 		else if((x_tft>=215)&&(x_tft<=270)&&(y_tft<=30)&&(y_tft>=0))
L__paint123:
L__paint122:
L__paint121:
L__paint120:
;paint.c,64 :: 		else if((x_tft>=270)&&(x_tft<=330)&&(y_tft<=30)&&(y_tft>=0))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #270
IT	LT
BLT	L__paint127
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #330
IT	GT
BGT	L__paint126
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #30
IT	GT
BGT	L__paint125
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint124
L__paint93:
;paint.c,66 :: 		TFT_Set_Pen(CL_YELLOW, size);
MOVW	R0, #lo_addr(_size+0)
MOVT	R0, #hi_addr(_size+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #65504
BL	_TFT_Set_Pen+0
;paint.c,67 :: 		erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;paint.c,68 :: 		indicator=5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_indicator+0)
MOVT	R0, #hi_addr(_indicator+0)
STRB	R1, [R0, #0]
;paint.c,69 :: 		}
IT	AL
BAL	L_paint30
;paint.c,64 :: 		else if((x_tft>=270)&&(x_tft<=330)&&(y_tft<=30)&&(y_tft>=0))
L__paint127:
L__paint126:
L__paint125:
L__paint124:
;paint.c,72 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=42)&&(y_tft<=75))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint131
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #50
IT	GT
BGT	L__paint130
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #42
IT	LT
BLT	L__paint129
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #75
IT	GT
BGT	L__paint128
L__paint92:
;paint.c,74 :: 		size=2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_size+0)
MOVT	R0, #hi_addr(_size+0)
STRB	R1, [R0, #0]
;paint.c,75 :: 		erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;paint.c,76 :: 		}
IT	AL
BAL	L_paint34
;paint.c,72 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=42)&&(y_tft<=75))
L__paint131:
L__paint130:
L__paint129:
L__paint128:
;paint.c,77 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=75)&&(y_tft<=108))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint135
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #50
IT	GT
BGT	L__paint134
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #75
IT	LT
BLT	L__paint133
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #108
IT	GT
BGT	L__paint132
L__paint91:
;paint.c,79 :: 		size=5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_size+0)
MOVT	R0, #hi_addr(_size+0)
STRB	R1, [R0, #0]
;paint.c,80 :: 		erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;paint.c,81 :: 		}
IT	AL
BAL	L_paint38
;paint.c,77 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=75)&&(y_tft<=108))
L__paint135:
L__paint134:
L__paint133:
L__paint132:
;paint.c,82 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=108)&&(y_tft<=141))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint139
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #50
IT	GT
BGT	L__paint138
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #108
IT	LT
BLT	L__paint137
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #141
IT	GT
BGT	L__paint136
L__paint90:
;paint.c,84 :: 		size=10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_size+0)
MOVT	R0, #hi_addr(_size+0)
STRB	R1, [R0, #0]
;paint.c,85 :: 		erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;paint.c,86 :: 		}
IT	AL
BAL	L_paint42
;paint.c,82 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=108)&&(y_tft<=141))
L__paint139:
L__paint138:
L__paint137:
L__paint136:
;paint.c,88 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=141)&&(y_tft<=174))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint143
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #50
IT	GT
BGT	L__paint142
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #141
IT	LT
BLT	L__paint141
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #174
IT	GT
BGT	L__paint140
L__paint89:
;paint.c,90 :: 		askal=0;
MOVS	R0, #0
STRB	R0, [SP, #5]
;paint.c,91 :: 		erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;paint.c,92 :: 		}
IT	AL
BAL	L_paint46
;paint.c,88 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=141)&&(y_tft<=174))
L__paint143:
L__paint142:
L__paint141:
L__paint140:
;paint.c,93 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=141)&&(y_tft<=174))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint147
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #50
IT	GT
BGT	L__paint146
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #141
IT	LT
BLT	L__paint145
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #174
IT	GT
BGT	L__paint144
L__paint88:
;paint.c,95 :: 		askal=0;
MOVS	R0, #0
STRB	R0, [SP, #5]
;paint.c,96 :: 		erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;paint.c,97 :: 		}
IT	AL
BAL	L_paint50
;paint.c,93 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=141)&&(y_tft<=174))
L__paint147:
L__paint146:
L__paint145:
L__paint144:
;paint.c,98 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=174)&&(y_tft<=207))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint151
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #50
IT	GT
BGT	L__paint150
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #174
IT	LT
BLT	L__paint149
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #207
IT	GT
BGT	L__paint148
L__paint87:
;paint.c,100 :: 		askal=1;
MOVS	R0, #1
STRB	R0, [SP, #5]
;paint.c,101 :: 		erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;paint.c,102 :: 		}
IT	AL
BAL	L_paint54
;paint.c,98 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=174)&&(y_tft<=207))
L__paint151:
L__paint150:
L__paint149:
L__paint148:
;paint.c,103 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=207)&&(y_tft<=240))
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__paint155
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #50
IT	GT
BGT	L__paint154
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #207
IT	LT
BLT	L__paint153
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #240
IT	GT
BGT	L__paint152
L__paint86:
;paint.c,105 :: 		askal=2;
MOVS	R0, #2
STRB	R0, [SP, #5]
;paint.c,106 :: 		erase=0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;paint.c,107 :: 		}
IT	AL
BAL	L_paint58
;paint.c,103 :: 		else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=207)&&(y_tft<=240))
L__paint155:
L__paint154:
L__paint153:
L__paint152:
;paint.c,111 :: 		if(y_tft>=50)
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #50
IT	LT
BLT	L_paint59
;paint.c,113 :: 		if(erase==1)
LDRB	R0, [SP, #4]
CMP	R0, #1
IT	NE
BNE	L_paint60
;paint.c,115 :: 		TFT_Set_Pen(CL_White, 10);
MOVS	R1, #10
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;paint.c,116 :: 		TFT_Circle(x_tft,y_tft,4);
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
STR	R0, [SP, #12]
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
BL	_TFT_Circle+0
;paint.c,117 :: 		xPaint[count]=x_tft;
MOVW	R2, #lo_addr(_count+0)
MOVT	R2, #hi_addr(_count+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_xPaint+0)
MOVT	R0, #hi_addr(_xPaint+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
STR	R0, [R1, #0]
;paint.c,118 :: 		yPaint[count]=y_tft;
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yPaint+0)
MOVT	R0, #hi_addr(_yPaint+0)
ADDS	R1, R0, R1
LDR	R0, [SP, #12]
LDRSH	R0, [R0, #0]
STR	R0, [R1, #0]
;paint.c,119 :: 		color[count]=0;
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_color+0)
MOVT	R0, #hi_addr(_color+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STR	R0, [R1, #0]
;paint.c,120 :: 		sizeP[count]=size;
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_sizeP+0)
MOVT	R0, #hi_addr(_sizeP+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_size+0)
MOVT	R0, #hi_addr(_size+0)
LDRB	R0, [R0, #0]
STR	R0, [R1, #0]
;paint.c,121 :: 		count++;
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;paint.c,122 :: 		}
IT	AL
BAL	L_paint61
L_paint60:
;paint.c,123 :: 		else if(askal==0)
LDRB	R0, [SP, #5]
CMP	R0, #0
IT	NE
BNE	L_paint62
;paint.c,125 :: 		TFT_Rectangle(x_tft,y_tft,x_tft+70,y_tft+40);
MOVW	R1, #lo_addr(_y_tft+0)
MOVT	R1, #hi_addr(_y_tft+0)
LDRSH	R0, [R1, #0]
ADDW	R4, R0, #40
MOVW	R3, #lo_addr(_x_tft+0)
MOVT	R3, #hi_addr(_x_tft+0)
LDRSH	R0, [R3, #0]
ADDW	R2, R0, #70
MOV	R0, R1
LDRSH	R1, [R0, #0]
MOV	R0, R3
LDRSH	R0, [R0, #0]
SXTH	R3, R4
BL	_TFT_Rectangle+0
;paint.c,126 :: 		}
IT	AL
BAL	L_paint63
L_paint62:
;paint.c,127 :: 		else if(askal==1)
LDRB	R0, [SP, #5]
CMP	R0, #1
IT	NE
BNE	L_paint64
;paint.c,129 :: 		TFT_Line(x_tft+10, y_tft+42, x_tft+30,y_tft+ 42);
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
ADDW	R3, R0, #42
MOVW	R2, #lo_addr(_x_tft+0)
MOVT	R2, #hi_addr(_x_tft+0)
LDRSH	R0, [R2, #0]
ADDW	R1, R0, #30
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, #10
SXTH	R2, R1
SXTH	R1, R3
BL	_TFT_Line+0
;paint.c,130 :: 		TFT_Line(x_tft+10,y_tft+42, x_tft+20, y_tft);
MOVW	R1, #lo_addr(_y_tft+0)
MOVT	R1, #hi_addr(_y_tft+0)
LDRSH	R4, [R1, #0]
MOVW	R3, #lo_addr(_x_tft+0)
MOVT	R3, #hi_addr(_x_tft+0)
LDRSH	R0, [R3, #0]
ADDW	R2, R0, #20
MOV	R0, R1
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #42
MOV	R0, R3
LDRSH	R0, [R0, #0]
ADDS	R0, #10
SXTH	R3, R4
BL	_TFT_Line+0
;paint.c,131 :: 		TFT_Line(x_tft+20, y_tft, x_tft+30,y_tft+ 42);
MOVW	R1, #lo_addr(_y_tft+0)
MOVT	R1, #hi_addr(_y_tft+0)
LDRSH	R0, [R1, #0]
ADDW	R4, R0, #42
MOVW	R3, #lo_addr(_x_tft+0)
MOVT	R3, #hi_addr(_x_tft+0)
LDRSH	R0, [R3, #0]
ADDW	R2, R0, #30
MOV	R0, R1
LDRSH	R1, [R0, #0]
MOV	R0, R3
LDRSH	R0, [R0, #0]
ADDS	R0, #20
SXTH	R3, R4
BL	_TFT_Line+0
;paint.c,132 :: 		}
IT	AL
BAL	L_paint65
L_paint64:
;paint.c,133 :: 		else if(askal==2)
LDRB	R0, [SP, #5]
CMP	R0, #2
IT	NE
BNE	L_paint66
;paint.c,135 :: 		TFT_Circle(x_tft,y_tft,1);
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
STR	R0, [SP, #12]
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;paint.c,137 :: 		xPaint[count]=x_tft;
MOVW	R2, #lo_addr(_count+0)
MOVT	R2, #hi_addr(_count+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_xPaint+0)
MOVT	R0, #hi_addr(_xPaint+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
STR	R0, [R1, #0]
;paint.c,138 :: 		yPaint[count]=y_tft;
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yPaint+0)
MOVT	R0, #hi_addr(_yPaint+0)
ADDS	R1, R0, R1
LDR	R0, [SP, #12]
LDRSH	R0, [R0, #0]
STR	R0, [R1, #0]
;paint.c,139 :: 		color[count]=indicator;
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_color+0)
MOVT	R0, #hi_addr(_color+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_indicator+0)
MOVT	R0, #hi_addr(_indicator+0)
LDRB	R0, [R0, #0]
STR	R0, [R1, #0]
;paint.c,140 :: 		sizeP[count]=size;
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_sizeP+0)
MOVT	R0, #hi_addr(_sizeP+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_size+0)
MOVT	R0, #hi_addr(_size+0)
LDRB	R0, [R0, #0]
STR	R0, [R1, #0]
;paint.c,141 :: 		count++;
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;paint.c,142 :: 		}
L_paint66:
L_paint65:
L_paint63:
L_paint61:
;paint.c,143 :: 		}
L_paint59:
;paint.c,145 :: 		}
L_paint58:
L_paint54:
L_paint50:
L_paint46:
L_paint42:
L_paint38:
L_paint34:
L_paint30:
L_paint26:
L_paint22:
L_paint18:
L_paint14:
L_paint10:
L_paint6:
;paint.c,148 :: 		}
L_paint2:
;paint.c,149 :: 		}
IT	AL
BAL	L_paint0
L_paint1:
;paint.c,150 :: 		}  //end of paint
L_end_paint:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _paint
_paint2:
;paint.c,153 :: 		void paint2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;paint.c,155 :: 		x_tft=500;
MOVW	R1, #500
SXTH	R1, R1
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
STRH	R1, [R0, #0]
;paint.c,156 :: 		y_TFT=500;
MOVW	R1, #500
SXTH	R1, R1
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
STRH	R1, [R0, #0]
;paint.c,157 :: 		while(x_tft==500&&y_tft==500)
L_paint267:
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #500
IT	NE
BNE	L__paint2158
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #500
IT	NE
BNE	L__paint2157
L__paint2156:
;paint.c,159 :: 		if(TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_paint271
;paint.c,161 :: 		TP_TFT_Get_Coordinates(&x_tft,&y_tft);
MOVW	R1, #lo_addr(_y_tft+0)
MOVT	R1, #hi_addr(_y_tft+0)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
BL	_TP_TFT_Get_Coordinates+0
;paint.c,162 :: 		}
L_paint271:
;paint.c,163 :: 		}
IT	AL
BAL	L_paint267
;paint.c,157 :: 		while(x_tft==500&&y_tft==500)
L__paint2158:
L__paint2157:
;paint.c,164 :: 		paint_module();
BL	_paint_module+0
;paint.c,165 :: 		for(i=0;i<count;i++)
; i start address is: 12 (R3)
MOVS	R3, #0
; i end address is: 12 (R3)
L_paint272:
; i start address is: 12 (R3)
MOVW	R0, #lo_addr(_count+0)
MOVT	R0, #hi_addr(_count+0)
LDR	R0, [R0, #0]
CMP	R3, R0
IT	CS
BCS	L_paint273
;paint.c,167 :: 		if(color[i]==0) {  TFT_Set_Pen(CL_White, 10); TFT_Circle(xPaint[i],yPaint[i],4);}
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_color+0)
MOVT	R0, #hi_addr(_color+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_paint275
MOVS	R1, #10
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
LSLS	R2, R3, #2
MOVW	R0, #lo_addr(_yPaint+0)
MOVT	R0, #hi_addr(_yPaint+0)
ADDS	R0, R0, R2
LDR	R0, [R0, #0]
SXTH	R1, R0
MOVW	R0, #lo_addr(_xPaint+0)
MOVT	R0, #hi_addr(_xPaint+0)
ADDS	R0, R0, R2
LDR	R0, [R0, #0]
SXTH	R0, R0
STR	R3, [SP, #4]
MOVS	R2, #4
SXTH	R2, R2
BL	_TFT_Circle+0
LDR	R3, [SP, #4]
IT	AL
BAL	L_paint276
L_paint275:
;paint.c,168 :: 		else if(color[i]==1) {  TFT_Set_Pen(CL_AQUA,  sizeP[i]); TFT_Circle(xPaint[i],yPaint[i],1);}
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_color+0)
MOVT	R0, #hi_addr(_color+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_paint277
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_sizeP+0)
MOVT	R0, #hi_addr(_sizeP+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
UXTB	R0, R0
UXTB	R1, R0
MOVW	R0, #4095
BL	_TFT_Set_Pen+0
LSLS	R2, R3, #2
MOVW	R0, #lo_addr(_yPaint+0)
MOVT	R0, #hi_addr(_yPaint+0)
ADDS	R0, R0, R2
LDR	R0, [R0, #0]
SXTH	R1, R0
MOVW	R0, #lo_addr(_xPaint+0)
MOVT	R0, #hi_addr(_xPaint+0)
ADDS	R0, R0, R2
LDR	R0, [R0, #0]
SXTH	R0, R0
STR	R3, [SP, #4]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
LDR	R3, [SP, #4]
IT	AL
BAL	L_paint278
L_paint277:
;paint.c,169 :: 		else if(color[i]==2) {   TFT_Set_Pen(CL_FUCHSIA, sizeP[i]); TFT_Circle(xPaint[i],yPaint[i],1);   }
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_color+0)
MOVT	R0, #hi_addr(_color+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_paint279
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_sizeP+0)
MOVT	R0, #hi_addr(_sizeP+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
UXTB	R0, R0
UXTB	R1, R0
MOVW	R0, #63519
BL	_TFT_Set_Pen+0
LSLS	R2, R3, #2
MOVW	R0, #lo_addr(_yPaint+0)
MOVT	R0, #hi_addr(_yPaint+0)
ADDS	R0, R0, R2
LDR	R0, [R0, #0]
SXTH	R1, R0
MOVW	R0, #lo_addr(_xPaint+0)
MOVT	R0, #hi_addr(_xPaint+0)
ADDS	R0, R0, R2
LDR	R0, [R0, #0]
SXTH	R0, R0
STR	R3, [SP, #4]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
LDR	R3, [SP, #4]
IT	AL
BAL	L_paint280
L_paint279:
;paint.c,170 :: 		else  if(color[i]==3) {   TFT_Set_Pen(CL_GRAY, sizeP[i]); TFT_Circle(xPaint[i],yPaint[i],1);   }
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_color+0)
MOVT	R0, #hi_addr(_color+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_paint281
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_sizeP+0)
MOVT	R0, #hi_addr(_sizeP+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
UXTB	R0, R0
UXTB	R1, R0
MOVW	R0, #33808
BL	_TFT_Set_Pen+0
LSLS	R2, R3, #2
MOVW	R0, #lo_addr(_yPaint+0)
MOVT	R0, #hi_addr(_yPaint+0)
ADDS	R0, R0, R2
LDR	R0, [R0, #0]
SXTH	R1, R0
MOVW	R0, #lo_addr(_xPaint+0)
MOVT	R0, #hi_addr(_xPaint+0)
ADDS	R0, R0, R2
LDR	R0, [R0, #0]
SXTH	R0, R0
STR	R3, [SP, #4]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
LDR	R3, [SP, #4]
IT	AL
BAL	L_paint282
L_paint281:
;paint.c,171 :: 		else  if(color[i]==4) {   TFT_Set_Pen(CL_RED, sizeP[i]); TFT_Circle(xPaint[i],yPaint[i],1);   }
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_color+0)
MOVT	R0, #hi_addr(_color+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
CMP	R0, #4
IT	NE
BNE	L_paint283
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_sizeP+0)
MOVT	R0, #hi_addr(_sizeP+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
UXTB	R0, R0
UXTB	R1, R0
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
LSLS	R2, R3, #2
MOVW	R0, #lo_addr(_yPaint+0)
MOVT	R0, #hi_addr(_yPaint+0)
ADDS	R0, R0, R2
LDR	R0, [R0, #0]
SXTH	R1, R0
MOVW	R0, #lo_addr(_xPaint+0)
MOVT	R0, #hi_addr(_xPaint+0)
ADDS	R0, R0, R2
LDR	R0, [R0, #0]
SXTH	R0, R0
STR	R3, [SP, #4]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
LDR	R3, [SP, #4]
IT	AL
BAL	L_paint284
L_paint283:
;paint.c,172 :: 		else  if(color[i]==5) {   TFT_Set_Pen(CL_YELLOW, sizeP[i]); TFT_Circle(xPaint[i],yPaint[i],1);   }
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_color+0)
MOVT	R0, #hi_addr(_color+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
CMP	R0, #5
IT	NE
BNE	L_paint285
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_sizeP+0)
MOVT	R0, #hi_addr(_sizeP+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
UXTB	R0, R0
UXTB	R1, R0
MOVW	R0, #65504
BL	_TFT_Set_Pen+0
LSLS	R2, R3, #2
MOVW	R0, #lo_addr(_yPaint+0)
MOVT	R0, #hi_addr(_yPaint+0)
ADDS	R0, R0, R2
LDR	R0, [R0, #0]
SXTH	R1, R0
MOVW	R0, #lo_addr(_xPaint+0)
MOVT	R0, #hi_addr(_xPaint+0)
ADDS	R0, R0, R2
LDR	R0, [R0, #0]
SXTH	R0, R0
STR	R3, [SP, #4]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
LDR	R3, [SP, #4]
L_paint285:
L_paint284:
L_paint282:
L_paint280:
L_paint278:
L_paint276:
;paint.c,165 :: 		for(i=0;i<count;i++)
ADDS	R3, R3, #1
;paint.c,173 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_paint272
L_paint273:
;paint.c,174 :: 		paint();
BL	_paint+0
;paint.c,177 :: 		}
L_end_paint2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _paint2
