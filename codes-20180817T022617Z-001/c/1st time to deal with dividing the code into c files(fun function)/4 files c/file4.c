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

//extern to tell file do not worry you will find Result in another file

extern u32 Result;

u32 power(u8 first,u8 second);

void print(void)
{
	printf("%d",Result);
}