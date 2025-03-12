#ifndef __global_h
#define __global_h
//-----------------------------------------------------------------------------
#define key_nothing  0
#define key_up       1
#define key_down     2
#define key_select   3
#define key_up_long      4
#define key_down_long    5
#define key_select_long  6
//
//******************************************************************************
//******************************************************************************
//-----------------------------------------------------------------------------
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




//-----------------------------------------------------------------------------
#endif