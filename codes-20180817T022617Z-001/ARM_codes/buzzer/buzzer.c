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
 u16 x=160,y=120;
 u8 flag=0;
 void ams7();
 void play(float Duty,float freq);
  void draw(u8 flag);
void main() 
{

u8 R=0;
u8 L=0;
u8 U=0;
u8 D=0;
u8 value=0;
u16 _step_x=1;
u16 _step_y=3;
GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
TFT_Set_Default_Mode();
TFT_Init_ILI9341_8bit(320,240);
TFT_Fill_Screen(CL_RED);
//let's play
TFT_Write_Text("let's play",150,120);
Delay_ms(1000);
TFT_Fill_Screen(CL_RED);
//start
 TFT_Set_Pen(CL_GRAY,10);
 TFT_Circle(x, y, 0);
   _step_x=rand()/8000;
 _step_y=rand()/8000;
 while(1)
 {

      if(x>=320)
      {
      ams7();
     _step_x=-_step_x;

      }
       if(x<=0)
      {
       ams7();
     _step_x =-_step_x;
      }
 

       if(y>=320)
      {
      ams7();
    _step_y=-_step_y;
      }
       if(y<=0)
      {
       ams7();
       _step_y=-_step_y;
      }

     ams7();
     x+=_step_x;
     y+=_step_y;
      draw(flag);
      
      _step_x=rand()/800;
 _step_y=rand()/800;
 
  //joystick
   R=Button(&GPIOA_IDR,6,delay_time,active_stateJ);
    L=Button(&GPIOD_IDR,2,delay_time,active_stateJ);
    U=Button(&GPIOD_IDR,4,delay_time,active_stateJ);
    D=Button(&GPIOB_IDR,5,delay_time,active_stateJ);
    value= Button(&GPIOB_IDR,0,delay_time,active_stateB);
          //directions
          if(R==255)
          {
          switch(x)
          {
          case 320:   ams7();
                      x=0;
                      draw(flag);
                      break;
          default:    ams7();
                      x+=20;
                      draw(flag);
                      break;
          }
          
          }
          else if(L==255)
          {
          switch(x)
          {
          case 0:     ams7();
                      x=320;
                      draw(flag);
                      break;
          default:    ams7();
                      x-=20;
                      draw(flag);
                      break;
          }
          }
          else if(D==255)
          {
          switch(y)
          {
          case 320:   ams7();
                      y=0;
                      draw(flag);
                      break;
          default:    ams7();
                      y+=20;
                      draw(flag);
                      break;
          }
          }
          else if(U==255)
          {
         switch(y)
          {
          case 0:     ams7();
                      y=320;
                      draw(flag);
                      break;
          default:    ams7();
                      y-=20;
                      draw(flag);
                      break;
          }
          }
             //color
            if(value==255)
            {
               switch(flag)
               {

                case 0:
                           TFT_Set_Pen(CL_BLACK,10);
                           TFT_Circle(x, y, 0);
                           flag=1;
                           break ;
                 case 1:
                           TFT_Set_Pen(CL_GRAY,10);
                           TFT_Circle(x, y, 0);
                           flag=0;
                           break ;
                           
               }
            
            }

                }
             
         //u16 value ;
        //GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
        //GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
       // GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
       // ADC_Set_Input_Channel(_ADC_CHANNEL_3);
        //ADC1_Init();
        //DAC1_Init(_DAC_CH1_ENABLE);

       // GPIOC_ODR=0;
       // GPIOE_ODR=0;
       // GPIOD_ODR=0;

       
       
       

                   // value= ADC1_Get_Sample(3);
                   // delay_ms(100);
                    /*if(value>0)   GPIOE_ODR=2048;
                    if(value>512)
                    {
                     GPIOE_ODR=34816;
                     GPIOD_ODR=0;
                     }
                    if(value>1024)  GPIOD_ODR=12;
                    if(value>1536)  GPIOD_ODR=204;
                    if(value>2048)  GPIOD_ODR=3788;
                    if(value>2560)  GPIOD_ODR=61132;*/


                    /*Sound_Init(&GPIOE_ODR,14);
                    Sound_play(value, 1000);*/

                  /*  for( value=0;value<4096;value++)
                    {
                        DAC1_Ch1_Output(value);
                        Delay_ms(1);
                    }     */
                    
                    //lcd
                    
                    
                    


}
//functions
void draw(u8 flag)
{
if (flag==1) 
{
     TFT_Set_Pen(CL_BLACK,10);
      TFT_Circle(x, y, 0);
}
else 
{
     TFT_Set_Pen(CL_GRAY,10);
     TFT_Circle(x, y, 0);
}

}

   void ams7()
    {
         TFT_Set_Pen(CL_RED,10);
          TFT_Circle(x, y, 0);
    }