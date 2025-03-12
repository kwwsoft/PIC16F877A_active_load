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
//-----------------------------------------------------------------------------
#include "built_in.h"
#include "global.h"
#include "keyboard.h"
//-----------------------------------------------------------------------------
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
//-----------------------------------------------------------------------------
void DoCalibrationCanal(short can){
 Lcd_Cmd(_LCD_CLEAR);               // Clear display
 LCDShowStringFromEEPROM(1, can + 10);
 LCDWriteFromROM(2, 1, s_5V);
 LCDWriteFromROM(2, 5, s_U);
 //*****  6v *******  */
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
  //
  GetVoltageFromADC(can);
  CalculateFloat1ADC();
  DisplayFloat1(2, 7);
  Delay_100ms();
  Delay_100ms();
  //
  short_1 = GetKeyNormal();
  //key down short
  if (short_1 == key_down){
   goto next_15;
  }
  else if (short_1 == key_up_long){
   LCDWriteFromROM(2,1, s_NothingChanged);
   goto end_;
  }
  //key select long
  else if (short_1 == key_select_long){
   k_can = adc_float / 5.00;
   //save coeff to eeprom
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
   //
   LCDWriteFromROM(2,1,s_EEPROMSaved);
   Delay_1sec();
   Delay_1sec();
   goto next_15;
  }
 }while(1);
 //*****  15v *******     */
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
  //
  GetVoltageFromADC(can);
  CalculateFloat1ADC();
  DisplayFloat1(2, 7);
  Delay_100ms();
  Delay_100ms();
  Delay_100ms();
  //
  short_1 = GetKeyNormal();
  //key down short
  if (short_1 == key_down){
   goto next_33;
  }
  else if (short_1 == key_up_long){
   LCDWriteFromROM(2,1, s_NothingChanged);
   goto end_;
  }
  //key select long
  else if (short_1 == key_select_long){
   k_can = adc_float / 12.00;
   //save coeff to eeprom
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
   //
   LCDWriteFromROM(2,1,s_EEPROMSaved);
   Delay_1sec();
   Delay_1sec();
   goto next_33;
  }
 }while(1);
 //*****  33v *******     */
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
  //
  GetVoltageFromADC(can);
  CalculateFloat1ADC();
  DisplayFloat1(2, 7);
  Delay_100ms();
  Delay_100ms();
  Delay_100ms();
  //
  short_1 = GetKeyNormal();
  //key down short
  if (short_1 == key_down){
   goto current;
  }
  else if (short_1 == key_up_long){
   LCDWriteFromROM(2,1, s_NothingChanged);
   goto end_;
  }
  //key select long
  else if (short_1 == key_select_long){
   k_can = adc_float / 19.00;
   //save coeff to eeprom
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
   //
   LCDWriteFromROM(2,1,s_EEPROMSaved);
   Delay_1sec();
   Delay_1sec();
   goto current;
  }
 }while(1);
current:;
//калибровка тока
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
  //
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
  //
  short_1 = GetKeyNormal();
  if (short_1 == key_up_long){
   LCDWriteFromROM(2,1, s_NothingChanged);
   goto end_;
  }
  else if (short_1 == key_down){
   LCDWriteFromROM(2,1, s_NothingChanged);
   goto end_;
  }
  //key select long
  else if (short_1 == key_select_long){
   k_can = adc_float / 8.00;
   //save coeff to eeprom
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
   //
   LCDWriteFromROM(2,1,s_EEPROMSaved);
  }
 }while(1);
