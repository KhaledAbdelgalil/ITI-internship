#include <stdio.h>

void printarray(int x[],int s);
void sortarray(int x[],int s);

void main(void)
{
int x[5];
int i;

for(i=0;i<5;i++)
scanf("%d",&x[i]);

sortarray(x,5);

printarray(x,5);

}
