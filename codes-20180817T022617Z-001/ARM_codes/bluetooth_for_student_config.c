//char arr_txt[60];

//////////////////////////////////////////////////
///////////////////////////////////////

void  BT_Configure() {

    UART3_Write_Text("$$$");                  // Enter command mode
    Delay_ms(500);
	Delay_ms(500);
	
    UART3_Write_Text("SN,BlueTooth-Click");   // Name of device
    UART3_Write(13);                          // CR
    Delay_ms(500);   
	Delay_ms(500);
	
    UART3_Write_Text("SO,Slave");             // Extended status string
    UART3_Write(13);                          // CR
    Delay_ms(500);    
	Delay_ms(500);
	
    UART3_Write_Text("SM,0");                 // Set mode (0 = slave, 1 = master, 2 = trigger, 3 = auto, 4 = DTR, 5 = ANY)
    UART3_Write(13);                          // CR
    Delay_ms(500);  
	Delay_ms(500);

    UART3_Write_Text("SA,1");                 // Authentication (1 to enable, 0 to disable)
    UART3_Write(13);                          // CR
    Delay_ms(500);  
	Delay_ms(500);


    UART3_Write_Text("SP,1234");              // Security pin code (mikroe)
    UART3_Write(13);                          // CR
    Delay_ms(500);  
	Delay_ms(500);

	
    UART3_Write_Text("---");                  // Security pin code (mikroe)
    UART3_Write(13);                          // CR
    Delay_ms(500);  
	Delay_ms(500);
}



  /*
        ** Hint on main "main" body ** 
void main() {


  
 // UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PD89);
 // Delay_ms(100);                // UART3 Init

    // Configure BlueTooth-Click module
// BT_Configure();

  //  Wait 4 sec to connect

//Delay_ms(4000);

  //Connected
  
  
  while (1) {                     // Endless loop

     //memset(arr_txt, 0, 16);
	 
	 }
}
*/