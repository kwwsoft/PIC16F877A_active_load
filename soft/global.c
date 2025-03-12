#include "stdlib.h"
#include "built_in.h"
#include "global.h"
//******************************************************************************
// LCD module connections
sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
// End LCD module connections
//******************************************************************************
extern const code char s_SelectMode[];
extern const code char s_VSB[];
extern const code char s_PG[];
extern const code char s_OFF[];
extern const code char s_ON[];
extern short short_1;
extern short mode1;
extern short on_off;
extern short i_p;
extern short counter;
extern short dyn_mode_flag;
extern unsigned int adc_in;
extern unsigned int adc_int;
extern unsigned int adc_middle;
extern unsigned int power_all;
extern unsigned int int_1;
extern unsigned int int_2;
extern unsigned long int key_press;
extern float k_adc;
extern float k_5vsb;
extern float k_pg;
extern float k_can;
extern float adc_float;
extern float float_1;
extern float float_2;
extern char txt_6[6];
extern char txt_9[9];
extern char txt_19[19];
//******************************************************************************
void CalculateFloat1Float2Power(){
 float_2 *= float_1;
 int_1 = (int)float_2;
}
//******************************************************************************
void CalculateFloat1ADC(){
 float_1 = adc_float / k_can;
}
//******************************************************************************
void MeasureVoltage1(){
 PORTC.RC6 = 0;
 PORTC.RC7 = 0;
 LoadFromEEPROMKoef((char*)&k_can, 0x0c);
 GetADCValue(1);
 if (adc_int > 950) {
  PORTC.RC6 = 0;
  PORTC.RC7 = 1;
  LoadFromEEPROMKoef((char*)&k_can, 0x10);
  GetADCValue(1);
  if (adc_int > 950) {
   PORTC.RC6 = 1;
   PORTC.RC7 = 0;
   LoadFromEEPROMKoef((char*)&k_can, 0x14);
   GetADCValue(1);
  }
 }
 CalculateFloat1ADC();
}
//-----------------------------------------------------------------------------
void MeasureCurrent1(){
 LoadFromEEPROMKoef((char*)&k_can, 0x30);
 GetADCValue(0);
 CalculateFloat1ADC();
}
//-----------------------------------------------------------------------------
void MeasureVoltage2(){
 PORTC.RC4 = 0;
 PORTC.RC5 = 0;
 LoadFromEEPROMKoef((char*)&k_can, 0x18);
 GetADCValue(2);
 if (adc_int > 950) {
  PORTC.RC4 = 0;
  PORTC.RC5 = 1;
  LoadFromEEPROMKoef((char*)&k_can, 0x1c);
  GetADCValue(2);
  if (adc_int > 950) {
   PORTC.RC4 = 1;
   PORTC.RC5 = 0;
   LoadFromEEPROMKoef((char*)&k_can, 0x20);
   GetADCValue(2);
  }
 }
 CalculateFloat1ADC();
}
//-----------------------------------------------------------------------------
void MeasureCurrent2(){
 LoadFromEEPROMKoef((char*)&k_can, 0x34);
 GetADCValue(3);
 CalculateFloat1ADC();
}
//-----------------------------------------------------------------------------
void MeasureVoltage3(){
 PORTD.RD2 = 0;
 PORTD.RD3 = 0;
 LoadFromEEPROMKoef((char*)&k_can, 0x24);
 GetADCValue(4);
 if (adc_int > 950) {
  PORTD.RD2 = 0;
  PORTD.RD3 = 1;
  LoadFromEEPROMKoef((char*)&k_can, 0x28);
  GetADCValue(4);
  if (adc_int > 950) {
   PORTD.RD2 = 1;
   PORTD.RD3 = 0;
   LoadFromEEPROMKoef((char*)&k_can, 0x2c);
   GetADCValue(4);
  }
 }
 CalculateFloat1ADC();
}
//-----------------------------------------------------------------------------
void MeasureCurrent3(){
 LoadFromEEPROMKoef((char*)&k_can, 0x38);
 GetADCValue(5);
 CalculateFloat1ADC();
}
//-----------------------------------------------------------------------------
void DisplayInt1ThreeDigit(short row, short col){
 WordToStr(int_1, txt_6);
 txt_6[0] = txt_6[2];
 txt_6[1] = txt_6[3];
 txt_6[2] = txt_6[4];
 txt_6[3] = 0;
 Lcd_Out(row, col, txt_6);
}
//-----------------------------------------------------------------------------
void DisplayFloat1(short row, short col){
// xx.xx
 Lcd_Chr(row, col, ' ');  
 for (counter = 0; counter < 4; counter++){
  Lcd_Chr_CP(' ');
 }
 FloatToStr(float_1, txt_6);
 //3.254e-3
 if (float_1 < 0.01){
  txt_6[0] = '0';
  txt_6[1] = '.';
  txt_6[2] = '0';
  txt_6[3] = '0';
 }
 //3.254e-2
 else if (float_1 < 0.1){
  Lo(adc_in) = txt_6[0];
  txt_6[0] = '0';
  txt_6[1] = '.';
  txt_6[2] = '0';
  txt_6[3] = Lo(adc_in);
 }
 //3.254e-1
 else if (float_1 < 1.0){
  Hi(adc_in) = txt_6[0];
  Lo(adc_in) = txt_6[2];
  txt_6[0] = '0';
  txt_6[1] = '.';
  txt_6[2] = Hi(adc_in);
  txt_6[3] = Lo(adc_in);
 }
 //2.35698
 else{
 }
 txt_6[4] = 0;
 Lcd_Out(row, col, txt_6);
}
//******************************************************************************
void SaveToEEPROMKoef(char *p1, short b1){
//коэф через указатель
 for (short_1 = 0; short_1 < 4; short_1++){
  EEPROM_Write(b1 ++, *p1);
  Delay_10ms();
  Delay_10ms();
  p1++;
 }
}
//******************************************************************************
void LoadFromEEPROMKoef(char *p1, short b1){
//читаЇмо в зм≥нну в пам€ть з ™™ѕ–ќћа через вказ≥вник
 for (short_1 = 0; short_1 < 4; short_1++){
  *p1 = EEPROM_Read(b1 ++);
  Delay_10ms();
  p1++;
 }
}
//******************************************************************************
void LoadFromEEPROMBaseKoef(){
 LoadFromEEPROMKoef((char*)&k_adc, 0x00);
 LoadFromEEPROMKoef((char*)&k_5vsb, 0x04);
 LoadFromEEPROMKoef((char*)&k_pg, 0x08);
}
//******************************************************************************
void GetADCValue(short canal){
 //вибираЇмо потр≥бний канал
 ADCON0.CHS2 = 0;  ADCON0.CHS1 = 0;  ADCON0.CHS0 = 0;
 switch(canal){
  case 0:
  break;
  case 1:
   ADCON0.CHS0 = 1;
  break;
  case 2:
   ADCON0.CHS1 = 1;
  break;
  case 3:
   ADCON0.CHS1 = 1;  ADCON0.CHS0 = 1;
  break;
  case 4:
   ADCON0.CHS2 = 1;
  break;
  case 5:
   ADCON0.CHS2 = 1;  ADCON0.CHS0 = 1;
  break;
  case 6:
   ADCON0.CHS2 = 1;  ADCON0.CHS1 = 1;
  break;
  case 7:
   ADCON0.CHS2 = 1;  ADCON0.CHS1 = 1;  ADCON0.CHS0 = 1;
  break;
 }
 adc_int = 0;
 short_1 = 32;
 do{
  Delay_22us();
  ADCON0.GO = 1;
  do{
  }while(ADCON0.GO == 1);
  //
  Lo(adc_in) = ADRESL;
  Hi(adc_in) = ADRESH;
  adc_int += adc_in;
 }while( --short_1 > 0);
 
 //
 adc_int /= 32;
 //
 adc_float = adc_int * k_adc;
}
//******************************************************************************
void LCDShowStringFromEEPROM(char lcd_row, char num){
//read 16 bytes fromm eeprom string
 num *= 16;
 for (short_1 = 0; short_1 < 16; short_1++){
  txt_19[short_1] = EEPROM_Read(num + short_1);
 }
 txt_19[16] = 0;
 Lcd_Out(lcd_row, 1, txt_19);
}
//******************************************************************************
void InitPic(){
 INTCON = 0;
 /*
 bit 7 RBPU: PORTB Pull-up Enable bit
 bit 6 INTEDG: Interrupt Edge Select bit
 bit 5 T0CS: TMR0 Clock Source Select bit
 bit 4 T0SE: TMR0 Source Edge Select bit
 bit 3 PSA: Prescaler Assignment bit
 bit 2-0 PS2:PS0: Prescaler Rate Select bits
 */
 OPTION_REG = 0b00001000;
 /*
 bit 7 PSPIE: Parallel Slave Port Read/Write Interrupt Enable bit(1)
 bit 6 ADIE: A/D Converter Interrupt Enable bit
 bit 5 RCIE: USART Receive Interrupt Enable bit
 bit 4 TXIE: USART Transmit Interrupt Enable bit
 bit 3 SSPIE: Synchronous Serial Port Interrupt Enable bit
 bit 2 CCP1IE: CCP1 Interrupt Enable bit
 bit 1 TMR2IE: TMR2 to PR2 Match Interrupt Enable bit
 bit 0 TMR1IE: TMR1 Overflow Interrupt Enable bit
*/
 PIE1 = 0;
 /*
 bit 7 Unimplemented: Read as С0Т
 bit 6 CMIE: Comparator Interrupt Enable bit
 bit 5 Unimplemented: Read as С0Т
 bit 4 EEIE: EEPROM Write Operation Interrupt Enable bit
 bit 3 BCLIE: Bus Collision Interrupt Enable bit
 bit 2-1 Unimplemented: Read as С0Т
 bit 0 CCP2IE: CCP2 Interrupt Enable bit
*/
 PIE2 = 0;
 TRISA = 0b11101111;
 //открытый сток - инверси€
 PORTA.F4 = 1;
 TRISB = 0b11111110;
 TRISC = 0b00000000;
 TRISD = 0b00000000;
 TRISE = 0b11101111;
 //
 T1CON.TMR1ON = 0;
 T2CON.TMR2ON = 0;
 ADCON0.ADON = 0;
 CVRCON = 0;
 //ADC
 //ADCS1 ADCS0 CHS2 CHS1 CHS0 GO/DONE Ч ADON
 //0       1 = FOSC/8
 //             0    0    0  =  Channel 0 (AN0)
 ADCON0 = 0b01000000;
 //ADFM ADCS2 Ч Ч PCFG3 PCFG2 PCFG1 PCFG0
 // 1 = Right justified. Six (6) Most Significant bits of ADRESH are read as С0Т.
 //       0 = FOSC/8
 //                                        7 6 5 4 3 2 1 0  VREF+  VREF-
 //                 0     0    0    0      A A A A A A A A   VDD    VSS
 ADCON1 = 0b10000000;
 ADCON0.ADON = 1;
 //
 PORTC = 0b00000000;
 PORTD = 0b00000000;
 //
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);               // Clear display
 Lcd_Cmd(_LCD_CURSOR_OFF);           // Cursor off
