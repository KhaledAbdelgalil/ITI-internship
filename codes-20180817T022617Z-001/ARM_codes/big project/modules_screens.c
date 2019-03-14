 #include "HEADER.h"
 extern  x_tft,y_tft;

void module1 ()
{
 y_tft=500;
 x_tft=500;
TFT_Set_Pen(CL_WHITE, 3);
TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
TFT_Write_Text("GAMES",120,60);
TFT_Line(0,80,320,80);
TFT_Write_Text("comm",120,120);
TFT_Line(0,150,320,150);
TFT_Write_Text("paint",120,180);


}
void Games_Module()
{
TFT_Fill_Screen(CL_Blue);
TFT_Write_Text("Dofd3",120,60);
TFT_Write_Text("bouncing",120,180);
 TFT_Line(0,120,320,120);

  TFT_Write_Text("here to back",235,220);

}
void paint_module()
{
   TFT_Fill_Screen(CL_WHITE);
   TFT_Set_Pen(CL_BLACK, 3);
   TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);


   TFT_Rectangle(0,0, 42, 21);
   TFT_Write_Text("Back", 2, 0);
   TFT_Rectangle(0,21, 42, 42);
   TFT_Write_Text("Erase", 2, 21);

   TFT_Set_Pen(CL_AQUA, 30);
   TFT_Rectangle(60,0, 95, 30);
   TFT_Set_Pen(CL_FUCHSIA, 30);
   TFT_Rectangle(115,0, 150, 30);
   TFT_Set_Pen(CL_GRAY,30);
   TFT_Rectangle(170,0, 205, 30);
   TFT_Set_Pen(CL_RED, 30);
   TFT_Rectangle(225,0, 260, 30);
   TFT_Set_Pen(CL_YELLOW, 30);
   TFT_Rectangle(280,0, 315, 30);


   TFT_Set_Pen(CL_BLACK, 3);
   TFT_Rectangle(0,42, 42,75);
   TFT_Set_Pen(CL_BLACK, 4);
   TFT_Circle(21,58, 2);
   TFT_Set_Pen(CL_BLACK, 3);
   TFT_Rectangle(0,75, 42,108);
   TFT_Set_Pen(CL_BLACK, 9);
   TFT_Circle(21,91, 4);
   TFT_Set_Pen(CL_BLACK, 3);
   TFT_Rectangle(0,108, 42,141);
   TFT_Set_Pen(CL_BLACK, 10);
   TFT_Circle(21,124, 5);
   TFT_Set_Pen(CL_BLACK, 3);
   TFT_Rectangle(0,141, 42,174);

   TFT_Rectangle(10,150,30 ,160);

   TFT_Rectangle(0,174, 42,207);

   TFT_Line(10, 202, 30, 202);
   TFT_Line(10,202, 20, 180);
   TFT_Line(20, 180, 30, 202);

   TFT_Rectangle(0,207, 42,240);
   TFT_Line(10, 210, 30, 232);

}
void comm_module()
{
   //void TFT_Rectangle(int x_upper_left, int y_upper_left, int x_bottom_right, int y_bottom_right);

   TFT_Fill_Screen(CL_GRay);
   TFT_Rectangle(0,0, 42, 42);
   TFT_Write_Text("BACK", 2, 21);
    //1,2,3
   TFT_Rectangle(0,120, 50, 140);
   TFT_Write_Text("1", 1, 121);
   TFT_Rectangle(105,120, 150, 140);
   TFT_Write_Text("2",106 , 121);
   TFT_Rectangle(205,120, 250, 140);
   TFT_Write_Text("3",206 , 121);
   //start,stop,send
     TFT_Rectangle(150,40, 200, 70);
   TFT_Write_Text("start", 151, 41);
   TFT_Rectangle(150,75, 200, 105);
   TFT_Write_Text("end",151 , 76);
   TFT_Rectangle(150,200, 200, 230);
   TFT_Write_Text("send",151 , 201);
   //Uart defintions
   UART1_Init(115200);
    Delay_ms(100);
    UART1_Write(13);
    UART1_Write(10);
    Init_ADC();
    //end of uart

}
void paint_module2()
{
   TFT_Fill_Screen(CL_Blue);
TFT_Write_Text("saved",120,60);
TFT_Write_Text("continue",120,180);
 TFT_Line(0,120,320,120);

  TFT_Write_Text("here to back",235,220);

}