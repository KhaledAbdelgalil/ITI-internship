#line 1 "C:/Users/pc2/Desktop/embded/microCforArm/joystick2/joystick2.c"



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
 R=Button(&GPIOA_IDR,6, 100 , 0 );
 L=Button(&GPIOD_IDR,2, 100 , 0 );
 U=Button(&GPIOD_IDR,4, 100 , 0 );
 D=Button(&GPIOB_IDR,5, 100 , 0 );

 if(U==255&&GPIOD_ODR==8)
 {
 GPIOD_ODR=8;
 Delay_ms(500);
 GPIOD_ODR=0;
 Delay_ms(500);
 }
 else if(U==0) GPIOD_ODR<<=GPIOD_ODR;

}
}
