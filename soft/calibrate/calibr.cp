#line 1 "D:/pic_mocrochip/ActiveLoad/soft/calibrate/calibr.c"
extern float k_adc;
extern float k_5vsb;
extern float k_pg;
extern float k_can;
extern float adc_float;
extern short short_1;
extern short mode1;
extern short mode2;
extern unsigned int adc_int;
extern unsigned int int_1;
extern float float_1;
extern char txt_6[6];
extern char txt_9[9];
extern const code char s_5V[];
extern const code char s_12V[];
extern const code char s_19V[];
extern const code char s_8A[];
extern const code char s_U[];
extern const code char s_I[];
extern const code char s_VSB[];
extern const code char s_PG[];
extern const code char s_Vref[];
extern const code char s_SelectMode[];
extern const code char s_EEPROMSaved[];
extern const code char s_SelectCalibr[];
extern const code char s_NothingChanged[];
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
#line 32 "D:/pic_mocrochip/ActiveLoad/soft/calibrate/calibr.c"
void GetVoltageFromADC(short can){
 switch(can){
 case 1:
 GetADCValue(1);
 break;
 case 2:
 GetADCValue(2);
 break;
 case 3:
 GetADCValue(4);
 break;
 }
}

void DoCalibrationCanal(short can){
 Lcd_Cmd(_LCD_CLEAR);
 LCDShowStringFromEEPROM(1, can + 10);
 LCDWriteFromROM(2, 1, s_5V);
 LCDWriteFromROM(2, 5, s_U);

 switch(can){
 case 1:
 PORTC.RC6 = 0;
 PORTC.RC7 = 0;
 LoadFromEEPROMKoef((char*)&k_can, 0x0c);
 break;
 case 2:
 PORTC.RC4 = 0;
 PORTC.RC5 = 0;
 LoadFromEEPROMKoef((char*)&k_can, 0x18);
 break;
 case 3:
 PORTD.RD2 = 0;
 PORTD.RD3 = 0;
 LoadFromEEPROMKoef((char*)&k_can, 0x24);
 break;
 }
 do{

 GetVoltageFromADC(can);
 CalculateFloat1ADC();
 DisplayFloat1(2, 7);
 Delay_100ms();
 Delay_100ms();

 short_1 = GetKeyNormal();

 if (short_1 ==  2 ){
 goto next_15;
 }
 else if (short_1 ==  4 ){
 LCDWriteFromROM(2,1, s_NothingChanged);
 goto end_;
 }

 else if (short_1 ==  6 ){
 k_can = adc_float / 5.00;

 switch(can){
 case 1:
 SaveToEEPROMKoef((char*)&k_can, 0x0c);
 break;
 case 2:
 SaveToEEPROMKoef((char*)&k_can, 0x18);
 break;
 case 3:
 SaveToEEPROMKoef((char*)&k_can, 0x24);
 break;
 }

 LCDWriteFromROM(2,1,s_EEPROMSaved);
 Delay_1sec();
 Delay_1sec();
 goto next_15;
 }
 }while(1);

next_15:;
 LCDClearString2();
 LCDWriteFromROM(2, 1, s_12V);
 LCDWriteFromROM(2, 5, s_U);
 switch(can){
 case 1:
 PORTC.RC6 = 0;
 PORTC.RC7 = 1;
 LoadFromEEPROMKoef((char*)&k_can, 0x10);
 break;
 case 2:
 PORTC.RC4 = 0;
 PORTC.RC5 = 1;
 LoadFromEEPROMKoef((char*)&k_can, 0x1C);
 break;
 case 3:
 PORTD.RD2 = 0;
 PORTD.RD3 = 1;
 LoadFromEEPROMKoef((char*)&k_can, 0x28);
 break;
 }
 do{

 GetVoltageFromADC(can);
 CalculateFloat1ADC();
 DisplayFloat1(2, 7);
 Delay_100ms();
 Delay_100ms();
 Delay_100ms();

 short_1 = GetKeyNormal();

 if (short_1 ==  2 ){
 goto next_33;
 }
 else if (short_1 ==  4 ){
 LCDWriteFromROM(2,1, s_NothingChanged);
 goto end_;
 }

 else if (short_1 ==  6 ){
 k_can = adc_float / 12.00;

 switch(can){
 case 1:
 SaveToEEPROMKoef((char*)&k_can, 0x10);
 break;
 case 2:
 SaveToEEPROMKoef((char*)&k_can, 0x1c);
 break;
 case 3:
 SaveToEEPROMKoef((char*)&k_can, 0x28);
 break;
 }

 LCDWriteFromROM(2,1,s_EEPROMSaved);
 Delay_1sec();
 Delay_1sec();
 goto next_33;
 }
 }while(1);

next_33:;
 LCDClearString2();
 LCDWriteFromROM(2, 1, s_19V);
 LCDWriteFromROM(2, 5, s_U);
 switch(can){
 case 1:
 PORTC.RC6 = 1;
 PORTC.RC7 = 0;
 LoadFromEEPROMKoef((char*)&k_can, 0x14);
 break;
 case 2:
 PORTC.RC4 = 1;
 PORTC.RC5 = 0;
 LoadFromEEPROMKoef((char*)&k_can, 0x20);
 break;
 case 3:
 PORTD.RD2 = 1;
 PORTD.RD3 = 0;
 LoadFromEEPROMKoef((char*)&k_can, 0x2c);
 break;
 }
 do{

 GetVoltageFromADC(can);
 CalculateFloat1ADC();
 DisplayFloat1(2, 7);
 Delay_100ms();
 Delay_100ms();
 Delay_100ms();

 short_1 = GetKeyNormal();

 if (short_1 ==  2 ){
 goto current;
 }
 else if (short_1 ==  4 ){
 LCDWriteFromROM(2,1, s_NothingChanged);
 goto end_;
 }

 else if (short_1 ==  6 ){
 k_can = adc_float / 19.00;

 switch(can){
 case 1:
 SaveToEEPROMKoef((char*)&k_can, 0x14);
 break;
 case 2:
 SaveToEEPROMKoef((char*)&k_can, 0x20);
 break;
 case 3:
 SaveToEEPROMKoef((char*)&k_can, 0x2c);
 break;
 }

 LCDWriteFromROM(2,1,s_EEPROMSaved);
 Delay_1sec();
 Delay_1sec();
 goto current;
 }
 }while(1);
current:;

 LCDClearString2();
 LCDWriteFromROM(2, 1, s_8A);
 LCDWriteFromROM(2, 5, s_I);
 switch(can){
 case 1:
 PORTC.RC6 = 1;
 PORTC.RC7 = 0;
 LoadFromEEPROMKoef((char*)&k_can, 0x30);
 break;
 case 2:
 PORTC.RC4 = 1;
 PORTC.RC5 = 0;
 LoadFromEEPROMKoef((char*)&k_can, 0x34);
 break;
 case 3:
 PORTD.RD2 = 1;
 PORTD.RD3 = 0;
 LoadFromEEPROMKoef((char*)&k_can, 0x38);
 break;
 }
 do{

 switch(can){
 case 1:
 GetADCValue(0);
 break;
 case 2:
 GetADCValue(3);
 break;
 case 3:
 GetADCValue(5);
 break;
 }
 CalculateFloat1ADC();
 DisplayFloat1(2, 7);
 Delay_100ms();
 Delay_100ms();
 Delay_100ms();

 short_1 = GetKeyNormal();
 if (short_1 ==  4 ){
 LCDWriteFromROM(2,1, s_NothingChanged);
 goto end_;
 }
 else if (short_1 ==  2 ){
 LCDWriteFromROM(2,1, s_NothingChanged);
 goto end_;
 }

 else if (short_1 ==  6 ){
 k_can = adc_float / 8.00;

 switch(can){
 case 1:
 SaveToEEPROMKoef((char*)&k_can, 0x30);
 break;
 case 2:
 SaveToEEPROMKoef((char*)&k_can, 0x34);
 break;
 case 3:
 SaveToEEPROMKoef((char*)&k_can, 0x38);
 break;
 }

 LCDWriteFromROM(2,1,s_EEPROMSaved);
 }
 }while(1);
end_:;
 Delay_1sec();
 Delay_1sec();
}