// Sound_Init(&PORTB, 0);
 Delay_10ms();
 //
}
//******************************************************************************
void LCDClearString2(){
 Lcd_Chr(2, 1, ' '); 
 for (counter = 0; counter < 15; counter++){
  Lcd_Chr_CP(' ');
 }
 dyn_mode_flag.B0 = 0;
}
//******************************************************************************
void LCDOverLoad(short row, short col){
 Lcd_Chr(row, col, 'O'); Lcd_Chr_CP('V'); Lcd_Chr_CP('E');  Lcd_Chr_CP('R');
}
//******************************************************************************
void LCDOverLoad_UIP(short row, short col, char ch){
 Lcd_Chr(row, col, '-'); Lcd_Chr_CP('-'); Lcd_Chr_CP(ch);  Lcd_Chr_CP('-');
}
//******************************************************************************
void MeasureAndShowAllChanels(){
 //
 if (i_p == 1){
  Lcd_Chr(2, 6, 'I');
 }
 else{
  Lcd_Chr(2, 6, 'P');
 }
  //------------------ can1 ----------------------------------
  MeasureVoltage1();
  int_1 = (int)float_1;
  float_2 = float_1;
  //overload
  if ( (int_1 > 30) || (adc_int > 1000) ){
   LCDOverLoad(1,1);
  }
  else{
   DisplayFloat1(1, 1);
  }
  MeasureCurrent1();
  int_2 = (int)float_1;
  if ( (int_2 > 25) || (adc_int > 1000) ){
   LCDOverLoad(2, 1);
  }
  else{
   CalculateFloat1Float2Power();
   //show current
   if (i_p == 1){
    DisplayFloat1(2, 1);
   }
   //show power
   else{
    DisplayInt1ThreeDigit(2, 1);
   }
  }
  //если перебор по мощности
  if ( int_1 > 290 ){
   LCDOverLoad(1,1);
   LCDOverLoad(2,1);
  }
  //---------------------- can2 ----------------------------------------
  MeasureVoltage2();
  int_1 = (int)float_1;
  float_2 = float_1;
  //overload
  if ( (int_1 > 21) || (adc_int > 1000) ){
   LCDOverLoad(1, 8);
  }
  else{
   DisplayFloat1(1, 8);
  }
  MeasureCurrent2();
  int_2 = (int)float_1;
  if ( (int_2 > 25) || (adc_int > 1000) ){
   LCDOverLoad(2, 8);
  }
  else{
   CalculateFloat1Float2Power();
   //show current
   if (i_p == 1){
    DisplayFloat1(2, 8);
   }
   //show power
   else{
    DisplayInt1ThreeDigit(2, 8);
   }
  }
  //если перебор по мощности
  if ( int_1 > 125 ){
   LCDOverLoad(1, 8);
   LCDOverLoad(2, 8);
  }
  //----------------------- can3 ------------------------------------
  MeasureVoltage3();
  int_1 = (int)float_1;
  float_2 = float_1;
  //overload
  if ( (int_1 > 21) || (adc_int > 1000) ){
   LCDOverLoad(1, 13);
  }
  else{
   DisplayFloat1(1, 13);
  }
  MeasureCurrent3();
  int_2 = (int)float_1;
  if ( (int_2 > 25) || (adc_int > 1000) ){
   LCDOverLoad(2, 13);
  }
  else{
   CalculateFloat1Float2Power();
   //show current
   if (i_p == 1){
    DisplayFloat1(2, 13);
   }
   //show power
   else{
    DisplayInt1ThreeDigit(2, 13);
   }
  }
  //если перебор по мощности
  if ( int_1 > 100 ){
   LCDOverLoad(1, 13);
   LCDOverLoad(2, 13);
  }
}
//******************************************************************************
void PlaySound_1000_50(){
 PORTB.B0 = 0;
 for (counter = 0; counter < 15; counter++){
  PORTB.B0 = 1;
  Delay_500us();
  PORTB.B0 = 0;
  Delay_500us();
 }
}
//******************************************************************************
void PlaySound_500_50(){
 PORTB.B0 = 0;
 for (counter = 0; counter < 10; counter++){
  PORTB.B0 = 1;
  Delay_1ms();
  PORTB.B0 = 0;
  Delay_1ms();
 }
}
//******************************************************************************
void LCDWriteFromROM( char row, char col, const char *text ){
 Lcd_Out( row, col, "" );
 while( *text )
 Lcd_Chr_CP( *text++ );
}
//******************************************************************************