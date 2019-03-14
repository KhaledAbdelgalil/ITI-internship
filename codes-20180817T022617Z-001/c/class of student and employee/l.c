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

struct bb
{
	u8 x;
	u16 y;
};
void main()
{
struct bb *m,l;
m=&l;
m->x=12;
m->y=26;
printf("%d,%d",(*m).x,(*m).y);
	
	
	
}