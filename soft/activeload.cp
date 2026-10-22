#line 1 "D:/pic_mocrochip/ActiveLoad/soft/activeload.c"
extern short mode1;
extern short short_1;
extern short dyn_mode_flag;
extern const code char s_SelectMode[];
const code char s_TesterName[];
const code char s_TesterVersion[];
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
#line 1 "d:/pic_mocrochip/activeload/soft/calibrate/calibr.h"
void DoCalibrationADCVref();
void DoCalibration5VSBandPG();
void DoCalibrationCanal(short can);
void DoCalibrationMenu();
#line 1 "d:/pic_mocrochip/activeload/soft/atxtester.h"



void DoATXTester();
void ATXMeasureAndShowAllChanels();
#line 1 "d:/pic_mocrochip/activeload/soft/anypowertester.h"




void DoAnyPowerTester();
#line 15 "D:/pic_mocrochip/ActiveLoad/soft/activeload.c"
void interrupt_vector() iv 0x0004 ics ICS_AUTO {

 if (PIR1.TMR1IF == 1){
 T1CON.TMR1ON = 0;
 PIR1.TMR1IF = 0;
 dyn_mode_flag.B7 = 1;
 }
}

void main() {
 InitPic();

 LCDWriteFromROM(1,1, s_TesterName);
 LCDWriteFromROM(2,1, s_TesterVersion);

 LoadFromEEPROMBaseKoef();
 Delay_1sec();
 Delay_1sec();

 Lcd_Cmd(_LCD_CLEAR);
 mode1 = 0;
start_soft:;
 LCDWriteFromROM(1,1, s_SelectMode);
 LCDShowStringFromEEPROM(2, 8 + mode1);
 do{
 short_1 = GetKeyNormal();


 if (short_1 ==  1 ){
 if (mode1 > 0){
 mode1 --;
 LCDShowStringFromEEPROM(2, 8 + mode1);
 }
 }

 else if (short_1 ==  2 ){
 if (mode1 < 1){
 mode1 ++;
 LCDShowStringFromEEPROM(2, 8 + mode1);
 }
 }

 else if (short_1 ==  3 ){
 switch(mode1){

 case 0:
 DoATXTester();
 goto start_soft;
 break;

 case 1:
 DoAnyPowerTester();
 goto start_soft;
 break;
 }
 }
 else if (short_1 ==  6 ){
 DoCalibrationMenu();
 goto start_soft;
 }
 }while(1);
}
