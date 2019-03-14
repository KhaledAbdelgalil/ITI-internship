typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned long int u32;
typedef  char s8;
typedef short int s16;
typedef long int s32;
typedef float f32;
typedef double f64;
typedef long double f128;

u32 power(u8 first,u8 second)
{ 
    u8 count;
	u32 result=1;
	for(count=0;count<second;count++)
	{
		result*=first;
	}
	return result;
}