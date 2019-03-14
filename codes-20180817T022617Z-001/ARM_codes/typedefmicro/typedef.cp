#line 1 "C:/Users/pc2/Desktop/embded/typedefmicro/typedef.c"
typedef char u8;
typedef short int;
typedef long int;
typedef double;
typedef long double;
typedef float;

void main()

{
GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
GPIOD_ODR=sizeof (long int);

}
