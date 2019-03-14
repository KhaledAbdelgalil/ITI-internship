
#include "at_engine.h"
 #include "Gsm_headers.h"
/*
 * GSM / GNSS 2 reset pin
 */
sbit GSM_GNSS_2_RST at GPIOC_ODR.B2;

/*
 * Power OFF String
 */
const char powerdown[] = "\r\nNORMAL POWER DOWN";

/*
 * Ready Flag
 */
bool ready_f = false;

/*
 * SIM Action Flag
 */
bool action_f = false;

/*
 * Message Ready Flag
 */
bool msg_ready_f = false;

/*
 * Message Delivered Flag
 */
bool msg_sent = false;

/*
 * microSD end Flag
 */
bool sd_f = false;

/*
 * Message event registered
 */
bool isMessage = false;

/*
 * Call event registered
 */
bool isCall = false;

/*
 * Response buffer
 */
uint8_t buffer[ 1024 ] = { 0 };

/*
 * Receiver ID ( Enter your phone number here )
 */
//char receiver_ID[ 20 ] = "\"01285883509\"";
char receiver_ID[ 20 ] = {0};

/*
 * Number of calls
 */
 uint8_t call_counter;
 
/*
 * Number of messages
 */
 uint8_t msg_counter;
 
/* 
 * Textual representation of numbers 
 */
 char txt_call[ 5 ] = { 0 };
 char txt_msg[ 5 ] = { 0 };

/*
 * System Initialization
 *    - GPIO Initialization
 *        + gsm_gnss_2 RST pin
 *    - Peripherals Initialization
 *        + UART1 for data dump
 *        + UART3 for GSM/GNSS 2 ( SIM868 )
 *    - Interrupt Initialization
 *        + Timer
 *        + UART
 */
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

/*
 * Power ON routine for GSM / GNSS 2
 */
static void gsm_gnss_2_power_on( void )
{   
    // Apply reset procedure
    at_cmd_single( "AT+CPOWD=1" );
    GSM_GNSS_2_RST = 1;
    Delay_ms( 1000 );
    GSM_GNSS_2_RST = 0;
    Delay_ms( 1500 );
    GSM_GNSS_2_RST = 1;
    

    Delay_ms( 20000 );                           // Waiting for GPS to stabilize
  }

void gsm_gnss_2_init( void )
{   

    // Enable Report of Mobile Equipment Error
    at_cmd_single( "AT+CMEE=2" );

    // Select Text SMS Message Format
    at_cmd_single( "AT+CMGF=1" );
     
    // Get SIM card group identifier
    at_cmd_single( "AT+CGID" );
    
    // List Available TE Character Set
    at_cmd_single( "AT+CSCS=?" );

    // Set TE Character Set as GSM 
    at_cmd_single( "AT+CSCS=\"GSM\"" );
    
    // Set New SMS Message Indications
    at_cmd_single( "AT+CNMI=2,2,0,1,0" );
    
    // Set SMS Text Mode Parameters
    at_cmd_single( "AT+CSMP=17,167,0,16" );

     // Power on GPS
    at_cmd_single( "AT+CGPSPWR=1" );

     // Reset and restart GPS
    at_cmd_single( "AT+CGPSRST=1" );
    
  }

/*
 * Composing Command and SMS content
 */
void send_SMS( u8 s )
{
    char cmd_content[ 30 ] = { 0 };              // Send SMS command
    char reply_content[ 256 ] = { 0 };           // SMS content

    strcat( cmd_content, "AT+CMGS=" );
    strcat( cmd_content, receiver_ID );

    if(s=='0')
    {
          strcat( reply_content,"Please Call Me Later" );
          at_cmd_double( cmd_content, reply_content );
   }
  else if(s=='1')
  {
          strcat( reply_content,"I'm at a Meeting" );
          at_cmd_double( cmd_content, reply_content );
  }
  else if(s=='2')
  {
          strcat( reply_content,"Can't take your call now!s" );
          at_cmd_double( cmd_content, reply_content );
   }
   else
    {
           strcat( reply_content,"message fault" );
           at_cmd_double( cmd_content, reply_content );
    }

    
}



/*
* Checking available memory, file creating, reading and writing to SD
*/
void micro_SD( void ) 
{    at_cmd_single( "AT+FSDRIVE=1" );      // 1 - SD card drive , 0 - Local drive
      
    // Creating file mikroe.txt
    at_cmd_single( "AT+FSCREATE=D:\\mikroelektronika.txt" );

    // Creating file event_log.txt
    at_cmd_single( "AT+FSCREATE=D:\\event_log.txt" );  

    // Writing string into event_log file 
    at_cmd_single( "AT+FSWRITE=D:\\event_log.txt,0,11,1" );
    at_cmd_single( "SEQUENCE:\r\n" );

    Delay_ms( 1000 );
 
    // Writing string into mikroelektronika file 
    at_cmd_single( "AT+FSWRITE=D:\\mikroelektronika.txt,0,44,1" );
    at_cmd_single( "Mikroelektronika GSM/GNSS 2 click example\r\n" );

    Delay_ms( 1000 );
    
    // Reading file data of mikroe.txt
    at_cmd_single( "AT+FSREAD=D:\\mikroelektronika.txt,1,50,0" );
    
    // Checking the file size of mikroe.txt
    at_cmd_single( "AT+FSFLSIZE=D:\\mikroelektronika.txt" );
    
    at_cmd_single( "AT+FSMEM" );          // Get the Size of Available Memory
}

