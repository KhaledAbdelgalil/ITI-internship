_main:
;led4.c,75 :: 		void main()
;led4.c,78 :: 		char value1=0;
;led4.c,79 :: 		char value2=0;
;led4.c,80 :: 		char port='D';
; port start address is: 44 (R11)
MOVW	R11, #68
;led4.c,81 :: 		char R=0;
;led4.c,82 :: 		char L=0;
;led4.c,83 :: 		char U=0;
;led4.c,84 :: 		char D=0;
;led4.c,86 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;led4.c,87 :: 		GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;led4.c,88 :: 		GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
BL	_GPIO_Digital_Output+0
;led4.c,89 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;led4.c,90 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;led4.c,91 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;led4.c,92 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;led4.c,93 :: 		GPIOD_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
; port end address is: 44 (R11)
UXTB	R6, R11
;led4.c,95 :: 		while(1)
L_main0:
;led4.c,97 :: 		value1=Button(&GPIOB_IDR,0,delay_time , active_state);
; port start address is: 24 (R6)
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
; value1 start address is: 32 (R8)
UXTB	R8, R0
;led4.c,98 :: 		value2=Button(&GPIOB_IDR,1,delay_time , active_state);
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
; value2 start address is: 36 (R9)
UXTB	R9, R0
;led4.c,99 :: 		R=Button(&GPIOA_IDR,6,delay_time , active_state);
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
;led4.c,100 :: 		L=Button(&GPIOD_IDR,2,delay_time , active_state);
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
;led4.c,101 :: 		U=Button(&GPIOD_IDR,4,delay_time , active_state);
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
;led4.c,102 :: 		D=Button(&GPIOB_IDR,5,delay_time , active_state);
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
;led4.c,106 :: 		if (U=255&&( GPIOA_ODR==0x0008 || GPIOC_ODR==0x0008 || GPIOD_ODR==0x0008))
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L__main94
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L__main93
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L__main92
IT	AL
BAL	L_main6
L__main94:
L__main93:
L__main92:
L__main90:
;led4.c,108 :: 		if(port=='D') flashing('D',4);
CMP	R6, #68
IT	NE
BNE	L_main7
MOVS	R1, #4
MOVS	R0, #68
BL	_flashing+0
IT	AL
BAL	L_main8
L_main7:
;led4.c,109 :: 		else if(port=='C') flashing('C',4);
CMP	R6, #67
IT	NE
BNE	L_main9
MOVS	R1, #4
MOVS	R0, #67
BL	_flashing+0
IT	AL
BAL	L_main10
L_main9:
;led4.c,110 :: 		else if(port=='A') flashing('A',4);
CMP	R6, #65
IT	NE
BNE	L_main11
MOVS	R1, #4
MOVS	R0, #65
BL	_flashing+0
L_main11:
L_main10:
L_main8:
;led4.c,111 :: 		}
L_main6:
;led4.c,116 :: 		if(value2==255 && port=='D' && GPIOD_ODR==1)
CMP	R9, #255
IT	NE
BNE	L__main97
CMP	R6, #68
IT	NE
BNE	L__main96
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__main95
; value1 end address is: 32 (R8)
; value2 end address is: 36 (R9)
; port end address is: 24 (R6)
L__main89:
;led4.c,118 :: 		port='A';
; port start address is: 8 (R2)
MOVS	R2, #65
;led4.c,119 :: 		GPIOA_ODR=0x8000;
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;led4.c,120 :: 		GPIOD_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;led4.c,121 :: 		}
UXTB	R6, R2
; port end address is: 8 (R2)
IT	AL
BAL	L_main15
;led4.c,116 :: 		if(value2==255 && port=='D' && GPIOD_ODR==1)
L__main97:
; port start address is: 24 (R6)
; value2 start address is: 36 (R9)
; value1 start address is: 32 (R8)
L__main96:
L__main95:
;led4.c,122 :: 		else if(value2==255 && port=='C' && GPIOC_ODR==1)
CMP	R9, #255
IT	NE
BNE	L__main100
CMP	R6, #67
IT	NE
BNE	L__main99
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__main98
; value1 end address is: 32 (R8)
; value2 end address is: 36 (R9)
; port end address is: 24 (R6)
L__main88:
;led4.c,124 :: 		port='D';
; port start address is: 8 (R2)
MOVS	R2, #68
;led4.c,125 :: 		GPIOD_ODR=0x8000;
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;led4.c,126 :: 		GPIOC_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;led4.c,127 :: 		}
UXTB	R0, R2
; port end address is: 8 (R2)
IT	AL
BAL	L_main19
;led4.c,122 :: 		else if(value2==255 && port=='C' && GPIOC_ODR==1)
L__main100:
; port start address is: 24 (R6)
; value2 start address is: 36 (R9)
; value1 start address is: 32 (R8)
L__main99:
L__main98:
;led4.c,128 :: 		else if(value2==255 && port=='A' && GPIOA_ODR==1)
CMP	R9, #255
IT	NE
BNE	L__main103
CMP	R6, #65
IT	NE
BNE	L__main102
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__main101
; value1 end address is: 32 (R8)
; value2 end address is: 36 (R9)
; port end address is: 24 (R6)
L__main87:
;led4.c,130 :: 		port='C';
; port start address is: 8 (R2)
MOVS	R2, #67
;led4.c,131 :: 		GPIOC_ODR=0x2000;
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;led4.c,132 :: 		GPIOA_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;led4.c,133 :: 		}
UXTB	R0, R2
; port end address is: 8 (R2)
IT	AL
BAL	L_main23
;led4.c,128 :: 		else if(value2==255 && port=='A' && GPIOA_ODR==1)
L__main103:
; port start address is: 24 (R6)
; value2 start address is: 36 (R9)
; value1 start address is: 32 (R8)
L__main102:
L__main101:
;led4.c,136 :: 		else if(value1==255 && port=='D' && GPIOD_ODR==0x8000)
CMP	R8, #255
IT	NE
BNE	L__main106
CMP	R6, #68
IT	NE
BNE	L__main105
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #32768
IT	NE
BNE	L__main104
; value1 end address is: 32 (R8)
; value2 end address is: 36 (R9)
; port end address is: 24 (R6)
L__main86:
;led4.c,138 :: 		port='C';
; port start address is: 8 (R2)
MOVS	R2, #67
;led4.c,139 :: 		GPIOC_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;led4.c,140 :: 		GPIOD_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;led4.c,141 :: 		}
UXTB	R0, R2
; port end address is: 8 (R2)
IT	AL
BAL	L_main27
;led4.c,136 :: 		else if(value1==255 && port=='D' && GPIOD_ODR==0x8000)
L__main106:
; port start address is: 24 (R6)
; value2 start address is: 36 (R9)
; value1 start address is: 32 (R8)
L__main105:
L__main104:
;led4.c,142 :: 		else if(value1==255 && port=='C' && GPIOC_ODR==0x2000)
CMP	R8, #255
IT	NE
BNE	L__main109
CMP	R6, #67
IT	NE
BNE	L__main108
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #8192
IT	NE
BNE	L__main107
; value1 end address is: 32 (R8)
; value2 end address is: 36 (R9)
; port end address is: 24 (R6)
L__main85:
;led4.c,144 :: 		port='A';
; port start address is: 8 (R2)
MOVS	R2, #65
;led4.c,145 :: 		GPIOA_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;led4.c,146 :: 		GPIOC_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;led4.c,147 :: 		}
UXTB	R0, R2
; port end address is: 8 (R2)
IT	AL
BAL	L_main31
;led4.c,142 :: 		else if(value1==255 && port=='C' && GPIOC_ODR==0x2000)
L__main109:
; port start address is: 24 (R6)
; value2 start address is: 36 (R9)
; value1 start address is: 32 (R8)
L__main108:
L__main107:
;led4.c,148 :: 		else if(value1==255 && port=='A' && GPIOA_ODR==0x8000)
CMP	R8, #255
IT	NE
BNE	L__main112
CMP	R6, #65
IT	NE
BNE	L__main111
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #32768
IT	NE
BNE	L__main110
; value1 end address is: 32 (R8)
; value2 end address is: 36 (R9)
; port end address is: 24 (R6)
L__main84:
;led4.c,150 :: 		port='D';
; port start address is: 8 (R2)
MOVS	R2, #68
;led4.c,151 :: 		GPIOD_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;led4.c,152 :: 		GPIOA_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;led4.c,153 :: 		}
UXTB	R0, R2
; port end address is: 8 (R2)
IT	AL
BAL	L_main35
;led4.c,148 :: 		else if(value1==255 && port=='A' && GPIOA_ODR==0x8000)
L__main112:
; port start address is: 24 (R6)
; value2 start address is: 36 (R9)
; value1 start address is: 32 (R8)
L__main111:
L__main110:
;led4.c,155 :: 		else if (port=='D'&&value1==255 )
CMP	R6, #68
IT	NE
BNE	L__main114
CMP	R8, #255
IT	NE
BNE	L__main113
; value1 end address is: 32 (R8)
; value2 end address is: 36 (R9)
L__main83:
;led4.c,158 :: 		GPIOD_ODR<<=1;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
; port end address is: 24 (R6)
;led4.c,159 :: 		while(Button(&GPIOB_IDR,0,delay_time , active_state)==255) {}
L_main39:
; port start address is: 24 (R6)
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main40
IT	AL
BAL	L_main39
L_main40:
;led4.c,161 :: 		}
UXTB	R0, R6
IT	AL
BAL	L_main41
;led4.c,155 :: 		else if (port=='D'&&value1==255 )
L__main114:
; value2 start address is: 36 (R9)
; value1 start address is: 32 (R8)
L__main113:
;led4.c,163 :: 		else if (port=='D'&&value2==255)
CMP	R6, #68
IT	NE
BNE	L__main116
CMP	R9, #255
IT	NE
BNE	L__main115
; value1 end address is: 32 (R8)
; value2 end address is: 36 (R9)
L__main82:
;led4.c,164 :: 		GPIOD_ODR>>=1;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
IT	AL
BAL	L_main45
;led4.c,163 :: 		else if (port=='D'&&value2==255)
L__main116:
; value2 start address is: 36 (R9)
; value1 start address is: 32 (R8)
L__main115:
;led4.c,165 :: 		else if (port=='C'&&value1==255)
CMP	R6, #67
IT	NE
BNE	L__main118
CMP	R8, #255
IT	NE
BNE	L__main117
; value1 end address is: 32 (R8)
; value2 end address is: 36 (R9)
L__main81:
;led4.c,166 :: 		GPIOC_ODR<<=1;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
IT	AL
BAL	L_main49
;led4.c,165 :: 		else if (port=='C'&&value1==255)
L__main118:
; value2 start address is: 36 (R9)
; value1 start address is: 32 (R8)
L__main117:
;led4.c,167 :: 		else if (port=='C'&&value2==255)
CMP	R6, #67
IT	NE
BNE	L__main120
CMP	R9, #255
IT	NE
BNE	L__main119
; value1 end address is: 32 (R8)
; value2 end address is: 36 (R9)
L__main80:
;led4.c,168 :: 		GPIOC_ODR>>=1;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
IT	AL
BAL	L_main53
;led4.c,167 :: 		else if (port=='C'&&value2==255)
L__main120:
; value2 start address is: 36 (R9)
; value1 start address is: 32 (R8)
L__main119:
;led4.c,169 :: 		else if (port=='A'&&value1==255)
CMP	R6, #65
IT	NE
BNE	L__main122
CMP	R8, #255
IT	NE
BNE	L__main121
; value1 end address is: 32 (R8)
; value2 end address is: 36 (R9)
L__main79:
;led4.c,170 :: 		GPIOA_ODR<<=1;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
IT	AL
BAL	L_main57
;led4.c,169 :: 		else if (port=='A'&&value1==255)
L__main122:
; value2 start address is: 36 (R9)
L__main121:
;led4.c,171 :: 		else if (port=='A'&&value2==255)
CMP	R6, #65
IT	NE
BNE	L__main124
CMP	R9, #255
IT	NE
BNE	L__main123
; value2 end address is: 36 (R9)
L__main78:
;led4.c,172 :: 		GPIOA_ODR>>=1;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;led4.c,171 :: 		else if (port=='A'&&value2==255)
L__main124:
L__main123:
;led4.c,172 :: 		GPIOA_ODR>>=1;
L_main57:
L_main53:
L_main49:
L_main45:
UXTB	R0, R6
L_main41:
; port end address is: 24 (R6)
; port start address is: 0 (R0)
; port end address is: 0 (R0)
L_main35:
; port start address is: 0 (R0)
; port end address is: 0 (R0)
L_main31:
; port start address is: 0 (R0)
; port end address is: 0 (R0)
L_main27:
; port start address is: 0 (R0)
; port end address is: 0 (R0)
L_main23:
; port start address is: 0 (R0)
; port end address is: 0 (R0)
L_main19:
; port start address is: 0 (R0)
UXTB	R6, R0
; port end address is: 0 (R0)
L_main15:
;led4.c,173 :: 		}
; port start address is: 24 (R6)
; port end address is: 24 (R6)
IT	AL
BAL	L_main0
;led4.c,175 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_flashing:
;led4.c,176 :: 		void flashing(char port, char pin)
; pin start address is: 4 (R1)
; port start address is: 0 (R0)
; pin end address is: 4 (R1)
; port end address is: 0 (R0)
; port start address is: 0 (R0)
; pin start address is: 4 (R1)
;led4.c,178 :: 		if (port == 'A')
CMP	R0, #65
IT	NE
BNE	L_flashing61
; port end address is: 0 (R0)
;led4.c,180 :: 		GPIOA_ODR=1<<pin ;
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R1
SXTH	R3, R3
; pin end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOA_ODR+0)
MOVT	R2, #hi_addr(GPIOA_ODR+0)
STR	R3, [R2, #0]
;led4.c,181 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_flashing62:
SUBS	R7, R7, #1
BNE	L_flashing62
NOP
NOP
;led4.c,182 :: 		GPIOA_ODR=0;
MOVS	R3, #0
MOVW	R2, #lo_addr(GPIOA_ODR+0)
MOVT	R2, #hi_addr(GPIOA_ODR+0)
STR	R3, [R2, #0]
;led4.c,183 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_flashing64:
SUBS	R7, R7, #1
BNE	L_flashing64
NOP
NOP
;led4.c,184 :: 		}
IT	AL
BAL	L_flashing66
L_flashing61:
;led4.c,185 :: 		else if(port == 'C')
; pin start address is: 4 (R1)
; port start address is: 0 (R0)
CMP	R0, #67
IT	NE
BNE	L_flashing67
; port end address is: 0 (R0)
;led4.c,187 :: 		GPIOC_ODR=1<<pin ;
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R1
SXTH	R3, R3
; pin end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
STR	R3, [R2, #0]
;led4.c,188 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_flashing68:
SUBS	R7, R7, #1
BNE	L_flashing68
NOP
NOP
;led4.c,189 :: 		GPIOC_ODR=0;
MOVS	R3, #0
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
STR	R3, [R2, #0]
;led4.c,190 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_flashing70:
SUBS	R7, R7, #1
BNE	L_flashing70
NOP
NOP
;led4.c,191 :: 		}
IT	AL
BAL	L_flashing72
L_flashing67:
;led4.c,192 :: 		else if(port == 'D')
; pin start address is: 4 (R1)
; port start address is: 0 (R0)
CMP	R0, #68
IT	NE
BNE	L_flashing73
; port end address is: 0 (R0)
;led4.c,194 :: 		GPIOD_ODR=1<<pin ;
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R1
SXTH	R3, R3
; pin end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOD_ODR+0)
MOVT	R2, #hi_addr(GPIOD_ODR+0)
STR	R3, [R2, #0]
;led4.c,195 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_flashing74:
SUBS	R7, R7, #1
BNE	L_flashing74
NOP
NOP
;led4.c,196 :: 		GPIOD_ODR=0;
MOVS	R3, #0
MOVW	R2, #lo_addr(GPIOD_ODR+0)
MOVT	R2, #hi_addr(GPIOD_ODR+0)
STR	R3, [R2, #0]
;led4.c,197 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_flashing76:
SUBS	R7, R7, #1
BNE	L_flashing76
NOP
NOP
;led4.c,198 :: 		}
L_flashing73:
L_flashing72:
L_flashing66:
;led4.c,199 :: 		}
L_end_flashing:
BX	LR
; end of _flashing
