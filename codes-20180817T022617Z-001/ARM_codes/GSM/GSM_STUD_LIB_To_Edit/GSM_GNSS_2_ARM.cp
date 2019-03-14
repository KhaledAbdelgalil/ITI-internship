#line 1 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
#line 1 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
#line 1 "c:/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "c:/mikroc pro for arm/include/stddef.h"



typedef long ptrdiff_t;


 typedef unsigned long size_t;

typedef unsigned long wchar_t;
#line 1 "c:/mikroc pro for arm/include/string.h"





void * memchr(void *p, char n, unsigned int v);
int memcmp(void *s1, void *s2, int n);
void * memcpy(void * d1, void * s1, int n);
void * memmove(void * to, void * from, int n);
void * memset(void * p1, char character, int n);
char * strcat(char * to, char * from);
char * strchr(char * ptr, char chr);
int strcmp(char * s1, char * s2);
char * strcpy(char * to, char * from);
int strlen(char * s);
char * strncat(char * to, char * from, int size);
char * strncpy(char * to, char * from, int size);
int strspn(char * str1, char * str2);
char strcspn(char * s1, char * s2);
int strncmp(char * s1, char * s2, char len);
char * strpbrk(char * s1, char * s2);
char * strrchr(char *ptr, char chr);
char * strstr(char * s1, char * s2);
char * strtok(char * s1, char * s2);
#line 1 "c:/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 23 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
typedef void ( *at_cmd_cb )( char *buffer );
#line 28 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
typedef void ( *at_write_p )( unsigned int in );
#line 40 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
typedef enum
{
#line 44 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
 AT_CMD_UNKNOWN = 0,
#line 47 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
 AT_CMD_GET = 1,
#line 50 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
 AT_CMD_SET = 2,
#line 53 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
 AT_CMD_TEST = 3,
#line 56 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
 AT_CMD_EXEC = 4,

}at_type_t;
#line 68 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
typedef struct
{
#line 72 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
 uint32_t hash;
#line 75 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
 uint32_t timeout;
#line 78 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
 at_cmd_cb getter;
#line 81 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
 at_cmd_cb setter;
#line 84 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
 at_cmd_cb tester;
#line 87 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
 at_cmd_cb executer;

}at_cmd_t;
#line 107 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
void at_init( at_cmd_cb default_callback, at_write_p default_write,
 uint8_t *buffer_ptr, uint16_t buffer_size );
#line 119 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
void at_rx( char rx_input );
#line 127 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
void at_tick( void );
#line 137 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
void at_cmd_single( char *cmd );
#line 149 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
void at_cmd_double( char *cmd, char *arg_1 );
#line 162 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
void at_cmd_triple( char *cmd, char *arg_1, char *arg_2 );
#line 178 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
void at_cmd_save( char *cmd, uint32_t timeout,
 at_cmd_cb getter, at_cmd_cb setter,
 at_cmd_cb tester, at_cmd_cb executer );
#line 187 "c:/users/pc2/desktop/gsm_stud_lib_to_edit/at_engine.h"
void at_process( void );
#line 7 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
sbit GSM_GNSS_2_RST at GPIOC_ODR.B2;
#line 12 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
const char powerdown[] = "\r\nNORMAL POWER DOWN";
#line 17 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
 _Bool  ready_f =  0 ;
#line 22 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
 _Bool  action_f =  0 ;
#line 27 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
 _Bool  msg_ready_f =  0 ;
#line 32 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
 _Bool  msg_sent =  0 ;
#line 37 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
 _Bool  sd_f =  0 ;
#line 42 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
 _Bool  isMessage =  0 ;
#line 47 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
 _Bool  isCall =  0 ;
#line 52 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
uint8_t buffer[ 1024 ] = { 0 };
#line 57 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
char receiver_ID[ 20 ] = "\"01065795514\"";
#line 62 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
 uint8_t call_counter;
#line 67 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
 uint8_t msg_counter;
#line 72 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
 char txt_call[ 5 ] = { 0 };
 char txt_msg[ 5 ] = { 0 };
#line 86 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
static void system_init( void )
{
 GPIO_Digital_Output( &GPIOA_ODR, _GPIO_PINMASK_4 );
 GPIO_Digital_Output( &GPIOC_ODR, _GPIO_PINMASK_2 );

 UART1_Init_Advanced( 115200, _UART_8_BIT_DATA,
 _UART_NOPARITY,
 _UART_ONE_STOPBIT,
 &_GPIO_MODULE_USART1_PA9_10 );
 UART3_Init_Advanced( 115200, _UART_8_BIT_DATA,
 _UART_NOPARITY,
 _UART_ONE_STOPBIT,
 &_GPIO_MODULE_USART3_PD89 );
 Delay_ms( 20 );

 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = 1;
 TIM2_ARR = 35999;
 TIM2_DIER.UIE = 1;
 TIM2_CR1.CEN = 1;;
 RXNEIE_USART3_CR1_bit = 1;
 NVIC_IntEnable( IVT_INT_TIM2 );
 NVIC_IntEnable( IVT_INT_USART3 );
 EnableInterrupts();

 msg_counter = 0;
 call_counter = 0;

}
#line 120 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
static void gsm_gnss_2_power_on( void )
{

 at_cmd_single( "AT+CPOWD=1" );
 GSM_GNSS_2_RST = 1;
 Delay_ms( 1000 );
 GSM_GNSS_2_RST = 0;
 Delay_ms( 1500 );
 GSM_GNSS_2_RST = 1;


 Delay_ms( 20000 );
 }

