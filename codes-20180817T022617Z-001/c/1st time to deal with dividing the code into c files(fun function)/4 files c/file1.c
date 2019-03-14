typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned long int u32;
typedef  char s8;
typedef short int s16;
typedef long int s32;
typedef float f32;
typedef double f64;
typedef long double f128;

u8 fun(void)
{
static u8 counter =0;
counter++;
return counter;
}