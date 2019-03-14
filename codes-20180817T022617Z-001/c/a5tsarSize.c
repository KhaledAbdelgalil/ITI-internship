#include <Stdio.h>
//k2nk bt3rf data type gded w bthtm bs enta el information bt3tk htkfy fe 3dad el bits wala l2:u8 unsigned 8 bits w enta kda kda 3aref enha unsigned char 8bits=1byte
typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned long int u32;
typedef  char s8;
typedef short int s16;
typedef long int s32;
typedef float f32;
typedef double f64;
typedef long double f128;
void main(void)
{
	
printf("size of char:%d",sizeof(s8));
printf("\nsize of int:%d",sizeof(s32));
printf("\nsize of float:%d",sizeof(f32));
printf("\nsize of double:%d",sizeof(f64));
printf("\nsize of short int:%d",sizeof(s16));
printf("\nsize of long int:%d",sizeof(s32));
printf("\nsize of long double:%d",sizeof(f128));

	
}