/*
 * Default response handler
 */
void rsp_handler( char *rsp )
{
    char tmp[ 25 ] = { 0 };


    // Performing reset procedure in case of power down    
    if ( !strncmp( rsp, "\r\nNORMAL POWER DOWN", 19 ) )
    {
        GSM_GNSS_2_RST = 0;
        Delay_ms( 1500 );
        GSM_GNSS_2_RST = 1;
      }
    

    if ( !strncmp( rsp, "\r\nRDY", 5 ) )
    {
        ready_f = true;
    }
    
    // Perform action after hang up
    if ( !strncmp( rsp, "\r\nNO CARRIER", 12 ) )
    {
        isCall = true;
        action_f = true;
    }
}


void sms_action_handler( char* rsp )
{ 
    isMessage = true;  
    action_f = true;
}

void at_cb_send_init_message ( char* rsp )
{
   msg_sent = true;
}

void at_cb_microsd_end ( char* rsp )
{

    sd_f = true;
}

void update_log ( void )
{
    char log_type[ 8 ] = { 0 };
      
    if ( isMessage )
    {
      strcpy( log_type, " msg  " );
      msg_counter++;
      isMessage = false;
    }
    if ( isCall )
    {
      strcpy( log_type, " call ");
      call_counter++;
      isCall = false;
    }


    ByteToStr( msg_counter, txt_msg );
     ByteToStr( call_counter, txt_call );


    // Save log to microSD card                   
  //  at_cmd_single( "AT+FSWRITE=D:\\event_log.txt,1,6,1" );
 //   at_cmd_single( log_type );  
    Delay_ms ( 1000 );


    // Read GPS info
    at_cmd_single( "AT+CGPSINF=0" );
}
// TFT module connections
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_RST at GPIOE_ODR.B8;
sbit TFT_BLED at GPIOE_ODR.B9;
// End TFT module connections

 // Touch Panel module connections
sbit DriveX_Left at GPIOB_ODR.B1;
sbit DriveX_Right at GPIOB_ODR.B8;
sbit DriveY_Up at GPIOB_ODR.B9;
sbit DriveY_Down at GPIOB_ODR.B0;
// End Touch Panel module connections

