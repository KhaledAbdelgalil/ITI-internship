_main:
;typedef.c,8 :: 		void main()
;typedef.c,11 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;typedef.c,12 :: 		GPIOD_ODR=sizeof (long int);
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;typedef.c,14 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
