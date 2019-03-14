#include <Stdio.h>

typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned long int u32;
typedef  char s8;
typedef short int s16;
typedef long int s32;
typedef float f32;
typedef double f64;
typedef long double f128;
//global variable

u32 Result;

//prototypes of functions included in another c files

u32 power(u8 first,u8 second);
void print(void);
u8 fun(void);

void main(void)
{
	while(fun()<20)
	{
		Result=power(2,fun());
		print();
		printf("\n");
	}
}