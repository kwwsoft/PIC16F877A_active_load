extern short dyn_mode_flag;
extern short short_1;
//режим работы динамической нагрузки
extern short dyn_mode;
#define dyn_mode_max 4
//0xff timer overflow
extern short mode1;
extern short dyn_mode_flag;
extern unsigned int int_1;
extern const code char s_SelectMode[];
//-----------------------------------------------------------------------------
#include "built_in.h"
#include "global.h"
#include "keyboard.h"
//-----------------------------------------------------------------------------
void ChangeValueShowToLcd(){
//перебор по кругу ничего-напряжение-ток-    ничего....
 if (dyn_mode_flag.B2 == 0){
  dyn_mode_flag.B2 = 1;
  dyn_mode_flag.B1 = 1;
  Lcd_Chr(1, 12, 'U');
 }
 else{
  if (dyn_mode_flag.B1 == 1){
   dyn_mode_flag.B1 = 0;
   Lcd_Chr(1, 12, 'I');
  }
  else{
   dyn_mode_flag.B2 = 0;
   Lcd_Chr(1, 12, ' ');
  }
 }
}
//-----------------------------------------------------------------------------
void DoDynamicsLoad(){
 Lcd_Cmd(_LCD_CLEAR);               // Clear display
 LCDShowStringFromEEPROM(1, 6);    //
 PORTC &= 0b11111000;
 T1CON = 0b00110100;
 TMR1H = 0;
 TMR1L = 0;
 PIE1.TMR1IE = 1;
 INTCON.PEIE = 1;
 dyn_mode_flag = 0;
 //
 dyn_mode_flag.B6 = 1;
 //
 dyn_mode = 0;
do{
  //есть прерывание от таймера
  if (dyn_mode_flag.B7 == 1){
   dyn_mode_flag.B7 = 0;
   T1CON.TMR1ON = 0;
   switch(dyn_mode){
    //dyn 0
    case 0:
     if (dyn_mode_flag.B2 == 1){
      //напряжение
      if (dyn_mode_flag.B1 == 1){
       Lcd_Chr(1, 12, 'U');
       MeasureVoltage1();
       DisplayFloat1(2, 1);
       MeasureVoltage2();
       DisplayFloat1(2, 8);
       MeasureVoltage3();
       DisplayFloat1(2, 13);
      }
      //ток
      else{
       Lcd_Chr(1, 12, 'I');
       MeasureCurrent1();
       DisplayFloat1(2, 1);
       MeasureCurrent2();
       DisplayFloat1(2, 8);
       MeasureCurrent3();
       DisplayFloat1(2, 13);
      }
     }
     //очистим нижнюю строку
     else{
      Lcd_Chr(1, 12, ' ');
      LCDClearString2();
     }//измерим что-то end
     //65535 - 62500 = 3035 (0x0BDB) 500 ms
     TMR1L = 0xDB;
     TMR1H = 0x0B;
     INTCON.GIE = 1;
     PORTC |= 0b00001111;
     T1CON.TMR1ON = 1;
    break;
    
    //dyn 1
    case 1:  //первый тип нагрузки - тип1 -------------
     //был первый полупериод - отключим нагрузку
     if (dyn_mode_flag.B5 == 0){
      //измерим что-то в конце нагрузки
      if (dyn_mode_flag.B2 == 1){
       //напряжение
       if (dyn_mode_flag.B1 == 1){
        Lcd_Chr(1, 12, 'U');
        MeasureVoltage1();
        DisplayFloat1(2, 1);
        MeasureVoltage2();
        DisplayFloat1(2, 8);
        MeasureVoltage3();
        DisplayFloat1(2, 13);
       }
       //ток
       else{
        Lcd_Chr(1, 12, 'I');
        MeasureCurrent1();
        DisplayFloat1(2, 1);
        MeasureCurrent2();
        DisplayFloat1(2, 8);
        MeasureCurrent3();
        DisplayFloat1(2, 13);
       }
      }
      //очистим нижнюю строку
      else{
       Lcd_Chr(1, 12, ' ');
       LCDClearString2();
      }//измерим что-то в конце нагрузки end
      //отключим нагрузку
      PORTC &= 0b11110000;
      dyn_mode_flag.B5 = 1;
      //65535 - 62500 = 3035 (0x0BDB) 500 ms
      TMR1L = 0xDB;
      TMR1H = 0x0B;
     }
     //был второй полупериод - включим нагрузку
     else{
      PORTC |= 0b00001111;
      dyn_mode_flag.B5 = 0;
      //ничего не измеряли - задержек нет
      if (dyn_mode_flag.B2 == 0){
       //65535 - 62500 = 3035 (0x0BDB) 500 ms
       TMR1L = 0xDB;
       TMR1H = 0x0B;
      }
      //что-то меряли - корректируем задержку
      else{
       //65535 - 42020 = 23515 (0x5BDB) 336 ms + индикатор = 500 ms
       TMR1L = 0xDB;
       TMR1H = 0x5B;
      }
     }//был первый полупериод - отключим нагрузку end
     T1CON.TMR1ON = 1;
    break;   //первый тип нагрузкм - тип1 -------------   end

    //dyn 2
    case 2:  //второй тип нагрузкм - тип2 -------------
     //был первый полупериод - отключим нагрузку
     if (dyn_mode_flag.B5 == 0){
      //отключим нагрузку
      PORTC &= 0b11110000;
      dyn_mode_flag.B5 = 1;
      //65535 - 62500 = 3035 (0x0BDB) 500 ms
      TMR1L = 0xDB;
      TMR1H = 0x0B;
     }
     //был второй полупериод - включим нагрузку
     else{
      PORTC |= 0b0001111;
      dyn_mode_flag.B5 = 0;
      //65535 - 125 = 65410 (0xFF82) 1 ms
      TMR1L = 0x82;
      TMR1H = 0xFF;
     }//был первый полупериод - отключим нагрузку end
     T1CON.TMR1ON = 1;
    break;   //второй тип нагрузки - тип2 -------------   end


    //dyn 3
    case 3:  //третий тип нагрузки - тип3 -------------
     //был первый полупериод - отключим нагрузку
     if (dyn_mode_flag.B5 == 0){
      //измерим что-то в конце нагрузки
      if (dyn_mode_flag.B2 == 1){
       //напряжение
       if (dyn_mode_flag.B1 == 1){
        Lcd_Chr(1, 12, 'U');
        MeasureVoltage1();
        DisplayFloat1(2, 1);
        MeasureVoltage2();
        DisplayFloat1(2, 8);
        MeasureVoltage3();
        DisplayFloat1(2, 13);
       }
       //ток
       else{
        Lcd_Chr(1, 12, 'I');
        MeasureCurrent1();
        DisplayFloat1(2, 1);
        MeasureCurrent2();
        DisplayFloat1(2, 8);
        MeasureCurrent3();
        DisplayFloat1(2, 13);
       }
      }
      //очистим нижнюю строку
      else{
       Lcd_Chr(1, 12, ' ');
       LCDClearString2();
      }//измерим что-то в конце нагрузки end
      //отключим нагрузку
      PORTC &= 0b11110000;
      dyn_mode_flag.B5 = 1;
      //65535 - 125 = 65410 (0xFF82) 1 ms
      TMR1L = 0x82;
      TMR1H = 0xFF;
     }
     //был второй полупериод - включим нагрузку
     else{
      PORTC |= 0b00001111;
      dyn_mode_flag.B5 = 0;
      //ничего не измеряли - задержек нет
      if (dyn_mode_flag.B2 == 0){
       //65535 - 62500 = 3035 (0x0BDB) 500 ms
       TMR1L = 0xDB;
       TMR1H = 0x0B;
      }
      //что-то меряли - корректируем задержку
      else{
       //65535 - 42020 = 23515 (0x5BDB) 336 ms + индикатор = 500 ms
       TMR1L = 0xDB;
       TMR1H = 0x5B;
      }
     }//был первый полупериод - отключим нагрузку end
     T1CON.TMR1ON = 1;
    break;   //третий тип нагрузкм - тип3 -------------   end


    //dyn 4
    case 4:  //четвертый тип нагрузки - тип4 -------------
     //был первый полупериод - отключим нагрузку
     if (dyn_mode_flag.B5 == 0){
      //измерим что-то в конце нагрузки
      if (dyn_mode_flag.B2 == 1){
       //напряжение
       if (dyn_mode_flag.B1 == 1){
        Lcd_Chr(1, 12, 'U');
        MeasureVoltage1();
        DisplayFloat1(2, 1);
        MeasureVoltage2();
        DisplayFloat1(2, 8);
        MeasureVoltage3();
        DisplayFloat1(2, 13);
       }
       //ток
       else{
        Lcd_Chr(1, 12, 'I');
        MeasureCurrent1();
        DisplayFloat1(2, 1);
        MeasureCurrent2();
        DisplayFloat1(2, 8);
        MeasureCurrent3();
        DisplayFloat1(2, 13);
       }
      }
      //очистим нижнюю строку
      else{
       Lcd_Chr(1, 12, ' ');
       LCDClearString2();
      }//измерим что-то в конце нагрузки end
      //отключим нагрузку
      PORTC &= 0b11110000;
      dyn_mode_flag.B5 = 1;
      //65535 - 62500 = 3035 (0x0BDB) 500 ms
      TMR1L = 0xDB;
      TMR1H = 0x0B;
      T1CON.TMR1ON = 1;
     }
     //был второй полупериод - включим нагрузку поканально
     else{
      PORTC |= 0b00001001;
      dyn_mode_flag.B5 = 0;
      //ничего не измеряли - задержек нет
      if (dyn_mode_flag.B2 == 0){
       //65535 - 62500 = 3035 (0x0BDB) 500 ms
       TMR1L = 0xDB;
       TMR1H = 0x0B;
      }
      //что-то меряли - корректируем задержку
      else{
       //65535 - 42020 = 23515 (0x5BDB) 336 ms + индикатор = 500 ms
       TMR1L = 0xDB;
       TMR1H = 0x5B;
      }
      T1CON.TMR1ON = 1;
      Delay_100ms();
      PORTC |= 0b00001011;
      Delay_100ms();
      PORTC |= 0b00001111;
     }//был первый полупериод - отключим нагрузку end
    break;   //четвертый тип нагрузкм - тип4 -------------   end

    
    //хз
    default:
    break;
   }
  }//есть прерывание от таймера end

  //опрoс клавы
  short_1 = GetKeyNormal();
  //key up short на режим выше
  if (short_1 == key_up){
   if (dyn_mode > 0){
    dyn_mode --;
    dyn_mode_flag.B6 = 1;
   }
  }
  //key down short на режим ниже
  else if (short_1 == key_down){
   if (dyn_mode < dyn_mode_max){
    dyn_mode ++;
    dyn_mode_flag.B6 = 1;
   }
  }
  //key select long уход
  else if (short_1 == key_select_long){
   goto end_;
  }
  //key select смена индикации ток/напряжение
  else if (short_1 == key_select){
   //мерять можно только в этих режимах
   switch(dyn_mode){
    case 0:
    case 1:
    case 3:
    case 4:
      ChangeValueShowToLcd();
      if (dyn_mode_flag.B2 == 1){
       //напряжение
       if (dyn_mode_flag.B1 == 1){
        Lcd_Chr(1, 12, 'U');
        MeasureVoltage1();
        DisplayFloat1(2, 1);
        MeasureVoltage2();
        DisplayFloat1(2, 8);
        MeasureVoltage3();
        DisplayFloat1(2, 13);
       }
       //ток
       else{
        Lcd_Chr(1, 12, 'I');
        MeasureCurrent1();
        DisplayFloat1(2, 1);
        MeasureCurrent2();
        DisplayFloat1(2, 8);
        MeasureCurrent3();
        DisplayFloat1(2, 13);
       }
      }
      //очистим нижнюю строку
      else{
       Lcd_Chr(1, 12, ' ');
       LCDClearString2();
      }//измерим что-то в конце нагрузки end
    break;
    //тут мерять ниче нельзя
    default:
     dyn_mode_flag.B2 = 0;
    break;
   }//мерять можно только в этих режимах end
  }//key select смена индикации ток/напряжение end
  //изменился режим работы
  if (dyn_mode_flag.B6 == 1){
   INTCON.GIE = 0;
   T1CON.TMR1ON = 0;
   PORTC &= 0b11110000;
   dyn_mode_flag.B6 = 0;
   dyn_mode_flag.B5 = 0;
   PIR1.TMR1IF = 0;
   switch(dyn_mode){
    //отключить динамический режим - снять нагрузку
    case 0:
     Lcd_Chr(1, 10, '0');
     //65535 - 62500 = 3035 (0x0BDB) 500 ms
     TMR1L = 0xDB;
     TMR1H = 0x0B;
     INTCON.GIE = 1;
     PORTC |= 0b00001111;
     T1CON.TMR1ON = 1;
/*     dyn_mode_flag &= 0b00000011;
     if (dyn_mode_flag.B2 == 1){
      //напряжение
      if (dyn_mode_flag.B1 == 1){
       Lcd_Chr(1, 12, 'U');
       MeasureVoltage1();
       DisplayFloat1(2, 1);
       MeasureVoltage2();
       DisplayFloat1(2, 8);
       MeasureVoltage3();
       DisplayFloat1(2, 13);
      }
      //ток
      else{
       Lcd_Chr(1, 12, 'I');
       MeasureCurrent1();
       DisplayFloat1(2, 1);
       MeasureCurrent2();
       DisplayFloat1(2, 8);
       MeasureCurrent3();
       DisplayFloat1(2, 13);
      }
     }
     //очистим нижнюю строку
     else{
      Lcd_Chr(1, 12, ' ');
      LCDClearString2();
     }//измерим что-то end*/
    break;
    //regime 1
    case 1:
     Lcd_Chr(1, 10, '1');
     //65535 - 62500 = 3035 (0x0BDB) 500 ms
     TMR1L = 0xDB;
     TMR1H = 0x0B;
     INTCON.GIE = 1;
     PORTC |= 0b00001111;
     T1CON.TMR1ON = 1;
    break;
    //regime 2
    case 2:
     Lcd_Chr(1, 10, '2');
     //65535 - 125 = 65410 (0xFF82) 1 ms
     TMR1L = 0x82;
     TMR1H = 0xFF;
     PIR1.TMR1IF = 0;
     INTCON.GIE = 1;
     PORTC |= 0b00001111;
     Lcd_Chr(1, 12, ' ');
     LCDClearString2();
     T1CON.TMR1ON = 1;
    break;
    //regime 3
    case 3:
     INTCON.GIE = 0;
     T1CON.TMR1ON = 0;
     PORTC &= 0b11110000;
     Lcd_Chr(1, 10, '3');
     //65535 - 62500 = 3035 (0x0BDB) 500 ms
     TMR1L = 0xDB;
     TMR1H = 0x0B;
     INTCON.GIE = 1;
     PORTC |= 0b00001111;
     T1CON.TMR1ON = 1;
    break;
    //regime 4
    case 4:
     INTCON.GIE = 0;
     T1CON.TMR1ON = 0;
     PORTC &= 0b11110000;
     Lcd_Chr(1, 10, '4');
     //65535 - 62500 = 3035 (0x0BDB) 500 ms
     TMR1L = 0xDB;
     TMR1H = 0x0B;
     INTCON.GIE = 1;
     PORTC |= 0b00001111;
     T1CON.TMR1ON = 1;
    break;
    //
    default:
    break;
   }
  
  }//изменился режим работы end




 }while(1);

 
 


//выход из режима
end_:;
 LCDWriteFromROM(1,1, s_SelectMode);
 LCDShowStringFromEEPROM(2, 8 + mode1); //
}
//-----------------------------------------------------------------------------