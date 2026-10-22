#line 1 "D:/pic_mocrochip/ActiveLoad/soft/variables.c"



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

char txt_4[4] absolute 0x00A0;
char txt_19[19] absolute 0x00A0;

char txt_6[6] absolute 0x00A4;
char txt_15[15] absolute 0x00A4;

char txt_9[9] absolute 0x00AA;

short short_1 absolute 0x00CD;

short on_off absolute 0x00e7;

short i_p absolute 0x00c6;
short counter absolute 0x00BE;
unsigned int power_all absolute 0x00BF;
unsigned int int_1 absolute 0x00CE;
unsigned int int_2 absolute 0x00D9;
float float_1 absolute 0x00e8;
float float_2 absolute 0x00c2;

float k_adc absolute 0x00ec;
float k_5vsb absolute 0x00DF;
float k_pg absolute 0x00DB;
float k_can absolute 0x00E3;
#line 67 "D:/pic_mocrochip/ActiveLoad/soft/variables.c"
short mode1 absolute 0x00D0;

short mode2 absolute 0x00C1;



unsigned long int key_press absolute 0x00D5;



unsigned int adc_in absolute 0x00D1;
unsigned int adc_int absolute 0x00D3;
float adc_float absolute 0x00C7;



short dyn_mode absolute 0x00CB;
short dyn_mode_flag absolute 0x00CC;
