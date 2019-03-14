#include <stdio.h>

void main(void)
{
int x[5];
int i;
int number;
int flag=0;
int y;
for(i=0;i<5;i++)
scanf("%d",&x[i]);
//enter number to show index
printf("enter number:");
scanf("%d",&number);

for(i=0;i<5;i++)
{
	if(x[i]==number){
		y=i+1;
		printf("\n%d is the index",y);
		flag=1;
	}
}

if(flag==0)
{
	printf("not found");
}
}