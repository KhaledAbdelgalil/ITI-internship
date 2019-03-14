GSM_GNSS_2_ARM_system_init:
;GSM_GNSS_2_ARM.c,87 :: 		static void system_init( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,89 :: 		GPIO_Digital_Output( &GPIOA_ODR, _GPIO_PINMASK_4 );
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
BL	_GPIO_Digital_Output+0
;GSM_GNSS_2_ARM.c,90 :: 		GPIO_Digital_Output( &GPIOC_ODR, _GPIO_PINMASK_2 );
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;GSM_GNSS_2_ARM.c,95 :: 		&_GPIO_MODULE_USART1_PA9_10 );
MOVW	R0, #lo_addr(__GPIO_MODULE_USART1_PA9_10+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART1_PA9_10+0)
PUSH	(R0)
;GSM_GNSS_2_ARM.c,94 :: 		_UART_ONE_STOPBIT,
MOVW	R3, #0
;GSM_GNSS_2_ARM.c,93 :: 		_UART_NOPARITY,
MOVW	R2, #0
;GSM_GNSS_2_ARM.c,92 :: 		UART1_Init_Advanced( 115200, _UART_8_BIT_DATA,
MOVW	R1, #0
MOV	R0, #115200
;GSM_GNSS_2_ARM.c,95 :: 		&_GPIO_MODULE_USART1_PA9_10 );
BL	_UART1_Init_Advanced+0
ADD	SP, SP, #4
;GSM_GNSS_2_ARM.c,99 :: 		&_GPIO_MODULE_USART3_PD89 );
MOVW	R0, #lo_addr(__GPIO_MODULE_USART3_PD89+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART3_PD89+0)
PUSH	(R0)
;GSM_GNSS_2_ARM.c,98 :: 		_UART_ONE_STOPBIT,
MOVW	R3, #0
;GSM_GNSS_2_ARM.c,97 :: 		_UART_NOPARITY,
MOVW	R2, #0
;GSM_GNSS_2_ARM.c,96 :: 		UART3_Init_Advanced( 115200, _UART_8_BIT_DATA,
MOVW	R1, #0
MOV	R0, #115200
;GSM_GNSS_2_ARM.c,99 :: 		&_GPIO_MODULE_USART3_PD89 );
BL	_UART3_Init_Advanced+0
ADD	SP, SP, #4
;GSM_GNSS_2_ARM.c,100 :: 		Delay_ms( 20 );
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_GSM_GNSS_2_ARM_system_init0:
SUBS	R7, R7, #1
BNE	L_GSM_GNSS_2_ARM_system_init0
NOP
NOP
;GSM_GNSS_2_ARM.c,102 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R2, [R0, #0]
;GSM_GNSS_2_ARM.c,103 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,104 :: 		TIM2_PSC = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,105 :: 		TIM2_ARR = 35999;
MOVW	R1, #35999
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,106 :: 		TIM2_DIER.UIE = 1;
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;GSM_GNSS_2_ARM.c,107 :: 		TIM2_CR1.CEN = 1;;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;GSM_GNSS_2_ARM.c,108 :: 		RXNEIE_USART3_CR1_bit = 1;
MOVW	R0, #lo_addr(RXNEIE_USART3_CR1_bit+0)
MOVT	R0, #hi_addr(RXNEIE_USART3_CR1_bit+0)
STR	R2, [R0, #0]
;GSM_GNSS_2_ARM.c,109 :: 		NVIC_IntEnable( IVT_INT_TIM2 );
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;GSM_GNSS_2_ARM.c,110 :: 		NVIC_IntEnable( IVT_INT_USART3 );
MOVW	R0, #55
BL	_NVIC_IntEnable+0
;GSM_GNSS_2_ARM.c,111 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;GSM_GNSS_2_ARM.c,113 :: 		msg_counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_msg_counter+0)
MOVT	R0, #hi_addr(_msg_counter+0)
STRB	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,114 :: 		call_counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_call_counter+0)
MOVT	R0, #hi_addr(_call_counter+0)
STRB	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,116 :: 		}
L_end_system_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of GSM_GNSS_2_ARM_system_init
GSM_GNSS_2_ARM_gsm_gnss_2_power_on:
;GSM_GNSS_2_ARM.c,121 :: 		static void gsm_gnss_2_power_on( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,124 :: 		at_cmd_single( "AT+CPOWD=1" );
MOVW	R0, #lo_addr(?lstr1_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr1_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,125 :: 		GSM_GNSS_2_RST = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,126 :: 		Delay_ms( 1000 );
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_GSM_GNSS_2_ARM_gsm_gnss_2_power_on2:
SUBS	R7, R7, #1
BNE	L_GSM_GNSS_2_ARM_gsm_gnss_2_power_on2
NOP
NOP
NOP
NOP
;GSM_GNSS_2_ARM.c,127 :: 		GSM_GNSS_2_RST = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,128 :: 		Delay_ms( 1500 );
MOVW	R7, #4606
MOVT	R7, #122
NOP
NOP
L_GSM_GNSS_2_ARM_gsm_gnss_2_power_on4:
SUBS	R7, R7, #1
BNE	L_GSM_GNSS_2_ARM_gsm_gnss_2_power_on4
NOP
NOP
NOP
;GSM_GNSS_2_ARM.c,129 :: 		GSM_GNSS_2_RST = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,132 :: 		Delay_ms( 20000 );                           // Waiting for GPS to stabilize
MOVW	R7, #39593
MOVT	R7, #1627
NOP
NOP
L_GSM_GNSS_2_ARM_gsm_gnss_2_power_on6:
SUBS	R7, R7, #1
BNE	L_GSM_GNSS_2_ARM_gsm_gnss_2_power_on6
NOP
NOP
;GSM_GNSS_2_ARM.c,133 :: 		}
L_end_gsm_gnss_2_power_on:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of GSM_GNSS_2_ARM_gsm_gnss_2_power_on
_gsm_gnss_2_init:
;GSM_GNSS_2_ARM.c,135 :: 		void gsm_gnss_2_init( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,139 :: 		at_cmd_single( "AT+CMEE=2" );
MOVW	R0, #lo_addr(?lstr2_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr2_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,142 :: 		at_cmd_single( "AT+CMGF=1" );
MOVW	R0, #lo_addr(?lstr3_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr3_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,145 :: 		at_cmd_single( "AT+CGID" );
MOVW	R0, #lo_addr(?lstr4_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr4_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,148 :: 		at_cmd_single( "AT+CSCS=?" );
MOVW	R0, #lo_addr(?lstr5_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr5_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,151 :: 		at_cmd_single( "AT+CSCS=\"GSM\"" );
MOVW	R0, #lo_addr(?lstr6_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr6_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,154 :: 		at_cmd_single( "AT+CNMI=2,2,0,1,0" );
MOVW	R0, #lo_addr(?lstr7_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr7_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,157 :: 		at_cmd_single( "AT+CSMP=17,167,0,16" );
MOVW	R0, #lo_addr(?lstr8_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr8_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,160 :: 		at_cmd_single( "AT+CGPSPWR=1" );
MOVW	R0, #lo_addr(?lstr9_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr9_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,163 :: 		at_cmd_single( "AT+CGPSRST=1" );
MOVW	R0, #lo_addr(?lstr10_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr10_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,165 :: 		}
L_end_gsm_gnss_2_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _gsm_gnss_2_init
_send_SMS:
;GSM_GNSS_2_ARM.c,170 :: 		void send_SMS( u8 s )
; s start address is: 0 (R0)
SUB	SP, SP, #292
STR	LR, [SP, #0]
UXTB	R6, R0
; s end address is: 0 (R0)
; s start address is: 24 (R6)
;GSM_GNSS_2_ARM.c,172 :: 		char cmd_content[ 30 ] = { 0 };              // Send SMS command
ADD	R11, SP, #4
ADD	R10, R11, #286
MOVW	R12, #lo_addr(?ICSsend_SMS_cmd_content_L0+0)
MOVT	R12, #hi_addr(?ICSsend_SMS_cmd_content_L0+0)
BL	___CC2DW+0
;GSM_GNSS_2_ARM.c,173 :: 		char reply_content[ 256 ] = { 0 };           // SMS content
;GSM_GNSS_2_ARM.c,175 :: 		strcat( cmd_content, "AT+CMGS=" );
MOVW	R2, #lo_addr(?lstr11_GSM_GNSS_2_ARM+0)
MOVT	R2, #hi_addr(?lstr11_GSM_GNSS_2_ARM+0)
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;GSM_GNSS_2_ARM.c,176 :: 		strcat( cmd_content, receiver_ID );
ADD	R1, SP, #4
MOV	R0, R1
MOVW	R1, #lo_addr(_receiver_ID+0)
MOVT	R1, #hi_addr(_receiver_ID+0)
BL	_strcat+0
;GSM_GNSS_2_ARM.c,178 :: 		if(s=='0')
CMP	R6, #48
IT	NE
BNE	L_send_SMS8
; s end address is: 24 (R6)
;GSM_GNSS_2_ARM.c,180 :: 		strcat( reply_content,"Please Call Me Later" );
MOVW	R2, #lo_addr(?lstr12_GSM_GNSS_2_ARM+0)
MOVT	R2, #hi_addr(?lstr12_GSM_GNSS_2_ARM+0)
ADD	R1, SP, #34
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;GSM_GNSS_2_ARM.c,181 :: 		at_cmd_double( cmd_content, reply_content );
ADD	R2, SP, #34
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
BL	_at_cmd_double+0
;GSM_GNSS_2_ARM.c,182 :: 		}
IT	AL
BAL	L_send_SMS9
L_send_SMS8:
;GSM_GNSS_2_ARM.c,183 :: 		else if(s=='1')
; s start address is: 24 (R6)
CMP	R6, #49
IT	NE
BNE	L_send_SMS10
; s end address is: 24 (R6)
;GSM_GNSS_2_ARM.c,185 :: 		strcat( reply_content,"I'm at a Meeting" );
MOVW	R2, #lo_addr(?lstr13_GSM_GNSS_2_ARM+0)
MOVT	R2, #hi_addr(?lstr13_GSM_GNSS_2_ARM+0)
ADD	R1, SP, #34
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;GSM_GNSS_2_ARM.c,186 :: 		at_cmd_double( cmd_content, reply_content );
ADD	R2, SP, #34
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
BL	_at_cmd_double+0
;GSM_GNSS_2_ARM.c,187 :: 		}
IT	AL
BAL	L_send_SMS11
L_send_SMS10:
;GSM_GNSS_2_ARM.c,188 :: 		else if(s=='2')
; s start address is: 24 (R6)
CMP	R6, #50
IT	NE
BNE	L_send_SMS12
; s end address is: 24 (R6)
;GSM_GNSS_2_ARM.c,190 :: 		strcat( reply_content,"Can't take your call now!s" );
MOVW	R2, #lo_addr(?lstr14_GSM_GNSS_2_ARM+0)
MOVT	R2, #hi_addr(?lstr14_GSM_GNSS_2_ARM+0)
ADD	R1, SP, #34
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;GSM_GNSS_2_ARM.c,191 :: 		at_cmd_double( cmd_content, reply_content );
ADD	R2, SP, #34
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
BL	_at_cmd_double+0
;GSM_GNSS_2_ARM.c,192 :: 		}
IT	AL
BAL	L_send_SMS13
L_send_SMS12:
;GSM_GNSS_2_ARM.c,195 :: 		strcat( reply_content,"message fault" );
MOVW	R2, #lo_addr(?lstr15_GSM_GNSS_2_ARM+0)
MOVT	R2, #hi_addr(?lstr15_GSM_GNSS_2_ARM+0)
ADD	R1, SP, #34
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;GSM_GNSS_2_ARM.c,196 :: 		at_cmd_double( cmd_content, reply_content );
ADD	R2, SP, #34
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
BL	_at_cmd_double+0
;GSM_GNSS_2_ARM.c,197 :: 		}
L_send_SMS13:
L_send_SMS11:
L_send_SMS9:
;GSM_GNSS_2_ARM.c,200 :: 		}
L_end_send_SMS:
LDR	LR, [SP, #0]
ADD	SP, SP, #292
BX	LR
; end of _send_SMS
_micro_SD:
;GSM_GNSS_2_ARM.c,207 :: 		void micro_SD( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,208 :: 		{    at_cmd_single( "AT+FSDRIVE=1" );      // 1 - SD card drive , 0 - Local drive
MOVW	R0, #lo_addr(?lstr16_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr16_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,211 :: 		at_cmd_single( "AT+FSCREATE=D:\\mikroelektronika.txt" );
MOVW	R0, #lo_addr(?lstr17_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr17_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,214 :: 		at_cmd_single( "AT+FSCREATE=D:\\event_log.txt" );
MOVW	R0, #lo_addr(?lstr18_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr18_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,217 :: 		at_cmd_single( "AT+FSWRITE=D:\\event_log.txt,0,11,1" );
MOVW	R0, #lo_addr(?lstr19_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr19_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,218 :: 		at_cmd_single( "SEQUENCE:\r\n" );
MOVW	R0, #lo_addr(?lstr20_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr20_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,220 :: 		Delay_ms( 1000 );
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_micro_SD14:
SUBS	R7, R7, #1
BNE	L_micro_SD14
NOP
NOP
NOP
NOP
;GSM_GNSS_2_ARM.c,223 :: 		at_cmd_single( "AT+FSWRITE=D:\\mikroelektronika.txt,0,44,1" );
MOVW	R0, #lo_addr(?lstr21_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr21_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,224 :: 		at_cmd_single( "Mikroelektronika GSM/GNSS 2 click example\r\n" );
MOVW	R0, #lo_addr(?lstr22_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr22_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,226 :: 		Delay_ms( 1000 );
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_micro_SD16:
SUBS	R7, R7, #1
BNE	L_micro_SD16
NOP
NOP
NOP
NOP
;GSM_GNSS_2_ARM.c,229 :: 		at_cmd_single( "AT+FSREAD=D:\\mikroelektronika.txt,1,50,0" );
MOVW	R0, #lo_addr(?lstr23_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr23_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,232 :: 		at_cmd_single( "AT+FSFLSIZE=D:\\mikroelektronika.txt" );
MOVW	R0, #lo_addr(?lstr24_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr24_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,234 :: 		at_cmd_single( "AT+FSMEM" );          // Get the Size of Available Memory
MOVW	R0, #lo_addr(?lstr25_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr25_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,235 :: 		}
L_end_micro_SD:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _micro_SD
_rsp_handler:
;GSM_GNSS_2_ARM.c,240 :: 		void rsp_handler( char *rsp )
; rsp start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
; rsp end address is: 0 (R0)
; rsp start address is: 20 (R5)
;GSM_GNSS_2_ARM.c,242 :: 		char tmp[ 25 ] = { 0 };
;GSM_GNSS_2_ARM.c,246 :: 		if ( !strncmp( rsp, "\r\nNORMAL POWER DOWN", 19 ) )
MOVW	R1, #lo_addr(?lstr26_GSM_GNSS_2_ARM+0)
MOVT	R1, #hi_addr(?lstr26_GSM_GNSS_2_ARM+0)
MOVS	R2, #19
MOV	R0, R5
BL	_strncmp+0
CMP	R0, #0
IT	NE
BNE	L_rsp_handler18
;GSM_GNSS_2_ARM.c,248 :: 		GSM_GNSS_2_RST = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
STR	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,249 :: 		Delay_ms( 1500 );
MOVW	R7, #4606
MOVT	R7, #122
NOP
NOP
L_rsp_handler19:
SUBS	R7, R7, #1
BNE	L_rsp_handler19
NOP
NOP
NOP
;GSM_GNSS_2_ARM.c,250 :: 		GSM_GNSS_2_RST = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
STR	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,251 :: 		}
L_rsp_handler18:
;GSM_GNSS_2_ARM.c,254 :: 		if ( !strncmp( rsp, "\r\nRDY", 5 ) )
MOVW	R1, #lo_addr(?lstr27_GSM_GNSS_2_ARM+0)
MOVT	R1, #hi_addr(?lstr27_GSM_GNSS_2_ARM+0)
MOVS	R2, #5
MOV	R0, R5
BL	_strncmp+0
CMP	R0, #0
IT	NE
BNE	L_rsp_handler21
;GSM_GNSS_2_ARM.c,256 :: 		ready_f = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_ready_f+0)
MOVT	R1, #hi_addr(_ready_f+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,257 :: 		}
L_rsp_handler21:
;GSM_GNSS_2_ARM.c,260 :: 		if ( !strncmp( rsp, "\r\nNO CARRIER", 12 ) )
MOVW	R1, #lo_addr(?lstr28_GSM_GNSS_2_ARM+0)
MOVT	R1, #hi_addr(?lstr28_GSM_GNSS_2_ARM+0)
MOVS	R2, #12
MOV	R0, R5
; rsp end address is: 20 (R5)
BL	_strncmp+0
CMP	R0, #0
IT	NE
BNE	L_rsp_handler22
;GSM_GNSS_2_ARM.c,262 :: 		isCall = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_isCall+0)
MOVT	R1, #hi_addr(_isCall+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,263 :: 		action_f = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_action_f+0)
MOVT	R1, #hi_addr(_action_f+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,264 :: 		}
L_rsp_handler22:
;GSM_GNSS_2_ARM.c,265 :: 		}
L_end_rsp_handler:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _rsp_handler
_sms_action_handler:
;GSM_GNSS_2_ARM.c,268 :: 		void sms_action_handler( char* rsp )
;GSM_GNSS_2_ARM.c,270 :: 		isMessage = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_isMessage+0)
MOVT	R1, #hi_addr(_isMessage+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,271 :: 		action_f = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_action_f+0)
MOVT	R1, #hi_addr(_action_f+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,272 :: 		}
L_end_sms_action_handler:
BX	LR
; end of _sms_action_handler
_at_cb_send_init_message:
;GSM_GNSS_2_ARM.c,274 :: 		void at_cb_send_init_message ( char* rsp )
;GSM_GNSS_2_ARM.c,276 :: 		msg_sent = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_msg_sent+0)
MOVT	R1, #hi_addr(_msg_sent+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,277 :: 		}
L_end_at_cb_send_init_message:
BX	LR
; end of _at_cb_send_init_message
_at_cb_microsd_end:
;GSM_GNSS_2_ARM.c,279 :: 		void at_cb_microsd_end ( char* rsp )
;GSM_GNSS_2_ARM.c,282 :: 		sd_f = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_sd_f+0)
MOVT	R1, #hi_addr(_sd_f+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,283 :: 		}
L_end_at_cb_microsd_end:
BX	LR
; end of _at_cb_microsd_end
_update_log:
;GSM_GNSS_2_ARM.c,285 :: 		void update_log ( void )
SUB	SP, SP, #12
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,287 :: 		char log_type[ 8 ] = { 0 };
ADD	R11, SP, #4
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSupdate_log_log_type_L0+0)
MOVT	R12, #hi_addr(?ICSupdate_log_log_type_L0+0)
BL	___CC2DW+0
;GSM_GNSS_2_ARM.c,289 :: 		if ( isMessage )
MOVW	R0, #lo_addr(_isMessage+0)
MOVT	R0, #hi_addr(_isMessage+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_update_log23
;GSM_GNSS_2_ARM.c,291 :: 		strcpy( log_type, " msg  " );
MOVW	R1, #lo_addr(?lstr29_GSM_GNSS_2_ARM+0)
MOVT	R1, #hi_addr(?lstr29_GSM_GNSS_2_ARM+0)
ADD	R0, SP, #4
BL	_strcpy+0
;GSM_GNSS_2_ARM.c,292 :: 		msg_counter++;
MOVW	R1, #lo_addr(_msg_counter+0)
MOVT	R1, #hi_addr(_msg_counter+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,293 :: 		isMessage = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_isMessage+0)
MOVT	R0, #hi_addr(_isMessage+0)
STRB	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,294 :: 		}
L_update_log23:
;GSM_GNSS_2_ARM.c,295 :: 		if ( isCall )
MOVW	R0, #lo_addr(_isCall+0)
MOVT	R0, #hi_addr(_isCall+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_update_log24
;GSM_GNSS_2_ARM.c,297 :: 		strcpy( log_type, " call ");
MOVW	R1, #lo_addr(?lstr30_GSM_GNSS_2_ARM+0)
MOVT	R1, #hi_addr(?lstr30_GSM_GNSS_2_ARM+0)
ADD	R0, SP, #4
BL	_strcpy+0
;GSM_GNSS_2_ARM.c,298 :: 		call_counter++;
MOVW	R1, #lo_addr(_call_counter+0)
MOVT	R1, #hi_addr(_call_counter+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,299 :: 		isCall = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_isCall+0)
MOVT	R0, #hi_addr(_isCall+0)
STRB	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,300 :: 		}
L_update_log24:
;GSM_GNSS_2_ARM.c,303 :: 		ByteToStr( msg_counter, txt_msg );
MOVW	R0, #lo_addr(_msg_counter+0)
MOVT	R0, #hi_addr(_msg_counter+0)
LDRB	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt_msg+0)
MOVT	R1, #hi_addr(_txt_msg+0)
BL	_ByteToStr+0
;GSM_GNSS_2_ARM.c,304 :: 		ByteToStr( call_counter, txt_call );
MOVW	R0, #lo_addr(_call_counter+0)
MOVT	R0, #hi_addr(_call_counter+0)
LDRB	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt_call+0)
MOVT	R1, #hi_addr(_txt_call+0)
BL	_ByteToStr+0
;GSM_GNSS_2_ARM.c,310 :: 		Delay_ms ( 1000 );
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_update_log25:
SUBS	R7, R7, #1
BNE	L_update_log25
NOP
NOP
NOP
NOP
;GSM_GNSS_2_ARM.c,314 :: 		at_cmd_single( "AT+CGPSINF=0" );
MOVW	R0, #lo_addr(?lstr31_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr31_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,315 :: 		}
L_end_update_log:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _update_log
_main:
;GSM_GNSS_2_ARM.c,333 :: 		void main( void )
SUB	SP, SP, #20
;GSM_GNSS_2_ARM.c,334 :: 		{       u8 initial_x=10;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmain_initial_x_L0+0)
MOVT	R12, #hi_addr(?ICSmain_initial_x_L0+0)
BL	___CC2DW+0
;GSM_GNSS_2_ARM.c,335 :: 		u8 counter_rkm=0;
;GSM_GNSS_2_ARM.c,336 :: 		u16 x_tft=500;
;GSM_GNSS_2_ARM.c,337 :: 		u16 y_tft=500;
;GSM_GNSS_2_ARM.c,339 :: 		u8 flag_messag=1;
;GSM_GNSS_2_ARM.c,340 :: 		u8 press_messag=10;
;GSM_GNSS_2_ARM.c,341 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;GSM_GNSS_2_ARM.c,342 :: 		TFT_Init_ILI9341_8bit(320,240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;GSM_GNSS_2_ARM.c,343 :: 		TFT_Fill_Screen(CL_Red);
MOVW	R0, #63488
BL	_TFT_Fill_Screen+0
;GSM_GNSS_2_ARM.c,344 :: 		TFT_Write_Text("First calibration of our touch screen",90,120);
MOVW	R0, #lo_addr(?lstr32_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr32_GSM_GNSS_2_ARM+0)
MOVS	R2, #120
MOVS	R1, #90
BL	_TFT_Write_Text+0
;GSM_GNSS_2_ARM.c,345 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_main27:
SUBS	R7, R7, #1
BNE	L_main27
NOP
NOP
;GSM_GNSS_2_ARM.c,346 :: 		TFT_Fill_Screen(CL_GREEN);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;GSM_GNSS_2_ARM.c,347 :: 		TFT_Set_Pen(CL_Blue,20);
MOVS	R1, #20
MOVW	R0, #31
BL	_TFT_Set_Pen+0
;GSM_GNSS_2_ARM.c,348 :: 		ADC_Set_Input_Channel(3);
MOVS	R0, #3
BL	_ADC_Set_Input_Channel+0
;GSM_GNSS_2_ARM.c,349 :: 		Init_ADC();
BL	_Init_ADC+0
;GSM_GNSS_2_ARM.c,350 :: 		TP_TFT_Init(320, 240, 8, 9);
MOVS	R3, #9
MOVS	R2, #8
MOVS	R1, #240
MOVW	R0, #320
BL	_TP_TFT_Init+0
;GSM_GNSS_2_ARM.c,351 :: 		TP_TFT_Set_ADC_Threshold(750);
MOVW	R0, #750
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;GSM_GNSS_2_ARM.c,352 :: 		Calibrate();
BL	_Calibrate+0
;GSM_GNSS_2_ARM.c,353 :: 		TFT_Fill_Screen(CL_GREEN);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;GSM_GNSS_2_ARM.c,354 :: 		module_layout();
BL	_module_layout+0
;GSM_GNSS_2_ARM.c,356 :: 		while(counter_rkm!=11)
L_main29:
LDRB	R0, [SP, #13]
CMP	R0, #11
IT	EQ
BEQ	L_main30
;GSM_GNSS_2_ARM.c,358 :: 		while(TP_TFT_Press_Detect())
L_main31:
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_main32
;GSM_GNSS_2_ARM.c,360 :: 		TP_TFT_Get_Coordinates(&x_tft,&y_tft);
ADD	R1, SP, #16
ADD	R0, SP, #14
BL	_TP_TFT_Get_Coordinates+0
;GSM_GNSS_2_ARM.c,361 :: 		}
IT	AL
BAL	L_main31
L_main32:
;GSM_GNSS_2_ARM.c,363 :: 		if(x_tft>=0 &&x_tft<=32 &&y_tft>= 48&&y_tft<=96 )
LDRH	R0, [SP, #14]
CMP	R0, #0
IT	CC
BCC	L__main105
LDRH	R0, [SP, #14]
CMP	R0, #32
IT	HI
BHI	L__main104
LDRH	R0, [SP, #16]
CMP	R0, #48
IT	CC
BCC	L__main103
LDRH	R0, [SP, #16]
CMP	R0, #96
IT	HI
BHI	L__main102
L__main101:
;GSM_GNSS_2_ARM.c,365 :: 		mobile[counter_rkm]='0';
ADD	R1, SP, #0
LDRB	R0, [SP, #13]
ADDS	R1, R1, R0
MOVS	R0, #48
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,366 :: 		counter_rkm++;
LDRB	R0, [SP, #13]
ADDS	R0, R0, #1
STRB	R0, [SP, #13]
;GSM_GNSS_2_ARM.c,367 :: 		TFT_Write_Text("0",initial_x,20);
MOVW	R0, #lo_addr(?lstr33_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr33_GSM_GNSS_2_ARM+0)
MOVS	R2, #20
LDRB	R1, [SP, #12]
BL	_TFT_Write_Text+0
;GSM_GNSS_2_ARM.c,368 :: 		initial_x+=10;
LDRB	R0, [SP, #12]
ADDS	R0, #10
STRB	R0, [SP, #12]
;GSM_GNSS_2_ARM.c,369 :: 		x_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #14]
;GSM_GNSS_2_ARM.c,370 :: 		y_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #16]
;GSM_GNSS_2_ARM.c,371 :: 		}
IT	AL
BAL	L_main36
;GSM_GNSS_2_ARM.c,363 :: 		if(x_tft>=0 &&x_tft<=32 &&y_tft>= 48&&y_tft<=96 )
L__main105:
L__main104:
L__main103:
L__main102:
;GSM_GNSS_2_ARM.c,372 :: 		else if(x_tft>=32 &&x_tft<=64 &&y_tft>= 48&&y_tft<=96 )
LDRH	R0, [SP, #14]
CMP	R0, #32
IT	CC
BCC	L__main109
LDRH	R0, [SP, #14]
CMP	R0, #64
IT	HI
BHI	L__main108
LDRH	R0, [SP, #16]
CMP	R0, #48
IT	CC
BCC	L__main107
LDRH	R0, [SP, #16]
CMP	R0, #96
IT	HI
BHI	L__main106
L__main100:
;GSM_GNSS_2_ARM.c,374 :: 		mobile[counter_rkm]='1';
ADD	R1, SP, #0
LDRB	R0, [SP, #13]
ADDS	R1, R1, R0
MOVS	R0, #49
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,375 :: 		counter_rkm++;
LDRB	R0, [SP, #13]
ADDS	R0, R0, #1
STRB	R0, [SP, #13]
;GSM_GNSS_2_ARM.c,376 :: 		TFT_Write_Text("1",initial_x,20);
MOVW	R0, #lo_addr(?lstr34_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr34_GSM_GNSS_2_ARM+0)
MOVS	R2, #20
LDRB	R1, [SP, #12]
BL	_TFT_Write_Text+0
;GSM_GNSS_2_ARM.c,377 :: 		initial_x+=10;
LDRB	R0, [SP, #12]
ADDS	R0, #10
STRB	R0, [SP, #12]
;GSM_GNSS_2_ARM.c,378 :: 		x_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #14]
;GSM_GNSS_2_ARM.c,379 :: 		y_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #16]
;GSM_GNSS_2_ARM.c,380 :: 		}
IT	AL
BAL	L_main40
;GSM_GNSS_2_ARM.c,372 :: 		else if(x_tft>=32 &&x_tft<=64 &&y_tft>= 48&&y_tft<=96 )
L__main109:
L__main108:
L__main107:
L__main106:
;GSM_GNSS_2_ARM.c,381 :: 		else if(x_tft>=64&&x_tft<=96 &&y_tft>= 48&&y_tft<=96 )
LDRH	R0, [SP, #14]
CMP	R0, #64
IT	CC
BCC	L__main113
LDRH	R0, [SP, #14]
CMP	R0, #96
IT	HI
BHI	L__main112
LDRH	R0, [SP, #16]
CMP	R0, #48
IT	CC
BCC	L__main111
LDRH	R0, [SP, #16]
CMP	R0, #96
IT	HI
BHI	L__main110
L__main99:
;GSM_GNSS_2_ARM.c,383 :: 		mobile[counter_rkm]='2';
ADD	R1, SP, #0
LDRB	R0, [SP, #13]
ADDS	R1, R1, R0
MOVS	R0, #50
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,384 :: 		counter_rkm++;
LDRB	R0, [SP, #13]
ADDS	R0, R0, #1
STRB	R0, [SP, #13]
;GSM_GNSS_2_ARM.c,385 :: 		TFT_Write_Text("2",initial_x,20);
MOVW	R0, #lo_addr(?lstr35_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr35_GSM_GNSS_2_ARM+0)
MOVS	R2, #20
LDRB	R1, [SP, #12]
BL	_TFT_Write_Text+0
;GSM_GNSS_2_ARM.c,386 :: 		initial_x+=10;
LDRB	R0, [SP, #12]
ADDS	R0, #10
STRB	R0, [SP, #12]
;GSM_GNSS_2_ARM.c,387 :: 		x_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #14]
;GSM_GNSS_2_ARM.c,388 :: 		y_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #16]
;GSM_GNSS_2_ARM.c,389 :: 		}
IT	AL
BAL	L_main44
;GSM_GNSS_2_ARM.c,381 :: 		else if(x_tft>=64&&x_tft<=96 &&y_tft>= 48&&y_tft<=96 )
L__main113:
L__main112:
L__main111:
L__main110:
;GSM_GNSS_2_ARM.c,390 :: 		else if(x_tft>=96 &&x_tft<=128 &&y_tft>= 48&&y_tft<=96 )
LDRH	R0, [SP, #14]
CMP	R0, #96
IT	CC
BCC	L__main117
LDRH	R0, [SP, #14]
CMP	R0, #128
IT	HI
BHI	L__main116
LDRH	R0, [SP, #16]
CMP	R0, #48
IT	CC
BCC	L__main115
LDRH	R0, [SP, #16]
CMP	R0, #96
IT	HI
BHI	L__main114
L__main98:
;GSM_GNSS_2_ARM.c,392 :: 		mobile[counter_rkm]='3';
ADD	R1, SP, #0
LDRB	R0, [SP, #13]
ADDS	R1, R1, R0
MOVS	R0, #51
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,393 :: 		counter_rkm++;
LDRB	R0, [SP, #13]
ADDS	R0, R0, #1
STRB	R0, [SP, #13]
;GSM_GNSS_2_ARM.c,394 :: 		TFT_Write_Text("3",initial_x,20);
MOVW	R0, #lo_addr(?lstr36_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr36_GSM_GNSS_2_ARM+0)
MOVS	R2, #20
LDRB	R1, [SP, #12]
BL	_TFT_Write_Text+0
;GSM_GNSS_2_ARM.c,395 :: 		initial_x+=10;
LDRB	R0, [SP, #12]
ADDS	R0, #10
STRB	R0, [SP, #12]
;GSM_GNSS_2_ARM.c,396 :: 		x_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #14]
;GSM_GNSS_2_ARM.c,397 :: 		y_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #16]
;GSM_GNSS_2_ARM.c,398 :: 		}
IT	AL
BAL	L_main48
;GSM_GNSS_2_ARM.c,390 :: 		else if(x_tft>=96 &&x_tft<=128 &&y_tft>= 48&&y_tft<=96 )
L__main117:
L__main116:
L__main115:
L__main114:
;GSM_GNSS_2_ARM.c,399 :: 		else if(x_tft>=128 &&x_tft<=160 &&y_tft>= 48&&y_tft<=96 )
LDRH	R0, [SP, #14]
CMP	R0, #128
IT	CC
BCC	L__main121
LDRH	R0, [SP, #14]
CMP	R0, #160
IT	HI
BHI	L__main120
LDRH	R0, [SP, #16]
CMP	R0, #48
IT	CC
BCC	L__main119
LDRH	R0, [SP, #16]
CMP	R0, #96
IT	HI
BHI	L__main118
L__main97:
;GSM_GNSS_2_ARM.c,401 :: 		mobile[counter_rkm]='4';
ADD	R1, SP, #0
LDRB	R0, [SP, #13]
ADDS	R1, R1, R0
MOVS	R0, #52
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,402 :: 		counter_rkm++;
LDRB	R0, [SP, #13]
ADDS	R0, R0, #1
STRB	R0, [SP, #13]
;GSM_GNSS_2_ARM.c,403 :: 		TFT_Write_Text("4",initial_x,20);
MOVW	R0, #lo_addr(?lstr37_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr37_GSM_GNSS_2_ARM+0)
MOVS	R2, #20
LDRB	R1, [SP, #12]
BL	_TFT_Write_Text+0
;GSM_GNSS_2_ARM.c,404 :: 		initial_x+=10;
LDRB	R0, [SP, #12]
ADDS	R0, #10
STRB	R0, [SP, #12]
;GSM_GNSS_2_ARM.c,405 :: 		x_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #14]
;GSM_GNSS_2_ARM.c,406 :: 		y_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #16]
;GSM_GNSS_2_ARM.c,407 :: 		}
IT	AL
BAL	L_main52
;GSM_GNSS_2_ARM.c,399 :: 		else if(x_tft>=128 &&x_tft<=160 &&y_tft>= 48&&y_tft<=96 )
L__main121:
L__main120:
L__main119:
L__main118:
;GSM_GNSS_2_ARM.c,408 :: 		else if(x_tft>=160 &&x_tft<=192 &&y_tft>= 48&&y_tft<=96 )
LDRH	R0, [SP, #14]
CMP	R0, #160
IT	CC
BCC	L__main125
LDRH	R0, [SP, #14]
CMP	R0, #192
IT	HI
BHI	L__main124
LDRH	R0, [SP, #16]
CMP	R0, #48
IT	CC
BCC	L__main123
LDRH	R0, [SP, #16]
CMP	R0, #96
IT	HI
BHI	L__main122
L__main96:
;GSM_GNSS_2_ARM.c,410 :: 		mobile[counter_rkm]='5';
ADD	R1, SP, #0
LDRB	R0, [SP, #13]
ADDS	R1, R1, R0
MOVS	R0, #53
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,411 :: 		counter_rkm++;
LDRB	R0, [SP, #13]
ADDS	R0, R0, #1
STRB	R0, [SP, #13]
;GSM_GNSS_2_ARM.c,412 :: 		TFT_Write_Text("5",initial_x,20);
MOVW	R0, #lo_addr(?lstr38_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr38_GSM_GNSS_2_ARM+0)
MOVS	R2, #20
LDRB	R1, [SP, #12]
BL	_TFT_Write_Text+0
;GSM_GNSS_2_ARM.c,413 :: 		initial_x+=10;
LDRB	R0, [SP, #12]
ADDS	R0, #10
STRB	R0, [SP, #12]
;GSM_GNSS_2_ARM.c,414 :: 		x_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #14]
;GSM_GNSS_2_ARM.c,415 :: 		y_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #16]
;GSM_GNSS_2_ARM.c,416 :: 		}
IT	AL
BAL	L_main56
;GSM_GNSS_2_ARM.c,408 :: 		else if(x_tft>=160 &&x_tft<=192 &&y_tft>= 48&&y_tft<=96 )
L__main125:
L__main124:
L__main123:
L__main122:
;GSM_GNSS_2_ARM.c,417 :: 		else if(x_tft>=192 &&x_tft<=224 &&y_tft>= 48&&y_tft<=96 )
LDRH	R0, [SP, #14]
CMP	R0, #192
IT	CC
BCC	L__main129
LDRH	R0, [SP, #14]
CMP	R0, #224
IT	HI
BHI	L__main128
LDRH	R0, [SP, #16]
CMP	R0, #48
IT	CC
BCC	L__main127
LDRH	R0, [SP, #16]
CMP	R0, #96
IT	HI
BHI	L__main126
L__main95:
;GSM_GNSS_2_ARM.c,419 :: 		mobile[counter_rkm]='6';
ADD	R1, SP, #0
LDRB	R0, [SP, #13]
ADDS	R1, R1, R0
MOVS	R0, #54
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,420 :: 		counter_rkm++;
LDRB	R0, [SP, #13]
ADDS	R0, R0, #1
STRB	R0, [SP, #13]
;GSM_GNSS_2_ARM.c,421 :: 		TFT_Write_Text("6",initial_x,20);
MOVW	R0, #lo_addr(?lstr39_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr39_GSM_GNSS_2_ARM+0)
MOVS	R2, #20
LDRB	R1, [SP, #12]
BL	_TFT_Write_Text+0
;GSM_GNSS_2_ARM.c,422 :: 		initial_x+=10;
LDRB	R0, [SP, #12]
ADDS	R0, #10
STRB	R0, [SP, #12]
;GSM_GNSS_2_ARM.c,423 :: 		x_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #14]
;GSM_GNSS_2_ARM.c,424 :: 		y_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #16]
;GSM_GNSS_2_ARM.c,425 :: 		}
IT	AL
BAL	L_main60
;GSM_GNSS_2_ARM.c,417 :: 		else if(x_tft>=192 &&x_tft<=224 &&y_tft>= 48&&y_tft<=96 )
L__main129:
L__main128:
L__main127:
L__main126:
;GSM_GNSS_2_ARM.c,426 :: 		else if(x_tft>=224 &&x_tft<=256 &&y_tft>= 48&&y_tft<=96 )
LDRH	R0, [SP, #14]
CMP	R0, #224
IT	CC
BCC	L__main133
LDRH	R0, [SP, #14]
CMP	R0, #256
IT	HI
BHI	L__main132
LDRH	R0, [SP, #16]
CMP	R0, #48
IT	CC
BCC	L__main131
LDRH	R0, [SP, #16]
CMP	R0, #96
IT	HI
BHI	L__main130
L__main94:
;GSM_GNSS_2_ARM.c,428 :: 		mobile[counter_rkm]='7';
ADD	R1, SP, #0
LDRB	R0, [SP, #13]
ADDS	R1, R1, R0
MOVS	R0, #55
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,429 :: 		counter_rkm++;
LDRB	R0, [SP, #13]
ADDS	R0, R0, #1
STRB	R0, [SP, #13]
;GSM_GNSS_2_ARM.c,430 :: 		TFT_Write_Text("7",initial_x,20);
MOVW	R0, #lo_addr(?lstr40_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr40_GSM_GNSS_2_ARM+0)
MOVS	R2, #20
LDRB	R1, [SP, #12]
BL	_TFT_Write_Text+0
;GSM_GNSS_2_ARM.c,431 :: 		initial_x+=10;
LDRB	R0, [SP, #12]
ADDS	R0, #10
STRB	R0, [SP, #12]
;GSM_GNSS_2_ARM.c,432 :: 		x_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #14]
;GSM_GNSS_2_ARM.c,433 :: 		y_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #16]
;GSM_GNSS_2_ARM.c,434 :: 		}
IT	AL
BAL	L_main64
;GSM_GNSS_2_ARM.c,426 :: 		else if(x_tft>=224 &&x_tft<=256 &&y_tft>= 48&&y_tft<=96 )
L__main133:
L__main132:
L__main131:
L__main130:
;GSM_GNSS_2_ARM.c,435 :: 		else if(x_tft>=256 &&x_tft<=288 &&y_tft>= 48&&y_tft<=96 )
LDRH	R0, [SP, #14]
CMP	R0, #256
IT	CC
BCC	L__main137
LDRH	R0, [SP, #14]
CMP	R0, #288
IT	HI
BHI	L__main136
LDRH	R0, [SP, #16]
CMP	R0, #48
IT	CC
BCC	L__main135
LDRH	R0, [SP, #16]
CMP	R0, #96
IT	HI
BHI	L__main134
L__main93:
;GSM_GNSS_2_ARM.c,437 :: 		mobile[counter_rkm]='8';
ADD	R1, SP, #0
LDRB	R0, [SP, #13]
ADDS	R1, R1, R0
MOVS	R0, #56
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,438 :: 		counter_rkm++;
LDRB	R0, [SP, #13]
ADDS	R0, R0, #1
STRB	R0, [SP, #13]
;GSM_GNSS_2_ARM.c,439 :: 		TFT_Write_Text("8",initial_x,20);
MOVW	R0, #lo_addr(?lstr41_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr41_GSM_GNSS_2_ARM+0)
MOVS	R2, #20
LDRB	R1, [SP, #12]
BL	_TFT_Write_Text+0
;GSM_GNSS_2_ARM.c,440 :: 		initial_x+=10;
LDRB	R0, [SP, #12]
ADDS	R0, #10
STRB	R0, [SP, #12]
;GSM_GNSS_2_ARM.c,441 :: 		x_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #14]
;GSM_GNSS_2_ARM.c,442 :: 		y_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #16]
;GSM_GNSS_2_ARM.c,443 :: 		}
IT	AL
BAL	L_main68
;GSM_GNSS_2_ARM.c,435 :: 		else if(x_tft>=256 &&x_tft<=288 &&y_tft>= 48&&y_tft<=96 )
L__main137:
L__main136:
L__main135:
L__main134:
;GSM_GNSS_2_ARM.c,444 :: 		else if(x_tft>=288 &&x_tft<=320 &&y_tft>= 48&&y_tft<=96 )
LDRH	R0, [SP, #14]
CMP	R0, #288
IT	CC
BCC	L__main141
LDRH	R0, [SP, #14]
CMP	R0, #320
IT	HI
BHI	L__main140
LDRH	R0, [SP, #16]
CMP	R0, #48
IT	CC
BCC	L__main139
LDRH	R0, [SP, #16]
CMP	R0, #96
IT	HI
BHI	L__main138
L__main92:
;GSM_GNSS_2_ARM.c,446 :: 		mobile[counter_rkm]='9';
ADD	R1, SP, #0
LDRB	R0, [SP, #13]
ADDS	R1, R1, R0
MOVS	R0, #57
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,447 :: 		counter_rkm++;
LDRB	R0, [SP, #13]
ADDS	R0, R0, #1
STRB	R0, [SP, #13]
;GSM_GNSS_2_ARM.c,448 :: 		TFT_Write_Text("9",initial_x,20);
MOVW	R0, #lo_addr(?lstr42_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr42_GSM_GNSS_2_ARM+0)
MOVS	R2, #20
LDRB	R1, [SP, #12]
BL	_TFT_Write_Text+0
;GSM_GNSS_2_ARM.c,449 :: 		initial_x+=10;
LDRB	R0, [SP, #12]
ADDS	R0, #10
STRB	R0, [SP, #12]
;GSM_GNSS_2_ARM.c,450 :: 		x_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #14]
;GSM_GNSS_2_ARM.c,451 :: 		y_tft=500;
MOVW	R0, #500
STRH	R0, [SP, #16]
;GSM_GNSS_2_ARM.c,444 :: 		else if(x_tft>=288 &&x_tft<=320 &&y_tft>= 48&&y_tft<=96 )
L__main141:
L__main140:
L__main139:
L__main138:
;GSM_GNSS_2_ARM.c,452 :: 		}
L_main68:
L_main64:
L_main60:
L_main56:
L_main52:
L_main48:
L_main44:
L_main40:
L_main36:
;GSM_GNSS_2_ARM.c,454 :: 		}
IT	AL
BAL	L_main29
L_main30:
;GSM_GNSS_2_ARM.c,456 :: 		mobile[11]='\0';
ADD	R0, SP, #0
ADDW	R1, R0, #11
MOVS	R0, #0
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,457 :: 		strcat( receiver_ID, "\"" );
MOVW	R0, #lo_addr(?lstr43_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr43_GSM_GNSS_2_ARM+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_receiver_ID+0)
MOVT	R0, #hi_addr(_receiver_ID+0)
BL	_strcat+0
;GSM_GNSS_2_ARM.c,458 :: 		strcat( receiver_ID,mobile);
ADD	R0, SP, #0
MOV	R1, R0
MOVW	R0, #lo_addr(_receiver_ID+0)
MOVT	R0, #hi_addr(_receiver_ID+0)
BL	_strcat+0
;GSM_GNSS_2_ARM.c,459 :: 		strcat( receiver_ID, "\"" );
MOVW	R0, #lo_addr(?lstr44_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr44_GSM_GNSS_2_ARM+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_receiver_ID+0)
MOVT	R0, #hi_addr(_receiver_ID+0)
BL	_strcat+0
;GSM_GNSS_2_ARM.c,462 :: 		while(flag_messag)
L_main72:
LDRB	R0, [SP, #18]
CMP	R0, #0
IT	EQ
BEQ	L_main73
;GSM_GNSS_2_ARM.c,464 :: 		if(TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_main74
;GSM_GNSS_2_ARM.c,466 :: 		TP_TFT_Get_Coordinates(&x_tft,&y_tft);
ADD	R1, SP, #16
ADD	R0, SP, #14
BL	_TP_TFT_Get_Coordinates+0
;GSM_GNSS_2_ARM.c,467 :: 		if(y_tft>= 96&&y_tft<=144 )
LDRH	R0, [SP, #16]
CMP	R0, #96
IT	CC
BCC	L__main143
LDRH	R0, [SP, #16]
CMP	R0, #144
IT	HI
BHI	L__main142
L__main91:
;GSM_GNSS_2_ARM.c,469 :: 		press_messag='0';
MOVS	R0, #48
STRB	R0, [SP, #19]
;GSM_GNSS_2_ARM.c,471 :: 		TFT_Circle(10, 120, 10);
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #120
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_TFT_Circle+0
;GSM_GNSS_2_ARM.c,472 :: 		flag_messag=0;
MOVS	R0, #0
STRB	R0, [SP, #18]
;GSM_GNSS_2_ARM.c,473 :: 		TFT_Write_Char(press_messag ,10,120);
MOVS	R2, #120
MOVS	R1, #10
LDRB	R0, [SP, #19]
BL	_TFT_Write_Char+0
;GSM_GNSS_2_ARM.c,475 :: 		}
IT	AL
BAL	L_main78
;GSM_GNSS_2_ARM.c,467 :: 		if(y_tft>= 96&&y_tft<=144 )
L__main143:
L__main142:
;GSM_GNSS_2_ARM.c,476 :: 		else if(y_tft>= 144&&y_tft<=192 )
LDRH	R0, [SP, #16]
CMP	R0, #144
IT	CC
BCC	L__main145
LDRH	R0, [SP, #16]
CMP	R0, #192
IT	HI
BHI	L__main144
L__main90:
;GSM_GNSS_2_ARM.c,478 :: 		press_messag='1';
MOVS	R0, #49
STRB	R0, [SP, #19]
;GSM_GNSS_2_ARM.c,479 :: 		TFT_Circle(10, 168, 10);
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #168
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_TFT_Circle+0
;GSM_GNSS_2_ARM.c,480 :: 		flag_messag=0;
MOVS	R0, #0
STRB	R0, [SP, #18]
;GSM_GNSS_2_ARM.c,482 :: 		TFT_Write_Char(press_messag ,10,168);
MOVS	R2, #168
MOVS	R1, #10
LDRB	R0, [SP, #19]
BL	_TFT_Write_Char+0
;GSM_GNSS_2_ARM.c,484 :: 		}
IT	AL
BAL	L_main82
;GSM_GNSS_2_ARM.c,476 :: 		else if(y_tft>= 144&&y_tft<=192 )
L__main145:
L__main144:
;GSM_GNSS_2_ARM.c,485 :: 		else if(y_tft>= 192&&y_tft<=240 )
LDRH	R0, [SP, #16]
CMP	R0, #192
IT	CC
BCC	L__main147
LDRH	R0, [SP, #16]
CMP	R0, #240
IT	HI
BHI	L__main146
L__main89:
;GSM_GNSS_2_ARM.c,487 :: 		press_messag='2';
MOVS	R0, #50
STRB	R0, [SP, #19]
;GSM_GNSS_2_ARM.c,488 :: 		TFT_Circle(10, 216, 10);
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #216
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_TFT_Circle+0
;GSM_GNSS_2_ARM.c,489 :: 		flag_messag=0;
MOVS	R0, #0
STRB	R0, [SP, #18]
;GSM_GNSS_2_ARM.c,490 :: 		TFT_Write_Char(press_messag ,10,216);
MOVS	R2, #216
MOVS	R1, #10
LDRB	R0, [SP, #19]
BL	_TFT_Write_Char+0
;GSM_GNSS_2_ARM.c,485 :: 		else if(y_tft>= 192&&y_tft<=240 )
L__main147:
L__main146:
;GSM_GNSS_2_ARM.c,492 :: 		}
L_main82:
L_main78:
;GSM_GNSS_2_ARM.c,494 :: 		}
L_main74:
;GSM_GNSS_2_ARM.c,496 :: 		}
IT	AL
BAL	L_main72
L_main73:
;GSM_GNSS_2_ARM.c,498 :: 		system_init();
BL	GSM_GNSS_2_ARM_system_init+0
;GSM_GNSS_2_ARM.c,499 :: 		at_init( rsp_handler, UART3_Write, buffer, sizeof( buffer ) );
MOVW	R1, #lo_addr(_UART3_Write+0)
MOVT	R1, #hi_addr(_UART3_Write+0)
MOVW	R0, #lo_addr(_rsp_handler+0)
MOVT	R0, #hi_addr(_rsp_handler+0)
MOVW	R3, #1024
MOVW	R2, #lo_addr(_buffer+0)
MOVT	R2, #hi_addr(_buffer+0)
BL	_at_init+0
;GSM_GNSS_2_ARM.c,500 :: 		at_cmd_save( "+CMS ERROR", 1000, NULL, NULL, NULL, at_cb_send_init_message );
MOVW	R2, #lo_addr(_at_cb_send_init_message+0)
MOVT	R2, #hi_addr(_at_cb_send_init_message+0)
MOVS	R1, #0
MOVW	R0, #lo_addr(?lstr45_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr45_GSM_GNSS_2_ARM+0)
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #1000
BL	_at_cmd_save+0
ADD	SP, SP, #8
;GSM_GNSS_2_ARM.c,501 :: 		at_cmd_save( "+FSMEM", 3000, NULL, NULL, NULL, at_cb_microsd_end );
MOVW	R2, #lo_addr(_at_cb_microsd_end+0)
MOVT	R2, #hi_addr(_at_cb_microsd_end+0)
MOVS	R1, #0
MOVW	R0, #lo_addr(?lstr46_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr46_GSM_GNSS_2_ARM+0)
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #3000
BL	_at_cmd_save+0
ADD	SP, SP, #8
;GSM_GNSS_2_ARM.c,502 :: 		at_cmd_save( "+CMT", 3000, NULL, NULL, NULL, sms_action_handler );
MOVW	R2, #lo_addr(_sms_action_handler+0)
MOVT	R2, #hi_addr(_sms_action_handler+0)
MOVS	R1, #0
MOVW	R0, #lo_addr(?lstr47_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr47_GSM_GNSS_2_ARM+0)
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #3000
BL	_at_cmd_save+0
ADD	SP, SP, #8
;GSM_GNSS_2_ARM.c,503 :: 		at_cmd_save( "+CMGS", 1000, NULL, NULL, NULL, at_cb_send_init_message );
MOVW	R2, #lo_addr(_at_cb_send_init_message+0)
MOVT	R2, #hi_addr(_at_cb_send_init_message+0)
MOVS	R1, #0
MOVW	R0, #lo_addr(?lstr48_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr48_GSM_GNSS_2_ARM+0)
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #1000
BL	_at_cmd_save+0
ADD	SP, SP, #8
;GSM_GNSS_2_ARM.c,505 :: 		gsm_gnss_2_power_on();
BL	GSM_GNSS_2_ARM_gsm_gnss_2_power_on+0
;GSM_GNSS_2_ARM.c,507 :: 		gsm_gnss_2_init();
BL	_gsm_gnss_2_init+0
;GSM_GNSS_2_ARM.c,509 :: 		send_SMS(press_messag);                               // Sending initial message
LDRB	R0, [SP, #19]
BL	_send_SMS+0
;GSM_GNSS_2_ARM.c,511 :: 		while( !msg_sent ) at_process();          // Waiting for SMS sending status
L_main86:
MOVW	R0, #lo_addr(_msg_sent+0)
MOVT	R0, #hi_addr(_msg_sent+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main87
BL	_at_process+0
IT	AL
BAL	L_main86
L_main87:
;GSM_GNSS_2_ARM.c,513 :: 		TFT_Fill_Screen(CL_GREEN);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;GSM_GNSS_2_ARM.c,540 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_TICK_ISR:
;GSM_GNSS_2_ARM.c,545 :: 		void TICK_ISR() iv IVT_INT_TIM2
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,547 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,548 :: 		at_tick();
BL	_at_tick+0
;GSM_GNSS_2_ARM.c,549 :: 		}
L_end_TICK_ISR:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TICK_ISR
_RX_ISR:
;GSM_GNSS_2_ARM.c,554 :: 		void RX_ISR() iv IVT_INT_USART3 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,556 :: 		if( RXNE_USART3_SR_bit )
MOVW	R1, #lo_addr(RXNE_USART3_SR_bit+0)
MOVT	R1, #hi_addr(RXNE_USART3_SR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_RX_ISR88
;GSM_GNSS_2_ARM.c,558 :: 		char tmp = USART3_DR;
MOVW	R0, #lo_addr(USART3_DR+0)
MOVT	R0, #hi_addr(USART3_DR+0)
; tmp start address is: 0 (R0)
LDR	R0, [R0, #0]
;GSM_GNSS_2_ARM.c,559 :: 		at_rx( tmp );
; tmp end address is: 0 (R0)
BL	_at_rx+0
;GSM_GNSS_2_ARM.c,560 :: 		}
L_RX_ISR88:
;GSM_GNSS_2_ARM.c,561 :: 		}
L_end_RX_ISR:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RX_ISR
