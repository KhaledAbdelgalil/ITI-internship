#line 1 "C:/Users/pc2/Desktop/embded/codes/microCforArm/big project/UART.c"
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
#line 2 "C:/Users/pc2/Desktop/embded/codes/microCforArm/big project/UART.c"
extern u8 x_tft,y_tft;
extern u8 UART_flag;
void comm()
{
 u8 tb3a[20];
 u8 start=0;
 u8 lens=0;
 while( UART_flag==1)
 {
 if(TP_TFT_Press_Detect())
 {
 TP_TFT_Get_Coordinates(&x_tft,&y_tft);

 if(x_tft>=0&& x_tft<=42&&y_tft>=0&&y_tft<=42)
 {
 start=0;
 UART_flag=0;
 UART1_Write_Text("back");
 TFT_Fill_Screen(CL_Green);
 module1();
 }

 else if(x_tft>=150&& x_tft<=200&&y_tft>=40&&y_tft<=70)
 {
 UART1_Write_Text(" start ");
 start=1;
 while(start==1)
 {


 while(1)
 {
 if(TP_TFT_Press_Detect())
 {
 TP_TFT_Get_Coordinates(&x_tft,&y_tft);
 break;
 }
 }

 if(x_tft>=0&& x_tft<=42&&y_tft>=0&&y_tft<=42)
 {
 start=0;
 UART_flag=0;
 UART1_Write_Text(" back ");
 TFT_Fill_Screen(CL_Green);
 module1();
 }

 else if((x_tft>=150&& x_tft<=200&&y_tft>=75&&y_tft<=105)||lens==20)
 {
 UART1_Write_Text(" end ");
 start=0;
 lens=0;

 }

 else if(x_tft>=0&& x_tft<=50&&y_tft>=120&&y_tft<=140)
 {
 UART1_Write_Text("1");
 tb3a[lens]='1';
 lens++;

 }

 else if (x_tft>=105&& x_tft<=150&&y_tft>=120&&y_tft<=140)
 {
 UART1_Write_Text("2");
 tb3a[lens]='2';
 lens++;


 }

 else if (x_tft>=205&& x_tft<=250&&y_tft>=120&&y_tft<=140)
 {
 UART1_Write_Text("3");
 tb3a[lens]='3';
 lens++;


 }


 }


 }



 else if( x_tft>=150&& x_tft<=200&&y_tft>=200&&y_tft<=230)
 {
 UART1_Write_Text(" send : ");
 UART1_Write_Text(tb3a);

 }
 }
 }


 }
