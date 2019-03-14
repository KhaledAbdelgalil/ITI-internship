_main:
;joystick2.c,5 :: 		void main()
;joystick2.c,8 :: 		char value1=0;
;joystick2.c,9 :: 		char value2=0;
;joystick2.c,10 :: 		char port='D';
;joystick2.c,11 :: 		char R=0;
;joystick2.c,12 :: 		char L=0;
;joystick2.c,13 :: 		char U=0;
;joystick2.c,14 :: 		char D=0;
;joystick2.c,16 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;joystick2.c,17 :: 		GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;joystick2.c,18 :: 		GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
BL	_GPIO_Digital_Output+0
;joystick2.c,19 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;joystick2.c,20 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;joystick2.c,21 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;joystick2.c,22 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;joystick2.c,23 :: 		GPIOD_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick2.c,26 :: 		while(1)
L_main0:
;joystick2.c,28 :: 		R=Button(&GPIOA_IDR,6,delay_time,active_stateJ);
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
;joystick2.c,29 :: 		L=Button(&GPIOD_IDR,2,delay_time,active_stateJ);
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
;joystick2.c,30 :: 		U=Button(&GPIOD_IDR,4,delay_time,active_stateJ);
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
; U start address is: 24 (R6)
UXTB	R6, R0
;joystick2.c,31 :: 		D=Button(&GPIOB_IDR,5,delay_time,active_stateJ);
MOVS	R3, #0
MOVS	R2, #100
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
;joystick2.c,33 :: 		if(U==255&&GPIOD_ODR==8)
CMP	R6, #255
IT	NE
BNE	L__main13
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #8
IT	NE
BNE	L__main12
L__main11:
;joystick2.c,35 :: 		GPIOD_ODR=8;
MOVS	R1, #8
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick2.c,36 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_main5:
SUBS	R7, R7, #1
BNE	L_main5
NOP
NOP
;joystick2.c,37 :: 		GPIOD_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick2.c,38 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_main7:
SUBS	R7, R7, #1
BNE	L_main7
NOP
NOP
;joystick2.c,39 :: 		}
IT	AL
BAL	L_main9
;joystick2.c,33 :: 		if(U==255&&GPIOD_ODR==8)
L__main13:
L__main12:
;joystick2.c,40 :: 		else if(U==0)  GPIOD_ODR<<=GPIOD_ODR;
CMP	R6, #0
IT	NE
BNE	L_main10
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSL	R1, R0, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
L_main10:
L_main9:
;joystick2.c,42 :: 		}
IT	AL
BAL	L_main0
; U end address is: 24 (R6)
;joystick2.c,43 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
