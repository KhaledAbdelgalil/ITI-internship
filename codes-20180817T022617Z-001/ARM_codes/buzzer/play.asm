_play:
;play.c,1 :: 		void play(float Duty,float freq)
; freq start address is: 4 (R1)
; Duty start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R8, R0
; freq end address is: 4 (R1)
; Duty end address is: 0 (R0)
; Duty start address is: 32 (R8)
; freq start address is: 4 (R1)
;play.c,7 :: 		x=0;
; x start address is: 36 (R9)
MOVW	R9, #0
;play.c,8 :: 		time=1/freq;
MOV	R0, #1065353216
MOV	R2, R1
BL	__Div_FP+0
; freq end address is: 4 (R1)
;play.c,11 :: 		time*=1000000;
MOVW	R2, #9216
MOVT	R2, #18804
BL	__Mul_FP+0
; time start address is: 40 (R10)
MOV	R10, R0
;play.c,13 :: 		timeON=Duty*time;
MOV	R2, R8
BL	__Mul_FP+0
; Duty end address is: 32 (R8)
STR	R0, [SP, #8]
STR	R0, [SP, #4]
LDR	R0, [SP, #8]
; timeON start address is: 44 (R11)
MOV	R11, R0
LDR	R0, [SP, #4]
;play.c,14 :: 		timeOFF =(time-timeON);
STR	R1, [SP, #4]
LDR	R1, [SP, #8]
MOV	R2, R1
MOV	R0, R10
BL	__Sub_FP+0
; time end address is: 40 (R10)
LDR	R1, [SP, #4]
; timeOFF start address is: 20 (R5)
MOV	R5, R0
; x end address is: 36 (R9)
; timeON end address is: 44 (R11)
; timeOFF end address is: 20 (R5)
MOV	R3, R9
MOV	R6, R11
;play.c,16 :: 		while(x<=timeON)
L_play0:
; timeOFF start address is: 20 (R5)
; timeON start address is: 24 (R6)
; x start address is: 12 (R3)
MOV	R0, R3
BL	__UnsignedIntegralToFloat+0
MOV	R2, R6
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__play9
MOVS	R0, #1
L__play9:
CMP	R0, #0
IT	EQ
BEQ	L_play1
;play.c,18 :: 		x+=10;
ADDW	R0, R3, #10
; x end address is: 12 (R3)
; x start address is: 0 (R0)
;play.c,19 :: 		GPIOE_ODR=0x4000;
MOVW	R3, #16384
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;play.c,20 :: 		Delay_us(10);
MOVW	R7, #51
MOVT	R7, #0
NOP
NOP
L_play2:
SUBS	R7, R7, #1
BNE	L_play2
NOP
NOP
NOP
NOP
;play.c,21 :: 		}
MOV	R3, R0
; timeON end address is: 24 (R6)
; x end address is: 0 (R0)
IT	AL
BAL	L_play0
L_play1:
;play.c,22 :: 		x=0;
; x start address is: 12 (R3)
MOVS	R3, #0
; x end address is: 12 (R3)
; timeOFF end address is: 20 (R5)
;play.c,23 :: 		while(x<=timeOFF)
L_play4:
; x start address is: 12 (R3)
; timeOFF start address is: 20 (R5)
MOV	R0, R3
BL	__UnsignedIntegralToFloat+0
MOV	R2, R5
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__play10
MOVS	R0, #1
L__play10:
CMP	R0, #0
IT	EQ
BEQ	L_play5
;play.c,25 :: 		x+=10;
ADDW	R2, R3, #10
; x end address is: 12 (R3)
; x start address is: 0 (R0)
MOV	R0, R2
;play.c,26 :: 		GPIOE_ODR=0x0000;
MOVS	R3, #0
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;play.c,27 :: 		Delay_us(10);
MOVW	R7, #51
MOVT	R7, #0
NOP
NOP
L_play6:
SUBS	R7, R7, #1
BNE	L_play6
NOP
NOP
NOP
NOP
;play.c,28 :: 		}
; timeOFF end address is: 20 (R5)
; x end address is: 0 (R0)
MOV	R3, R0
IT	AL
BAL	L_play4
L_play5:
;play.c,30 :: 		}
L_end_play:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _play
