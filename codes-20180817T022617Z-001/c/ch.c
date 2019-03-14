#include <Stdio.h>

void main(void)
{
unsigned char x;
for(x=0;x<256;x++){
printf("x=%d",x);
if(x==255) break;
}
}