extern short mode1;
extern short short_1;
extern short dyn_mode_flag;
extern const code char s_SelectMode[];
const code char s_TesterName[];
const code char s_TesterVersion[];
//******************************************************************************
#include "built_in.h"
#include "global.h"
#include "keyboard.h"
#include "calibr.h"
#include "atxtester.h"
#include "anypowertester.h"
//******************************************************************************
void interrupt_vector() iv 0x0004 ics ICS_AUTO {
 //ставим флаг по переполнению T1
 if (PIR1.TMR1IF == 1){
  T1CON.TMR1ON = 0;
  PIR1.TMR1IF = 0;
  dyn_mode_flag.B7 = 1;
 }
}
//******************************************************************************
void main() {
 InitPic();
 //заставка
 LCDWriteFromROM(1,1, s_TesterName);
 LCDWriteFromROM(2,1, s_TesterVersion);
 //загрузка з ЕЕПРОма основних коэфіцієнтів
 LoadFromEEPROMBaseKoef();
 Delay_1sec();
 Delay_1sec();
 //меню що робити
 Lcd_Cmd(_LCD_CLEAR);               // Clear display
 mode1 = 0;
start_soft:;
 LCDWriteFromROM(1,1, s_SelectMode);
 LCDShowStringFromEEPROM(2, 8 + mode1); //
 do{
   short_1 = GetKeyNormal();
//   short_1 = key_select;
   //key up short
   if (short_1 == key_up){
    if (mode1 > 0){
     mode1 --;
     LCDShowStringFromEEPROM(2, 8 + mode1); //
    }
   }
   //key down short
   else if (short_1 == key_down){
    if (mode1 < 1){
     mode1 ++;
     LCDShowStringFromEEPROM(2, 8 + mode1); //
    }
   }
   //key select short
   else if (short_1 == key_select){
    switch(mode1){
     //atx power
     case 0:
      DoATXTester();
      goto start_soft;
     break;
     //any power
     case 1:
      DoAnyPowerTester();
      goto start_soft;
     break;
    }
   }
   else if (short_1 == key_select_long){
    DoCalibrationMenu();
    goto start_soft;
   }
 }while(1);
}