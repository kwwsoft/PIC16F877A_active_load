#line 1 "D:/pic_mocrochip/ActiveLoad/soft/anypowertester.c"
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
#line 1 "d:/pic_mocrochip/activeload/soft/dynamics.h"
void DoDynamicsLoad();
#line 1 "d:/pic_mocrochip/activeload/soft/atxtester.h"



void DoATXTester();
void ATXMeasureAndShowAllChanels();
#line 7 "D:/pic_mocrochip/ActiveLoad/soft/anypowertester.c"
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

void DoAnyPowerTester(){
 Lcd_Cmd(_LCD_CLEAR);
 PORTA.RA4 = 0;
 PORTC.RC0 = 0;
 PORTC.RC1 = 0;
 PORTC.RC2 = 0;
 i_p = 1;


next1:;
 Lcd_Cmd(_LCD_CLEAR);
 do{
 MeasureAndShowAllChanels();

 PlaySound_500_50();

 short_1 = GetKeyNormal();

 if (short_1 ==  1 ){
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
 LCDClearString2();
 }

 else if (short_1 ==  6 ){

 goto end_;
 }

 else if (short_1 ==  3 ){

 }
 }while(1);
#line 92 "D:/pic_mocrochip/ActiveLoad/soft/anypowertester.c"
end_:;
 LCDWriteFromROM(1,1, s_SelectMode);
 LCDShowStringFromEEPROM(2, 8 + mode1);
}
