_draw:
;snake.c,11 :: 		void draw(u8 sizeOFsnake)
; sizeOFsnake start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; sizeOFsnake end address is: 0 (R0)
; sizeOFsnake start address is: 0 (R0)
;snake.c,13 :: 		TFT_Set_Pen(CL_GRAY,sizeOFsnake);
UXTB	R1, R0
; sizeOFsnake end address is: 0 (R0)
MOVW	R0, #33808
BL	_TFT_Set_Pen+0
;snake.c,14 :: 		TFT_Circle(x, y, 0);
MOVW	R1, #lo_addr(_y+0)
MOVT	R1, #hi_addr(_y+0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_x+0)
MOVT	R1, #hi_addr(_x+0)
LDRH	R1, [R1, #0]
SXTH	R0, R1
SXTH	R1, R2
MOVS	R2, #0
SXTH	R2, R2
BL	_TFT_Circle+0
;snake.c,15 :: 		}
L_end_draw:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _draw
_ams7:
;snake.c,17 :: 		void ams7()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;snake.c,19 :: 		TFT_Set_Pen(CL_RED,size_snake);
MOVW	R0, #lo_addr(_size_snake+0)
MOVT	R0, #hi_addr(_size_snake+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;snake.c,20 :: 		TFT_Circle(x, y, 0);
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
SXTH	R2, R2
BL	_TFT_Circle+0
;snake.c,21 :: 		}
L_end_ams7:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ams7
_snake:
;snake.c,23 :: 		void snake()
SUB	SP, SP, #36
STR	LR, [SP, #0]
;snake.c,27 :: 		u8 R=0;
;snake.c,28 :: 		u8 L=0;
;snake.c,29 :: 		u8 U=0;
;snake.c,30 :: 		u8 D=0;
;snake.c,31 :: 		u8 value=0;
;snake.c,35 :: 		u8 out1=0;
MOVS	R0, #0
STRB	R0, [SP, #25]
MOVS	R0, #0
STRB	R0, [SP, #26]
;snake.c,36 :: 		u8 exit=0;
;snake.c,37 :: 		TFT_Fill_Screen(CL_RED);
MOVW	R0, #63488
BL	_TFT_Fill_Screen+0
;snake.c,38 :: 		TFT_Write_Text("let's play",150,120);
MOVW	R0, #lo_addr(?lstr1_snake+0)
MOVT	R0, #hi_addr(?lstr1_snake+0)
MOVS	R2, #120
MOVS	R1, #150
BL	_TFT_Write_Text+0
;snake.c,39 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_snake0:
SUBS	R7, R7, #1
BNE	L_snake0
NOP
NOP
NOP
NOP
;snake.c,40 :: 		TFT_Fill_Screen(CL_RED);
MOVW	R0, #63488
BL	_TFT_Fill_Screen+0
;snake.c,41 :: 		TFT_Set_Pen(CL_GRAY,size_snake);
MOVW	R0, #lo_addr(_size_snake+0)
MOVT	R0, #hi_addr(_size_snake+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #33808
BL	_TFT_Set_Pen+0
;snake.c,42 :: 		TFT_Circle(x, y, 0);
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
SXTH	R2, R2
BL	_TFT_Circle+0
;snake.c,43 :: 		TFT_Set_Pen(CL_Black,7);
MOVS	R1, #7
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;snake.c,44 :: 		TFT_Circle(xRandom, yRandom, 0);
ADD	R1, SP, #16
ADD	R0, SP, #10
MOVS	R2, #0
SXTH	R2, R2
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Circle+0
;snake.c,45 :: 		TFT_Set_Pen(CL_GRAY,size_snake);
MOVW	R0, #lo_addr(_size_snake+0)
MOVT	R0, #hi_addr(_size_snake+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #33808
BL	_TFT_Set_Pen+0
;snake.c,47 :: 		if(out1==0)
LDRB	R0, [SP, #25]
CMP	R0, #0
IT	NE
BNE	L_snake2
;snake.c,50 :: 		for(i=0;i<3;i++)
; i start address is: 12 (R3)
MOVS	R3, #0
; i end address is: 12 (R3)
L_snake3:
; i start address is: 12 (R3)
CMP	R3, #3
IT	CS
BCS	L_snake4
;snake.c,52 :: 		xRandom[i]=rand()/200;
ADD	R1, SP, #10
LSLS	R0, R3, #1
ADDS	R0, R1, R0
STR	R0, [SP, #32]
BL	_rand+0
MOVS	R1, #200
SXTH	R1, R1
SDIV	R1, R0, R1
LDR	R0, [SP, #32]
STRH	R1, [R0, #0]
;snake.c,53 :: 		yRandom[i]=rand()/200;
ADD	R1, SP, #16
LSLS	R0, R3, #1
ADDS	R0, R1, R0
STR	R0, [SP, #32]
BL	_rand+0
MOVS	R1, #200
SXTH	R1, R1
SDIV	R1, R0, R1
LDR	R0, [SP, #32]
STRH	R1, [R0, #0]
;snake.c,54 :: 		TFT_Set_Pen(CL_Black,7);
MOVS	R1, #7
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;snake.c,55 :: 		TFT_Circle(xRandom[i], yRandom[i], 0);
ADD	R0, SP, #16
LSLS	R2, R3, #1
ADDS	R0, R0, R2
LDRH	R0, [R0, #0]
SXTH	R1, R0
ADD	R0, SP, #10
ADDS	R0, R0, R2
LDRH	R0, [R0, #0]
SXTH	R0, R0
STRB	R3, [SP, #4]
MOVS	R2, #0
SXTH	R2, R2
BL	_TFT_Circle+0
LDRB	R3, [SP, #4]
;snake.c,56 :: 		flag_food[i]=1;
ADD	R0, SP, #22
ADDS	R1, R0, R3
MOVS	R0, #1
STRB	R0, [R1, #0]
;snake.c,50 :: 		for(i=0;i<3;i++)
ADDS	R0, R3, #1
UXTB	R0, R0
; i end address is: 12 (R3)
; i start address is: 0 (R0)
;snake.c,57 :: 		}
UXTB	R3, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_snake3
L_snake4:
;snake.c,58 :: 		}
L_snake2:
;snake.c,59 :: 		while(dofd3_flag==1)
L_snake6:
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_snake7
;snake.c,62 :: 		R=Button(&GPIOA_IDR,6,delay_time,active_stateJ);
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
; R start address is: 24 (R6)
UXTB	R6, R0
;snake.c,63 :: 		L=Button(&GPIOD_IDR,2,delay_time,active_stateJ);
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
; L start address is: 32 (R8)
UXTB	R8, R0
;snake.c,64 :: 		U=Button(&GPIOD_IDR,4,delay_time,active_stateJ);
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
; U start address is: 36 (R9)
UXTB	R9, R0
;snake.c,65 :: 		D=Button(&GPIOB_IDR,5,delay_time,active_stateJ);
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
; D start address is: 40 (R10)
UXTB	R10, R0
;snake.c,66 :: 		value= Button(&GPIOB_IDR,0,delay_time,active_stateB);
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
;snake.c,68 :: 		if(R==255)
CMP	R6, #255
IT	NE
BNE	L_snake8
; R end address is: 24 (R6)
; L end address is: 32 (R8)
; U end address is: 36 (R9)
; D end address is: 40 (R10)
;snake.c,70 :: 		while(Button(&GPIOD_IDR,2,delay_time,active_stateJ)==0&& Button(&GPIOD_IDR,4,delay_time,active_stateJ)==0 &&Button(&GPIOB_IDR,5,delay_time,active_stateJ)==0)
L_snake9:
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L__snake168
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L__snake167
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L__snake166
L__snake159:
;snake.c,72 :: 		for(j=0;j<3;j++)
MOVS	R0, #0
STRB	R0, [SP, #8]
L_snake13:
LDRB	R0, [SP, #8]
CMP	R0, #3
IT	CS
BCS	L_snake14
;snake.c,74 :: 		for(i=0;i<10;i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_snake16:
; i start address is: 8 (R2)
CMP	R2, #10
IT	CS
BCS	L_snake17
;snake.c,76 :: 		if((y==yRandom[j]+i)&&(x==xRandom[j])&&(flag_food[j]==1)) {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
ADD	R1, SP, #16
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R0, [R0, #0]
ADDS	R1, R0, R2
UXTH	R1, R1
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake162
ADD	R1, SP, #10
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake161
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__snake160
L__snake158:
MOVW	R1, #lo_addr(_size_snake+0)
MOVT	R1, #hi_addr(_size_snake+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #5
STRB	R0, [R1, #0]
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R1, R1, R0
MOVS	R0, #0
STRB	R0, [R1, #0]
LDRB	R0, [SP, #26]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [SP, #26]
CMP	R0, #3
IT	NE
BNE	L_snake22
; i end address is: 8 (R2)
;snake.c,78 :: 		dofd3_flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
STRB	R1, [R0, #0]
;snake.c,79 :: 		break;
IT	AL
BAL	L_snake17
;snake.c,80 :: 		}
L_snake22:
;snake.c,76 :: 		if((y==yRandom[j]+i)&&(x==xRandom[j])&&(flag_food[j]==1)) {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
; i start address is: 8 (R2)
L__snake162:
L__snake161:
L__snake160:
;snake.c,74 :: 		for(i=0;i<10;i++)
ADDS	R0, R2, #1
UXTB	R0, R0
; i end address is: 8 (R2)
; i start address is: 0 (R0)
;snake.c,82 :: 		}
UXTB	R2, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_snake16
L_snake17:
;snake.c,83 :: 		if( dofd3_flag==0)   break;
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_snake23
IT	AL
BAL	L_snake14
L_snake23:
;snake.c,84 :: 		for(i=0;i<10;i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_snake24:
; i start address is: 8 (R2)
CMP	R2, #10
IT	CS
BCS	L_snake25
;snake.c,86 :: 		if((y==yRandom[j]-i)&&(x==xRandom[j])&&(flag_food[j]==1)) {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
ADD	R1, SP, #16
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R0, [R0, #0]
SUB	R1, R0, R2
UXTH	R1, R1
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake165
ADD	R1, SP, #10
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake164
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__snake163
L__snake157:
MOVW	R1, #lo_addr(_size_snake+0)
MOVT	R1, #hi_addr(_size_snake+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #5
STRB	R0, [R1, #0]
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R1, R1, R0
MOVS	R0, #0
STRB	R0, [R1, #0]
LDRB	R0, [SP, #26]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [SP, #26]
CMP	R0, #3
IT	NE
BNE	L_snake30
; i end address is: 8 (R2)
;snake.c,88 :: 		dofd3_flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
STRB	R1, [R0, #0]
;snake.c,89 :: 		break;
IT	AL
BAL	L_snake25
;snake.c,90 :: 		}
L_snake30:
;snake.c,86 :: 		if((y==yRandom[j]-i)&&(x==xRandom[j])&&(flag_food[j]==1)) {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
; i start address is: 8 (R2)
L__snake165:
L__snake164:
L__snake163:
;snake.c,91 :: 		}   if( dofd3_flag==0)   break;
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_snake31
; i end address is: 8 (R2)
IT	AL
BAL	L_snake25
L_snake31:
;snake.c,84 :: 		for(i=0;i<10;i++)
; i start address is: 8 (R2)
ADDS	R0, R2, #1
UXTB	R0, R0
; i end address is: 8 (R2)
; i start address is: 0 (R0)
;snake.c,92 :: 		}
UXTB	R2, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_snake24
L_snake25:
;snake.c,72 :: 		for(j=0;j<3;j++)
LDRB	R0, [SP, #8]
ADDS	R0, R0, #1
STRB	R0, [SP, #8]
;snake.c,93 :: 		}
IT	AL
BAL	L_snake13
L_snake14:
;snake.c,94 :: 		if( dofd3_flag==0)   break;
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_snake32
IT	AL
BAL	L_snake10
L_snake32:
;snake.c,95 :: 		switch(x)
IT	AL
BAL	L_snake33
;snake.c,97 :: 		case 320:   ams7();
L_snake35:
BL	_ams7+0
;snake.c,98 :: 		x=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
STRH	R1, [R0, #0]
;snake.c,99 :: 		draw(size_snake);
MOVW	R0, #lo_addr(_size_snake+0)
MOVT	R0, #hi_addr(_size_snake+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;snake.c,100 :: 		break;
IT	AL
BAL	L_snake34
;snake.c,101 :: 		default:    ams7();
L_snake36:
BL	_ams7+0
;snake.c,102 :: 		x+=1;
MOVW	R1, #lo_addr(_x+0)
MOVT	R1, #hi_addr(_x+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;snake.c,103 :: 		draw(size_snake);
MOVW	R0, #lo_addr(_size_snake+0)
MOVT	R0, #hi_addr(_size_snake+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;snake.c,104 :: 		break;
IT	AL
BAL	L_snake34
;snake.c,105 :: 		}
L_snake33:
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, #320
IT	EQ
BEQ	L_snake35
IT	AL
BAL	L_snake36
L_snake34:
;snake.c,106 :: 		Delay_ms(5);
MOVW	R7, #26665
MOVT	R7, #0
NOP
NOP
L_snake37:
SUBS	R7, R7, #1
BNE	L_snake37
NOP
NOP
;snake.c,108 :: 		}
IT	AL
BAL	L_snake9
L_snake10:
;snake.c,70 :: 		while(Button(&GPIOD_IDR,2,delay_time,active_stateJ)==0&& Button(&GPIOD_IDR,4,delay_time,active_stateJ)==0 &&Button(&GPIOB_IDR,5,delay_time,active_stateJ)==0)
L__snake168:
L__snake167:
L__snake166:
;snake.c,109 :: 		}
IT	AL
BAL	L_snake39
L_snake8:
;snake.c,110 :: 		else if(L==255)
; D start address is: 40 (R10)
; U start address is: 36 (R9)
; L start address is: 32 (R8)
CMP	R8, #255
IT	NE
BNE	L_snake40
; L end address is: 32 (R8)
; U end address is: 36 (R9)
; D end address is: 40 (R10)
;snake.c,112 :: 		while(Button(&GPIOA_IDR,6,delay_time,active_stateJ)==0&& Button(&GPIOD_IDR,4,delay_time,active_stateJ)==0 &&Button(&GPIOB_IDR,5,delay_time,active_stateJ)==0)
L_snake41:
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L__snake177
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L__snake176
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L__snake175
L__snake156:
;snake.c,114 :: 		for(j=0;j<3;j++)
MOVS	R0, #0
STRB	R0, [SP, #8]
L_snake45:
LDRB	R0, [SP, #8]
CMP	R0, #3
IT	CS
BCS	L_snake46
;snake.c,116 :: 		for(i=0;i<10;i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_snake48:
; i start address is: 8 (R2)
CMP	R2, #10
IT	CS
BCS	L_snake49
;snake.c,118 :: 		if((y==yRandom[j]+i)&&(x==xRandom[j])&&(flag_food[j]==1))  {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
ADD	R1, SP, #16
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R0, [R0, #0]
ADDS	R1, R0, R2
UXTH	R1, R1
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake171
ADD	R1, SP, #10
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake170
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__snake169
L__snake155:
MOVW	R1, #lo_addr(_size_snake+0)
MOVT	R1, #hi_addr(_size_snake+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #5
STRB	R0, [R1, #0]
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R1, R1, R0
MOVS	R0, #0
STRB	R0, [R1, #0]
LDRB	R0, [SP, #26]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [SP, #26]
CMP	R0, #3
IT	NE
BNE	L_snake54
; i end address is: 8 (R2)
;snake.c,120 :: 		dofd3_flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
STRB	R1, [R0, #0]
;snake.c,121 :: 		break;
IT	AL
BAL	L_snake49
;snake.c,122 :: 		}
L_snake54:
;snake.c,118 :: 		if((y==yRandom[j]+i)&&(x==xRandom[j])&&(flag_food[j]==1))  {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
; i start address is: 8 (R2)
L__snake171:
L__snake170:
L__snake169:
;snake.c,116 :: 		for(i=0;i<10;i++)
ADDS	R0, R2, #1
UXTB	R0, R0
; i end address is: 8 (R2)
; i start address is: 0 (R0)
;snake.c,124 :: 		}
UXTB	R2, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_snake48
L_snake49:
;snake.c,125 :: 		if( dofd3_flag==0)   break;
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_snake55
IT	AL
BAL	L_snake46
L_snake55:
;snake.c,126 :: 		for(i=0;i<10;i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_snake56:
; i start address is: 8 (R2)
CMP	R2, #10
IT	CS
BCS	L_snake57
;snake.c,128 :: 		if((y==yRandom[j]-i)&&(x==xRandom[j])&&(flag_food[j]==1))  {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
ADD	R1, SP, #16
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R0, [R0, #0]
SUB	R1, R0, R2
UXTH	R1, R1
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake174
ADD	R1, SP, #10
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake173
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__snake172
L__snake154:
MOVW	R1, #lo_addr(_size_snake+0)
MOVT	R1, #hi_addr(_size_snake+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #5
STRB	R0, [R1, #0]
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R1, R1, R0
MOVS	R0, #0
STRB	R0, [R1, #0]
LDRB	R0, [SP, #26]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [SP, #26]
CMP	R0, #3
IT	NE
BNE	L_snake62
; i end address is: 8 (R2)
;snake.c,130 :: 		dofd3_flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
STRB	R1, [R0, #0]
;snake.c,131 :: 		break;
IT	AL
BAL	L_snake57
;snake.c,132 :: 		}
L_snake62:
;snake.c,128 :: 		if((y==yRandom[j]-i)&&(x==xRandom[j])&&(flag_food[j]==1))  {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
; i start address is: 8 (R2)
L__snake174:
L__snake173:
L__snake172:
;snake.c,126 :: 		for(i=0;i<10;i++)
ADDS	R0, R2, #1
UXTB	R0, R0
; i end address is: 8 (R2)
; i start address is: 0 (R0)
;snake.c,134 :: 		}
UXTB	R2, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_snake56
L_snake57:
;snake.c,114 :: 		for(j=0;j<3;j++)
LDRB	R0, [SP, #8]
ADDS	R0, R0, #1
STRB	R0, [SP, #8]
;snake.c,135 :: 		}
IT	AL
BAL	L_snake45
L_snake46:
;snake.c,136 :: 		if( dofd3_flag==0)   break;
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_snake63
IT	AL
BAL	L_snake42
L_snake63:
;snake.c,137 :: 		switch(x)
IT	AL
BAL	L_snake64
;snake.c,139 :: 		case 0:     ams7();
L_snake66:
BL	_ams7+0
;snake.c,140 :: 		x=320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
STRH	R1, [R0, #0]
;snake.c,141 :: 		draw(size_snake);
MOVW	R0, #lo_addr(_size_snake+0)
MOVT	R0, #hi_addr(_size_snake+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;snake.c,142 :: 		break;
IT	AL
BAL	L_snake65
;snake.c,143 :: 		default:    ams7();
L_snake67:
BL	_ams7+0
;snake.c,144 :: 		x-=1;
MOVW	R1, #lo_addr(_x+0)
MOVT	R1, #hi_addr(_x+0)
LDRH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;snake.c,145 :: 		draw(size_snake);
MOVW	R0, #lo_addr(_size_snake+0)
MOVT	R0, #hi_addr(_size_snake+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;snake.c,146 :: 		break;
IT	AL
BAL	L_snake65
;snake.c,147 :: 		}
L_snake64:
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_snake66
IT	AL
BAL	L_snake67
L_snake65:
;snake.c,148 :: 		Delay_ms(5);
MOVW	R7, #26665
MOVT	R7, #0
NOP
NOP
L_snake68:
SUBS	R7, R7, #1
BNE	L_snake68
NOP
NOP
;snake.c,150 :: 		}
IT	AL
BAL	L_snake41
L_snake42:
;snake.c,112 :: 		while(Button(&GPIOA_IDR,6,delay_time,active_stateJ)==0&& Button(&GPIOD_IDR,4,delay_time,active_stateJ)==0 &&Button(&GPIOB_IDR,5,delay_time,active_stateJ)==0)
L__snake177:
L__snake176:
L__snake175:
;snake.c,151 :: 		}
IT	AL
BAL	L_snake70
L_snake40:
;snake.c,152 :: 		else if(D==255)
; D start address is: 40 (R10)
; U start address is: 36 (R9)
CMP	R10, #255
IT	NE
BNE	L_snake71
; U end address is: 36 (R9)
; D end address is: 40 (R10)
;snake.c,154 :: 		while(Button(&GPIOA_IDR,6,delay_time,active_stateJ)==0&& Button(&GPIOD_IDR,4,delay_time,active_stateJ)==0 &&Button(&GPIOD_IDR,2,delay_time,active_stateJ)==0)
L_snake72:
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L__snake186
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L__snake185
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L__snake184
L__snake153:
;snake.c,156 :: 		for(j=0;j<3;j++)
MOVS	R0, #0
STRB	R0, [SP, #8]
L_snake76:
LDRB	R0, [SP, #8]
CMP	R0, #3
IT	CS
BCS	L_snake77
;snake.c,158 :: 		for(i=0;i<10;i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_snake79:
; i start address is: 8 (R2)
CMP	R2, #10
IT	CS
BCS	L_snake80
;snake.c,160 :: 		if((y==yRandom[j])&&(x==xRandom[j]+i)&&(flag_food[j]==1))  {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
ADD	R1, SP, #16
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake180
ADD	R1, SP, #10
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R0, [R0, #0]
ADDS	R1, R0, R2
UXTH	R1, R1
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake179
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__snake178
L__snake152:
MOVW	R1, #lo_addr(_size_snake+0)
MOVT	R1, #hi_addr(_size_snake+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #5
STRB	R0, [R1, #0]
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R1, R1, R0
MOVS	R0, #0
STRB	R0, [R1, #0]
LDRB	R0, [SP, #26]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [SP, #26]
CMP	R0, #3
IT	NE
BNE	L_snake85
; i end address is: 8 (R2)
;snake.c,162 :: 		dofd3_flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
STRB	R1, [R0, #0]
;snake.c,163 :: 		break;
IT	AL
BAL	L_snake80
;snake.c,164 :: 		}
L_snake85:
;snake.c,160 :: 		if((y==yRandom[j])&&(x==xRandom[j]+i)&&(flag_food[j]==1))  {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
; i start address is: 8 (R2)
L__snake180:
L__snake179:
L__snake178:
;snake.c,166 :: 		if( dofd3_flag==0)   break;
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_snake86
; i end address is: 8 (R2)
IT	AL
BAL	L_snake80
L_snake86:
;snake.c,158 :: 		for(i=0;i<10;i++)
; i start address is: 8 (R2)
ADDS	R0, R2, #1
UXTB	R0, R0
; i end address is: 8 (R2)
; i start address is: 0 (R0)
;snake.c,167 :: 		}
UXTB	R2, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_snake79
L_snake80:
;snake.c,168 :: 		if( dofd3_flag==0)   break;
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_snake87
IT	AL
BAL	L_snake77
L_snake87:
;snake.c,169 :: 		for(i=0;i<10;i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_snake88:
; i start address is: 8 (R2)
CMP	R2, #10
IT	CS
BCS	L_snake89
;snake.c,171 :: 		if((y==yRandom[j])&&(x==xRandom[j]-i)&&(flag_food[j]==1))  {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
ADD	R1, SP, #16
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake183
ADD	R1, SP, #10
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R0, [R0, #0]
SUB	R1, R0, R2
UXTH	R1, R1
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake182
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__snake181
L__snake151:
MOVW	R1, #lo_addr(_size_snake+0)
MOVT	R1, #hi_addr(_size_snake+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #5
STRB	R0, [R1, #0]
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R1, R1, R0
MOVS	R0, #0
STRB	R0, [R1, #0]
LDRB	R0, [SP, #26]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [SP, #26]
CMP	R0, #3
IT	NE
BNE	L_snake94
; i end address is: 8 (R2)
;snake.c,173 :: 		dofd3_flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
STRB	R1, [R0, #0]
;snake.c,174 :: 		break;
IT	AL
BAL	L_snake89
;snake.c,175 :: 		}
L_snake94:
;snake.c,171 :: 		if((y==yRandom[j])&&(x==xRandom[j]-i)&&(flag_food[j]==1))  {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
; i start address is: 8 (R2)
L__snake183:
L__snake182:
L__snake181:
;snake.c,169 :: 		for(i=0;i<10;i++)
ADDS	R0, R2, #1
UXTB	R0, R0
; i end address is: 8 (R2)
; i start address is: 0 (R0)
;snake.c,177 :: 		}
UXTB	R2, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_snake88
L_snake89:
;snake.c,178 :: 		if( dofd3_flag==0)   break;
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_snake95
IT	AL
BAL	L_snake77
L_snake95:
;snake.c,156 :: 		for(j=0;j<3;j++)
LDRB	R0, [SP, #8]
ADDS	R0, R0, #1
STRB	R0, [SP, #8]
;snake.c,179 :: 		}
IT	AL
BAL	L_snake76
L_snake77:
;snake.c,180 :: 		if( dofd3_flag==0)   break;
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_snake96
IT	AL
BAL	L_snake73
L_snake96:
;snake.c,181 :: 		switch(y)
IT	AL
BAL	L_snake97
;snake.c,183 :: 		case 320:   ams7();
L_snake99:
BL	_ams7+0
;snake.c,184 :: 		y=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
STRH	R1, [R0, #0]
;snake.c,185 :: 		draw(size_snake);
MOVW	R0, #lo_addr(_size_snake+0)
MOVT	R0, #hi_addr(_size_snake+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;snake.c,186 :: 		break;
IT	AL
BAL	L_snake98
;snake.c,187 :: 		default:    ams7();
L_snake100:
BL	_ams7+0
;snake.c,188 :: 		y+=1;
MOVW	R1, #lo_addr(_y+0)
MOVT	R1, #hi_addr(_y+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;snake.c,189 :: 		draw(size_snake);
MOVW	R0, #lo_addr(_size_snake+0)
MOVT	R0, #hi_addr(_size_snake+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;snake.c,190 :: 		break;
IT	AL
BAL	L_snake98
;snake.c,191 :: 		}
L_snake97:
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, #320
IT	EQ
BEQ	L_snake99
IT	AL
BAL	L_snake100
L_snake98:
;snake.c,192 :: 		Delay_ms(5);
MOVW	R7, #26665
MOVT	R7, #0
NOP
NOP
L_snake101:
SUBS	R7, R7, #1
BNE	L_snake101
NOP
NOP
;snake.c,193 :: 		}
IT	AL
BAL	L_snake72
L_snake73:
;snake.c,154 :: 		while(Button(&GPIOA_IDR,6,delay_time,active_stateJ)==0&& Button(&GPIOD_IDR,4,delay_time,active_stateJ)==0 &&Button(&GPIOD_IDR,2,delay_time,active_stateJ)==0)
L__snake186:
L__snake185:
L__snake184:
;snake.c,194 :: 		}
IT	AL
BAL	L_snake103
L_snake71:
;snake.c,195 :: 		else if(U==255)
; U start address is: 36 (R9)
CMP	R9, #255
IT	NE
BNE	L_snake104
; U end address is: 36 (R9)
;snake.c,197 :: 		while(Button(&GPIOA_IDR,6,delay_time,active_stateJ)==0&& Button(&GPIOD_IDR,2,delay_time,active_stateJ)==0 &&Button(&GPIOB_IDR,5,delay_time,active_stateJ)==0)
L_snake105:
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L__snake195
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L__snake194
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L__snake193
L__snake150:
;snake.c,199 :: 		for(j=0;j<3;j++)
MOVS	R0, #0
STRB	R0, [SP, #8]
L_snake109:
LDRB	R0, [SP, #8]
CMP	R0, #3
IT	CS
BCS	L_snake110
;snake.c,201 :: 		for(i=0;i<10;i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_snake112:
; i start address is: 8 (R2)
CMP	R2, #10
IT	CS
BCS	L_snake113
;snake.c,203 :: 		if((y==yRandom[j])&&(x==xRandom[j]+i)&&(flag_food[j]==1))
ADD	R1, SP, #16
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake189
ADD	R1, SP, #10
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R0, [R0, #0]
ADDS	R1, R0, R2
UXTH	R1, R1
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake188
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__snake187
L__snake149:
;snake.c,205 :: 		size_snake+=5;
MOVW	R1, #lo_addr(_size_snake+0)
MOVT	R1, #hi_addr(_size_snake+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #5
STRB	R0, [R1, #0]
;snake.c,206 :: 		flag_food[j]=0;
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R1, R1, R0
MOVS	R0, #0
STRB	R0, [R1, #0]
;snake.c,207 :: 		exit++;
LDRB	R0, [SP, #26]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [SP, #26]
;snake.c,208 :: 		if(exit==3)
CMP	R0, #3
IT	NE
BNE	L_snake118
; i end address is: 8 (R2)
;snake.c,210 :: 		dofd3_flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
STRB	R1, [R0, #0]
;snake.c,211 :: 		break;
IT	AL
BAL	L_snake113
;snake.c,212 :: 		}
L_snake118:
;snake.c,203 :: 		if((y==yRandom[j])&&(x==xRandom[j]+i)&&(flag_food[j]==1))
; i start address is: 8 (R2)
L__snake189:
L__snake188:
L__snake187:
;snake.c,213 :: 		}  if( dofd3_flag==0)   break;
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_snake119
; i end address is: 8 (R2)
IT	AL
BAL	L_snake113
L_snake119:
;snake.c,201 :: 		for(i=0;i<10;i++)
; i start address is: 8 (R2)
ADDS	R0, R2, #1
UXTB	R0, R0
; i end address is: 8 (R2)
; i start address is: 0 (R0)
;snake.c,214 :: 		}
UXTB	R2, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_snake112
L_snake113:
;snake.c,215 :: 		if( dofd3_flag==0)   break;
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_snake120
IT	AL
BAL	L_snake110
L_snake120:
;snake.c,216 :: 		for(i=0;i<10;i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_snake121:
; i start address is: 8 (R2)
CMP	R2, #10
IT	CS
BCS	L_snake122
;snake.c,218 :: 		if((y==yRandom[j])&&(x==xRandom[j]-i)&&(flag_food[j]==1))  {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
ADD	R1, SP, #16
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake192
ADD	R1, SP, #10
LDRB	R0, [SP, #8]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R0, [R0, #0]
SUB	R1, R0, R2
UXTH	R1, R1
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__snake191
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__snake190
L__snake148:
MOVW	R1, #lo_addr(_size_snake+0)
MOVT	R1, #hi_addr(_size_snake+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #5
STRB	R0, [R1, #0]
ADD	R1, SP, #22
LDRB	R0, [SP, #8]
ADDS	R1, R1, R0
MOVS	R0, #0
STRB	R0, [R1, #0]
LDRB	R0, [SP, #26]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [SP, #26]
CMP	R0, #3
IT	NE
BNE	L_snake127
; i end address is: 8 (R2)
;snake.c,220 :: 		dofd3_flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
STRB	R1, [R0, #0]
;snake.c,221 :: 		break;
IT	AL
BAL	L_snake122
;snake.c,222 :: 		}}
L_snake127:
;snake.c,218 :: 		if((y==yRandom[j])&&(x==xRandom[j]-i)&&(flag_food[j]==1))  {size_snake+=5;flag_food[j]=0;exit++; if(exit==3)
; i start address is: 8 (R2)
L__snake192:
L__snake191:
L__snake190:
;snake.c,216 :: 		for(i=0;i<10;i++)
ADDS	R0, R2, #1
; i end address is: 8 (R2)
; i start address is: 0 (R0)
;snake.c,223 :: 		}
UXTB	R2, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_snake121
L_snake122:
;snake.c,199 :: 		for(j=0;j<3;j++)
LDRB	R0, [SP, #8]
ADDS	R0, R0, #1
STRB	R0, [SP, #8]
;snake.c,224 :: 		}
IT	AL
BAL	L_snake109
L_snake110:
;snake.c,225 :: 		if( dofd3_flag==0)   break;
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_snake128
IT	AL
BAL	L_snake106
L_snake128:
;snake.c,226 :: 		switch(y)
IT	AL
BAL	L_snake129
;snake.c,228 :: 		case 0:     ams7();
L_snake131:
BL	_ams7+0
;snake.c,229 :: 		y=320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
STRH	R1, [R0, #0]
;snake.c,230 :: 		draw(size_snake);
MOVW	R0, #lo_addr(_size_snake+0)
MOVT	R0, #hi_addr(_size_snake+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;snake.c,231 :: 		break;
IT	AL
BAL	L_snake130
;snake.c,232 :: 		default:    ams7();
L_snake132:
BL	_ams7+0
;snake.c,233 :: 		y-=1;
MOVW	R1, #lo_addr(_y+0)
MOVT	R1, #hi_addr(_y+0)
LDRH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;snake.c,234 :: 		draw(size_snake);
MOVW	R0, #lo_addr(_size_snake+0)
MOVT	R0, #hi_addr(_size_snake+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;snake.c,235 :: 		break;
IT	AL
BAL	L_snake130
;snake.c,236 :: 		}
L_snake129:
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_snake131
IT	AL
BAL	L_snake132
L_snake130:
;snake.c,237 :: 		Delay_ms(5);
MOVW	R7, #26665
MOVT	R7, #0
NOP
NOP
L_snake133:
SUBS	R7, R7, #1
BNE	L_snake133
NOP
NOP
;snake.c,239 :: 		}
IT	AL
BAL	L_snake105
L_snake106:
;snake.c,197 :: 		while(Button(&GPIOA_IDR,6,delay_time,active_stateJ)==0&& Button(&GPIOD_IDR,2,delay_time,active_stateJ)==0 &&Button(&GPIOB_IDR,5,delay_time,active_stateJ)==0)
L__snake195:
L__snake194:
L__snake193:
;snake.c,240 :: 		}
L_snake104:
L_snake103:
L_snake70:
L_snake39:
;snake.c,241 :: 		}
IT	AL
BAL	L_snake6
L_snake7:
;snake.c,246 :: 		TFT_Fill_Screen(CL_Green);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;snake.c,247 :: 		TFT_Write_Text("Good job ,Bro",150,120);
MOVW	R0, #lo_addr(?lstr2_snake+0)
MOVT	R0, #hi_addr(?lstr2_snake+0)
MOVS	R2, #120
MOVS	R1, #150
BL	_TFT_Write_Text+0
;snake.c,248 :: 		size_snake=20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_size_snake+0)
MOVT	R0, #hi_addr(_size_snake+0)
STRB	R1, [R0, #0]
;snake.c,249 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;snake.c,250 :: 		x_tft=500;
MOVW	R1, #500
SXTH	R1, R1
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
STRH	R1, [R0, #0]
;snake.c,251 :: 		y_tft=500;
MOVW	R1, #500
SXTH	R1, R1
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
STRH	R1, [R0, #0]
;snake.c,252 :: 		after_snake();
BL	_after_snake+0
;snake.c,253 :: 		}
L_end_snake:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _snake
_after_snake:
;snake.c,258 :: 		void after_snake()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;snake.c,260 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_after_snake135:
SUBS	R7, R7, #1
BNE	L_after_snake135
NOP
NOP
;snake.c,261 :: 		TFT_Fill_Screen(CL_Yellow);
MOVW	R0, #65504
BL	_TFT_Fill_Screen+0
;snake.c,262 :: 		TFT_Write_Text("again",120,60);
MOVW	R0, #lo_addr(?lstr3_snake+0)
MOVT	R0, #hi_addr(?lstr3_snake+0)
MOVS	R2, #60
MOVS	R1, #120
BL	_TFT_Write_Text+0
;snake.c,263 :: 		TFT_Write_Text("Back to games",120,180);
MOVW	R0, #lo_addr(?lstr4_snake+0)
MOVT	R0, #hi_addr(?lstr4_snake+0)
MOVS	R2, #180
MOVS	R1, #120
BL	_TFT_Write_Text+0
;snake.c,264 :: 		TFT_Line(0,120,320,120);
MOVS	R3, #120
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #120
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;snake.c,265 :: 		while(x_tft==500&&y_tft==500)
L_after_snake137:
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #500
IT	NE
BNE	L__after_snake147
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #500
IT	NE
BNE	L__after_snake146
L__after_snake145:
;snake.c,267 :: 		if(TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_after_snake141
;snake.c,269 :: 		TP_TFT_Get_Coordinates(&x_tft,&y_tft);
MOVW	R1, #lo_addr(_y_tft+0)
MOVT	R1, #hi_addr(_y_tft+0)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
BL	_TP_TFT_Get_Coordinates+0
;snake.c,270 :: 		}
L_after_snake141:
;snake.c,271 :: 		}
IT	AL
BAL	L_after_snake137
;snake.c,265 :: 		while(x_tft==500&&y_tft==500)
L__after_snake147:
L__after_snake146:
;snake.c,272 :: 		if(y_tft<120)
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #120
IT	GE
BGE	L_after_snake142
;snake.c,274 :: 		dofd3_flag  =1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dofd3_flag+0)
MOVT	R0, #hi_addr(_dofd3_flag+0)
STRB	R1, [R0, #0]
;snake.c,275 :: 		snake();
BL	_snake+0
;snake.c,276 :: 		}
IT	AL
BAL	L_after_snake143
L_after_snake142:
;snake.c,277 :: 		else if(y_tft>120)
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRSH	R0, [R0, #0]
CMP	R0, #120
IT	LE
BLE	L_after_snake144
;snake.c,278 :: 		Games_Module();
BL	_Games_Module+0
L_after_snake144:
L_after_snake143:
;snake.c,281 :: 		}
L_end_after_snake:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _after_snake
