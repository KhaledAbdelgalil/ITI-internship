#include <stdio.h>
typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned long int u32;
typedef  char s8;
typedef short int s16;
typedef long int s32;
typedef float f32;
typedef double f64;
typedef long double f128;
int fn1(void);

void main()
{
	printf("%d",fn1());
	printf("%d",fn1());
	printf("%d",fn1());

}
int fn1(void)
{
	static int x=2;
	x++;
	return x;
	
}