end_:;
 Delay_1sec();
 Delay_1sec();
}
//-----------------------------------------------------------------------------
void DoCalibration5VSBandPG(){
 Lcd_Cmd(_LCD_CLEAR);               // Clear display
 LCDShowStringFromEEPROM(1, 10); //
 LCDWriteFromROM(2, 1, s_VSB);
 LCDWriteFromROM(2, 10, s_PG);
 do{
  //5VSB
  GetADCValue(7);
  float_1 = adc_float / k_5vsb;
  int_1 = adc_int;
  DisplayFloat1(2, 5);
  Delay_100ms();
  //
  //PG
  GetADCValue(6);
  float_1 = adc_float / k_pg;
  DisplayFloat1(2, 13);
  Delay_100ms();
  Delay_100ms();
  Delay_100ms();
 //
  short_1 = GetKeyNormal();
  //key up short
  if (short_1 == key_up_long){
   LCDWriteFromROM(2,1, s_NothingChanged);
   goto end_;
  }
  //key select long
  else if (short_1 == key_select_long){
   //
   k_5vsb = int_1 * k_adc / 5.00;
   //save coeff to eeprom
   SaveToEEPROMKoef((char*)&k_5vsb, 0x04);
   //
   k_pg = adc_float / 5.00;
   //save coeff to eeprom
   SaveToEEPROMKoef((char*)&k_pg, 0x08);
   //
   LCDWriteFromROM(2,1,s_EEPROMSaved);
   goto end_;
  }
 }while(1);
end_:;
 Delay_1sec();
 Delay_1sec();
}
//-----------------------------------------------------------------------------
void DoCalibrationADCVref(){
 Lcd_Cmd(_LCD_CLEAR);               // Clear display
 LCDShowStringFromEEPROM(1, 14); //
 LCDWriteFromROM(2, 1, s_Vref);
 do{
  //
  GetADCValue(6);
  float_1 = adc_float;
  DisplayFloat1(2, 6);
  Delay_100ms();
  Delay_100ms();
  Delay_100ms();
  //
  short_1 = GetKeyNormal();
  //key up short
  if (short_1 == key_up_long){
   LCDWriteFromROM(2,1, s_NothingChanged);
   goto end_;
  }
  //key select long
  else if (short_1 == key_select_long){
   k_adc = 4.0 / adc_int;
   //save coeff to eeprom
   SaveToEEPROMKoef((char*)&k_adc, 0x00);
   //
   LCDWriteFromROM(2,1,s_EEPROMSaved);
   goto end_;
  }
 }while(1);
end_:;
 Delay_1sec();
 Delay_1sec();
}
//-----------------------------------------------------------------------------
void DoCalibrationMenu(){
 Lcd_Cmd(_LCD_CLEAR);               // Clear display
// Display_SelectMode();
 mode2 = 0;
start_soft:;
 LCDWriteFromROM(1,1, s_SelectCalibr);
 LCDShowStringFromEEPROM(2, 10 + mode2); //
 do{
   short_1 = GetKeyNormal();
//   short_1 = key_select;
   //key up short
   if (short_1 == key_up){
    if (mode2 > 0){
     mode2 --;
     LCDShowStringFromEEPROM(2, 10 + mode2); //
    }
   }
   //key down short
   else if (short_1 == key_down){
    if (mode2 < 4){
     mode2 ++;
     LCDShowStringFromEEPROM(2, 10 + mode2); //
    }
   }
   //key select short
   else if (short_1 == key_select){
    switch(mode2){
     //calibrate 5VSB PG
     case 0:
      DoCalibration5VSBandPG();
      //загрузка с ЕЕПРОма для контроля
      LoadFromEEPROMBaseKoef();
      goto start_soft;
     //calibrate canal1
     case 1:
      DoCalibrationCanal(1);
      //загрузка с ЕЕПРОма для контроля
      LoadFromEEPROMBaseKoef();
      goto start_soft;
     break;
     //calibrate canal2
     case 2:
      DoCalibrationCanal(2);
      //загрузка с ЕЕПРОма для контроля
      LoadFromEEPROMBaseKoef();
      goto start_soft;
     //calibrate canal3
     case 3:
      DoCalibrationCanal(3);
      //загрузка с ЕЕПРОма для контроля
      LoadFromEEPROMBaseKoef();
      goto start_soft;
     break;
     //calibrate Vref
     case 4:
      DoCalibrationADCVref();
      //загрузка с ЕЕПРОма для контроля
      LoadFromEEPROMBaseKoef();
      goto start_soft;
     break;
    }
   }
   else if (short_1 == key_up_long){
    return;
   }
 }while(1);
}
//-----------------------------------------------------------------------------