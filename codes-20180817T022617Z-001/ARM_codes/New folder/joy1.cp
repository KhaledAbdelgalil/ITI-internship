#line 1 "C:/Users/pc2/Desktop/embded/New folder/joy1.c"
void play(float Duty,float freq);
void main()
{

 unsigned long int value ;
 GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_ALL);
 GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
 ADC_Set_Input_Channel(_ADC_CHANNEL_3);
 ADC1_Init();
 while(1){

 value= ADC1_Get_Sample(3);
 GPIOD_ODR=value;
 delay_ms(100);
 }
#line 22 "C:/Users/pc2/Desktop/embded/New folder/joy1.c"
}

void play(float Duty,float freq)
{
 float time;
 float timeON;
 float timeOFF;
 unsigned long int x;
 x=0;
 time=1/freq;


 time*=1000000;

 timeON=Duty*time;
 timeOFF =(time-timeON);

 while(x<=timeON)
 {
 x+=10;
 GPIOE_ODR=0x4000;
 Delay_us(10);
 }
 x=0;
 while(x<=timeOFF)
 {
 x+=10;
 GPIOE_ODR=0x0000;
 Delay_us(10);
 }

}
