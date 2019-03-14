#include <stdio.h>
void printarray(int x[],int s);
void sortarray(int x[],int s);
void printarray(int x[],int s)
{
int i;
for(i=0;i<s;i++)
printf("\n%d",x[i]);
}

void sortarray(int x[],int s)
{   
    int temp;
    int i,j;
	for(i=0;i<s;i++)
   {
	for(j=i+1;j<s;j++)
	{
		if(x[j]>x[i])
		{
			temp=x[i];
            x[i]=x[j];
	        x[j]=temp;
		}
		
	}
/*if(x[i+1]>x[i])
{
	temp=x[i];
    x[i]=x[i+1];
	x[i+1]=temp;
	
	i=-1;
	
	
}*/
   }

}
