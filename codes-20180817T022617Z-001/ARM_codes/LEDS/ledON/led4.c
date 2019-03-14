  #define delay_time 100
  #define active_state 1
//code tsk1
/*void main()
{
char value=0;
GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
GPIOD_ODR=0;

while(1)
{
   value=Button(&GPIOB_IDR,0,delay_time , active_state);
   if(value==255)
    GPIOD_ODR=~ GPIOD_ODR  ;


}
              
} */

    //task2

/*void main()
{
char value=0;
char firstTime=0;
GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
GPIOD_ODR=0;

    while(1)
{
   value=Button(&GPIOB_IDR,0,delay_time , active_state);
   if(value==255&&firstTime==0)
    {
    GPIOD_ODR=1;
    firstTime=1;
    }
   else if(value==255)
     GPIOD_ODR<<=1;
   else if(  GPIOD_ODR==0x8000)
     firstTime=0;
}

} */
//task3
/*              void main()
{
char value1=0;
char value2=0;
GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
GPIOD_ODR=1;
 while(1)
{
   value1=Button(&GPIOB_IDR,0,delay_time , active_state);
   value2=Button(&GPIOB_IDR,1,delay_time , active_state);

   if (value1==255  && GPIOD_ODR==0x8000)
      GPIOD_ODR=1;
   else if (value1==255)
      GPIOD_ODR<<=1;
   if ( value2==255  &&  GPIOD_ODR==0x0001)
      GPIOD_ODR=0x8000;
   else if( value2==255)
      GPIOD_ODR>>=1;

}


} */
      //task4
      void flashing(char port, char pin);
       void main()
{

char value1=0;
char value2=0;
char port='D';
char R=0;
char L=0;
char U=0;
char D=0;

GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
GPIOD_ODR=1;

while(1)
{
   value1=Button(&GPIOB_IDR,0,delay_time , active_state);
   value2=Button(&GPIOB_IDR,1,delay_time , active_state);
    R=Button(&GPIOA_IDR,6,delay_time , active_state);
    L=Button(&GPIOD_IDR,2,delay_time , active_state);
    U=Button(&GPIOD_IDR,4,delay_time , active_state);
    D=Button(&GPIOB_IDR,5,delay_time , active_state);
    //code of joystick

    // up direction

    
    
      //code of two buttons
    //breakpoints of Right button
    if(value2==255 && port=='D' && GPIOD_ODR==1)
    {
       port='A';
       GPIOA_ODR=0x8000;
       GPIOD_ODR=0;
    }
   else if(value2==255 && port=='C' && GPIOC_ODR==1)
    {
       port='D';
       GPIOD_ODR=0x8000;
       GPIOC_ODR=0;
    }
    else if(value2==255 && port=='A' && GPIOA_ODR==1)
    {
       port='C';
       GPIOC_ODR=0x2000;
       GPIOA_ODR=0;
    }
    //breakpoints of left button
    
   else if(value1==255 && port=='D' && GPIOD_ODR==0x8000)
    {
       port='C';
       GPIOC_ODR=1;
       GPIOD_ODR=0;
    }
   else if(value1==255 && port=='C' && GPIOC_ODR==0x2000)
    {
       port='A';
       GPIOA_ODR=1;
       GPIOC_ODR=0;
    }
    else if(value1==255 && port=='A' && GPIOA_ODR==0x8000)
    {
       port='D';
       GPIOD_ODR=1;
       GPIOA_ODR=0;
    }
    //code
    else if (port=='D'&&value1==255 )
             { 

             GPIOD_ODR<<=1;
             while(Button(&GPIOB_IDR,0,delay_time , active_state)==255) {}
             
             }
    
    else if (port=='D'&&value2==255)
              GPIOD_ODR>>=1;
    else if (port=='C'&&value1==255)
              GPIOC_ODR<<=1;
    else if (port=='C'&&value2==255)
              GPIOC_ODR>>=1;
    else if (port=='A'&&value1==255)
              GPIOA_ODR<<=1;
    else if (port=='A'&&value2==255)
              GPIOA_ODR>>=1;
}

 }
 void flashing(char port, char pin)
 {
    if (port == 'A')
       {
       GPIOA_ODR=1<<pin ;
       Delay_ms(500);
       GPIOA_ODR=0;
       Delay_ms(500);
    }
    else if(port == 'C')
        {
       GPIOC_ODR=1<<pin ;
       Delay_ms(500);
       GPIOC_ODR=0;
       Delay_ms(500);
    }
    else if(port == 'D')
    {
       GPIOD_ODR=1<<pin ;
       Delay_ms(500);
       GPIOD_ODR=0;
       Delay_ms(500);
    }
 }