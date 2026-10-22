#line 1 "D:/pic_mocrochip/ActiveLoad/soft/dynamics.c"
extern short dyn_mode_flag;
extern short short_1;

extern short dyn_mode;


extern short mode1;
extern short dyn_mode_flag;
extern unsigned int int_1;
extern const code char s_SelectMode[];
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
#line 1 "d:/pic_mocrochip/activeload/soft/keyboard.h"



char GetKeyNormal();
#line 16 "D:/pic_mocrochip/ActiveLoad/soft/dynamics.c"
void ChangeValueShowToLcd(){

 if (dyn_mode_flag.B2 == 0){
 dyn_mode_flag.B2 = 1;
 dyn_mode_flag.B1 = 1;
 Lcd_Chr(1, 12, 'U');
 }
 else{
 if (dyn_mode_flag.B1 == 1){
 dyn_mode_flag.B1 = 0;
 Lcd_Chr(1, 12, 'I');
 }
 else{
 dyn_mode_flag.B2 = 0;
 Lcd_Chr(1, 12, ' ');
 }
 }
}

void DoDynamicsLoad(){
 Lcd_Cmd(_LCD_CLEAR);
 LCDShowStringFromEEPROM(1, 6);
 PORTC &= 0b11111000;
 T1CON = 0b00110100;
 TMR1H = 0;
 TMR1L = 0;
 PIE1.TMR1IE = 1;
 INTCON.PEIE = 1;
 dyn_mode_flag = 0;

 dyn_mode_flag.B6 = 1;

 dyn_mode = 0;
do{

 if (dyn_mode_flag.B7 == 1){
 dyn_mode_flag.B7 = 0;
 T1CON.TMR1ON = 0;
 switch(dyn_mode){

 case 0:
 if (dyn_mode_flag.B2 == 1){

 if (dyn_mode_flag.B1 == 1){
 Lcd_Chr(1, 12, 'U');
 MeasureVoltage1();
 DisplayFloat1(2, 1);
 MeasureVoltage2();
 DisplayFloat1(2, 8);
 MeasureVoltage3();
 DisplayFloat1(2, 13);
 }

 else{
 Lcd_Chr(1, 12, 'I');
 MeasureCurrent1();
 DisplayFloat1(2, 1);
 MeasureCurrent2();
 DisplayFloat1(2, 8);
 MeasureCurrent3();
 DisplayFloat1(2, 13);
 }
 }

 else{
 Lcd_Chr(1, 12, ' ');
 LCDClearString2();
 }

 TMR1L = 0xDB;
 TMR1H = 0x0B;
 INTCON.GIE = 1;
 PORTC |= 0b00001111;
 T1CON.TMR1ON = 1;
 break;


 case 1:

 if (dyn_mode_flag.B5 == 0){

 if (dyn_mode_flag.B2 == 1){

 if (dyn_mode_flag.B1 == 1){
 Lcd_Chr(1, 12, 'U');
 MeasureVoltage1();
 DisplayFloat1(2, 1);
 MeasureVoltage2();
 DisplayFloat1(2, 8);
 MeasureVoltage3();
 DisplayFloat1(2, 13);
 }

 else{
 Lcd_Chr(1, 12, 'I');
 MeasureCurrent1();
 DisplayFloat1(2, 1);
 MeasureCurrent2();
 DisplayFloat1(2, 8);
 MeasureCurrent3();
 DisplayFloat1(2, 13);
 }
 }

 else{
 Lcd_Chr(1, 12, ' ');
 LCDClearString2();
 }

 PORTC &= 0b11110000;
 dyn_mode_flag.B5 = 1;

 TMR1L = 0xDB;
 TMR1H = 0x0B;
 }

 else{
 PORTC |= 0b00001111;
 dyn_mode_flag.B5 = 0;

 if (dyn_mode_flag.B2 == 0){

 TMR1L = 0xDB;
 TMR1H = 0x0B;
 }

 else{

 TMR1L = 0xDB;
 TMR1H = 0x5B;
 }
 }
 T1CON.TMR1ON = 1;
 break;


 case 2:

 if (dyn_mode_flag.B5 == 0){

 PORTC &= 0b11110000;
 dyn_mode_flag.B5 = 1;

 TMR1L = 0xDB;
 TMR1H = 0x0B;
 }

 else{
 PORTC |= 0b0001111;
 dyn_mode_flag.B5 = 0;

 TMR1L = 0x82;
 TMR1H = 0xFF;
 }
 T1CON.TMR1ON = 1;
 break;



 case 3:

 if (dyn_mode_flag.B5 == 0){

 if (dyn_mode_flag.B2 == 1){

 if (dyn_mode_flag.B1 == 1){
 Lcd_Chr(1, 12, 'U');
 MeasureVoltage1();
 DisplayFloat1(2, 1);
 MeasureVoltage2();
 DisplayFloat1(2, 8);
 MeasureVoltage3();
 DisplayFloat1(2, 13);
 }

 else{
 Lcd_Chr(1, 12, 'I');
 MeasureCurrent1();
 DisplayFloat1(2, 1);
 MeasureCurrent2();
 DisplayFloat1(2, 8);
 MeasureCurrent3();
 DisplayFloat1(2, 13);
 }
 }

 else{
 Lcd_Chr(1, 12, ' ');
 LCDClearString2();
 }

 PORTC &= 0b11110000;
 dyn_mode_flag.B5 = 1;

 TMR1L = 0x82;
 TMR1H = 0xFF;
 }

 else{
 PORTC |= 0b00001111;
 dyn_mode_flag.B5 = 0;

 if (dyn_mode_flag.B2 == 0){

 TMR1L = 0xDB;
 TMR1H = 0x0B;
 }

 else{

 TMR1L = 0xDB;
 TMR1H = 0x5B;
 }
 }
 T1CON.TMR1ON = 1;
 break;



 case 4:

 if (dyn_mode_flag.B5 == 0){

 if (dyn_mode_flag.B2 == 1){

 if (dyn_mode_flag.B1 == 1){
 Lcd_Chr(1, 12, 'U');
 MeasureVoltage1();
 DisplayFloat1(2, 1);
 MeasureVoltage2();
 DisplayFloat1(2, 8);
 MeasureVoltage3();
 DisplayFloat1(2, 13);
 }

 else{
 Lcd_Chr(1, 12, 'I');
 MeasureCurrent1();
 DisplayFloat1(2, 1);
 MeasureCurrent2();
 DisplayFloat1(2, 8);
 MeasureCurrent3();
 DisplayFloat1(2, 13);
 }
 }

 else{
 Lcd_Chr(1, 12, ' ');
 LCDClearString2();
 }

 PORTC &= 0b11110000;
 dyn_mode_flag.B5 = 1;

 TMR1L = 0xDB;
 TMR1H = 0x0B;
 T1CON.TMR1ON = 1;
 }

 else{
 PORTC |= 0b00001001;
 dyn_mode_flag.B5 = 0;

 if (dyn_mode_flag.B2 == 0){

 TMR1L = 0xDB;
 TMR1H = 0x0B;
 }

 else{

 TMR1L = 0xDB;
 TMR1H = 0x5B;
 }
 T1CON.TMR1ON = 1;
 Delay_100ms();
 PORTC |= 0b00001011;
 Delay_100ms();
 PORTC |= 0b00001111;
 }
 break;



 default:
 break;
 }
 }


 short_1 = GetKeyNormal();

 if (short_1 ==  1 ){
 if (dyn_mode > 0){
 dyn_mode --;
 dyn_mode_flag.B6 = 1;
 }
 }

 else if (short_1 ==  2 ){
 if (dyn_mode <  4 ){
 dyn_mode ++;
 dyn_mode_flag.B6 = 1;
 }
 }

 else if (short_1 ==  6 ){
 goto end_;
 }

 else if (short_1 ==  3 ){

 switch(dyn_mode){
 case 0:
 case 1:
 case 3:
 case 4:
 ChangeValueShowToLcd();
 if (dyn_mode_flag.B2 == 1){

 if (dyn_mode_flag.B1 == 1){
 Lcd_Chr(1, 12, 'U');
 MeasureVoltage1();
 DisplayFloat1(2, 1);
 MeasureVoltage2();
 DisplayFloat1(2, 8);
 MeasureVoltage3();
 DisplayFloat1(2, 13);
 }

 else{
 Lcd_Chr(1, 12, 'I');
 MeasureCurrent1();
 DisplayFloat1(2, 1);
 MeasureCurrent2();
 DisplayFloat1(2, 8);
 MeasureCurrent3();
 DisplayFloat1(2, 13);
 }
 }

 else{
 Lcd_Chr(1, 12, ' ');
 LCDClearString2();
 }
 break;

 default:
 dyn_mode_flag.B2 = 0;
 break;
 }
 }

 if (dyn_mode_flag.B6 == 1){
 INTCON.GIE = 0;
 T1CON.TMR1ON = 0;
 PORTC &= 0b11110000;
 dyn_mode_flag.B6 = 0;
 dyn_mode_flag.B5 = 0;
 PIR1.TMR1IF = 0;
 switch(dyn_mode){

 case 0:
 Lcd_Chr(1, 10, '0');

 TMR1L = 0xDB;
 TMR1H = 0x0B;
 INTCON.GIE = 1;
 PORTC |= 0b00001111;
 T1CON.TMR1ON = 1;
#line 414 "D:/pic_mocrochip/ActiveLoad/soft/dynamics.c"
 break;

 case 1:
 Lcd_Chr(1, 10, '1');

 TMR1L = 0xDB;
 TMR1H = 0x0B;
 INTCON.GIE = 1;
 PORTC |= 0b00001111;
 T1CON.TMR1ON = 1;
 break;

 case 2:
 Lcd_Chr(1, 10, '2');

 TMR1L = 0x82;
 TMR1H = 0xFF;
 PIR1.TMR1IF = 0;
 INTCON.GIE = 1;
 PORTC |= 0b00001111;
 Lcd_Chr(1, 12, ' ');
 LCDClearString2();
 T1CON.TMR1ON = 1;
 break;

 case 3:
 INTCON.GIE = 0;
 T1CON.TMR1ON = 0;
 PORTC &= 0b11110000;
 Lcd_Chr(1, 10, '3');

 TMR1L = 0xDB;
 TMR1H = 0x0B;
 INTCON.GIE = 1;
 PORTC |= 0b00001111;
 T1CON.TMR1ON = 1;
 break;

 case 4:
 INTCON.GIE = 0;
 T1CON.TMR1ON = 0;
 PORTC &= 0b11110000;
 Lcd_Chr(1, 10, '4');

 TMR1L = 0xDB;
 TMR1H = 0x0B;
 INTCON.GIE = 1;
 PORTC |= 0b00001111;
 T1CON.TMR1ON = 1;
 break;

 default:
 break;
 }

 }




 }while(1);






end_:;
 LCDWriteFromROM(1,1, s_SelectMode);
 LCDShowStringFromEEPROM(2, 8 + mode1);
}
