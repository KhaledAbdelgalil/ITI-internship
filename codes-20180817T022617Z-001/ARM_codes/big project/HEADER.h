typedef unsigned char u8;
typedef unsigned int u16;
 typedef unsigned long int u32;

//prototype of functions

//lcd
void Calibrate(void);
void Init_ADC(void);

//modules
void module1 ();
void Games_Module();

//snake
void draw(u8 sizeOFsnake);
void ams7();
void snake();
void after_snake();

//paint
void paint_module();
void  paint_module2();
void paint();
void paint2();
//comm
void comm_module();
void comm();