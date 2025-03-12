#include "built_in.h"
#include "global.h"
#include "keyboard.h"
#include "dynamics.h"
#include "atxtester.h"
//-----------------------------------------------------------------------------
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
//-----------------------------------------------------------------------------
void DoAnyPowerTester(){
 Lcd_Cmd(_LCD_CLEAR);
 PORTA.RA4 = 0;
 PORTC.RC0 = 0;
 PORTC.RC1 = 0;
 PORTC.RC2 = 0;
 i_p = 1;
 //
//-- меряем напряжение
next1:;
 Lcd_Cmd(_LCD_CLEAR);
 do{
  MeasureAndShowAllChanels();
  //
  PlaySound_500_50();
 //
  short_1 = GetKeyNormal();
  //key up short
  if (short_1 == key_up){
  }
  //key up long
  else if (short_1 == key_up_long){
   goto end_;
  }
  //key down short
  else if (short_1 == key_down){
   if (i_p == 0){
    i_p = 1;
   }
   else{
    i_p = 0;
   }
   LCDClearString2();
  }
  //key select long
  else if (short_1 == key_select_long){
//   DoDynamicsLoad();
   goto end_;
  }
  //key select
  else if (short_1 == key_select){

  }
 }while(1);













end_:;
 LCDWriteFromROM(1,1, s_SelectMode);
 LCDShowStringFromEEPROM(2, 8 + mode1); //
}
//-----------------------------------------------------------------------------