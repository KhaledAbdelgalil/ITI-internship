#include <Stdio.h>
//dataType definitions
typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned long int u32;
typedef  char s8;
typedef short int s16;
typedef long int s32;
typedef float f32;
typedef double f64;
typedef long double f128;

//the complex structure

typedef struct complex
{
	s32 Real;
	s32 Imj;
}complex;

complex AddComplex(complex first,complex second)
{
	complex Result;
	Result.Real=first.Real+second.Real;
	Result.Imj=first.Imj+second.Imj;
	return Result;
}
complex SubComplex(complex first,complex second)
{
	complex Result;
	Result.Real=first.Real-second.Real;
	Result.Imj=first.Imj-second.Imj;
	return Result;
}
complex printComplex(complex Result)
{
	if(Result.Imj>=0)
		printf("%d+%dj",Result.Real,Result.Imj);
	else
		printf("%d%dj",Result.Real,Result.Imj);
}