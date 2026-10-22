#line 1 "D:/pic_mocrochip/ActiveLoad/soft/keyboard.c"

extern short short_1;
extern unsigned long int key_press;
#line 1 "d:/program files/mikroc pro for pic/include/built_in.h"
#line 1 "d:/pic_mocrochip/activeload/soft/global.h"
#line 15 "d:/pic_mocrochip/activeload/soft/global.h"
void InitPic();
void LCDShowStringFromEEPROM(char lcd_row, char num);
void GetADCValue(short canal);
void LoadFromEEPROMKoef(char *p1, short b1);
void LoadFromEEPROMBaseKoef();
void SaveToEEPROMKoef(char *p1, short b1);
void DisplayFloat1(short row, short col);
void MeasureVoltage1();
void MeasureCurrent1();
void MeasureVoltage2();
void MeasureCurrent2();
void MeasureVoltage3();
void MeasureCurrent3();
void CalculateFloat1ADC();
void LCDClearString2();
void LCDOverLoad(short row, short col);
void LCDOverLoad_UIP(short row, short col, char ch);
void MeasureAndShowAllChanels();
void PlaySound_500_50();
void PlaySound_1000_50();
void LCDWriteFromROM( char row, char col, const char *text );
void DisplayInt1ThreeDigit(short row, short col);
void CalculateFloat1Float2Power();
#line 8 "D:/pic_mocrochip/ActiveLoad/soft/keyboard.c"
char GetKeyNormal(){

 key_press = 0;
 short_1 = (PORTB & 0b00110000);

 if (short_1 == 0b00110000)
 return  0 ;

 do{
 key_press ++;

 if (key_press > 20000){

 if (key_press > 200000){
 return  0 ;
 }

 if (short_1 == 0b00000000){
 short_1 =  6 ;
 }

 else if (short_1 == 0b00010000){
 short_1 =  4 ;
 }

 else{
 short_1 =  5 ;
 }
 PlaySound_1000_50();
 PlaySound_500_50();
 PlaySound_1000_50();
 PlaySound_500_50();

 do{
 }while((PORTB & 0b00110000) != 0b00110000);

 return short_1;
 }
 }while( short_1 == (PORTB & 0b00110000) );

 if (key_press < 1500){
 return  0 ;
 }

 if (short_1 == 0b00000000){
 short_1 =  3 ;
 }

 else if (short_1 == 0b00010000){
 short_1 =  1 ;
 }

 else{
 short_1 =  2 ;
 }
 PlaySound_1000_50();
 PlaySound_500_50();

 do{
 }while((PORTB & 0b00110000) != 0b00110000);

 return short_1;
}
