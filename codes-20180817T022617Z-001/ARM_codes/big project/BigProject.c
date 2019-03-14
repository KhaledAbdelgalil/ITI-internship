#include "HEADER.h"
#define delay_time 100
#define active_stateB 1
#define active_stateJ 0
#define snake_initial_size  20


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

//position of dosa
u16 x_tft=500,y_tft=500;

// definitions related to snake
u16 x=160,y=120;
u8 size_snake=snake_initial_size;
u8 dofd3_flag=0;
//games_Screen
    u8 flag_games=0;
//paint
u8 paint_flag=0;
u8 tany_mara=0;

//UART
 u8 UART_flag=0;
void main() {

   GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_ALL);
   GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_ALL);
   GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_ALL);
   GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);

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
   module1 ();
   while(1)
   {
    if(TP_TFT_Press_Detect())
    {
      
      TP_TFT_Get_Coordinates(&x_tft,&y_tft);
      //start of games
      if(y_tft<=70&&y_tft>=0)
      {
          y_tft=500;
          x_tft=500;
          Games_Module();
          flag_games=1;
          while(flag_games==1)
          {

          if (TP_TFT_Press_Detect()) 
          TP_TFT_Get_Coordinates(&x_tft,&y_tft);

           if((x_tft<=320 &&x_tft>=235) || ( y_tft<=220 &&y_tft>=240))
           {
             TFT_Fill_Screen(CL_GREEN);
             module1 ();
             flag_games=0;
             y_tft=500;
             x_tft=500;
           }
           //dofd3
           else if(y_tft<120)
           {
            dofd3_flag=1;
            snake();
            x_tft=500,
            y_tft=500;
               
           }
           //end of dofd3
          }
      }
      //end of games
      
      //start of paint
      else if(y_tft>=160&&y_tft<=240)
      {
      if(tany_mara==0)
      {
      y_tft=500;
      x_tft=500;
      paint_module();
       paint_flag=1;
        paint();
        tany_mara=1;
        }
      else if(tany_mara==1)
      {
      y_tft=500;
      x_tft=500;
      paint_module2();
      paint_flag=1;
      paint2();
      }
      }
      //end of paint
      //start of comm
        else if(y_tft<=160&&y_tft>=80)
        {
         y_tft=500;
         x_tft=500;
         comm_module();
         UART_flag=1;
         comm();
        }
      
      //end of comm
   }


   }

}