void DoCalibration5VSBandPG(){
 Lcd_Cmd(_LCD_CLEAR);
 LCDShowStringFromEEPROM(1, 10);
 LCDWriteFromROM(2, 1, s_VSB);
 LCDWriteFromROM(2, 10, s_PG);
 do{

 GetADCValue(7);
 float_1 = adc_float / k_5vsb;
 int_1 = adc_int;
 DisplayFloat1(2, 5);
 Delay_100ms();


 GetADCValue(6);
 float_1 = adc_float / k_pg;
 DisplayFloat1(2, 13);
 Delay_100ms();
 Delay_100ms();
 Delay_100ms();

 short_1 = GetKeyNormal();

 if (short_1 ==  4 ){
 LCDWriteFromROM(2,1, s_NothingChanged);
 goto end_;
 }

 else if (short_1 ==  6 ){

 k_5vsb = int_1 * k_adc / 5.00;

 SaveToEEPROMKoef((char*)&k_5vsb, 0x04);

 k_pg = adc_float / 5.00;

 SaveToEEPROMKoef((char*)&k_pg, 0x08);

 LCDWriteFromROM(2,1,s_EEPROMSaved);
 goto end_;
 }
 }while(1);
end_:;
 Delay_1sec();
 Delay_1sec();
}

void DoCalibrationADCVref(){
 Lcd_Cmd(_LCD_CLEAR);
 LCDShowStringFromEEPROM(1, 14);
 LCDWriteFromROM(2, 1, s_Vref);
 do{

 GetADCValue(6);
 float_1 = adc_float;
 DisplayFloat1(2, 6);
 Delay_100ms();
 Delay_100ms();
 Delay_100ms();

 short_1 = GetKeyNormal();

 if (short_1 ==  4 ){
 LCDWriteFromROM(2,1, s_NothingChanged);
 goto end_;
 }

 else if (short_1 ==  6 ){
 k_adc = 4.0 / adc_int;

 SaveToEEPROMKoef((char*)&k_adc, 0x00);

 LCDWriteFromROM(2,1,s_EEPROMSaved);
 goto end_;
 }
 }while(1);
end_:;
 Delay_1sec();
 Delay_1sec();
}

