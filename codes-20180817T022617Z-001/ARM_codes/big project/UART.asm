_comm:
;UART.c,4 :: 		void comm()
SUB	SP, SP, #28
STR	LR, [SP, #0]
;UART.c,7 :: 		u8 start=0;
;UART.c,8 :: 		u8 lens=0;
MOVS	R0, #0
STRB	R0, [SP, #24]
;UART.c,9 :: 		while( UART_flag==1)
L_comm0:
MOVW	R0, #lo_addr(_UART_flag+0)
MOVT	R0, #hi_addr(_UART_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_comm1
;UART.c,11 :: 		if(TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_comm2
;UART.c,13 :: 		TP_TFT_Get_Coordinates(&x_tft,&y_tft);
MOVW	R1, #lo_addr(_y_tft+0)
MOVT	R1, #hi_addr(_y_tft+0)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
BL	_TP_TFT_Get_Coordinates+0
;UART.c,15 :: 		if(x_tft>=0&& x_tft<=42&&y_tft>=0&&y_tft<=42)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__comm52
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #42
IT	HI
BHI	L__comm51
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__comm50
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #42
IT	HI
BHI	L__comm49
L__comm48:
;UART.c,18 :: 		UART_flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_UART_flag+0)
MOVT	R0, #hi_addr(_UART_flag+0)
STRB	R1, [R0, #0]
;UART.c,19 :: 		UART1_Write_Text("back");
MOVW	R0, #lo_addr(?lstr1_UART+0)
MOVT	R0, #hi_addr(?lstr1_UART+0)
BL	_UART1_Write_Text+0
;UART.c,20 :: 		TFT_Fill_Screen(CL_Green);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;UART.c,21 :: 		module1();
BL	_module1+0
;UART.c,22 :: 		}
IT	AL
BAL	L_comm6
;UART.c,15 :: 		if(x_tft>=0&& x_tft<=42&&y_tft>=0&&y_tft<=42)
L__comm52:
L__comm51:
L__comm50:
L__comm49:
;UART.c,24 :: 		else if(x_tft>=150&& x_tft<=200&&y_tft>=40&&y_tft<=70)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #150
IT	CC
BCC	L__comm77
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #200
IT	HI
BHI	L__comm76
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #40
IT	CC
BCC	L__comm75
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #70
IT	HI
BHI	L__comm74
L__comm47:
;UART.c,26 :: 		UART1_Write_Text(" start ");
MOVW	R0, #lo_addr(?lstr2_UART+0)
MOVT	R0, #hi_addr(?lstr2_UART+0)
BL	_UART1_Write_Text+0
;UART.c,27 :: 		start=1;
MOVS	R0, #1
STRB	R0, [SP, #25]
;UART.c,28 :: 		while(start==1)
L_comm10:
LDRB	R0, [SP, #25]
CMP	R0, #1
IT	NE
BNE	L_comm11
;UART.c,32 :: 		while(1)
L_comm12:
;UART.c,34 :: 		if(TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_comm14
;UART.c,36 :: 		TP_TFT_Get_Coordinates(&x_tft,&y_tft);
MOVW	R1, #lo_addr(_y_tft+0)
MOVT	R1, #hi_addr(_y_tft+0)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
BL	_TP_TFT_Get_Coordinates+0
;UART.c,37 :: 		break;
IT	AL
BAL	L_comm13
;UART.c,38 :: 		}
L_comm14:
;UART.c,39 :: 		}
IT	AL
BAL	L_comm12
L_comm13:
;UART.c,41 :: 		if(x_tft>=0&& x_tft<=42&&y_tft>=0&&y_tft<=42)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__comm56
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #42
IT	HI
BHI	L__comm55
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__comm54
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #42
IT	HI
BHI	L__comm53
L__comm46:
;UART.c,43 :: 		start=0;
MOVS	R0, #0
STRB	R0, [SP, #25]
;UART.c,44 :: 		UART_flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_UART_flag+0)
MOVT	R0, #hi_addr(_UART_flag+0)
STRB	R1, [R0, #0]
;UART.c,45 :: 		UART1_Write_Text(" back ");
MOVW	R0, #lo_addr(?lstr3_UART+0)
MOVT	R0, #hi_addr(?lstr3_UART+0)
BL	_UART1_Write_Text+0
;UART.c,46 :: 		TFT_Fill_Screen(CL_Green);
MOVW	R0, #1024
BL	_TFT_Fill_Screen+0
;UART.c,47 :: 		module1();
BL	_module1+0
;UART.c,48 :: 		}
IT	AL
BAL	L_comm18
;UART.c,41 :: 		if(x_tft>=0&& x_tft<=42&&y_tft>=0&&y_tft<=42)
L__comm56:
L__comm55:
L__comm54:
L__comm53:
;UART.c,50 :: 		else if((x_tft>=150&& x_tft<=200&&y_tft>=75&&y_tft<=105)||lens==20)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #150
IT	CC
BCC	L__comm60
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #200
IT	HI
BHI	L__comm59
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #75
IT	CC
BCC	L__comm58
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #105
IT	HI
BHI	L__comm57
IT	AL
BAL	L__comm44
L__comm60:
L__comm59:
L__comm58:
L__comm57:
LDRB	R0, [SP, #24]
CMP	R0, #20
IT	EQ
BEQ	L__comm61
IT	AL
BAL	L_comm23
L__comm44:
L__comm61:
;UART.c,52 :: 		UART1_Write_Text(" end ");
MOVW	R0, #lo_addr(?lstr4_UART+0)
MOVT	R0, #hi_addr(?lstr4_UART+0)
BL	_UART1_Write_Text+0
;UART.c,53 :: 		start=0;
MOVS	R0, #0
STRB	R0, [SP, #25]
;UART.c,54 :: 		lens=0;
MOVS	R0, #0
STRB	R0, [SP, #24]
;UART.c,56 :: 		}
IT	AL
BAL	L_comm24
L_comm23:
;UART.c,58 :: 		else if(x_tft>=0&& x_tft<=50&&y_tft>=120&&y_tft<=140)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__comm65
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #50
IT	HI
BHI	L__comm64
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #120
IT	CC
BCC	L__comm63
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #140
IT	HI
BHI	L__comm62
L__comm43:
;UART.c,60 :: 		UART1_Write_Text("1");
MOVW	R0, #lo_addr(?lstr5_UART+0)
MOVT	R0, #hi_addr(?lstr5_UART+0)
BL	_UART1_Write_Text+0
;UART.c,61 :: 		tb3a[lens]='1';
ADD	R1, SP, #4
LDRB	R0, [SP, #24]
ADDS	R1, R1, R0
MOVS	R0, #49
STRB	R0, [R1, #0]
;UART.c,62 :: 		lens++;
LDRB	R0, [SP, #24]
ADDS	R0, R0, #1
STRB	R0, [SP, #24]
;UART.c,64 :: 		}
IT	AL
BAL	L_comm28
;UART.c,58 :: 		else if(x_tft>=0&& x_tft<=50&&y_tft>=120&&y_tft<=140)
L__comm65:
L__comm64:
L__comm63:
L__comm62:
;UART.c,66 :: 		else if (x_tft>=105&& x_tft<=150&&y_tft>=120&&y_tft<=140)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #105
IT	CC
BCC	L__comm69
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #150
IT	HI
BHI	L__comm68
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #120
IT	CC
BCC	L__comm67
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #140
IT	HI
BHI	L__comm66
L__comm42:
;UART.c,68 :: 		UART1_Write_Text("2");
MOVW	R0, #lo_addr(?lstr6_UART+0)
MOVT	R0, #hi_addr(?lstr6_UART+0)
BL	_UART1_Write_Text+0
;UART.c,69 :: 		tb3a[lens]='2';
ADD	R1, SP, #4
LDRB	R0, [SP, #24]
ADDS	R1, R1, R0
MOVS	R0, #50
STRB	R0, [R1, #0]
;UART.c,70 :: 		lens++;
LDRB	R0, [SP, #24]
ADDS	R0, R0, #1
STRB	R0, [SP, #24]
;UART.c,73 :: 		}
IT	AL
BAL	L_comm32
;UART.c,66 :: 		else if (x_tft>=105&& x_tft<=150&&y_tft>=120&&y_tft<=140)
L__comm69:
L__comm68:
L__comm67:
L__comm66:
;UART.c,75 :: 		else if (x_tft>=205&& x_tft<=250&&y_tft>=120&&y_tft<=140)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #205
IT	CC
BCC	L__comm73
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #250
IT	HI
BHI	L__comm72
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #120
IT	CC
BCC	L__comm71
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #140
IT	HI
BHI	L__comm70
L__comm41:
;UART.c,77 :: 		UART1_Write_Text("3");
MOVW	R0, #lo_addr(?lstr7_UART+0)
MOVT	R0, #hi_addr(?lstr7_UART+0)
BL	_UART1_Write_Text+0
;UART.c,78 :: 		tb3a[lens]='3';
ADD	R1, SP, #4
LDRB	R0, [SP, #24]
ADDS	R1, R1, R0
MOVS	R0, #51
STRB	R0, [R1, #0]
;UART.c,79 :: 		lens++;
LDRB	R0, [SP, #24]
ADDS	R0, R0, #1
STRB	R0, [SP, #24]
;UART.c,75 :: 		else if (x_tft>=205&& x_tft<=250&&y_tft>=120&&y_tft<=140)
L__comm73:
L__comm72:
L__comm71:
L__comm70:
;UART.c,82 :: 		}
L_comm32:
L_comm28:
L_comm24:
L_comm18:
;UART.c,85 :: 		}
IT	AL
BAL	L_comm10
L_comm11:
;UART.c,88 :: 		}
IT	AL
BAL	L_comm36
;UART.c,24 :: 		else if(x_tft>=150&& x_tft<=200&&y_tft>=40&&y_tft<=70)
L__comm77:
L__comm76:
L__comm75:
L__comm74:
;UART.c,92 :: 		else if( x_tft>=150&& x_tft<=200&&y_tft>=200&&y_tft<=230)
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #150
IT	CC
BCC	L__comm81
MOVW	R0, #lo_addr(_x_tft+0)
MOVT	R0, #hi_addr(_x_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #200
IT	HI
BHI	L__comm80
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #200
IT	CC
BCC	L__comm79
MOVW	R0, #lo_addr(_y_tft+0)
MOVT	R0, #hi_addr(_y_tft+0)
LDRB	R0, [R0, #0]
CMP	R0, #230
IT	HI
BHI	L__comm78
L__comm40:
;UART.c,94 :: 		UART1_Write_Text(" send : ");
MOVW	R0, #lo_addr(?lstr8_UART+0)
MOVT	R0, #hi_addr(?lstr8_UART+0)
BL	_UART1_Write_Text+0
;UART.c,95 :: 		UART1_Write_Text(tb3a);
ADD	R0, SP, #4
BL	_UART1_Write_Text+0
;UART.c,92 :: 		else if( x_tft>=150&& x_tft<=200&&y_tft>=200&&y_tft<=230)
L__comm81:
L__comm80:
L__comm79:
L__comm78:
;UART.c,97 :: 		}
L_comm36:
L_comm6:
;UART.c,98 :: 		}
L_comm2:
;UART.c,99 :: 		}
IT	AL
BAL	L_comm0
L_comm1:
;UART.c,102 :: 		}
L_end_comm:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _comm
