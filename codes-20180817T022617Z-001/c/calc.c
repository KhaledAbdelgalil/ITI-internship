#include <Stdio.h>
#include <conio.h>
void main(void)
{
int first;
int second;
char operation=0;
char again;
printf("welcome to our calculator\n");
do
{
	
//take 1st operand

printf("enter the 1st operand:");
scanf("%d",&first);

//take 2nd operand

printf("enter the 2nd operand:");
scanf("%d",&second);

//take operation

do 
{
printf("enter operation:\n");
operation=getch();
}
while(operation != '+' && operation != '*' && operation != '/' && operation != '-');


switch (operation)
{
  case '+':printf("the result is:%d",first+second);break;
  case '-': printf("the result is:%d",first-second);break;
  case '*': printf("the result is:%d",first*second);break;
  case '/': if(second == 0)printf("Math error");
	        else printf("the result is:%f",(float)first/second);
}
//ask user to repeat

printf("\ndo you want to repeat:\n");
again = getch();


}
while(again=='y' || again=='Y');

}