#line 1 "C:/Users/pc2/Desktop/embded/buzzer/buzzer.c"
#line 1 "c:/users/pc2/desktop/embded/buzzer/typedefs.h"
typedef unsigned long int u32;
typedef signed long int s32;

typedef signed char s8;
typedef unsigned char u8;
typedef signed int s16;
typedef unsigned int u16;
void play(float Duty,float freq);
#line 7 "C:/Users/pc2/Desktop/embded/buzzer/buzzer.c"
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

TFT_Write_Text("let's play",150,120);
Delay_ms(1000);
TFT_Fill_Screen(CL_RED);

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


 R=Button(&GPIOA_IDR,6, 100 , 0 );
 L=Button(&GPIOD_IDR,2, 100 , 0 );
 U=Button(&GPIOD_IDR,4, 100 , 0 );
 D=Button(&GPIOB_IDR,5, 100 , 0 );
 value= Button(&GPIOB_IDR,0, 100 , 1 );

 if(R==255)
 {
 switch(x)
 {
 case 320: ams7();
 x=0;
 draw(flag);
 break;
 default: ams7();
 x+=20;
 draw(flag);
 break;
 }

 }
 else if(L==255)
 {
 switch(x)
 {
 case 0: ams7();
 x=320;
 draw(flag);
 break;
 default: ams7();
 x-=20;
 draw(flag);
 break;
 }
 }
 else if(D==255)
 {
 switch(y)
 {
 case 320: ams7();
 y=0;
 draw(flag);
 break;
 default: ams7();
 y+=20;
 draw(flag);
 break;
 }
 }
 else if(U==255)
 {
 switch(y)
 {
 case 0: ams7();
 y=320;
 draw(flag);
 break;
 default: ams7();
 y-=20;
 draw(flag);
 break;
 }
 }

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
#line 212 "C:/Users/pc2/Desktop/embded/buzzer/buzzer.c"
}

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
