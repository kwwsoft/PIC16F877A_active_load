#line 1 "D:/pic_mocrochip/ActiveLoad/soft/atxtester.c"

extern const code char s_SelectMode[];
extern const code char s_VSB[];
extern const code char s_PG[];
extern const code char s_OFF[];
extern const code char s_ON[];
extern short short_1;
extern short mode1;
extern short on_off;
extern short i_p;
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
#line 35 "D:/pic_mocrochip/ActiveLoad/soft/atxtester.c"
void Show5VSBandPG(){
 LCDWriteFromROM(1,1,s_VSB);
 GetADCValue(7);
 float_1 = adc_float / k_5vsb;
 DisplayFloat1(1, 5);
 LCDWriteFromROM(2,1,s_PG);
 GetADCValue(6);
 float_1 = adc_float / k_pg;
 DisplayFloat1(2, 4);
}

void ATXMeasureAndShowAllChanels(){

 if (dyn_mode_flag.B0 == 1){
 LCDClearString2();
 }

 if (i_p == 1){
 Lcd_Chr(2, 6, 'I');
 }
 power_all = 0;

 MeasureVoltage1();
 int_1 = (int)float_1;
 float_2 = float_1;

 if ( (int_1 > 30) || (adc_int > 1000) ){
 LCDOverLoad_UIP(1,1, 'U');
 }
 else{
 DisplayFloat1(1, 1);
 }

 MeasureCurrent1();
 int_2 = (int)float_1;
 if ( (int_2 > 25) || (adc_int > 1000) ){
 LCDOverLoad_UIP(1,1,'I');
 }
 CalculateFloat1Float2Power();
 power_all += int_1;

 if (i_p == 1){
 DisplayFloat1(2, 1);
 }

 else{
 DisplayInt1ThreeDigit(2, 1);
 }

 if ( int_1 > 290 ){
 LCDOverLoad_UIP(1,1,'P');
 }

 MeasureVoltage2();
 int_1 = (int)float_1;
 float_2 = float_1;

 if ( (int_1 > 21) || (adc_int > 1000) ){
 LCDOverLoad_UIP(1,8, 'U');
 }
 else{
 DisplayFloat1(1, 8);
 }

 MeasureCurrent2();
 int_2 = (int)float_1;
 if ( (int_2 > 25) || (adc_int > 1000) ){
 LCDOverLoad_UIP(1,8,'I');
 }
 CalculateFloat1Float2Power();
 power_all += int_1;

 if (i_p == 1){
 DisplayFloat1(2, 8);
 }

 else{
 DisplayInt1ThreeDigit(2, 5);
 }

 if ( int_1 > 125 ){
 LCDOverLoad_UIP(1,8,'P');
 }

 MeasureVoltage3();
 int_1 = (int)float_1;
 float_2 = float_1;

 if ( (int_1 > 21) || (adc_int > 1000) ){
 LCDOverLoad_UIP(1,13,'U');
 }
 else{
 DisplayFloat1(1, 13);
 }

 MeasureCurrent3();
 int_2 = (int)float_1;
 if ( (int_2 > 25) || (adc_int > 1000) ){
 LCDOverLoad_UIP(1,13,'I');
 }
 CalculateFloat1Float2Power();
 power_all += int_1;

 if (i_p == 1){
 DisplayFloat1(2, 13);
 }

 else{
 DisplayInt1ThreeDigit(2, 9);
 }

 if ( int_1 > 100 ){
 LCDOverLoad_UIP(1,13,'P');
 }

 if (i_p == 0){
 int_1 = power_all;
 DisplayInt1ThreeDigit(2, 14);
 }
}

void DoATXTester(){
 Lcd_Cmd(_LCD_CLEAR);
 on_off = 0;
 i_p = 1;
 PORTA.B4 = 1;
 PORTC.RC0 = 0;
 PORTC.RC1 = 0;
 PORTC.RC2 = 0;

start_:;
 do{
 Show5VSBandPG();
 if (on_off == 1){
 LCDWriteFromROM(2,14,s_ON);
 }
 else{
 LCDWriteFromROM(2,14,s_OFF);
 }
 Delay_100ms();

 short_1 = GetKeyNormal();

start_1:;

 if (short_1 ==  1 ){
 }

 if (short_1 ==  4 ){
 goto end_;
 }

 else if (short_1 ==  2 ){
 goto next1;
 }

 else if (short_1 ==  3 ){
 if (on_off == 0){
 on_off = 1;
 PORTA.B4 = 0;
 }
 else{
 on_off = 0;
 PORTA.B4 = 1;
 }
 }

 else if (short_1 ==  6 ){
 }
 }while(1);

next1:;
 Lcd_Cmd(_LCD_CLEAR);
 do{
 ATXMeasureAndShowAllChanels();


 if (on_off == 1){
 Lcd_Chr(1, 6, '^');
 }

 else{
 Lcd_Chr(1, 6, '_');
 }

 PlaySound_500_50();
 Delay_10ms();

 short_1 = GetKeyNormal();


 if (short_1 ==  1 ){
 Lcd_Cmd(_LCD_CLEAR);
 goto start_;
 }

 else if (short_1 ==  4 ){
 goto end_;
 }

 else if (short_1 ==  2 ){
 if (i_p == 0){
 i_p = 1;
 }
 else{
 i_p = 0;
 }
 dyn_mode_flag.B0 = 1;
 }

 else if (short_1 ==  5 ){
 }

 else if (short_1 ==  6 ){
 }

 else if (short_1 ==  3 ){
 if (on_off == 0){
 on_off = 1;
 PORTA.B4 = 0;
 }
 else{
 on_off = 0;
 PORTA.B4 = 1;
 }
 }
 }while(1);

end_:;
 LCDWriteFromROM(1,1, s_SelectMode);
 LCDShowStringFromEEPROM(2, 8 + mode1);
}
