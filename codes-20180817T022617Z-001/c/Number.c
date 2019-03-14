#include <stdio.h>

void main(void)
{
	int x=3,y=4,n=1,z;
	z=x+y;
	printf("%d\n",z);
	z=n++;
	printf("%d\n",z);
	z=++n+y;
	printf("%d\n",z);
	z=n+++y;
	printf("%d\n",z);
	z=n--;
	printf("%d\n",z);
	printf("%d\n",n);
	
}