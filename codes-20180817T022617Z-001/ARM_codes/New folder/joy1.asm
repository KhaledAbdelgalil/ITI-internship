_main:
;joy1.c,2 :: 		void main()
;joy1.c,6 :: 		GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_GPIO_Digital_Output+0
;joy1.c,7 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;joy1.c,8 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;joy1.c,9 :: 		ADC1_Init();
BL	_ADC1_Init+0
;joy1.c,10 :: 		while(1){
L_main0:
;joy1.c,12 :: 		value= ADC1_Get_Sample(3);
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
; value start address is: 4 (R1)
UXTH	R1, R0
;joy1.c,13 :: 		GPIOD_ODR=value;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joy1.c,14 :: 		delay_ms(100);
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
;joy1.c,15 :: 		}
IT	AL
BAL	L_main0
; value end address is: 4 (R1)
;joy1.c,22 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_play:
;joy1.c,24 :: 		void play(float Duty,float freq)
; freq start address is: 4 (R1)
; Duty start address is: 0 (R0)
VMOV.F32	S2, S0
VMOV.F32	S3, S1
; freq end address is: 4 (R1)
; Duty end address is: 0 (R0)
; Duty start address is: 8 (R2)
; freq start address is: 12 (R3)
;joy1.c,30 :: 		x=0;
; x start address is: 0 (R0)
MOVS	R0, #0
;joy1.c,31 :: 		time=1/freq;
VMOV.F32	S0, #1
VDIV.F32	S1, S0, S3
; freq end address is: 12 (R3)
;joy1.c,34 :: 		time*=1000000;
MOVW	R2, #9216
MOVT	R2, #18804
VMOV	S0, R2
VMUL.F32	S1, S1, S0
;joy1.c,36 :: 		timeON=Duty*time;
VMUL.F32	S0, S2, S1
; Duty end address is: 8 (R2)
; timeON start address is: 8 (R2)
VMOV.F32	S2, S0
;joy1.c,37 :: 		timeOFF =(time-timeON);
VSUB.F32	S1, S1, S0
; timeOFF start address is: 4 (R1)
; timeON end address is: 8 (R2)
; timeOFF end address is: 4 (R1)
; x end address is: 0 (R0)
;joy1.c,39 :: 		while(x<=timeON)
L_play4:
; timeOFF start address is: 4 (R1)
; timeON start address is: 8 (R2)
; x start address is: 0 (R0)
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VCMPE.F32	S0, S2
VMRS	#60, FPSCR
IT	GT
BGT	L_play5
;joy1.c,41 :: 		x+=10;
ADDS	R0, #10
;joy1.c,42 :: 		GPIOE_ODR=0x4000;
MOVW	R3, #16384
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;joy1.c,43 :: 		Delay_us(10);
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
;joy1.c,44 :: 		}
; timeON end address is: 8 (R2)
; x end address is: 0 (R0)
IT	AL
BAL	L_play4
L_play5:
;joy1.c,45 :: 		x=0;
; x start address is: 0 (R0)
MOVS	R0, #0
; timeOFF end address is: 4 (R1)
; x end address is: 0 (R0)
;joy1.c,46 :: 		while(x<=timeOFF)
L_play8:
; x start address is: 0 (R0)
; timeOFF start address is: 4 (R1)
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GT
BGT	L_play9
;joy1.c,48 :: 		x+=10;
ADDS	R0, #10
;joy1.c,49 :: 		GPIOE_ODR=0x0000;
MOVS	R3, #0
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;joy1.c,50 :: 		Delay_us(10);
MOVW	R7, #51
MOVT	R7, #0
NOP
NOP
L_play10:
SUBS	R7, R7, #1
BNE	L_play10
NOP
NOP
NOP
NOP
;joy1.c,51 :: 		}
; timeOFF end address is: 4 (R1)
; x end address is: 0 (R0)
IT	AL
BAL	L_play8
L_play9:
;joy1.c,53 :: 		}
L_end_play:
BX	LR
; end of _play