void gsm_gnss_2_init( void )
{


 at_cmd_single( "AT+CMEE=2" );


 at_cmd_single( "AT+CMGF=1" );


 at_cmd_single( "AT+CGID" );


 at_cmd_single( "AT+CSCS=?" );


 at_cmd_single( "AT+CSCS=\"GSM\"" );


 at_cmd_single( "AT+CNMI=2,2,0,1,0" );


 at_cmd_single( "AT+CSMP=17,167,0,16" );


 at_cmd_single( "AT+CGPSPWR=1" );


 at_cmd_single( "AT+CGPSRST=1" );

 }
#line 169 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
void send_SMS( void )
{
 char cmd_content[ 30 ] = { 0 };
 char reply_content[ 256 ] = { 0 };

 strcat( cmd_content, "AT+CMGS=" );
 strcat( cmd_content, receiver_ID );
 strcat( reply_content,"saves event log on microSD formed of messages and calls." );
 at_cmd_double( cmd_content, reply_content );
}
#line 183 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
void micro_SD( void )
{ at_cmd_single( "AT+FSDRIVE=1" );


 at_cmd_single( "AT+FSCREATE=D:\\mikroelektronika.txt" );


 at_cmd_single( "AT+FSCREATE=D:\\event_log.txt" );


 at_cmd_single( "AT+FSWRITE=D:\\event_log.txt,0,11,1" );
 at_cmd_single( "SEQUENCE:\r\n" );

 Delay_ms( 1000 );


 at_cmd_single( "AT+FSWRITE=D:\\mikroelektronika.txt,0,44,1" );
 at_cmd_single( "Mikroelektronika GSM/GNSS 2 click example\r\n" );

 Delay_ms( 1000 );


 at_cmd_single( "AT+FSREAD=D:\\mikroelektronika.txt,1,50,0" );


 at_cmd_single( "AT+FSFLSIZE=D:\\mikroelektronika.txt" );

 at_cmd_single( "AT+FSMEM" );
}
#line 216 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
void rsp_handler( char *rsp )
{
 char tmp[ 25 ] = { 0 };



 if ( !strncmp( rsp, "\r\nNORMAL POWER DOWN", 19 ) )
 {
 GSM_GNSS_2_RST = 0;
 Delay_ms( 1500 );
 GSM_GNSS_2_RST = 1;
 }


 if ( !strncmp( rsp, "\r\nRDY", 5 ) )
 {
 ready_f =  1 ;
 }


 if ( !strncmp( rsp, "\r\nNO CARRIER", 12 ) )
 {
 isCall =  1 ;
 action_f =  1 ;
 }
}


void sms_action_handler( char* rsp )
{
 isMessage =  1 ;
 action_f =  1 ;
}

void at_cb_send_init_message ( char* rsp )
{
 msg_sent =  1 ;
}

void at_cb_microsd_end ( char* rsp )
{

 sd_f =  1 ;
}

void update_log ( void )
{
 char log_type[ 8 ] = { 0 };

 if ( isMessage )
 {
 strcpy( log_type, " msg  " );
 msg_counter++;
 isMessage =  0 ;
 }
 if ( isCall )
 {
 strcpy( log_type, " call ");
 call_counter++;
 isCall =  0 ;
 }


 ByteToStr( msg_counter, txt_msg );
 ByteToStr( call_counter, txt_call );





 Delay_ms ( 1000 );



 at_cmd_single( "AT+CGPSINF=0" );
}

void main( void )
{
 system_init();
 at_init( rsp_handler, UART3_Write, buffer, sizeof( buffer ) );
 at_cmd_save( "+CMS ERROR", 1000,  ((void *)0) ,  ((void *)0) ,  ((void *)0) , at_cb_send_init_message );
 at_cmd_save( "+FSMEM", 3000,  ((void *)0) ,  ((void *)0) ,  ((void *)0) , at_cb_microsd_end );
 at_cmd_save( "+CMT", 3000,  ((void *)0) ,  ((void *)0) ,  ((void *)0) , sms_action_handler );
 at_cmd_save( "+CMGS", 1000,  ((void *)0) ,  ((void *)0) ,  ((void *)0) , at_cb_send_init_message );

 gsm_gnss_2_power_on();

 gsm_gnss_2_init();

 send_SMS();

 while( !msg_sent ) at_process();
#line 336 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
}
#line 341 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
void TICK_ISR() iv IVT_INT_TIM2
{
 TIM2_SR.UIF = 0;
 at_tick();
}
#line 350 "C:/Users/pc2/Desktop/GSM_STUD_LIB_To_Edit/GSM_GNSS_2_ARM.c"
void RX_ISR() iv IVT_INT_USART3 ics ICS_AUTO
{
 if( RXNE_USART3_SR_bit )
 {
 char tmp = USART3_DR;
 at_rx( tmp );
 }
}
