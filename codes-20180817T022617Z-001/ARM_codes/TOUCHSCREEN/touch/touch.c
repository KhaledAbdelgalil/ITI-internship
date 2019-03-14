#include "typedefs.h"
#define delay_time 100
#define active_stateB 1
#define active_stateJ 0

 //definitions of lcd
 unsigned int TFT_DataPort at GPIOE_ODR;
 sbit TFT_RST at GPIOE_ODR.B8;
 sbit TFT_RS at GPIOE_ODR.B12;
 sbit TFT_CS at GPIOE_ODR.B15;
 sbit TFT_RD at GPIOE_ODR.B10;
 sbit TFT_WR at GPIOE_ODR.B11;
 sbit TFT_BLED at GPIOE_ODR.B9;

 //touch panel
 sbit DriveX_Left at GPIOE_ODR.B1;
 sbit DriveX_Right at GPIOE_ODR.B8;
 sbit DriveY_Up at GPIOE_ODR.B9;
 sbit DriveY_Down at GPIOE_ODR.B10;

 void main()
 {
 u16 x;
 u16 y;
 u8 xs[100];
 u8 ys[100];
 TFT_Set_Default_Mode();
TFT_Init_ILI9341_8bit(320,240);
 TFT_Fill_Screen(CL_RED);
ADC1_Init();
 ADC_Set_Input_Channel(_ADC_CHANNEL_8|_ADC_CHANNEL_9);
TP_TFT_Init(320,240,8,9);
TP_TFT_Set_ADC_Threshold(750);

while(1)
{
      //TP_TFT_Get_Coordinates(&x, &y);

     if( TP_TFT_Press_Detect())
     {
            TFT_Fill_Screen(CL_Blue);
     }
}


 }