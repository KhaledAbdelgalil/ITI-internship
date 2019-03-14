#include "HEADER.h"
extern u8 paint_flag;
extern  x_tft,y_tft;
u32 xPaint[1000];
u32 yPaint[1000];
u32 color[1000];
u32 sizeP[1000];
u32 count;
u8 size=2;
u8 indicator;

void paint (void)
{
   u8 erase=0;
   u8 askal=2;
   count=0;
while(paint_flag==1)
{

    if(TP_TFT_Press_Detect())
     {

      TP_TFT_Get_Coordinates(&x_tft,&y_tft);
      //out
       if((x_tft>=0)&&(x_tft<=42)&&(y_tft>=0)&&(y_tft<=21))
       {
              paint_flag=0;
              TFT_Fill_Screen(CL_Green);
              module1();
             x_tft=500;
             y_tft=500;
       
       }
       //erase
       else if((x_tft>=0)&&(x_tft<=42)&&(y_tft>=21)&&(y_tft<=42))
       {
           erase=1;
       }
      //colors
      else if((x_tft>=50)&&(x_tft<=105)&&(y_tft<=30)&&(y_tft>=0))
     {
       TFT_Set_Pen(CL_AQUA, size);
        erase=0;
        indicator=1;
     }
         else if((x_tft>=105)&&(x_tft<=160)&&(y_tft<=30)&&(y_tft>=0))
     {
     TFT_Set_Pen(CL_FUCHSIA, size);
      erase=0;
       indicator=2;
     }
         else if((x_tft>=160)&&(x_tft<=215)&&(y_tft<=30)&&(y_tft>=0))
     {
     TFT_Set_Pen(CL_GRAY, size);
      erase=0;
       indicator=3;
     }
         else if((x_tft>=215)&&(x_tft<=270)&&(y_tft<=30)&&(y_tft>=0))
     {
     TFT_Set_Pen(CL_RED, size);
      erase=0;
       indicator=4;
     }
         else if((x_tft>=270)&&(x_tft<=330)&&(y_tft<=30)&&(y_tft>=0))
     {
     TFT_Set_Pen(CL_YELLOW, size);
      erase=0;
       indicator=5;
     }

         //fonts
        else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=42)&&(y_tft<=75))
        {
        size=2;
         erase=0;
        }
         else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=75)&&(y_tft<=108))
        {
        size=5;
         erase=0;
        }
         else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=108)&&(y_tft<=141))
        {
        size=10;
         erase=0;
        }
        //askal   rectangle=0;triangle=1;freehand =2
         else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=141)&&(y_tft<=174))
        {
         askal=0;
          erase=0;
        }
        else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=141)&&(y_tft<=174))
        {
         askal=0;
          erase=0;
        }
         else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=174)&&(y_tft<=207))
        {
         askal=1;
          erase=0;
        }
         else if((x_tft>=0)&&(x_tft<=50)&&(y_tft>=207)&&(y_tft<=240))
        {
         askal=2;
         erase=0;
        }
        //drawing
        else
        {
          if(y_tft>=50)
          {
          if(erase==1)
           {
               TFT_Set_Pen(CL_White, 10);
               TFT_Circle(x_tft,y_tft,4);
               xPaint[count]=x_tft;
               yPaint[count]=y_tft;
               color[count]=0;
               sizeP[count]=size;
               count++;
           }
          else if(askal==0)
          {
                  TFT_Rectangle(x_tft,y_tft,x_tft+70,y_tft+40);
          }
          else if(askal==1)
          {
                TFT_Line(x_tft+10, y_tft+42, x_tft+30,y_tft+ 42);
           TFT_Line(x_tft+10,y_tft+42, x_tft+20, y_tft);
           TFT_Line(x_tft+20, y_tft, x_tft+30,y_tft+ 42);
          }
          else if(askal==2)
          {
              TFT_Circle(x_tft,y_tft,1);

               xPaint[count]=x_tft;
               yPaint[count]=y_tft;
               color[count]=indicator;
               sizeP[count]=size;
               count++;
          }
           }
          
        }

        
     }
}
}  //end of paint

//paint2  feha error
void paint2()
{         u32 i;
   x_tft=500;
   y_TFT=500;
   while(x_tft==500&&y_tft==500)
   {
   if(TP_TFT_Press_Detect())
   { 
      TP_TFT_Get_Coordinates(&x_tft,&y_tft);
   }
   }
        paint_module();
        for(i=0;i<count;i++)
        {
          if(color[i]==0) {  TFT_Set_Pen(CL_White, 10); TFT_Circle(xPaint[i],yPaint[i],4);}
         else if(color[i]==1) {  TFT_Set_Pen(CL_AQUA,  sizeP[i]); TFT_Circle(xPaint[i],yPaint[i],1);}
         else if(color[i]==2) {   TFT_Set_Pen(CL_FUCHSIA, sizeP[i]); TFT_Circle(xPaint[i],yPaint[i],1);   }
        else  if(color[i]==3) {   TFT_Set_Pen(CL_GRAY, sizeP[i]); TFT_Circle(xPaint[i],yPaint[i],1);   }
         else  if(color[i]==4) {   TFT_Set_Pen(CL_RED, sizeP[i]); TFT_Circle(xPaint[i],yPaint[i],1);   }
          else  if(color[i]==5) {   TFT_Set_Pen(CL_YELLOW, sizeP[i]); TFT_Circle(xPaint[i],yPaint[i],1);   }
        }
          paint();


}