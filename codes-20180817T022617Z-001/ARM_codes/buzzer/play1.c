void play(float Duty,float freq)
{
      float time;
      float timeON;
      float timeOFF;
     unsigned long int x;
     x=0;
     time=1/freq;

   //period
     time*=1000000;
   //timeON in us
   timeON=Duty*time;
   timeOFF =(time-timeON);

   while(x<=timeON)
   {
        x+=10;
        GPIOE_ODR=0x4000;
        Delay_us(10);
   }
     x=0;
     while(x<=timeOFF)
   {
        x+=10;
        GPIOE_ODR=0x0000;
        Delay_us(10);
   }

}