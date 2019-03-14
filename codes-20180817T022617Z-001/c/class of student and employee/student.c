#include <Stdio.h>

//dataTypes definitions
#include "typedef.h"

typedef struct human
{
	u8 name[15];
	u8 age;
	u8 Gender[15];
	u16 ID;
	
	
}human;

typedef struct student
{
	human basics;
	f32 totalGrade;
	f32 subject1;
	f32 subject2;
}student;

typedef struct employee
{
    human basics;
	u32 salary;
	u8 workHours;
	u32 bonus;
}employee;

//prototypes
void bonusCalc(employee y[],u8 size);
void totalCalc(student x[],u8 size);

void main(void)
{
	student x[3];
	employee y[3];
	int count;
	//taking students information
	printf("firstly we will take information about three students:\n");
	for(count=0;count<3;count++)
	{
		printf("enter student Name:\n");
		scanf("%s",&x[count].basics.name);
		printf("enter student age:\n");
		scanf("%d",&x[count].basics.age);
		printf("enter student gender:\n");
		scanf("%s",&x[count].basics.Gender);
		printf("enter student ID:\n");
		scanf("%d",&x[count].basics.ID);
		printf("enter student 1st subject grade:\n");
		scanf("%f",&x[count].subject1);
		printf("enter student 2nd subject grade:\n");
		scanf("%f",&x[count].subject2);
		if(count!=2) printf("the next student information:\n");
	}
	//taking employee information
	printf("now we will take information about three employees:\n");
	for(count=0;count<3;count++)
	{
		printf("enter employee Name:\n");
		scanf("%s",&y[count].basics.name);
		printf("enter employee age:\n");
		scanf("%d",&y[count].basics.age);
		printf("enter employee gender:\n");
		scanf("%s",&y[count].basics.Gender);
		printf("enter employee ID:\n");
		scanf("%d",&y[count].basics.ID);
		printf("enter employee salary:\n");
		scanf("%d",&y[count].salary);
		printf("enter employee workHours:\n");
		scanf("%d",&y[count].workHours);
		if(count!=2) printf("the next employe information:\n");
	}
	//calculations
	totalCalc(x,3);
	bonusCalc(y,3);
	//students information
	printf("Our information about students:\n");
	for (count = 0;count < 3;count++)
	{
	  //basics
	  printf("Name:%s , age:%d , gender:%s , ID:%d ",x[count].basics.name,x[count].basics.age,x[count].basics.Gender,x[count].basics.ID);
      //subjects grades
	  printf("subject1Grade:%f ,subject2Grade:%f ,Total:%f",x[count].subject1,x[count].subject2,x[count].totalGrade);
      printf("\n");
	}
	//employee information
	printf("Our information about employees:\n");
	for (count = 0;count < 3;count++)
	{
	  //basics
	  printf("Name:%s , age:%d , gender:%s , ID:%d ",y[count].basics.name,y[count].basics.age,y[count].basics.Gender,y[count].basics.ID);
      //subjects grades
	  printf("employeeSalary:%d ,workHours:%d ,bonus:%d",y[count].salary,y[count].workHours,y[count].bonus);
      printf("\n");
	}
}

void bonusCalc(employee y[],u8 size)
{
 u8 count;
 for (count=0;count<size;count++)	
 {
	 if(y[count].workHours>8)
		 y[count].bonus=(y[count].workHours-8)*y[count].basics.age+y[count].salary/20;
	 else y[count].bonus=0;
 }
	
}
void totalCalc(student x[],u8 size)
{
	u8 count;
	for (count=0;count<size;count++)	
 {
	 x[count].totalGrade=x[count].subject1+x[count].subject2;
 }
}