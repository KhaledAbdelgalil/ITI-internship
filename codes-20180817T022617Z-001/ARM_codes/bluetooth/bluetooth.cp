#line 1 "C:/Users/pc2/Desktop/embded/microCforArm/bluetooth/bluetooth.c"

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

void Calibrate(void);
void BT_Configure();
void Init_ADC(void);

void main() {
char a[5];
char i=0;
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
 UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PD89);
 Delay_ms(100);
 BT_Configure();
 Delay_ms(4000);
 while(1)
 {
 if(UART3_Data_Ready())
 {
 a[i]=UART3_Read();
 TFT_Write_Char(a,22+i*10,23);
 i+=1;
 if(i==5)
 UART3_Write_Text(a);
 }
 }

}





void BT_Configure() {

 UART3_Write_Text("$$$");
 Delay_ms(500);
 Delay_ms(500);

 UART3_Write_Text("SN,BlueTooth-LOODA");
 UART3_Write(13);
 Delay_ms(500);
 Delay_ms(500);

 UART3_Write_Text("SO,Slave");
 UART3_Write(13);
 Delay_ms(500);
 Delay_ms(500);

 UART3_Write_Text("SM,0");
 UART3_Write(13);
 Delay_ms(500);
 Delay_ms(500);

 UART3_Write_Text("SA,1");
 UART3_Write(13);
 Delay_ms(500);
 Delay_ms(500);


 UART3_Write_Text("SP,1234");
 UART3_Write(13);
 Delay_ms(500);
 Delay_ms(500);


 UART3_Write_Text("---");
 UART3_Write(13);
 Delay_ms(500);
 Delay_ms(500);
}
void Calibrate(void) {
 TFT_Set_Pen(CL_WHITE, 3);
 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
 TFT_Write_Text("Touch selected corners for calibration", 50, 80);
 TFT_Line(315, 239, 319, 239);
 TFT_Line(309, 229, 319, 239);
 TFT_Line(319, 234, 319, 239);
 TFT_Write_Text("first here",235,220);

 TP_TFT_Calibrate_Min();
 Delay_ms(500);
 TFT_Set_Pen(CL_BLACK, 3);
 TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
 TFT_Line(315, 239, 319, 239);
 TFT_Line(309, 229, 319, 239);
 TFT_Line(319, 234, 319, 239);
 TFT_Write_Text("first here",235,220);

 TFT_Set_Pen(CL_WHITE, 3);
 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
 TFT_Write_Text("now here ", 20, 5);
 TFT_Line(0, 0, 5, 0);
 TFT_Line(0, 0, 0, 5);
 TFT_Line(0, 0, 10, 10);

 TP_TFT_Calibrate_Max();
 Delay_ms(500);
}

 void Init_ADC(void) {
 ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
 ADC1_Init();
 Delay_ms(100);
}
