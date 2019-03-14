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

void main()
{
	u8 i;
	u8 x[10]={1,2,3,4,5,6,7,8,9,10};
	u8 *xp=x;
	
	for (i=0;i<10;i++)
		{
		printf("%d\n",*xp);
		xp++;
		}
	for (i=0;i<10;i++)
		printf("%d\n",x[i]);
	for (i=0;i<10;i++)
		printf("%d\n",*(x+i));
}