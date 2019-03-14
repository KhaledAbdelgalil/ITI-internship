/*
in main
force
rst 0
delay 100
rst 1
*/

#include"resources.h"
#define MESSAGE_LEN  767


//global var
char txt[768];
char *string;
int  latitude, longitude;
char lat_str[8];
char long_str[9];



void Display_Init() {
  //Initialize the display
  TFT_Init_ILI9341_8bit(320, 240);
  Delay_ms(500);
  TFT_Fill_Screen(CL_WHITE);
  TFT_Image(0, 40, WorldImage_bmp, 1);
  }



  void Display_Cursor(signed int lat, signed int lon, char *lt_Str, char *lng_Str, unsigned int color) {
  unsigned long latitude_y, longitude_x;

  // Latitude and Longitude scaling for 320x240 display:
  // Latitude: Input range is -90 to 90 degrees
  // Longitude: Input range is -180 to 180 degrees
  latitude_y = ((160*(90 - lat))/180) + 40;
  longitude_x = (320* ((unsigned long)(lon + 180)))/360 - 10;

  // Cursor drawing
  TFT_Set_Pen(CL_RED, 1);
  TFT_H_Line(longitude_x - 2, longitude_x + 2, latitude_y );
  TFT_V_Line( latitude_y - 2, latitude_y + 2, longitude_x );

  TFT_Set_Font(&TFT_defaultFont, color, FO_HORIZONTAL);
  TFT_Write_Text(lt_Str, 160, 200);
  TFT_Write_Text(lng_Str, 160, 215);
}

// UART3_Init_Advanced(9600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PD89);   //Advanced Initialization




void GPS_messagePARSER(void){
    string = strstr(txt,"$GPGGA");
      if(string != 0) {                      // If txt array contains "$GPGLL" string we proceed...
        if(string[43] == '1') {               // if "$GPGGA" 	 message have '1' sign in the 43-th
                                             // position it means that tha GPS receiver does not have FIXed position!

            latitude = (string[18]-48)*10 + (string[19]-48);
            longitude = (string[30]-48)*100 + (string[31]-48)*10 + (string[32]-48);
            if(string[28] == 'S') {            // if the latitude is in the South direction it has minus sign
              latitude = 0 - latitude;
            }
            if(string[41] == 'W') {            // if the longitude is in the West direction it has minus sign
              longitude = 0 - longitude;
            }

              lat_str[0] = string[18];
              lat_str[1] = string[19];
              lat_str[2] = ',';
              lat_str[3] = string[20];
              lat_str[4] = string[21];
              lat_str[5] = ' ';
              lat_str[6] = string[28];
              lat_str[7] = 0;

              long_str[0] = string[30];
              long_str[1] = string[31];
              long_str[2] = string[32];
              long_str[3] = ',';
              long_str[4] = string[33];
              long_str[5] = string[34];
              long_str[6] = ' ';
              long_str[7] = string[41];
              long_str[8] = 0;
		}
	  }
}
void main(void){
TFT_Set_Default_Mode();
TFT_Init_ILI9341_8bit(320, 240);
TFT_Fill_Screen(CL_BLACK);


TFT_Set_Font(TFT_defaultFont, CL_White, FO_HORIZONTAL);
 UART3_Init_Advanced(9600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PD89);
  Delay_ms(100);                // UART3 Init
  
GPIO_Digital_Input(&GPIOC_ODR,_GPIO_PINMASK_2);
GPIOC_ODR = 0x0000;
Delay_ms(100);
GPIOC_ODR = 0x0004;
Display_Init();
Display_Cursor(latitude, longitude, &lat_str, &long_Str,CL_Yellow);
GPS_messagePARSER();
}