#line 1 "C:/Users/pc2/Desktop/embded/microCforArm/led2/led3.c"
void main() {
GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOB_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_ALL);
GPIOA_ODR = 0xFFFF;
GPIOB_ODR = 0xFFFF;
GPIOC_ODR = 0xFFFF;
GPIOD_ODR = 0xFFFF;
GPIOE_ODR = 0xFFFF;
while(1)
{
GPIOA_ODR =~GPIOA_ODR ;
GPIOB_ODR =~GPIOB_ODR ;
GPIOC_ODR =~GPIOC_ODR ;
GPIOD_ODR =~ GPIOD_ODR ;
GPIOE_ODR =~GPIOE_ODR ;
 Delay_ms(500);
}
 }
