_main:
;buzzer.c,19 :: 		void main()
SUB	SP, SP, #8
;buzzer.c,22 :: 		u8 R=0;
;buzzer.c,23 :: 		u8 L=0;
;buzzer.c,24 :: 		u8 U=0;
;buzzer.c,25 :: 		u8 D=0;
;buzzer.c,26 :: 		u8 value=0;
;buzzer.c,27 :: 		u16 _step_x=1;
;buzzer.c,28 :: 		u16 _step_y=3;
;buzzer.c,29 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;buzzer.c,30 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;buzzer.c,31 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;buzzer.c,32 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;buzzer.c,33 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;buzzer.c,34 :: 		TFT_Init_ILI9341_8bit(320,240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;buzzer.c,35 :: 		TFT_Fill_Screen(CL_RED);
MOVW	R0, #63488
BL	_TFT_Fill_Screen+0
;buzzer.c,37 :: 		TFT_Write_Text("let's play",150,120);
MOVW	R0, #lo_addr(?lstr1_buzzer+0)
MOVT	R0, #hi_addr(?lstr1_buzzer+0)
MOVS	R2, #120
MOVS	R1, #150
BL	_TFT_Write_Text+0
;buzzer.c,38 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
NOP
;buzzer.c,39 :: 		TFT_Fill_Screen(CL_RED);
MOVW	R0, #63488
BL	_TFT_Fill_Screen+0
;buzzer.c,41 :: 		TFT_Set_Pen(CL_GRAY,10);
MOVS	R1, #10
MOVW	R0, #33808
BL	_TFT_Set_Pen+0
;buzzer.c,42 :: 		TFT_Circle(x, y, 0);
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
SXTH	R2, R2
BL	_TFT_Circle+0
;buzzer.c,43 :: 		_step_x=rand()/8000;
BL	_rand+0
MOVW	R1, #8000
SXTH	R1, R1
SDIV	R0, R0, R1
STRH	R0, [SP, #2]
;buzzer.c,44 :: 		_step_y=rand()/8000;
BL	_rand+0
MOVW	R1, #8000
SXTH	R1, R1
SDIV	R0, R0, R1
STRH	R0, [SP, #4]
;buzzer.c,45 :: 		while(1)
L_main2:
;buzzer.c,48 :: 		if(x>=320)
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, #320
IT	CC
BCC	L_main4
;buzzer.c,50 :: 		ams7();
BL	_ams7+0
;buzzer.c,51 :: 		_step_x=-_step_x;
LDRH	R0, [SP, #2]
RSBS	R0, R0, #0
STRH	R0, [SP, #2]
;buzzer.c,53 :: 		}
L_main4:
;buzzer.c,54 :: 		if(x<=0)
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	HI
BHI	L_main5
;buzzer.c,56 :: 		ams7();
BL	_ams7+0
;buzzer.c,57 :: 		_step_x =-_step_x;
LDRH	R0, [SP, #2]
RSBS	R0, R0, #0
STRH	R0, [SP, #2]
;buzzer.c,58 :: 		}
L_main5:
;buzzer.c,61 :: 		if(y>=320)
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, #320
IT	CC
BCC	L_main6
;buzzer.c,63 :: 		ams7();
BL	_ams7+0
;buzzer.c,64 :: 		_step_y=-_step_y;
LDRH	R0, [SP, #4]
RSBS	R0, R0, #0
STRH	R0, [SP, #4]
;buzzer.c,65 :: 		}
L_main6:
;buzzer.c,66 :: 		if(y<=0)
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	HI
BHI	L_main7
;buzzer.c,68 :: 		ams7();
BL	_ams7+0
;buzzer.c,69 :: 		_step_y=-_step_y;
LDRH	R0, [SP, #4]
RSBS	R0, R0, #0
STRH	R0, [SP, #4]
;buzzer.c,70 :: 		}
L_main7:
;buzzer.c,72 :: 		ams7();
BL	_ams7+0
;buzzer.c,73 :: 		x+=_step_x;
LDRH	R2, [SP, #2]
MOVW	R1, #lo_addr(_x+0)
MOVT	R1, #hi_addr(_x+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, R2
STRH	R0, [R1, #0]
;buzzer.c,74 :: 		y+=_step_y;
LDRH	R2, [SP, #4]
MOVW	R1, #lo_addr(_y+0)
MOVT	R1, #hi_addr(_y+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, R2
STRH	R0, [R1, #0]
;buzzer.c,75 :: 		draw(flag);
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;buzzer.c,77 :: 		_step_x=rand()/800;
BL	_rand+0
MOVW	R1, #800
SXTH	R1, R1
SDIV	R0, R0, R1
STRH	R0, [SP, #2]
;buzzer.c,78 :: 		_step_y=rand()/800;
BL	_rand+0
MOVW	R1, #800
SXTH	R1, R1
SDIV	R0, R0, R1
STRH	R0, [SP, #4]
;buzzer.c,81 :: 		R=Button(&GPIOA_IDR,6,delay_time,active_stateJ);
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
; R start address is: 24 (R6)
UXTB	R6, R0
;buzzer.c,82 :: 		L=Button(&GPIOD_IDR,2,delay_time,active_stateJ);
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
; L start address is: 32 (R8)
UXTB	R8, R0
;buzzer.c,83 :: 		U=Button(&GPIOD_IDR,4,delay_time,active_stateJ);
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
; U start address is: 36 (R9)
UXTB	R9, R0
;buzzer.c,84 :: 		D=Button(&GPIOB_IDR,5,delay_time,active_stateJ);
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
; D start address is: 40 (R10)
UXTB	R10, R0
;buzzer.c,85 :: 		value= Button(&GPIOB_IDR,0,delay_time,active_stateB);
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
STRB	R0, [SP, #0]
;buzzer.c,87 :: 		if(R==255)
CMP	R6, #255
IT	NE
BNE	L_main8
; R end address is: 24 (R6)
; L end address is: 32 (R8)
; U end address is: 36 (R9)
; D end address is: 40 (R10)
;buzzer.c,89 :: 		switch(x)
IT	AL
BAL	L_main9
;buzzer.c,91 :: 		case 320:   ams7();
L_main11:
BL	_ams7+0
;buzzer.c,92 :: 		x=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
STRH	R1, [R0, #0]
;buzzer.c,93 :: 		draw(flag);
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;buzzer.c,94 :: 		break;
IT	AL
BAL	L_main10
;buzzer.c,95 :: 		default:    ams7();
L_main12:
BL	_ams7+0
;buzzer.c,96 :: 		x+=20;
MOVW	R1, #lo_addr(_x+0)
MOVT	R1, #hi_addr(_x+0)
LDRH	R0, [R1, #0]
ADDS	R0, #20
STRH	R0, [R1, #0]
;buzzer.c,97 :: 		draw(flag);
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;buzzer.c,98 :: 		break;
IT	AL
BAL	L_main10
;buzzer.c,99 :: 		}
L_main9:
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, #320
IT	EQ
BEQ	L_main11
IT	AL
BAL	L_main12
L_main10:
;buzzer.c,101 :: 		}
IT	AL
BAL	L_main13
L_main8:
;buzzer.c,102 :: 		else if(L==255)
; D start address is: 40 (R10)
; U start address is: 36 (R9)
; L start address is: 32 (R8)
CMP	R8, #255
IT	NE
BNE	L_main14
; L end address is: 32 (R8)
; U end address is: 36 (R9)
; D end address is: 40 (R10)
;buzzer.c,104 :: 		switch(x)
IT	AL
BAL	L_main15
;buzzer.c,106 :: 		case 0:     ams7();
L_main17:
BL	_ams7+0
;buzzer.c,107 :: 		x=320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
STRH	R1, [R0, #0]
;buzzer.c,108 :: 		draw(flag);
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;buzzer.c,109 :: 		break;
IT	AL
BAL	L_main16
;buzzer.c,110 :: 		default:    ams7();
L_main18:
BL	_ams7+0
;buzzer.c,111 :: 		x-=20;
MOVW	R1, #lo_addr(_x+0)
MOVT	R1, #hi_addr(_x+0)
LDRH	R0, [R1, #0]
SUBS	R0, #20
STRH	R0, [R1, #0]
;buzzer.c,112 :: 		draw(flag);
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;buzzer.c,113 :: 		break;
IT	AL
BAL	L_main16
;buzzer.c,114 :: 		}
L_main15:
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main17
IT	AL
BAL	L_main18
L_main16:
;buzzer.c,115 :: 		}
IT	AL
BAL	L_main19
L_main14:
;buzzer.c,116 :: 		else if(D==255)
; D start address is: 40 (R10)
; U start address is: 36 (R9)
CMP	R10, #255
IT	NE
BNE	L_main20
; U end address is: 36 (R9)
; D end address is: 40 (R10)
;buzzer.c,118 :: 		switch(y)
IT	AL
BAL	L_main21
;buzzer.c,120 :: 		case 320:   ams7();
L_main23:
BL	_ams7+0
;buzzer.c,121 :: 		y=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
STRH	R1, [R0, #0]
;buzzer.c,122 :: 		draw(flag);
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;buzzer.c,123 :: 		break;
IT	AL
BAL	L_main22
;buzzer.c,124 :: 		default:    ams7();
L_main24:
BL	_ams7+0
;buzzer.c,125 :: 		y+=20;
MOVW	R1, #lo_addr(_y+0)
MOVT	R1, #hi_addr(_y+0)
LDRH	R0, [R1, #0]
ADDS	R0, #20
STRH	R0, [R1, #0]
;buzzer.c,126 :: 		draw(flag);
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;buzzer.c,127 :: 		break;
IT	AL
BAL	L_main22
;buzzer.c,128 :: 		}
L_main21:
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, #320
IT	EQ
BEQ	L_main23
IT	AL
BAL	L_main24
L_main22:
;buzzer.c,129 :: 		}
IT	AL
BAL	L_main25
L_main20:
;buzzer.c,130 :: 		else if(U==255)
; U start address is: 36 (R9)
CMP	R9, #255
IT	NE
BNE	L_main26
; U end address is: 36 (R9)
;buzzer.c,132 :: 		switch(y)
IT	AL
BAL	L_main27
;buzzer.c,134 :: 		case 0:     ams7();
L_main29:
BL	_ams7+0
;buzzer.c,135 :: 		y=320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
STRH	R1, [R0, #0]
;buzzer.c,136 :: 		draw(flag);
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;buzzer.c,137 :: 		break;
IT	AL
BAL	L_main28
;buzzer.c,138 :: 		default:    ams7();
L_main30:
BL	_ams7+0
;buzzer.c,139 :: 		y-=20;
MOVW	R1, #lo_addr(_y+0)
MOVT	R1, #hi_addr(_y+0)
LDRH	R0, [R1, #0]
SUBS	R0, #20
STRH	R0, [R1, #0]
;buzzer.c,140 :: 		draw(flag);
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
LDRB	R0, [R0, #0]
BL	_draw+0
;buzzer.c,141 :: 		break;
IT	AL
BAL	L_main28
;buzzer.c,142 :: 		}
L_main27:
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main29
IT	AL
BAL	L_main30
L_main28:
;buzzer.c,143 :: 		}
L_main26:
L_main25:
L_main19:
L_main13:
;buzzer.c,145 :: 		if(value==255)
LDRB	R0, [SP, #0]
CMP	R0, #255
IT	NE
BNE	L_main31
;buzzer.c,147 :: 		switch(flag)
IT	AL
BAL	L_main32
;buzzer.c,150 :: 		case 0:
L_main34:
;buzzer.c,151 :: 		TFT_Set_Pen(CL_BLACK,10);
MOVS	R1, #10
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;buzzer.c,152 :: 		TFT_Circle(x, y, 0);
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
SXTH	R2, R2
BL	_TFT_Circle+0
;buzzer.c,153 :: 		flag=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
STRB	R1, [R0, #0]
;buzzer.c,154 :: 		break ;
IT	AL
BAL	L_main33
;buzzer.c,155 :: 		case 1:
L_main35:
;buzzer.c,156 :: 		TFT_Set_Pen(CL_GRAY,10);
MOVS	R1, #10
MOVW	R0, #33808
BL	_TFT_Set_Pen+0
;buzzer.c,157 :: 		TFT_Circle(x, y, 0);
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
SXTH	R2, R2
BL	_TFT_Circle+0
;buzzer.c,158 :: 		flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
STRB	R1, [R0, #0]
;buzzer.c,159 :: 		break ;
IT	AL
BAL	L_main33
;buzzer.c,161 :: 		}
L_main32:
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main34
MOVW	R0, #lo_addr(_flag+0)
MOVT	R0, #hi_addr(_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_main35
L_main33:
;buzzer.c,163 :: 		}
L_main31:
;buzzer.c,165 :: 		}
IT	AL
BAL	L_main2
;buzzer.c,212 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_draw:
;buzzer.c,214 :: 		void draw(u8 flag)
; flag start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; flag end address is: 0 (R0)
; flag start address is: 0 (R0)
;buzzer.c,216 :: 		if (flag==1)
CMP	R0, #1
IT	NE
BNE	L_draw36
; flag end address is: 0 (R0)
;buzzer.c,218 :: 		TFT_Set_Pen(CL_BLACK,10);
MOVS	R1, #10
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;buzzer.c,219 :: 		TFT_Circle(x, y, 0);
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
;buzzer.c,220 :: 		}
IT	AL
BAL	L_draw37
L_draw36:
;buzzer.c,223 :: 		TFT_Set_Pen(CL_GRAY,10);
MOVS	R1, #10
MOVW	R0, #33808
BL	_TFT_Set_Pen+0
;buzzer.c,224 :: 		TFT_Circle(x, y, 0);
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
;buzzer.c,225 :: 		}
L_draw37:
;buzzer.c,227 :: 		}
L_end_draw:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _draw
_ams7:
;buzzer.c,229 :: 		void ams7()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;buzzer.c,231 :: 		TFT_Set_Pen(CL_RED,10);
MOVS	R1, #10
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;buzzer.c,232 :: 		TFT_Circle(x, y, 0);
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
SXTH	R2, R2
BL	_TFT_Circle+0
;buzzer.c,233 :: 		}
L_end_ams7:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ams7
