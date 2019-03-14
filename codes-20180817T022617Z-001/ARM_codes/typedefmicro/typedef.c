//typedef char u8;     //1byte
//typedef short int;        //1byte
//typedef long int;           // 4bytes
//typedef double;                 //4byte
//typedef long double;        //8bytes
//typedef float;               //4bytes

void main()

{
GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
GPIOD_ODR=sizeof (long int);

}