void main( void )
{       u8 initial_x=10;
        u8 counter_rkm=0;
        u16 x_tft=500;
        u16 y_tft=500;
        u8 mobile[12];
        u8 flag_messag=1;
        u8 press_messag=10;
        TFT_Set_Default_Mode();
   TFT_Init_ILI9341_8bit(320,240);
   TFT_Fill_Screen(CL_Red);
   TFT_Write_Text("First calibration of our touch screen",90,120);
   Delay_ms(500);
    TFT_Fill_Screen(CL_GREEN);
   TFT_Set_Pen(CL_Blue,20);
   ADC_Set_Input_Channel(3);
   Init_ADC();
   TP_TFT_Init(320, 240, 8, 9);
   TP_TFT_Set_ADC_Threshold(750);
    Calibrate();
  TFT_Fill_Screen(CL_GREEN);
  module_layout();
  //rkm
    while(counter_rkm!=11)
    {
    while(TP_TFT_Press_Detect())
    {
       TP_TFT_Get_Coordinates(&x_tft,&y_tft);
    }

     if(x_tft>=0 &&x_tft<=32 &&y_tft>= 48&&y_tft<=96 )
    {
          mobile[counter_rkm]='0';
             counter_rkm++;
            TFT_Write_Text("0",initial_x,20);
            initial_x+=10;
            x_tft=500;
             y_tft=500;
    }
    else if(x_tft>=32 &&x_tft<=64 &&y_tft>= 48&&y_tft<=96 )
    {
          mobile[counter_rkm]='1';
             counter_rkm++;
            TFT_Write_Text("1",initial_x,20);
            initial_x+=10;
            x_tft=500;
             y_tft=500;
    }
    else if(x_tft>=64&&x_tft<=96 &&y_tft>= 48&&y_tft<=96 )
    {
          mobile[counter_rkm]='2';
             counter_rkm++;
            TFT_Write_Text("2",initial_x,20);
            initial_x+=10;
            x_tft=500;
             y_tft=500;
    }
    else if(x_tft>=96 &&x_tft<=128 &&y_tft>= 48&&y_tft<=96 )
    {
          mobile[counter_rkm]='3';
             counter_rkm++;
            TFT_Write_Text("3",initial_x,20);
            initial_x+=10;
            x_tft=500;
             y_tft=500;
    }
    else if(x_tft>=128 &&x_tft<=160 &&y_tft>= 48&&y_tft<=96 )
    {
          mobile[counter_rkm]='4';
             counter_rkm++;
            TFT_Write_Text("4",initial_x,20);
            initial_x+=10;
            x_tft=500;
             y_tft=500;
    }
    else if(x_tft>=160 &&x_tft<=192 &&y_tft>= 48&&y_tft<=96 )
    {
          mobile[counter_rkm]='5';
             counter_rkm++;
            TFT_Write_Text("5",initial_x,20);
            initial_x+=10;
            x_tft=500;
             y_tft=500;
    }
    else if(x_tft>=192 &&x_tft<=224 &&y_tft>= 48&&y_tft<=96 )
    {
          mobile[counter_rkm]='6';
             counter_rkm++;
            TFT_Write_Text("6",initial_x,20);
            initial_x+=10;
            x_tft=500;
             y_tft=500;
    }
    else if(x_tft>=224 &&x_tft<=256 &&y_tft>= 48&&y_tft<=96 )
    {
          mobile[counter_rkm]='7';
             counter_rkm++;
            TFT_Write_Text("7",initial_x,20);
            initial_x+=10;
            x_tft=500;
             y_tft=500;
    }
    else if(x_tft>=256 &&x_tft<=288 &&y_tft>= 48&&y_tft<=96 )
    {
          mobile[counter_rkm]='8';
             counter_rkm++;
            TFT_Write_Text("8",initial_x,20);
            initial_x+=10;
            x_tft=500;
             y_tft=500;
    }
    else if(x_tft>=288 &&x_tft<=320 &&y_tft>= 48&&y_tft<=96 )
    {
          mobile[counter_rkm]='9';
             counter_rkm++;
            TFT_Write_Text("9",initial_x,20);
            initial_x+=10;
            x_tft=500;
             y_tft=500;
    }

    }

      mobile[11]='\0';
    strcat( receiver_ID, "\"" );
    strcat( receiver_ID,mobile);
     strcat( receiver_ID, "\"" );

    //message
    while(flag_messag)
    {
      if(TP_TFT_Press_Detect())
    {
       TP_TFT_Get_Coordinates(&x_tft,&y_tft);
      if(y_tft>= 96&&y_tft<=144 )
      {
          press_messag='0';
          //void TFT_Circle(int x_center, int y_center, int radius);
           TFT_Circle(10, 120, 10);
           flag_messag=0;
         TFT_Write_Char(press_messag ,10,120);
           
      }
      else if(y_tft>= 144&&y_tft<=192 )
      {
            press_messag='1';
           TFT_Circle(10, 168, 10);
           flag_messag=0;
             
           TFT_Write_Char(press_messag ,10,168);

      }
      else if(y_tft>= 192&&y_tft<=240 )
      {
             press_messag='2';
             TFT_Circle(10, 216, 10);
             flag_messag=0;
             TFT_Write_Char(press_messag ,10,216);

      }
      
    }

    }
      //send
   system_init();
    at_init( rsp_handler, UART3_Write, buffer, sizeof( buffer ) );
    at_cmd_save( "+CMS ERROR", 1000, NULL, NULL, NULL, at_cb_send_init_message );
    at_cmd_save( "+FSMEM", 3000, NULL, NULL, NULL, at_cb_microsd_end );
    at_cmd_save( "+CMT", 3000, NULL, NULL, NULL, sms_action_handler );
    at_cmd_save( "+CMGS", 1000, NULL, NULL, NULL, at_cb_send_init_message );

    gsm_gnss_2_power_on();

    gsm_gnss_2_init();

    send_SMS(press_messag);                               // Sending initial message

    while( !msg_sent ) at_process();          // Waiting for SMS sending status

    TFT_Fill_Screen(CL_GREEN);

 /*   micro_SD();                               // Creating files on microSD
    
    while( !sd_f ) at_process();              // Waiting for SD card operations
    
    LOG( "\r\n**********************************************************\r\n" );
    LOG( "Finished SD Initialization.");
    LOG( "\r\n**********************************************************\r\n" );
    Delay_ms( 1000 );
    
    LOG( "\r\n**********************************************************\r\n" );
    LOG( "Waiting for the Message or Call in an Infinite Loop");
    LOG( "\r\n**********************************************************\r\n" );

    ////////////////////////////////////////////////////////////////////////////
    while( true )
    {
        at_process();

        if ( action_f )                       // Message received or call ended
        {
            update_log();
            action_f = false;
        }
    } */
    ////////////////////////////////////////////////////////////////////////////
}

/*
 * Timer Interrupt
 */
void TICK_ISR() iv IVT_INT_TIM2
{
    TIM2_SR.UIF = 0;
    at_tick();
}

/*
 * UART Interrupt
 */
void RX_ISR() iv IVT_INT_USART3 ics ICS_AUTO
{
    if( RXNE_USART3_SR_bit )
    {
        char tmp = USART3_DR;
        at_rx( tmp );
    }
}
/************************************************************ END OF FILE *****/