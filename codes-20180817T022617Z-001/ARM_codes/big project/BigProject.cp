#line 1 "C:/Users/pc2/Desktop/embded/codes/microCforArm/big project/BigProject.c"
#line 1 "c:/users/pc2/desktop/embded/codes/microcforarm/big project/header.h"
typedef unsigned char u8;
typedef unsigned int u16;
 typedef unsigned long int u32;




void Calibrate(void);
void Init_ADC(void);


void module1 ();
void Games_Module();


void draw(u8 sizeOFsnake);
void ams7();
void snake();
void after_snake();


void paint_module();
void paint_module2();
void paint();
void paint2();

void comm_module();
void comm();
#line 9 "C:/Users/pc2/Desktop/embded/codes/microCforArm/big project/BigProject.c"
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_RST at GPIOE_ODR.B8;
sbit TFT_BLED at GPIOE_ODR.B9;



sbit DriveX_Left at GPIOB_ODR.B1;
sbit DriveX_Right at GPIOB_ODR.B8;
sbit DriveY_Up at GPIOB_ODR.B9;
sbit DriveY_Down at GPIOB_ODR.B0;



u16 x_tft=500,y_tft=500;


u16 x=160,y=120;
u8 size_snake= 20 ;
u8 dofd3_flag=0;

 u8 flag_games=0;

u8 paint_flag=0;
u8 tany_mara=0;


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

 else if(y_tft<120)
 {
 dofd3_flag=1;
 snake();
 x_tft=500,
 y_tft=500;

 }

 }
 }



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


 else if(y_tft<=160&&y_tft>=80)
 {
 y_tft=500;
 x_tft=500;
 comm_module();
 UART_flag=1;
 comm();
 }


 }


 }

}
