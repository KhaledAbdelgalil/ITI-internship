_main:
;ledshift.c,1 :: 		void main()
;ledshift.c,3 :: 		char value1=0;
;ledshift.c,4 :: 		char value2=0;
;ledshift.c,5 :: 		char port='D';
; port start address is: 44 (R11)
MOVW	R11, #68
;ledshift.c,6 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;ledshift.c,7 :: 		GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;ledshift.c,8 :: 		GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
BL	_GPIO_Digital_Output+0
;ledshift.c,9 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;ledshift.c,10 :: 		GPIOD_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
; port end address is: 44 (R11)
UXTB	R0, R11
;ledshift.c,11 :: 		while(1)
L_main0:
;ledshift.c,13 :: 		while(port=='D')
; port start address is: 0 (R0)
; port end address is: 0 (R0)
L_main2:
; port start address is: 0 (R0)
CMP	R0, #68
IT	NE
BNE	L_main3
;ledshift.c,17 :: 		}
IT	AL
BAL	L_main2
L_main3:
;ledshift.c,19 :: 		}
; port end address is: 0 (R0)
IT	AL
BAL	L_main0
;ledshift.c,20 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
