#define ROW PORTC //define portc as row
#define COL PORTD //define prtd as col
unsigned char ROW_Data[10] = {0x7E,0x81,0x81,0x85,0x46,0x00};//A

unsigned char COL_Data[8] = {0x80,0x40,0x20,0x10,0x08,0x04,0x02,0x01};
unsigned char RData,CData,Nex,Del;//Define variable

void MSDelay()//Delay function
{
   unsigned char y;
   for(y = 0;y<60;y++);//For loop for delay
}
void main() //main function
{
  TRISC = 0x00; //Define PORTC as output
  TRISD = 0x00; //define portd as output
  RData = 0; //aasigned intial value as zero
  CData = 0; //assigned intial value as zero
  Nex = 0;//Assigned intial value 0
  while(1)
  {
    for(Del = 0; Del<5;Del++)  //delay for next character Data
    {
          for(CData = 0;CData <8;CData++)//for loop for moving character
          {
           COL = COL_Data[CData];//find code and send data to column
           ROW = ROW_Data[RData]; //find code and send data to Row
           MSDelay();   //Delay
           RData++;  //increament Rdata
           if(RData == 10) RData = 0;
          }
     RData = Nex;
     if(Nex == 10) Nex = 0;
    }
    Nex++;
    RData = Nex;
  }
}