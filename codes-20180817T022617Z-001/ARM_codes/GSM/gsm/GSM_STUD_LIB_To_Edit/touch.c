void Calibrate(void) {
  TFT_Set_Pen(CL_WHITE, 3);
  TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
  TFT_Write_Text("Touch selected corners for calibration", 50, 80);
  TFT_Line(315, 239, 319, 239);
  TFT_Line(309, 229, 319, 239);
  TFT_Line(319, 234, 319, 239);
  TFT_Write_Text("first here",235,220);

  TP_TFT_Calibrate_Min();                      // Calibration of bottom left corner
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

  TP_TFT_Calibrate_Max();                      // Calibration of bottom left corner
  Delay_ms(500);
}

 void Init_ADC(void) {
  ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
  ADC1_Init();
  Delay_ms(100);
}
void module_layout()
{
//void TFT_H_Line(int x_start, int x_end, int y_pos);

TFT_H_Line(0,320,48);
TFT_H_Line(0,320,96);
TFT_H_Line(0,320,144);
TFT_H_Line(0,320,192);
  //void TFT_V_Line(int y_start, int y_end, int x_pos);

TFT_V_Line(48,96,32);
TFT_V_Line(48,96,64);
TFT_V_Line(48,96,96);
TFT_V_Line(48,96,128);
TFT_V_Line(48,96,160);
TFT_V_Line(48,96,192);
TFT_V_Line(48,96,224);
TFT_V_Line(48,96,256);
TFT_V_Line(48,96,288);
TFT_V_Line(0,48,256);



TFT_Write_Text("Please Call Me Later",70,120);
TFT_Write_Text("I'm at a Meeting",70,168);
TFT_Write_Text("Can't take your call now!",70,216);


TFT_Write_Text("0",16,72);
TFT_Write_Text("1",48,72);
TFT_Write_Text("2",80,72);
TFT_Write_Text("3",112,72);
TFT_Write_Text("4",144,72);
TFT_Write_Text("5",176,72);
TFT_Write_Text("6",208,72);
TFT_Write_Text("7",244,72);
TFT_Write_Text("8",276,72);
TFT_Write_Text("9",308,72);


TFT_Write_Text("UNDO",270,18);



}