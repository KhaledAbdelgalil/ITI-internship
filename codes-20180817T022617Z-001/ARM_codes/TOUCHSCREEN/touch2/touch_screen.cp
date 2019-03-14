#line 1 "C:/Users/pc2/Desktop/embded/TOUCHSCREEN/touch_screen.c"
#line 1 "c:/users/pc2/desktop/embded/touchscreen/typedefs.h"
typedef unsigned long int u32;
typedef signed long int s32;

typedef signed char s8;
typedef unsigned char u8;
typedef signed int s16;
typedef unsigned int u16;
void play(float Duty,float freq);
#line 7 "C:/Users/pc2/Desktop/embded/TOUCHSCREEN/touch_screen.c"
 unsigned int TFT_DataPort at GPIOE_ODR;
 sbit TFT_RST at GPIOE_ODR.B8;
 sbit TFT_RS at GPIOE_ODR.B12;
 sbit TFT_CS at GPIOE_ODR.B15;
 sbit TFT_RD at GPIOE_ODR.B10;
 sbit TFT_WR at GPIOE_ODR.B11;
 sbit TFT_BLED at GPIOE_ODR.B9;


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
#line 35 "C:/Users/pc2/Desktop/embded/TOUCHSCREEN/touch_screen.c"
while(1)
{


 if( TP_TFT_Press_Detect())
 {
 TFT_Fill_Screen(CL_Blue);
 }
}


 }
