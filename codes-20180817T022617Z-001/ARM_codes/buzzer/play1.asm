_play:
;play1.c,1 :: 		void play(float Duty,float freq)
; freq start address is: 4 (R1)
; Duty start address is: 0 (R0)
VMOV.F32	S2, S0
VMOV.F32	S3, S1
; freq end address is: 4 (R1)
; Duty end address is: 0 (R0)
; Duty start address is: 8 (R2)
; freq start address is: 12 (R3)
;play1.c,7 :: 		x=0;
; x start address is: 0 (R0)
MOVS	R0, #0
;play1.c,8 :: 		time=1/freq;
VMOV.F32	S0, #1
VDIV.F32	S1, S0, S3
; freq end address is: 12 (R3)
;play1.c,11 :: 		time*=1000000;
MOVW	R2, #9216
MOVT	R2, #18804
VMOV	S0, R2
VMUL.F32	S1, S1, S0
;play1.c,13 :: 		timeON=Duty*time;
VMUL.F32	S0, S2, S1
; Duty end address is: 8 (R2)
; timeON start address is: 8 (R2)
VMOV.F32	S2, S0
;play1.c,14 :: 		timeOFF =(time-timeON);
VSUB.F32	S1, S1, S0
; timeOFF start address is: 4 (R1)
; timeON end address is: 8 (R2)
; timeOFF end address is: 4 (R1)
; x end address is: 0 (R0)
;play1.c,16 :: 		while(x<=timeON)
L_play0:
; timeOFF start address is: 4 (R1)
; timeON start address is: 8 (R2)
; x start address is: 0 (R0)
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VCMPE.F32	S0, S2
VMRS	#60, FPSCR
IT	GT
BGT	L_play1
;play1.c,18 :: 		x+=10;
ADDS	R0, #10
;play1.c,19 :: 		GPIOE_ODR=0x4000;
MOVW	R3, #16384
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;play1.c,20 :: 		Delay_us(10);
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
;play1.c,21 :: 		}
; timeON end address is: 8 (R2)
; x end address is: 0 (R0)
IT	AL
BAL	L_play0
L_play1:
;play1.c,22 :: 		x=0;
; x start address is: 0 (R0)
MOVS	R0, #0
; timeOFF end address is: 4 (R1)
; x end address is: 0 (R0)
;play1.c,23 :: 		while(x<=timeOFF)
L_play4:
; x start address is: 0 (R0)
; timeOFF start address is: 4 (R1)
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GT
BGT	L_play5
;play1.c,25 :: 		x+=10;
ADDS	R0, #10
;play1.c,26 :: 		GPIOE_ODR=0x0000;
MOVS	R3, #0
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;play1.c,27 :: 		Delay_us(10);
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
;play1.c,28 :: 		}
; timeOFF end address is: 4 (R1)
; x end address is: 0 (R0)
IT	AL
BAL	L_play4
L_play5:
;play1.c,30 :: 		}
L_end_play:
BX	LR
; end of _play
