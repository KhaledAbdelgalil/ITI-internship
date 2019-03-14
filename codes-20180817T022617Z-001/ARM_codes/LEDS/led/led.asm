_main:
;led.c,3 :: 		void main() {
;led.c,4 :: 		GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
BL	_GPIO_Digital_Output+0
;led.c,5 :: 		GPIO_Digital_Output(&GPIOB_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
BL	_GPIO_Digital_Output+0
;led.c,6 :: 		GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;led.c,7 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;led.c,8 :: 		GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_GPIO_Digital_Output+0
;led.c,9 :: 		GPIOA_ODR = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;led.c,10 :: 		GPIOB_ODR = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;led.c,11 :: 		GPIOC_ODR = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;led.c,12 :: 		GPIOD_ODR = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;led.c,13 :: 		GPIOE_ODR = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;led.c,14 :: 		while(1)
L_main0:
;led.c,16 :: 		GPIOA_ODR = ~GPIOA_ODR;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;led.c,17 :: 		GPIOB_ODR = ~GPIOB_ODR;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R0, #0]
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;led.c,18 :: 		GPIOC_ODR = ~GPIOC_ODR;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;led.c,19 :: 		GPIOD_ODR = ~GPIOD_ODR;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;led.c,20 :: 		GPIOE_ODR = ~GPIOE_ODR;
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;led.c,21 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
;led.c,22 :: 		}
IT	AL
BAL	L_main0
;led.c,32 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
