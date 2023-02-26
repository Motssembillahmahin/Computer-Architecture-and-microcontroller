#line 1 "C:/Users/Mahin/Desktop/microcontrollerexam/Dot matrix/dotmatrix.c"


unsigned char ROW_Data[10] = {0x7E,0x81,0x81,0x85,0x46,0x00};

unsigned char COL_Data[8] = {0x80,0x40,0x20,0x10,0x08,0x04,0x02,0x01};
unsigned char RData,CData,Nex,Del;

void MSDelay()
{
 unsigned char y;
 for(y = 0;y<60;y++);
}
void main()
{
 TRISC = 0x00;
 TRISD = 0x00;
 RData = 0;
 CData = 0;
 Nex = 0;
 while(1)
 {
 for(Del = 0; Del<5;Del++)
 {
 for(CData = 0;CData <8;CData++)
 {
  PORTD  = COL_Data[CData];
  PORTC  = ROW_Data[RData];
 MSDelay();
 RData++;
 if(RData == 10) RData = 0;
 }
 RData = Nex;
 if(Nex == 10) Nex = 0;
 }
 Nex++;
 RData = Nex;
 }
}
