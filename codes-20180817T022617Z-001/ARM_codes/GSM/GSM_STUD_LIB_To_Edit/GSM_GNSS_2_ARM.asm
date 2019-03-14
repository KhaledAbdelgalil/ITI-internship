GSM_GNSS_2_ARM_system_init:
;GSM_GNSS_2_ARM.c,86 :: 		static void system_init( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,88 :: 		GPIO_Digital_Output( &GPIOA_ODR, _GPIO_PINMASK_4 );
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
BL	_GPIO_Digital_Output+0
;GSM_GNSS_2_ARM.c,89 :: 		GPIO_Digital_Output( &GPIOC_ODR, _GPIO_PINMASK_2 );
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;GSM_GNSS_2_ARM.c,94 :: 		&_GPIO_MODULE_USART1_PA9_10 );
MOVW	R0, #lo_addr(__GPIO_MODULE_USART1_PA9_10+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART1_PA9_10+0)
PUSH	(R0)
;GSM_GNSS_2_ARM.c,93 :: 		_UART_ONE_STOPBIT,
MOVW	R3, #0
;GSM_GNSS_2_ARM.c,92 :: 		_UART_NOPARITY,
MOVW	R2, #0
;GSM_GNSS_2_ARM.c,91 :: 		UART1_Init_Advanced( 115200, _UART_8_BIT_DATA,
MOVW	R1, #0
MOV	R0, #115200
;GSM_GNSS_2_ARM.c,94 :: 		&_GPIO_MODULE_USART1_PA9_10 );
BL	_UART1_Init_Advanced+0
ADD	SP, SP, #4
;GSM_GNSS_2_ARM.c,98 :: 		&_GPIO_MODULE_USART3_PD89 );
MOVW	R0, #lo_addr(__GPIO_MODULE_USART3_PD89+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART3_PD89+0)
PUSH	(R0)
;GSM_GNSS_2_ARM.c,97 :: 		_UART_ONE_STOPBIT,
MOVW	R3, #0
;GSM_GNSS_2_ARM.c,96 :: 		_UART_NOPARITY,
MOVW	R2, #0
;GSM_GNSS_2_ARM.c,95 :: 		UART3_Init_Advanced( 115200, _UART_8_BIT_DATA,
MOVW	R1, #0
MOV	R0, #115200
;GSM_GNSS_2_ARM.c,98 :: 		&_GPIO_MODULE_USART3_PD89 );
BL	_UART3_Init_Advanced+0
ADD	SP, SP, #4
;GSM_GNSS_2_ARM.c,99 :: 		Delay_ms( 20 );
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_GSM_GNSS_2_ARM_system_init0:
SUBS	R7, R7, #1
BNE	L_GSM_GNSS_2_ARM_system_init0
NOP
NOP
;GSM_GNSS_2_ARM.c,101 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R2, [R0, #0]
;GSM_GNSS_2_ARM.c,102 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,103 :: 		TIM2_PSC = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,104 :: 		TIM2_ARR = 35999;
MOVW	R1, #35999
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,105 :: 		TIM2_DIER.UIE = 1;
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;GSM_GNSS_2_ARM.c,106 :: 		TIM2_CR1.CEN = 1;;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;GSM_GNSS_2_ARM.c,107 :: 		RXNEIE_USART3_CR1_bit = 1;
MOVW	R0, #lo_addr(RXNEIE_USART3_CR1_bit+0)
MOVT	R0, #hi_addr(RXNEIE_USART3_CR1_bit+0)
STR	R2, [R0, #0]
;GSM_GNSS_2_ARM.c,108 :: 		NVIC_IntEnable( IVT_INT_TIM2 );
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;GSM_GNSS_2_ARM.c,109 :: 		NVIC_IntEnable( IVT_INT_USART3 );
MOVW	R0, #55
BL	_NVIC_IntEnable+0
;GSM_GNSS_2_ARM.c,110 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;GSM_GNSS_2_ARM.c,112 :: 		msg_counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_msg_counter+0)
MOVT	R0, #hi_addr(_msg_counter+0)
STRB	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,113 :: 		call_counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_call_counter+0)
MOVT	R0, #hi_addr(_call_counter+0)
STRB	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,115 :: 		}
L_end_system_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of GSM_GNSS_2_ARM_system_init
GSM_GNSS_2_ARM_gsm_gnss_2_power_on:
;GSM_GNSS_2_ARM.c,120 :: 		static void gsm_gnss_2_power_on( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,123 :: 		at_cmd_single( "AT+CPOWD=1" );
MOVW	R0, #lo_addr(?lstr1_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr1_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,124 :: 		GSM_GNSS_2_RST = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,125 :: 		Delay_ms( 1000 );
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
;GSM_GNSS_2_ARM.c,126 :: 		GSM_GNSS_2_RST = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,127 :: 		Delay_ms( 1500 );
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
;GSM_GNSS_2_ARM.c,128 :: 		GSM_GNSS_2_RST = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,131 :: 		Delay_ms( 20000 );                           // Waiting for GPS to stabilize
MOVW	R7, #39593
MOVT	R7, #1627
NOP
NOP
L_GSM_GNSS_2_ARM_gsm_gnss_2_power_on6:
SUBS	R7, R7, #1
BNE	L_GSM_GNSS_2_ARM_gsm_gnss_2_power_on6
NOP
NOP
;GSM_GNSS_2_ARM.c,132 :: 		}
L_end_gsm_gnss_2_power_on:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of GSM_GNSS_2_ARM_gsm_gnss_2_power_on
_gsm_gnss_2_init:
;GSM_GNSS_2_ARM.c,134 :: 		void gsm_gnss_2_init( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,138 :: 		at_cmd_single( "AT+CMEE=2" );
MOVW	R0, #lo_addr(?lstr2_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr2_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,141 :: 		at_cmd_single( "AT+CMGF=1" );
MOVW	R0, #lo_addr(?lstr3_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr3_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,144 :: 		at_cmd_single( "AT+CGID" );
MOVW	R0, #lo_addr(?lstr4_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr4_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,147 :: 		at_cmd_single( "AT+CSCS=?" );
MOVW	R0, #lo_addr(?lstr5_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr5_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,150 :: 		at_cmd_single( "AT+CSCS=\"GSM\"" );
MOVW	R0, #lo_addr(?lstr6_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr6_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,153 :: 		at_cmd_single( "AT+CNMI=2,2,0,1,0" );
MOVW	R0, #lo_addr(?lstr7_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr7_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,156 :: 		at_cmd_single( "AT+CSMP=17,167,0,16" );
MOVW	R0, #lo_addr(?lstr8_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr8_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,159 :: 		at_cmd_single( "AT+CGPSPWR=1" );
MOVW	R0, #lo_addr(?lstr9_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr9_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,162 :: 		at_cmd_single( "AT+CGPSRST=1" );
MOVW	R0, #lo_addr(?lstr10_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr10_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,164 :: 		}
L_end_gsm_gnss_2_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _gsm_gnss_2_init
_send_SMS:
;GSM_GNSS_2_ARM.c,169 :: 		void send_SMS( void )
SUB	SP, SP, #292
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,171 :: 		char cmd_content[ 30 ] = { 0 };              // Send SMS command
ADD	R11, SP, #4
ADD	R10, R11, #286
MOVW	R12, #lo_addr(?ICSsend_SMS_cmd_content_L0+0)
MOVT	R12, #hi_addr(?ICSsend_SMS_cmd_content_L0+0)
BL	___CC2DW+0
;GSM_GNSS_2_ARM.c,172 :: 		char reply_content[ 256 ] = { 0 };           // SMS content
;GSM_GNSS_2_ARM.c,174 :: 		strcat( cmd_content, "AT+CMGS=" );
MOVW	R1, #lo_addr(?lstr11_GSM_GNSS_2_ARM+0)
MOVT	R1, #hi_addr(?lstr11_GSM_GNSS_2_ARM+0)
ADD	R0, SP, #4
BL	_strcat+0
;GSM_GNSS_2_ARM.c,175 :: 		strcat( cmd_content, receiver_ID );
ADD	R0, SP, #4
MOVW	R1, #lo_addr(_receiver_ID+0)
MOVT	R1, #hi_addr(_receiver_ID+0)
BL	_strcat+0
;GSM_GNSS_2_ARM.c,176 :: 		strcat( reply_content,"saves event log on microSD formed of messages and calls." );
MOVW	R1, #lo_addr(?lstr12_GSM_GNSS_2_ARM+0)
MOVT	R1, #hi_addr(?lstr12_GSM_GNSS_2_ARM+0)
ADD	R0, SP, #34
BL	_strcat+0
;GSM_GNSS_2_ARM.c,177 :: 		at_cmd_double( cmd_content, reply_content );
ADD	R1, SP, #34
ADD	R0, SP, #4
BL	_at_cmd_double+0
;GSM_GNSS_2_ARM.c,178 :: 		}
L_end_send_SMS:
LDR	LR, [SP, #0]
ADD	SP, SP, #292
BX	LR
; end of _send_SMS
_micro_SD:
;GSM_GNSS_2_ARM.c,183 :: 		void micro_SD( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,184 :: 		{    at_cmd_single( "AT+FSDRIVE=1" );      // 1 - SD card drive , 0 - Local drive
MOVW	R0, #lo_addr(?lstr13_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr13_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,187 :: 		at_cmd_single( "AT+FSCREATE=D:\\mikroelektronika.txt" );
MOVW	R0, #lo_addr(?lstr14_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr14_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,190 :: 		at_cmd_single( "AT+FSCREATE=D:\\event_log.txt" );
MOVW	R0, #lo_addr(?lstr15_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr15_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,193 :: 		at_cmd_single( "AT+FSWRITE=D:\\event_log.txt,0,11,1" );
MOVW	R0, #lo_addr(?lstr16_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr16_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,194 :: 		at_cmd_single( "SEQUENCE:\r\n" );
MOVW	R0, #lo_addr(?lstr17_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr17_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,196 :: 		Delay_ms( 1000 );
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_micro_SD8:
SUBS	R7, R7, #1
BNE	L_micro_SD8
NOP
NOP
NOP
NOP
;GSM_GNSS_2_ARM.c,199 :: 		at_cmd_single( "AT+FSWRITE=D:\\mikroelektronika.txt,0,44,1" );
MOVW	R0, #lo_addr(?lstr18_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr18_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,200 :: 		at_cmd_single( "Mikroelektronika GSM/GNSS 2 click example\r\n" );
MOVW	R0, #lo_addr(?lstr19_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr19_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,202 :: 		Delay_ms( 1000 );
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_micro_SD10:
SUBS	R7, R7, #1
BNE	L_micro_SD10
NOP
NOP
NOP
NOP
;GSM_GNSS_2_ARM.c,205 :: 		at_cmd_single( "AT+FSREAD=D:\\mikroelektronika.txt,1,50,0" );
MOVW	R0, #lo_addr(?lstr20_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr20_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,208 :: 		at_cmd_single( "AT+FSFLSIZE=D:\\mikroelektronika.txt" );
MOVW	R0, #lo_addr(?lstr21_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr21_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,210 :: 		at_cmd_single( "AT+FSMEM" );          // Get the Size of Available Memory
MOVW	R0, #lo_addr(?lstr22_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr22_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,211 :: 		}
L_end_micro_SD:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _micro_SD
_rsp_handler:
;GSM_GNSS_2_ARM.c,216 :: 		void rsp_handler( char *rsp )
; rsp start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
; rsp end address is: 0 (R0)
; rsp start address is: 20 (R5)
;GSM_GNSS_2_ARM.c,218 :: 		char tmp[ 25 ] = { 0 };
;GSM_GNSS_2_ARM.c,222 :: 		if ( !strncmp( rsp, "\r\nNORMAL POWER DOWN", 19 ) )
MOVW	R1, #lo_addr(?lstr23_GSM_GNSS_2_ARM+0)
MOVT	R1, #hi_addr(?lstr23_GSM_GNSS_2_ARM+0)
MOVS	R2, #19
MOV	R0, R5
BL	_strncmp+0
CMP	R0, #0
IT	NE
BNE	L_rsp_handler12
;GSM_GNSS_2_ARM.c,224 :: 		GSM_GNSS_2_RST = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
STR	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,225 :: 		Delay_ms( 1500 );
MOVW	R7, #4606
MOVT	R7, #122
NOP
NOP
L_rsp_handler13:
SUBS	R7, R7, #1
BNE	L_rsp_handler13
NOP
NOP
NOP
;GSM_GNSS_2_ARM.c,226 :: 		GSM_GNSS_2_RST = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
STR	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,227 :: 		}
L_rsp_handler12:
;GSM_GNSS_2_ARM.c,230 :: 		if ( !strncmp( rsp, "\r\nRDY", 5 ) )
MOVW	R1, #lo_addr(?lstr24_GSM_GNSS_2_ARM+0)
MOVT	R1, #hi_addr(?lstr24_GSM_GNSS_2_ARM+0)
MOVS	R2, #5
MOV	R0, R5
BL	_strncmp+0
CMP	R0, #0
IT	NE
BNE	L_rsp_handler15
;GSM_GNSS_2_ARM.c,232 :: 		ready_f = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_ready_f+0)
MOVT	R1, #hi_addr(_ready_f+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,233 :: 		}
L_rsp_handler15:
;GSM_GNSS_2_ARM.c,236 :: 		if ( !strncmp( rsp, "\r\nNO CARRIER", 12 ) )
MOVW	R1, #lo_addr(?lstr25_GSM_GNSS_2_ARM+0)
MOVT	R1, #hi_addr(?lstr25_GSM_GNSS_2_ARM+0)
MOVS	R2, #12
MOV	R0, R5
; rsp end address is: 20 (R5)
BL	_strncmp+0
CMP	R0, #0
IT	NE
BNE	L_rsp_handler16
;GSM_GNSS_2_ARM.c,238 :: 		isCall = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_isCall+0)
MOVT	R1, #hi_addr(_isCall+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,239 :: 		action_f = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_action_f+0)
MOVT	R1, #hi_addr(_action_f+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,240 :: 		}
L_rsp_handler16:
;GSM_GNSS_2_ARM.c,241 :: 		}
L_end_rsp_handler:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _rsp_handler
_sms_action_handler:
;GSM_GNSS_2_ARM.c,244 :: 		void sms_action_handler( char* rsp )
;GSM_GNSS_2_ARM.c,246 :: 		isMessage = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_isMessage+0)
MOVT	R1, #hi_addr(_isMessage+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,247 :: 		action_f = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_action_f+0)
MOVT	R1, #hi_addr(_action_f+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,248 :: 		}
L_end_sms_action_handler:
BX	LR
; end of _sms_action_handler
_at_cb_send_init_message:
;GSM_GNSS_2_ARM.c,250 :: 		void at_cb_send_init_message ( char* rsp )
;GSM_GNSS_2_ARM.c,252 :: 		msg_sent = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_msg_sent+0)
MOVT	R1, #hi_addr(_msg_sent+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,253 :: 		}
L_end_at_cb_send_init_message:
BX	LR
; end of _at_cb_send_init_message
_at_cb_microsd_end:
;GSM_GNSS_2_ARM.c,255 :: 		void at_cb_microsd_end ( char* rsp )
;GSM_GNSS_2_ARM.c,258 :: 		sd_f = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_sd_f+0)
MOVT	R1, #hi_addr(_sd_f+0)
STRB	R2, [R1, #0]
;GSM_GNSS_2_ARM.c,259 :: 		}
L_end_at_cb_microsd_end:
BX	LR
; end of _at_cb_microsd_end
_update_log:
;GSM_GNSS_2_ARM.c,261 :: 		void update_log ( void )
SUB	SP, SP, #12
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,263 :: 		char log_type[ 8 ] = { 0 };
ADD	R11, SP, #4
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSupdate_log_log_type_L0+0)
MOVT	R12, #hi_addr(?ICSupdate_log_log_type_L0+0)
BL	___CC2DW+0
;GSM_GNSS_2_ARM.c,265 :: 		if ( isMessage )
MOVW	R0, #lo_addr(_isMessage+0)
MOVT	R0, #hi_addr(_isMessage+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_update_log17
;GSM_GNSS_2_ARM.c,267 :: 		strcpy( log_type, " msg  " );
MOVW	R1, #lo_addr(?lstr26_GSM_GNSS_2_ARM+0)
MOVT	R1, #hi_addr(?lstr26_GSM_GNSS_2_ARM+0)
ADD	R0, SP, #4
BL	_strcpy+0
;GSM_GNSS_2_ARM.c,268 :: 		msg_counter++;
MOVW	R1, #lo_addr(_msg_counter+0)
MOVT	R1, #hi_addr(_msg_counter+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,269 :: 		isMessage = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_isMessage+0)
MOVT	R0, #hi_addr(_isMessage+0)
STRB	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,270 :: 		}
L_update_log17:
;GSM_GNSS_2_ARM.c,271 :: 		if ( isCall )
MOVW	R0, #lo_addr(_isCall+0)
MOVT	R0, #hi_addr(_isCall+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_update_log18
;GSM_GNSS_2_ARM.c,273 :: 		strcpy( log_type, " call ");
MOVW	R1, #lo_addr(?lstr27_GSM_GNSS_2_ARM+0)
MOVT	R1, #hi_addr(?lstr27_GSM_GNSS_2_ARM+0)
ADD	R0, SP, #4
BL	_strcpy+0
;GSM_GNSS_2_ARM.c,274 :: 		call_counter++;
MOVW	R1, #lo_addr(_call_counter+0)
MOVT	R1, #hi_addr(_call_counter+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;GSM_GNSS_2_ARM.c,275 :: 		isCall = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_isCall+0)
MOVT	R0, #hi_addr(_isCall+0)
STRB	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,276 :: 		}
L_update_log18:
;GSM_GNSS_2_ARM.c,279 :: 		ByteToStr( msg_counter, txt_msg );
MOVW	R0, #lo_addr(_msg_counter+0)
MOVT	R0, #hi_addr(_msg_counter+0)
LDRB	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt_msg+0)
MOVT	R1, #hi_addr(_txt_msg+0)
BL	_ByteToStr+0
;GSM_GNSS_2_ARM.c,280 :: 		ByteToStr( call_counter, txt_call );
MOVW	R0, #lo_addr(_call_counter+0)
MOVT	R0, #hi_addr(_call_counter+0)
LDRB	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt_call+0)
MOVT	R1, #hi_addr(_txt_call+0)
BL	_ByteToStr+0
;GSM_GNSS_2_ARM.c,286 :: 		Delay_ms ( 1000 );
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_update_log19:
SUBS	R7, R7, #1
BNE	L_update_log19
NOP
NOP
NOP
NOP
;GSM_GNSS_2_ARM.c,290 :: 		at_cmd_single( "AT+CGPSINF=0" );
MOVW	R0, #lo_addr(?lstr28_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr28_GSM_GNSS_2_ARM+0)
BL	_at_cmd_single+0
;GSM_GNSS_2_ARM.c,291 :: 		}
L_end_update_log:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _update_log
_main:
;GSM_GNSS_2_ARM.c,293 :: 		void main( void )
;GSM_GNSS_2_ARM.c,295 :: 		system_init();
BL	GSM_GNSS_2_ARM_system_init+0
;GSM_GNSS_2_ARM.c,296 :: 		at_init( rsp_handler, UART3_Write, buffer, sizeof( buffer ) );
MOVW	R1, #lo_addr(_UART3_Write+0)
MOVT	R1, #hi_addr(_UART3_Write+0)
MOVW	R0, #lo_addr(_rsp_handler+0)
MOVT	R0, #hi_addr(_rsp_handler+0)
MOVW	R3, #1024
MOVW	R2, #lo_addr(_buffer+0)
MOVT	R2, #hi_addr(_buffer+0)
BL	_at_init+0
;GSM_GNSS_2_ARM.c,297 :: 		at_cmd_save( "+CMS ERROR", 1000, NULL, NULL, NULL, at_cb_send_init_message );
MOVW	R2, #lo_addr(_at_cb_send_init_message+0)
MOVT	R2, #hi_addr(_at_cb_send_init_message+0)
MOVS	R1, #0
MOVW	R0, #lo_addr(?lstr29_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr29_GSM_GNSS_2_ARM+0)
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #1000
BL	_at_cmd_save+0
ADD	SP, SP, #8
;GSM_GNSS_2_ARM.c,298 :: 		at_cmd_save( "+FSMEM", 3000, NULL, NULL, NULL, at_cb_microsd_end );
MOVW	R2, #lo_addr(_at_cb_microsd_end+0)
MOVT	R2, #hi_addr(_at_cb_microsd_end+0)
MOVS	R1, #0
MOVW	R0, #lo_addr(?lstr30_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr30_GSM_GNSS_2_ARM+0)
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #3000
BL	_at_cmd_save+0
ADD	SP, SP, #8
;GSM_GNSS_2_ARM.c,299 :: 		at_cmd_save( "+CMT", 3000, NULL, NULL, NULL, sms_action_handler );
MOVW	R2, #lo_addr(_sms_action_handler+0)
MOVT	R2, #hi_addr(_sms_action_handler+0)
MOVS	R1, #0
MOVW	R0, #lo_addr(?lstr31_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr31_GSM_GNSS_2_ARM+0)
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #3000
BL	_at_cmd_save+0
ADD	SP, SP, #8
;GSM_GNSS_2_ARM.c,300 :: 		at_cmd_save( "+CMGS", 1000, NULL, NULL, NULL, at_cb_send_init_message );
MOVW	R2, #lo_addr(_at_cb_send_init_message+0)
MOVT	R2, #hi_addr(_at_cb_send_init_message+0)
MOVS	R1, #0
MOVW	R0, #lo_addr(?lstr32_GSM_GNSS_2_ARM+0)
MOVT	R0, #hi_addr(?lstr32_GSM_GNSS_2_ARM+0)
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #1000
BL	_at_cmd_save+0
ADD	SP, SP, #8
;GSM_GNSS_2_ARM.c,302 :: 		gsm_gnss_2_power_on();
BL	GSM_GNSS_2_ARM_gsm_gnss_2_power_on+0
;GSM_GNSS_2_ARM.c,304 :: 		gsm_gnss_2_init();
BL	_gsm_gnss_2_init+0
;GSM_GNSS_2_ARM.c,306 :: 		send_SMS();                               // Sending initial message
BL	_send_SMS+0
;GSM_GNSS_2_ARM.c,308 :: 		while( !msg_sent ) at_process();          // Waiting for SMS sending status
L_main21:
MOVW	R0, #lo_addr(_msg_sent+0)
MOVT	R0, #hi_addr(_msg_sent+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main22
BL	_at_process+0
IT	AL
BAL	L_main21
L_main22:
;GSM_GNSS_2_ARM.c,336 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_TICK_ISR:
;GSM_GNSS_2_ARM.c,341 :: 		void TICK_ISR() iv IVT_INT_TIM2
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,343 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;GSM_GNSS_2_ARM.c,344 :: 		at_tick();
BL	_at_tick+0
;GSM_GNSS_2_ARM.c,345 :: 		}
L_end_TICK_ISR:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TICK_ISR
_RX_ISR:
;GSM_GNSS_2_ARM.c,350 :: 		void RX_ISR() iv IVT_INT_USART3 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GSM_GNSS_2_ARM.c,352 :: 		if( RXNE_USART3_SR_bit )
MOVW	R1, #lo_addr(RXNE_USART3_SR_bit+0)
MOVT	R1, #hi_addr(RXNE_USART3_SR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_RX_ISR23
;GSM_GNSS_2_ARM.c,354 :: 		char tmp = USART3_DR;
MOVW	R0, #lo_addr(USART3_DR+0)
MOVT	R0, #hi_addr(USART3_DR+0)
; tmp start address is: 0 (R0)
LDR	R0, [R0, #0]
;GSM_GNSS_2_ARM.c,355 :: 		at_rx( tmp );
; tmp end address is: 0 (R0)
BL	_at_rx+0
;GSM_GNSS_2_ARM.c,356 :: 		}
L_RX_ISR23:
;GSM_GNSS_2_ARM.c,357 :: 		}
L_end_RX_ISR:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RX_ISR
