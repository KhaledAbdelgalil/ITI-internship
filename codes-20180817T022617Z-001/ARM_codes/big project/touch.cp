#line 1 "C:/Users/pc2/Desktop/embded/codes/microCforArm/big project/touch.c"

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
