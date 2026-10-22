#line 1 "D:/pic_mocrochip/ActiveLoad/soft/global.c"
#line 1 "d:/program files/mikroc pro for pic/include/stdlib.h"







 typedef struct divstruct {
 int quot;
 int rem;
 } div_t;

 typedef struct ldivstruct {
 long quot;
 long rem;
 } ldiv_t;

 typedef struct uldivstruct {
 unsigned long quot;
 unsigned long rem;
 } uldiv_t;

int abs(int a);
float atof(char * s);
int atoi(char * s);
long atol(char * s);
div_t div(int number, int denom);
ldiv_t ldiv(long number, long denom);
uldiv_t uldiv(unsigned long number, unsigned long denom);
long labs(long x);
int max(int a, int b);
int min(int a, int b);
void srand(unsigned x);
int rand();
int xtoi(char * s);
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
#line 6 "D:/pic_mocrochip/ActiveLoad/soft/global.c"
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

void CalculateFloat1Float2Power(){
 float_2 *= float_1;
 int_1 = (int)float_2;
}

void CalculateFloat1ADC(){
 float_1 = adc_float / k_can;
}

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

void MeasureCurrent1(){
 LoadFromEEPROMKoef((char*)&k_can, 0x30);
 GetADCValue(0);
 CalculateFloat1ADC();
}

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

void MeasureCurrent2(){
 LoadFromEEPROMKoef((char*)&k_can, 0x34);
 GetADCValue(3);
 CalculateFloat1ADC();
}

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

void MeasureCurrent3(){
 LoadFromEEPROMKoef((char*)&k_can, 0x38);
 GetADCValue(5);
 CalculateFloat1ADC();
}

void DisplayInt1ThreeDigit(short row, short col){
 WordToStr(int_1, txt_6);
 txt_6[0] = txt_6[2];
 txt_6[1] = txt_6[3];
 txt_6[2] = txt_6[4];
 txt_6[3] = 0;
 Lcd_Out(row, col, txt_6);
}

void DisplayFloat1(short row, short col){

 Lcd_Chr(row, col, ' ');
 for (counter = 0; counter < 4; counter++){
 Lcd_Chr_CP(' ');
 }
 FloatToStr(float_1, txt_6);

 if (float_1 < 0.01){
 txt_6[0] = '0';
 txt_6[1] = '.';
 txt_6[2] = '0';
 txt_6[3] = '0';
 }

 else if (float_1 < 0.1){
  ((char *)&adc_in)[0]  = txt_6[0];
 txt_6[0] = '0';
 txt_6[1] = '.';
 txt_6[2] = '0';
 txt_6[3] =  ((char *)&adc_in)[0] ;
 }

 else if (float_1 < 1.0){
  ((char *)&adc_in)[1]  = txt_6[0];
  ((char *)&adc_in)[0]  = txt_6[2];
 txt_6[0] = '0';
 txt_6[1] = '.';
 txt_6[2] =  ((char *)&adc_in)[1] ;
 txt_6[3] =  ((char *)&adc_in)[0] ;
 }

 else{
 }
 txt_6[4] = 0;
 Lcd_Out(row, col, txt_6);
}

void SaveToEEPROMKoef(char *p1, short b1){

 for (short_1 = 0; short_1 < 4; short_1++){
 EEPROM_Write(b1 ++, *p1);
 Delay_10ms();
 Delay_10ms();
 p1++;
 }
}

void LoadFromEEPROMKoef(char *p1, short b1){

 for (short_1 = 0; short_1 < 4; short_1++){
 *p1 = EEPROM_Read(b1 ++);
 Delay_10ms();
 p1++;
 }
}

void LoadFromEEPROMBaseKoef(){
 LoadFromEEPROMKoef((char*)&k_adc, 0x00);
 LoadFromEEPROMKoef((char*)&k_5vsb, 0x04);
 LoadFromEEPROMKoef((char*)&k_pg, 0x08);
}

void GetADCValue(short canal){

 ADCON0.CHS2 = 0; ADCON0.CHS1 = 0; ADCON0.CHS0 = 0;
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
 ADCON0.CHS1 = 1; ADCON0.CHS0 = 1;
 break;
 case 4:
 ADCON0.CHS2 = 1;
 break;
 case 5:
 ADCON0.CHS2 = 1; ADCON0.CHS0 = 1;
 break;
 case 6:
 ADCON0.CHS2 = 1; ADCON0.CHS1 = 1;
 break;
 case 7:
 ADCON0.CHS2 = 1; ADCON0.CHS1 = 1; ADCON0.CHS0 = 1;
 break;
 }
 adc_int = 0;
 short_1 = 32;
 do{
 Delay_22us();
 ADCON0.GO = 1;
 do{
 }while(ADCON0.GO == 1);

  ((char *)&adc_in)[0]  = ADRESL;
  ((char *)&adc_in)[1]  = ADRESH;
 adc_int += adc_in;
 }while( --short_1 > 0);


 adc_int /= 32;

 adc_float = adc_int * k_adc;
}

