_main:
;tagroba.c,1 :: 		void main()
;tagroba.c,4 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;tagroba.c,5 :: 		GPIOD_ODR=sizeof(unsigned long int );
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;tagroba.c,7 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
