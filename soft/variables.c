//*************************** --> для всего проекта begin <-- *******************
//*******************************************************************************
//in ROM
const code char s_5V[] = " 5V";
const code char s_12V[] = "12V";
const code char s_19V[] = "19V";
const code char s_8A[] = " 8A";
const code char s_U[] = "U=";
const code char s_I[] = "I=";
const code char s_VSB[] = "VSB=";
const code char s_PG[] = "PG=";
const code char s_Vref[] = "Vref=";
const code char s_SelectMode[] = "  Select mode:  ";
const code char s_SelectCalibr[] = "Sel calibration:";
const code char s_NothingChanged[] = "Nothing changed.";
const code char s_EEPROMSaved[] = "EEPROM Saved !!!";
const code char s_OFF[] = "OFF";
const code char s_ON[] = "On ";
const code char s_TesterName[] = "  Power Tester  ";
const code char s_TesterVersion[] = "(c)KWWSoft  v2.3";
//*******************************************************************************
char txt_4[4] absolute 0x00A0;      //IRP not work !!!!!!!!
char txt_19[19] absolute 0x00A0;

char txt_6[6] absolute 0x00A4;
char txt_15[15] absolute 0x00A4;

char txt_9[9] absolute 0x00AA;
//
short short_1 absolute 0x00CD;
//1 - on, 0 - off
short on_off absolute 0x00e7;
//1 - I, 0 - P
short i_p absolute 0x00c6;
short counter absolute 0x00BE;
unsigned int power_all absolute 0x00BF;
unsigned int int_1 absolute 0x00CE;
unsigned int int_2 absolute 0x00D9;
float float_1 absolute 0x00e8;
float float_2 absolute 0x00c2;
//коэфіцієнты напруги та струму - оригінал знаходиться в ЄЄПРОМ та калібрується
float k_adc absolute    0x00ec;   //EEPROM  0x00 0x01 0x02 0x03   Vref
float k_5vsb absolute   0x00DF;   //EEPROM  0x04 0x05 0x06 0x07   5VSB
float k_pg absolute     0x00DB;   //EEPROM  0x08 0x09 0x0a 0x0b   PG
float k_can absolute    0x00E3;
                                  //EEPROM  0x0C 0x0d 0x0e 0x0f   1 - 6V
                                  //EEPROM  0x10 0x11 0x12 0x13   1 - 15V
                                  //EEPROM  0x14 0x15 0x16 0x17   1 - 33V
                                  //EEPROM  0x30 0x31 0x32 0x33   1 - current

                                  //EEPROM  0x18 0x19 0x1a 0x1b   2 - 6V
                                  //EEPROM  0x1C 0x1d 0x1e 0x1f   2 - 15V
                                  //EEPROM  0x20 0x21 0x22 0x23   2 - 33V
                                  //EEPROM  0x34 0x35 0x36 0x37   2 - current

                                  //EEPROM  0x24 0x25 0x26 0x27   3 - 6V
                                  //EEPROM  0x28 0x29 0x2a 0x2b   3 - 15V
                                  //EEPROM  0x2C 0x2d 0x2e 0x2f   3 - 33V
                                  //EEPROM  0x38 0x39 0x3a 0x3b   3 - current
//*************************** --> для всего проекта begin <-- *******************
//------------------------------------------------------------------------------
//
/*
 кварц на 4 МГц - команда идет за 1000 нс (1 мкс)
*/
//выбранный режим работы в главном меню
short mode1 absolute 0x00D0;
//выбранный режим работы в меню калибровки
short mode2 absolute 0x00C1;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//*************************** --> keyboard.c begin <-- ***************************
unsigned long int key_press absolute 0x00D5;
//*************************** --> keyboard.c end <-- *****************************
//------------------------------------------------------------------------------
//*************************** --> atxtester.c begin <-- ***************************
unsigned int adc_in absolute 0x00D1;
unsigned int adc_int absolute 0x00D3; //считанное значение ацп в 0...1023
float adc_float absolute 0x00C7;         //считанное значание ацп в вольтах
//*************************** --> atxtester.c end <-- *****************************
//------------------------------------------------------------------------------
//*************************** --> dynamics.c begin <-- ***************************
short dyn_mode absolute 0x00CB;
short dyn_mode_flag absolute 0x00CC;
/*  7   6   5   4   3   2   1   0
    0   0   0   0   0   0   0   0
    1 - есть прерывание от таймера
        1 - изменился режим работы нагрузки
            0 - первый полупериод, 1 - второй полупериод первый канал
                0 - первый полупериод, 1 - второй полупериод второй канал
                    0 - первый полупериод, 1 - второй полупериод третий канал
                        1 - показывать напряжение/ток или 0 - ничего
                            1 - показывать напряжение, 0 - показывать ток
                                1 - нужен вызов LCDClearString2()
*/
//*************************** --> dynamics.c end <-- *****************************
//------------------------------------------------------------------------------