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
	char *ptr1;
	int *ptr2;
	printf("%d\n",sizeof(ptr1));
	printf("%d\n",sizeof(ptr2));

}