void LCDShowStringFromEEPROM(char lcd_row, char num){

 num *= 16;
 for (short_1 = 0; short_1 < 16; short_1++){
 txt_19[short_1] = EEPROM_Read(num + short_1);
 }
 txt_19[16] = 0;
 Lcd_Out(lcd_row, 1, txt_19);
}

void InitPic(){
 INTCON = 0;
#line 276 "D:/pic_mocrochip/ActiveLoad/soft/global.c"
 OPTION_REG = 0b00001000;
#line 287 "D:/pic_mocrochip/ActiveLoad/soft/global.c"
 PIE1 = 0;
#line 297 "D:/pic_mocrochip/ActiveLoad/soft/global.c"
 PIE2 = 0;
 TRISA = 0b11101111;

 PORTA.F4 = 1;
 TRISB = 0b11111110;
 TRISC = 0b00000000;
 TRISD = 0b00000000;
 TRISE = 0b11101111;

 T1CON.TMR1ON = 0;
 T2CON.TMR2ON = 0;
 ADCON0.ADON = 0;
 CVRCON = 0;




 ADCON0 = 0b01000000;





 ADCON1 = 0b10000000;
 ADCON0.ADON = 1;

 PORTC = 0b00000000;
 PORTD = 0b00000000;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Delay_10ms();

}

void LCDClearString2(){
 Lcd_Chr(2, 1, ' ');
 for (counter = 0; counter < 15; counter++){
 Lcd_Chr_CP(' ');
 }
 dyn_mode_flag.B0 = 0;
}

void LCDOverLoad(short row, short col){
 Lcd_Chr(row, col, 'O'); Lcd_Chr_CP('V'); Lcd_Chr_CP('E'); Lcd_Chr_CP('R');
}

void LCDOverLoad_UIP(short row, short col, char ch){
 Lcd_Chr(row, col, '-'); Lcd_Chr_CP('-'); Lcd_Chr_CP(ch); Lcd_Chr_CP('-');
}

void MeasureAndShowAllChanels(){

 if (i_p == 1){
 Lcd_Chr(2, 6, 'I');
 }
 else{
 Lcd_Chr(2, 6, 'P');
 }

 MeasureVoltage1();
 int_1 = (int)float_1;
 float_2 = float_1;

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

 if (i_p == 1){
 DisplayFloat1(2, 1);
 }

 else{
 DisplayInt1ThreeDigit(2, 1);
 }
 }

 if ( int_1 > 290 ){
 LCDOverLoad(1,1);
 LCDOverLoad(2,1);
 }

 MeasureVoltage2();
 int_1 = (int)float_1;
 float_2 = float_1;

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

 if (i_p == 1){
 DisplayFloat1(2, 8);
 }

 else{
 DisplayInt1ThreeDigit(2, 8);
 }
 }

 if ( int_1 > 125 ){
 LCDOverLoad(1, 8);
 LCDOverLoad(2, 8);
 }

 MeasureVoltage3();
 int_1 = (int)float_1;
 float_2 = float_1;

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

 if (i_p == 1){
 DisplayFloat1(2, 13);
 }

 else{
 DisplayInt1ThreeDigit(2, 13);
 }
 }

 if ( int_1 > 100 ){
 LCDOverLoad(1, 13);
 LCDOverLoad(2, 13);
 }
}

void PlaySound_1000_50(){
 PORTB.B0 = 0;
 for (counter = 0; counter < 15; counter++){
 PORTB.B0 = 1;
 Delay_500us();
 PORTB.B0 = 0;
 Delay_500us();
 }
}

void PlaySound_500_50(){
 PORTB.B0 = 0;
 for (counter = 0; counter < 10; counter++){
 PORTB.B0 = 1;
 Delay_1ms();
 PORTB.B0 = 0;
 Delay_1ms();
 }
}

void LCDWriteFromROM( char row, char col, const char *text ){
 Lcd_Out( row, col, "" );
 while( *text )
 Lcd_Chr_CP( *text++ );
}
