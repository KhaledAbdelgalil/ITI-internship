_Display_Init:
;GPS_Browse.c,22 :: 		void Display_Init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GPS_Browse.c,24 :: 		TFT_Init_ILI9341_8bit(320, 240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;GPS_Browse.c,25 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Display_Init0:
SUBS	R7, R7, #1
BNE	L_Display_Init0
NOP
NOP
;GPS_Browse.c,26 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;GPS_Browse.c,27 :: 		TFT_Image(0, 40, WorldImage_bmp, 1);
MOVS	R3, #1
MOVW	R2, #lo_addr(_WorldImage_bmp+0)
MOVT	R2, #hi_addr(_WorldImage_bmp+0)
MOVS	R1, #40
MOVS	R0, #0
BL	_TFT_Image+0
;GPS_Browse.c,28 :: 		}
L_end_Display_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Display_Init
_Display_Cursor:
;GPS_Browse.c,32 :: 		void Display_Cursor(signed int lat, signed int lon, char *lt_Str, char *lng_Str, unsigned int color) {
; lon start address is: 4 (R1)
; lat start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R2, [SP, #12]
STR	R3, [SP, #16]
; lon end address is: 4 (R1)
; lat end address is: 0 (R0)
; lat start address is: 0 (R0)
; lon start address is: 4 (R1)
LDRH	R4, [SP, #20]
STRH	R4, [SP, #20]
;GPS_Browse.c,38 :: 		latitude_y = ((160*(90 - lat))/180) + 40;
RSB	R5, R0, #90
SXTH	R5, R5
; lat end address is: 0 (R0)
MOVS	R4, #160
SXTH	R4, R4
MULS	R5, R4, R5
SXTH	R5, R5
MOVS	R4, #180
SXTH	R4, R4
SDIV	R4, R5, R4
SXTH	R4, R4
ADDS	R4, #40
SXTH	R4, R4
; latitude_y start address is: 0 (R0)
SXTH	R0, R4
;GPS_Browse.c,39 :: 		longitude_x = (320* ((unsigned long)(lon + 180)))/360 - 10;
ADDW	R4, R1, #180
SXTH	R4, R4
; lon end address is: 4 (R1)
SXTH	R5, R4
MOVW	R4, #320
MULS	R5, R4, R5
MOVW	R4, #360
UDIV	R4, R5, R4
SUBS	R4, #10
; longitude_x start address is: 4 (R1)
MOV	R1, R4
;GPS_Browse.c,42 :: 		TFT_Set_Pen(CL_RED, 1);
STR	R1, [SP, #4]
STR	R0, [SP, #8]
MOVS	R1, #1
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #8]
LDR	R1, [SP, #4]
;GPS_Browse.c,43 :: 		TFT_H_Line(longitude_x - 2, longitude_x + 2, latitude_y );
ADDS	R5, R1, #2
SUBS	R4, R1, #2
STR	R1, [SP, #4]
STR	R0, [SP, #8]
SXTH	R2, R0
SXTH	R1, R5
SXTH	R0, R4
BL	_TFT_H_Line+0
LDR	R0, [SP, #8]
LDR	R1, [SP, #4]
;GPS_Browse.c,44 :: 		TFT_V_Line( latitude_y - 2, latitude_y + 2, longitude_x );
ADDS	R5, R0, #2
SUBS	R4, R0, #2
; latitude_y end address is: 0 (R0)
SXTH	R2, R1
; longitude_x end address is: 4 (R1)
SXTH	R1, R5
SXTH	R0, R4
BL	_TFT_V_Line+0
;GPS_Browse.c,46 :: 		TFT_Set_Font(&TFT_defaultFont, color, FO_HORIZONTAL);
MOVS	R2, #0
LDRH	R1, [SP, #20]
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;GPS_Browse.c,47 :: 		TFT_Write_Text(lt_Str, 160, 200);
MOVS	R2, #200
MOVS	R1, #160
LDR	R0, [SP, #12]
BL	_TFT_Write_Text+0
;GPS_Browse.c,48 :: 		TFT_Write_Text(lng_Str, 160, 215);
MOVS	R2, #215
MOVS	R1, #160
LDR	R0, [SP, #16]
BL	_TFT_Write_Text+0
;GPS_Browse.c,49 :: 		}
L_end_Display_Cursor:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _Display_Cursor
_GPS_messagePARSER:
;GPS_Browse.c,56 :: 		void GPS_messagePARSER(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GPS_Browse.c,57 :: 		string = strstr(txt,"$GPGGA");
MOVW	R0, #lo_addr(?lstr1_GPS_Browse+0)
MOVT	R0, #hi_addr(?lstr1_GPS_Browse+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_strstr+0
MOVW	R1, #lo_addr(_string+0)
MOVT	R1, #hi_addr(_string+0)
STR	R0, [R1, #0]
;GPS_Browse.c,58 :: 		if(string != 0) {                      // If txt array contains "$GPGLL" string we proceed...
CMP	R0, #0
IT	EQ
BEQ	L_GPS_messagePARSER2
;GPS_Browse.c,59 :: 		if(string[43] == '1') {               // if "$GPGGA" 	 message have '1' sign in the 43-th
MOVW	R0, #lo_addr(_string+0)
MOVT	R0, #hi_addr(_string+0)
LDR	R0, [R0, #0]
ADDS	R0, #43
LDRB	R0, [R0, #0]
CMP	R0, #49
IT	NE
BNE	L_GPS_messagePARSER3
;GPS_Browse.c,62 :: 		latitude = (string[18]-48)*10 + (string[19]-48);
MOVW	R3, #lo_addr(_string+0)
MOVT	R3, #hi_addr(_string+0)
LDR	R0, [R3, #0]
ADDS	R0, #18
LDRB	R0, [R0, #0]
SUBW	R1, R0, #48
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
MULS	R1, R0, R1
SXTH	R1, R1
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, #19
LDRB	R0, [R0, #0]
SUBS	R0, #48
SXTH	R0, R0
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_latitude+0)
MOVT	R0, #hi_addr(_latitude+0)
STRH	R1, [R0, #0]
;GPS_Browse.c,63 :: 		longitude = (string[30]-48)*100 + (string[31]-48)*10 + (string[32]-48);
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, #30
LDRB	R0, [R0, #0]
SUBW	R1, R0, #48
SXTH	R1, R1
MOVS	R0, #100
SXTH	R0, R0
MUL	R2, R1, R0
SXTH	R2, R2
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, #31
LDRB	R0, [R0, #0]
SUBW	R1, R0, #48
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
MULS	R0, R1, R0
SXTH	R0, R0
ADDS	R1, R2, R0
SXTH	R1, R1
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, #32
LDRB	R0, [R0, #0]
SUBS	R0, #48
SXTH	R0, R0
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_longitude+0)
MOVT	R0, #hi_addr(_longitude+0)
STRH	R1, [R0, #0]
;GPS_Browse.c,64 :: 		if(string[28] == 'S') {            // if the latitude is in the South direction it has minus sign
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, #28
LDRB	R0, [R0, #0]
CMP	R0, #83
IT	NE
BNE	L_GPS_messagePARSER4
;GPS_Browse.c,65 :: 		latitude = 0 - latitude;
MOVW	R1, #lo_addr(_latitude+0)
MOVT	R1, #hi_addr(_latitude+0)
LDRSH	R0, [R1, #0]
RSBS	R0, R0, #0
STRH	R0, [R1, #0]
;GPS_Browse.c,66 :: 		}
L_GPS_messagePARSER4:
;GPS_Browse.c,67 :: 		if(string[41] == 'W') {            // if the longitude is in the West direction it has minus sign
MOVW	R0, #lo_addr(_string+0)
MOVT	R0, #hi_addr(_string+0)
LDR	R0, [R0, #0]
ADDS	R0, #41
LDRB	R0, [R0, #0]
CMP	R0, #87
IT	NE
BNE	L_GPS_messagePARSER5
;GPS_Browse.c,68 :: 		longitude = 0 - longitude;
MOVW	R1, #lo_addr(_longitude+0)
MOVT	R1, #hi_addr(_longitude+0)
LDRSH	R0, [R1, #0]
RSBS	R0, R0, #0
STRH	R0, [R1, #0]
;GPS_Browse.c,69 :: 		}
L_GPS_messagePARSER5:
;GPS_Browse.c,71 :: 		lat_str[0] = string[18];
MOVW	R2, #lo_addr(_string+0)
MOVT	R2, #hi_addr(_string+0)
LDR	R0, [R2, #0]
ADDS	R0, #18
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_lat_str+0)
MOVT	R0, #hi_addr(_lat_str+0)
STRB	R1, [R0, #0]
;GPS_Browse.c,72 :: 		lat_str[1] = string[19];
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, #19
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_lat_str+1)
MOVT	R0, #hi_addr(_lat_str+1)
STRB	R1, [R0, #0]
;GPS_Browse.c,73 :: 		lat_str[2] = ',';
MOVS	R1, #44
MOVW	R0, #lo_addr(_lat_str+2)
MOVT	R0, #hi_addr(_lat_str+2)
STRB	R1, [R0, #0]
;GPS_Browse.c,74 :: 		lat_str[3] = string[20];
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, #20
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_lat_str+3)
MOVT	R0, #hi_addr(_lat_str+3)
STRB	R1, [R0, #0]
;GPS_Browse.c,75 :: 		lat_str[4] = string[21];
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, #21
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_lat_str+4)
MOVT	R0, #hi_addr(_lat_str+4)
STRB	R1, [R0, #0]
;GPS_Browse.c,76 :: 		lat_str[5] = ' ';
MOVS	R1, #32
MOVW	R0, #lo_addr(_lat_str+5)
MOVT	R0, #hi_addr(_lat_str+5)
STRB	R1, [R0, #0]
;GPS_Browse.c,77 :: 		lat_str[6] = string[28];
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, #28
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_lat_str+6)
MOVT	R0, #hi_addr(_lat_str+6)
STRB	R1, [R0, #0]
;GPS_Browse.c,78 :: 		lat_str[7] = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_lat_str+7)
MOVT	R0, #hi_addr(_lat_str+7)
STRB	R1, [R0, #0]
;GPS_Browse.c,80 :: 		long_str[0] = string[30];
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, #30
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_long_str+0)
MOVT	R0, #hi_addr(_long_str+0)
STRB	R1, [R0, #0]
;GPS_Browse.c,81 :: 		long_str[1] = string[31];
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, #31
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_long_str+1)
MOVT	R0, #hi_addr(_long_str+1)
STRB	R1, [R0, #0]
;GPS_Browse.c,82 :: 		long_str[2] = string[32];
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, #32
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_long_str+2)
MOVT	R0, #hi_addr(_long_str+2)
STRB	R1, [R0, #0]
;GPS_Browse.c,83 :: 		long_str[3] = ',';
MOVS	R1, #44
MOVW	R0, #lo_addr(_long_str+3)
MOVT	R0, #hi_addr(_long_str+3)
STRB	R1, [R0, #0]
;GPS_Browse.c,84 :: 		long_str[4] = string[33];
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, #33
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_long_str+4)
MOVT	R0, #hi_addr(_long_str+4)
STRB	R1, [R0, #0]
;GPS_Browse.c,85 :: 		long_str[5] = string[34];
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, #34
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_long_str+5)
MOVT	R0, #hi_addr(_long_str+5)
STRB	R1, [R0, #0]
;GPS_Browse.c,86 :: 		long_str[6] = ' ';
MOVS	R1, #32
MOVW	R0, #lo_addr(_long_str+6)
MOVT	R0, #hi_addr(_long_str+6)
STRB	R1, [R0, #0]
;GPS_Browse.c,87 :: 		long_str[7] = string[41];
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, #41
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_long_str+7)
MOVT	R0, #hi_addr(_long_str+7)
STRB	R1, [R0, #0]
;GPS_Browse.c,88 :: 		long_str[8] = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_long_str+8)
MOVT	R0, #hi_addr(_long_str+8)
STRB	R1, [R0, #0]
;GPS_Browse.c,89 :: 		}
L_GPS_messagePARSER3:
;GPS_Browse.c,90 :: 		}
L_GPS_messagePARSER2:
;GPS_Browse.c,91 :: 		}
L_end_GPS_messagePARSER:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _GPS_messagePARSER
_main:
;GPS_Browse.c,92 :: 		void main(void){
;GPS_Browse.c,93 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;GPS_Browse.c,94 :: 		TFT_Init_ILI9341_8bit(320, 240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;GPS_Browse.c,95 :: 		TFT_Fill_Screen(CL_BLACK);
MOVW	R0, #0
BL	_TFT_Fill_Screen+0
;GPS_Browse.c,98 :: 		TFT_Set_Font(TFT_defaultFont, CL_White, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;GPS_Browse.c,99 :: 		UART3_Init_Advanced(9600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PD89);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART3_PD89+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART3_PD89+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #9600
BL	_UART3_Init_Advanced+0
ADD	SP, SP, #4
;GPS_Browse.c,100 :: 		Delay_ms(100);                // UART3 Init
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
NOP
;GPS_Browse.c,102 :: 		GPIO_Digital_Input(&GPIOC_ODR,_GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Input+0
;GPS_Browse.c,103 :: 		GPIOC_ODR = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;GPS_Browse.c,104 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
NOP
;GPS_Browse.c,105 :: 		GPIOC_ODR = 0x0004;
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;GPS_Browse.c,106 :: 		Display_Init();
BL	_Display_Init+0
;GPS_Browse.c,107 :: 		Display_Cursor(latitude, longitude, &lat_str, &long_Str,CL_Yellow);
MOVW	R2, #65504
MOVW	R0, #lo_addr(_longitude+0)
MOVT	R0, #hi_addr(_longitude+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_latitude+0)
MOVT	R0, #hi_addr(_latitude+0)
LDRSH	R0, [R0, #0]
PUSH	(R2)
MOVW	R3, #lo_addr(_long_str+0)
MOVT	R3, #hi_addr(_long_str+0)
MOVW	R2, #lo_addr(_lat_str+0)
MOVT	R2, #hi_addr(_lat_str+0)
BL	_Display_Cursor+0
ADD	SP, SP, #4
;GPS_Browse.c,108 :: 		GPS_messagePARSER();
BL	_GPS_messagePARSER+0
;GPS_Browse.c,109 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
