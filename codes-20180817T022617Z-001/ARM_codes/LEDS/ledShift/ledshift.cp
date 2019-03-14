#line 1 "C:/Users/pc2/Desktop/embded/microCforArm/ledShift/ledshift.c"
void main()
{
char value1=0;
char value2=0;
char port='D';
GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
GPIOD_ODR=1;
while(1)
{
 while(port=='D')
 {


 }

}
}
