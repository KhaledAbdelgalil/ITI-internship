#include <Stdio.h>

//dataTypes definitions

typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned long int u32;
typedef  char s8;
typedef short int s16;
typedef long int s32;
typedef float f32;
typedef double f64;
typedef long double f128;

//structure

typedef struct complex
{
	s32 Real;
	s32 Imj;
}complex;

//protoTypes

complex AddComplex(complex first,complex second);
complex SubComplex(complex first,complex second);
complex printComplex(complex Result);



void main(void)
{
	 complex first;
	 complex second;
	 complex Result;
	
	//taking 1st from user
	
	printf("enter 1st Real part:\n");
	scanf("%d",&first.Real);
	printf("enter 1st Imj part:\n");
	scanf("%d",&first.Imj);
	
	//taking 2nd from user
	
	printf("enter 2nd Real part:\n");
	scanf("%d",&second.Real);
	printf("enter 2nd Imj part:\n");
	scanf("%d",&second.Imj);
	
	//sum
	Result=AddComplex(first,second);
	printf("their sum is:\n");
	printComplex(Result);
	
	//sub
	Result=SubComplex(first,second);
	printf("\ntheir subtraction is:\n");
	printComplex(Result);
	
}