void DoCalibrationMenu(){
 Lcd_Cmd(_LCD_CLEAR);

 mode2 = 0;
start_soft:;
 LCDWriteFromROM(1,1, s_SelectCalibr);
 LCDShowStringFromEEPROM(2, 10 + mode2);
 do{
 short_1 = GetKeyNormal();


 if (short_1 ==  1 ){
 if (mode2 > 0){
 mode2 --;
 LCDShowStringFromEEPROM(2, 10 + mode2);
 }
 }

 else if (short_1 ==  2 ){
 if (mode2 < 4){
 mode2 ++;
 LCDShowStringFromEEPROM(2, 10 + mode2);
 }
 }

 else if (short_1 ==  3 ){
 switch(mode2){

 case 0:
 DoCalibration5VSBandPG();

 LoadFromEEPROMBaseKoef();
 goto start_soft;

 case 1:
 DoCalibrationCanal(1);

 LoadFromEEPROMBaseKoef();
 goto start_soft;
 break;

 case 2:
 DoCalibrationCanal(2);

 LoadFromEEPROMBaseKoef();
 goto start_soft;

 case 3:
 DoCalibrationCanal(3);

 LoadFromEEPROMBaseKoef();
 goto start_soft;
 break;

 case 4:
 DoCalibrationADCVref();

 LoadFromEEPROMBaseKoef();
 goto start_soft;
 break;
 }
 }
 else if (short_1 ==  4 ){
 return;
 }
 }while(1);
}
