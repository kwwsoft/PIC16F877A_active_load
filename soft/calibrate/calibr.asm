
_GetVoltageFromADC:

;calibr.c,32 :: 		void GetVoltageFromADC(short can){
;calibr.c,33 :: 		switch(can){
	GOTO       L_GetVoltageFromADC0
;calibr.c,34 :: 		case 1:
L_GetVoltageFromADC2:
;calibr.c,35 :: 		GetADCValue(1);
	MOVLW      1
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;calibr.c,36 :: 		break;
	GOTO       L_GetVoltageFromADC1
;calibr.c,37 :: 		case 2:
L_GetVoltageFromADC3:
;calibr.c,38 :: 		GetADCValue(2);
	MOVLW      2
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;calibr.c,39 :: 		break;
	GOTO       L_GetVoltageFromADC1
;calibr.c,40 :: 		case 3:
L_GetVoltageFromADC4:
;calibr.c,41 :: 		GetADCValue(4);
	MOVLW      4
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;calibr.c,42 :: 		break;
	GOTO       L_GetVoltageFromADC1
;calibr.c,43 :: 		}
L_GetVoltageFromADC0:
	MOVF       FARG_GetVoltageFromADC_can+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_GetVoltageFromADC2
	MOVF       FARG_GetVoltageFromADC_can+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_GetVoltageFromADC3
	MOVF       FARG_GetVoltageFromADC_can+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_GetVoltageFromADC4
L_GetVoltageFromADC1:
;calibr.c,44 :: 		}
L_end_GetVoltageFromADC:
	RETURN
; end of _GetVoltageFromADC

_DoCalibrationCanal:

;calibr.c,46 :: 		void DoCalibrationCanal(short can){
;calibr.c,47 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;calibr.c,48 :: 		LCDShowStringFromEEPROM(1, can + 10);
	MOVLW      1
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVLW      10
	ADDWF      FARG_DoCalibrationCanal_can+0, 0
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;calibr.c,49 :: 		LCDWriteFromROM(2, 1, s_5V);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_5V+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_5V+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,50 :: 		LCDWriteFromROM(2, 5, s_U);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      5
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_U+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_U+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,52 :: 		switch(can){
	GOTO       L_DoCalibrationCanal5
;calibr.c,53 :: 		case 1:
L_DoCalibrationCanal7:
;calibr.c,54 :: 		PORTC.RC6 = 0;
	BCF        PORTC+0, 6
;calibr.c,55 :: 		PORTC.RC7 = 0;
	BCF        PORTC+0, 7
;calibr.c,56 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x0c);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      12
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;calibr.c,57 :: 		break;
	GOTO       L_DoCalibrationCanal6
;calibr.c,58 :: 		case 2:
L_DoCalibrationCanal8:
;calibr.c,59 :: 		PORTC.RC4 = 0;
	BCF        PORTC+0, 4
;calibr.c,60 :: 		PORTC.RC5 = 0;
	BCF        PORTC+0, 5
;calibr.c,61 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x18);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      24
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;calibr.c,62 :: 		break;
	GOTO       L_DoCalibrationCanal6
;calibr.c,63 :: 		case 3:
L_DoCalibrationCanal9:
;calibr.c,64 :: 		PORTD.RD2 = 0;
	BCF        PORTD+0, 2
;calibr.c,65 :: 		PORTD.RD3 = 0;
	BCF        PORTD+0, 3
;calibr.c,66 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x24);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      36
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;calibr.c,67 :: 		break;
	GOTO       L_DoCalibrationCanal6
;calibr.c,68 :: 		}
L_DoCalibrationCanal5:
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal7
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal8
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal9
L_DoCalibrationCanal6:
;calibr.c,69 :: 		do{
L_DoCalibrationCanal10:
;calibr.c,71 :: 		GetVoltageFromADC(can);
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	MOVWF      FARG_GetVoltageFromADC_can+0
	CALL       _GetVoltageFromADC+0
;calibr.c,72 :: 		CalculateFloat1ADC();
	CALL       _CalculateFloat1ADC+0
;calibr.c,73 :: 		DisplayFloat1(2, 7);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      7
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;calibr.c,74 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,75 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,77 :: 		short_1 = GetKeyNormal();
	CALL       _GetKeyNormal+0
	MOVF       R0+0, 0
	MOVWF      _short_1+0
;calibr.c,79 :: 		if (short_1 == key_down){
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationCanal13
;calibr.c,80 :: 		goto next_15;
	GOTO       ___DoCalibrationCanal_next_15
;calibr.c,81 :: 		}
L_DoCalibrationCanal13:
;calibr.c,82 :: 		else if (short_1 == key_up_long){
	MOVF       _short_1+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationCanal15
;calibr.c,83 :: 		LCDWriteFromROM(2,1, s_NothingChanged);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_NothingChanged+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_NothingChanged+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,84 :: 		goto end_;
	GOTO       ___DoCalibrationCanal_end_
;calibr.c,85 :: 		}
L_DoCalibrationCanal15:
;calibr.c,87 :: 		else if (short_1 == key_select_long){
	MOVF       _short_1+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationCanal17
;calibr.c,88 :: 		k_can = adc_float / 5.00;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	MOVF       _adc_float+0, 0
	MOVWF      R0+0
	MOVF       _adc_float+1, 0
	MOVWF      R0+1
	MOVF       _adc_float+2, 0
	MOVWF      R0+2
	MOVF       _adc_float+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _k_can+0
	MOVF       R0+1, 0
	MOVWF      _k_can+1
	MOVF       R0+2, 0
	MOVWF      _k_can+2
	MOVF       R0+3, 0
	MOVWF      _k_can+3
;calibr.c,90 :: 		switch(can){
	GOTO       L_DoCalibrationCanal18
;calibr.c,91 :: 		case 1:
L_DoCalibrationCanal20:
;calibr.c,92 :: 		SaveToEEPROMKoef((char*)&k_can, 0x0c);
	MOVLW      _k_can+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      12
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,93 :: 		break;
	GOTO       L_DoCalibrationCanal19
;calibr.c,94 :: 		case 2:
L_DoCalibrationCanal21:
;calibr.c,95 :: 		SaveToEEPROMKoef((char*)&k_can, 0x18);
	MOVLW      _k_can+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      24
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,96 :: 		break;
	GOTO       L_DoCalibrationCanal19
;calibr.c,97 :: 		case 3:
L_DoCalibrationCanal22:
;calibr.c,98 :: 		SaveToEEPROMKoef((char*)&k_can, 0x24);
	MOVLW      _k_can+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      36
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,99 :: 		break;
	GOTO       L_DoCalibrationCanal19
;calibr.c,100 :: 		}
L_DoCalibrationCanal18:
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal20
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal21
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal22
L_DoCalibrationCanal19:
;calibr.c,102 :: 		LCDWriteFromROM(2,1,s_EEPROMSaved);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_EEPROMSaved+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_EEPROMSaved+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,103 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;calibr.c,104 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;calibr.c,105 :: 		goto next_15;
	GOTO       ___DoCalibrationCanal_next_15
;calibr.c,106 :: 		}
L_DoCalibrationCanal17:
;calibr.c,107 :: 		}while(1);
	GOTO       L_DoCalibrationCanal10
;calibr.c,109 :: 		next_15:;
___DoCalibrationCanal_next_15:
;calibr.c,110 :: 		LCDClearString2();
	CALL       _LCDClearString2+0
;calibr.c,111 :: 		LCDWriteFromROM(2, 1, s_12V);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_12V+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_12V+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,112 :: 		LCDWriteFromROM(2, 5, s_U);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      5
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_U+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_U+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,113 :: 		switch(can){
	GOTO       L_DoCalibrationCanal23
;calibr.c,114 :: 		case 1:
L_DoCalibrationCanal25:
;calibr.c,115 :: 		PORTC.RC6 = 0;
	BCF        PORTC+0, 6
;calibr.c,116 :: 		PORTC.RC7 = 1;
	BSF        PORTC+0, 7
;calibr.c,117 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x10);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      16
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;calibr.c,118 :: 		break;
	GOTO       L_DoCalibrationCanal24
;calibr.c,119 :: 		case 2:
L_DoCalibrationCanal26:
;calibr.c,120 :: 		PORTC.RC4 = 0;
	BCF        PORTC+0, 4
;calibr.c,121 :: 		PORTC.RC5 = 1;
	BSF        PORTC+0, 5
;calibr.c,122 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x1C);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      28
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;calibr.c,123 :: 		break;
	GOTO       L_DoCalibrationCanal24
;calibr.c,124 :: 		case 3:
L_DoCalibrationCanal27:
;calibr.c,125 :: 		PORTD.RD2 = 0;
	BCF        PORTD+0, 2
;calibr.c,126 :: 		PORTD.RD3 = 1;
	BSF        PORTD+0, 3
;calibr.c,127 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x28);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      40
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;calibr.c,128 :: 		break;
	GOTO       L_DoCalibrationCanal24
;calibr.c,129 :: 		}
L_DoCalibrationCanal23:
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal25
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal26
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal27
L_DoCalibrationCanal24:
;calibr.c,130 :: 		do{
L_DoCalibrationCanal28:
;calibr.c,132 :: 		GetVoltageFromADC(can);
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	MOVWF      FARG_GetVoltageFromADC_can+0
	CALL       _GetVoltageFromADC+0
;calibr.c,133 :: 		CalculateFloat1ADC();
	CALL       _CalculateFloat1ADC+0
;calibr.c,134 :: 		DisplayFloat1(2, 7);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      7
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;calibr.c,135 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,136 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,137 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,139 :: 		short_1 = GetKeyNormal();
	CALL       _GetKeyNormal+0
	MOVF       R0+0, 0
	MOVWF      _short_1+0
;calibr.c,141 :: 		if (short_1 == key_down){
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationCanal31
;calibr.c,142 :: 		goto next_33;
	GOTO       ___DoCalibrationCanal_next_33
;calibr.c,143 :: 		}
L_DoCalibrationCanal31:
;calibr.c,144 :: 		else if (short_1 == key_up_long){
	MOVF       _short_1+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationCanal33
;calibr.c,145 :: 		LCDWriteFromROM(2,1, s_NothingChanged);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_NothingChanged+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_NothingChanged+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,146 :: 		goto end_;
	GOTO       ___DoCalibrationCanal_end_
;calibr.c,147 :: 		}
L_DoCalibrationCanal33:
;calibr.c,149 :: 		else if (short_1 == key_select_long){
	MOVF       _short_1+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationCanal35
;calibr.c,150 :: 		k_can = adc_float / 12.00;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      64
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       _adc_float+0, 0
	MOVWF      R0+0
	MOVF       _adc_float+1, 0
	MOVWF      R0+1
	MOVF       _adc_float+2, 0
	MOVWF      R0+2
	MOVF       _adc_float+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _k_can+0
	MOVF       R0+1, 0
	MOVWF      _k_can+1
	MOVF       R0+2, 0
	MOVWF      _k_can+2
	MOVF       R0+3, 0
	MOVWF      _k_can+3
;calibr.c,152 :: 		switch(can){
	GOTO       L_DoCalibrationCanal36
;calibr.c,153 :: 		case 1:
L_DoCalibrationCanal38:
;calibr.c,154 :: 		SaveToEEPROMKoef((char*)&k_can, 0x10);
	MOVLW      _k_can+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      16
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,155 :: 		break;
	GOTO       L_DoCalibrationCanal37
;calibr.c,156 :: 		case 2:
L_DoCalibrationCanal39:
;calibr.c,157 :: 		SaveToEEPROMKoef((char*)&k_can, 0x1c);
	MOVLW      _k_can+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      28
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,158 :: 		break;
	GOTO       L_DoCalibrationCanal37
;calibr.c,159 :: 		case 3:
L_DoCalibrationCanal40:
;calibr.c,160 :: 		SaveToEEPROMKoef((char*)&k_can, 0x28);
	MOVLW      _k_can+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      40
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,161 :: 		break;
	GOTO       L_DoCalibrationCanal37
;calibr.c,162 :: 		}
L_DoCalibrationCanal36:
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal38
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal39
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal40
L_DoCalibrationCanal37:
;calibr.c,164 :: 		LCDWriteFromROM(2,1,s_EEPROMSaved);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_EEPROMSaved+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_EEPROMSaved+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,165 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;calibr.c,166 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;calibr.c,167 :: 		goto next_33;
	GOTO       ___DoCalibrationCanal_next_33
;calibr.c,168 :: 		}
L_DoCalibrationCanal35:
;calibr.c,169 :: 		}while(1);
	GOTO       L_DoCalibrationCanal28
;calibr.c,171 :: 		next_33:;
___DoCalibrationCanal_next_33:
;calibr.c,172 :: 		LCDClearString2();
	CALL       _LCDClearString2+0
;calibr.c,173 :: 		LCDWriteFromROM(2, 1, s_19V);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_19V+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_19V+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,174 :: 		LCDWriteFromROM(2, 5, s_U);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      5
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_U+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_U+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,175 :: 		switch(can){
	GOTO       L_DoCalibrationCanal41
;calibr.c,176 :: 		case 1:
L_DoCalibrationCanal43:
;calibr.c,177 :: 		PORTC.RC6 = 1;
	BSF        PORTC+0, 6
;calibr.c,178 :: 		PORTC.RC7 = 0;
	BCF        PORTC+0, 7
;calibr.c,179 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x14);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      20
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;calibr.c,180 :: 		break;
	GOTO       L_DoCalibrationCanal42
;calibr.c,181 :: 		case 2:
L_DoCalibrationCanal44:
;calibr.c,182 :: 		PORTC.RC4 = 1;
	BSF        PORTC+0, 4
;calibr.c,183 :: 		PORTC.RC5 = 0;
	BCF        PORTC+0, 5
;calibr.c,184 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x20);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      32
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;calibr.c,185 :: 		break;
	GOTO       L_DoCalibrationCanal42
;calibr.c,186 :: 		case 3:
L_DoCalibrationCanal45:
;calibr.c,187 :: 		PORTD.RD2 = 1;
	BSF        PORTD+0, 2
;calibr.c,188 :: 		PORTD.RD3 = 0;
	BCF        PORTD+0, 3
;calibr.c,189 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x2c);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      44
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;calibr.c,190 :: 		break;
	GOTO       L_DoCalibrationCanal42
;calibr.c,191 :: 		}
L_DoCalibrationCanal41:
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal43
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal44
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal45
L_DoCalibrationCanal42:
;calibr.c,192 :: 		do{
L_DoCalibrationCanal46:
;calibr.c,194 :: 		GetVoltageFromADC(can);
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	MOVWF      FARG_GetVoltageFromADC_can+0
	CALL       _GetVoltageFromADC+0
;calibr.c,195 :: 		CalculateFloat1ADC();
	CALL       _CalculateFloat1ADC+0
;calibr.c,196 :: 		DisplayFloat1(2, 7);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      7
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;calibr.c,197 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,198 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,199 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,201 :: 		short_1 = GetKeyNormal();
	CALL       _GetKeyNormal+0
	MOVF       R0+0, 0
	MOVWF      _short_1+0
;calibr.c,203 :: 		if (short_1 == key_down){
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationCanal49
;calibr.c,204 :: 		goto current;
	GOTO       ___DoCalibrationCanal_current
;calibr.c,205 :: 		}
L_DoCalibrationCanal49:
;calibr.c,206 :: 		else if (short_1 == key_up_long){
	MOVF       _short_1+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationCanal51
;calibr.c,207 :: 		LCDWriteFromROM(2,1, s_NothingChanged);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_NothingChanged+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_NothingChanged+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,208 :: 		goto end_;
	GOTO       ___DoCalibrationCanal_end_
;calibr.c,209 :: 		}
L_DoCalibrationCanal51:
;calibr.c,211 :: 		else if (short_1 == key_select_long){
	MOVF       _short_1+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationCanal53
;calibr.c,212 :: 		k_can = adc_float / 19.00;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      24
	MOVWF      R4+2
	MOVLW      131
	MOVWF      R4+3
	MOVF       _adc_float+0, 0
	MOVWF      R0+0
	MOVF       _adc_float+1, 0
	MOVWF      R0+1
	MOVF       _adc_float+2, 0
	MOVWF      R0+2
	MOVF       _adc_float+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _k_can+0
	MOVF       R0+1, 0
	MOVWF      _k_can+1
	MOVF       R0+2, 0
	MOVWF      _k_can+2
	MOVF       R0+3, 0
	MOVWF      _k_can+3
;calibr.c,214 :: 		switch(can){
	GOTO       L_DoCalibrationCanal54
;calibr.c,215 :: 		case 1:
L_DoCalibrationCanal56:
;calibr.c,216 :: 		SaveToEEPROMKoef((char*)&k_can, 0x14);
	MOVLW      _k_can+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      20
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,217 :: 		break;
	GOTO       L_DoCalibrationCanal55
;calibr.c,218 :: 		case 2:
L_DoCalibrationCanal57:
;calibr.c,219 :: 		SaveToEEPROMKoef((char*)&k_can, 0x20);
	MOVLW      _k_can+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      32
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,220 :: 		break;
	GOTO       L_DoCalibrationCanal55
;calibr.c,221 :: 		case 3:
L_DoCalibrationCanal58:
;calibr.c,222 :: 		SaveToEEPROMKoef((char*)&k_can, 0x2c);
	MOVLW      _k_can+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      44
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,223 :: 		break;
	GOTO       L_DoCalibrationCanal55
;calibr.c,224 :: 		}
L_DoCalibrationCanal54:
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal56
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal57
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal58
L_DoCalibrationCanal55:
;calibr.c,226 :: 		LCDWriteFromROM(2,1,s_EEPROMSaved);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_EEPROMSaved+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_EEPROMSaved+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,227 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;calibr.c,228 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;calibr.c,229 :: 		goto current;
	GOTO       ___DoCalibrationCanal_current
;calibr.c,230 :: 		}
L_DoCalibrationCanal53:
;calibr.c,231 :: 		}while(1);
	GOTO       L_DoCalibrationCanal46
;calibr.c,232 :: 		current:;
___DoCalibrationCanal_current:
;calibr.c,234 :: 		LCDClearString2();
	CALL       _LCDClearString2+0
;calibr.c,235 :: 		LCDWriteFromROM(2, 1, s_8A);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_8A+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_8A+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,236 :: 		LCDWriteFromROM(2, 5, s_I);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      5
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_I+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_I+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,237 :: 		switch(can){
	GOTO       L_DoCalibrationCanal59
;calibr.c,238 :: 		case 1:
L_DoCalibrationCanal61:
;calibr.c,239 :: 		PORTC.RC6 = 1;
	BSF        PORTC+0, 6
;calibr.c,240 :: 		PORTC.RC7 = 0;
	BCF        PORTC+0, 7
;calibr.c,241 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x30);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      48
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;calibr.c,242 :: 		break;
	GOTO       L_DoCalibrationCanal60
;calibr.c,243 :: 		case 2:
L_DoCalibrationCanal62:
;calibr.c,244 :: 		PORTC.RC4 = 1;
	BSF        PORTC+0, 4
;calibr.c,245 :: 		PORTC.RC5 = 0;
	BCF        PORTC+0, 5
;calibr.c,246 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x34);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      52
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;calibr.c,247 :: 		break;
	GOTO       L_DoCalibrationCanal60
;calibr.c,248 :: 		case 3:
L_DoCalibrationCanal63:
;calibr.c,249 :: 		PORTD.RD2 = 1;
	BSF        PORTD+0, 2
;calibr.c,250 :: 		PORTD.RD3 = 0;
	BCF        PORTD+0, 3
;calibr.c,251 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x38);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      56
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;calibr.c,252 :: 		break;
	GOTO       L_DoCalibrationCanal60
;calibr.c,253 :: 		}
L_DoCalibrationCanal59:
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal61
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal62
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal63
L_DoCalibrationCanal60:
;calibr.c,254 :: 		do{
L_DoCalibrationCanal64:
;calibr.c,256 :: 		switch(can){
	GOTO       L_DoCalibrationCanal67
;calibr.c,257 :: 		case 1:
L_DoCalibrationCanal69:
;calibr.c,258 :: 		GetADCValue(0);
	CLRF       FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;calibr.c,259 :: 		break;
	GOTO       L_DoCalibrationCanal68
;calibr.c,260 :: 		case 2:
L_DoCalibrationCanal70:
;calibr.c,261 :: 		GetADCValue(3);
	MOVLW      3
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;calibr.c,262 :: 		break;
	GOTO       L_DoCalibrationCanal68
;calibr.c,263 :: 		case 3:
L_DoCalibrationCanal71:
;calibr.c,264 :: 		GetADCValue(5);
	MOVLW      5
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;calibr.c,265 :: 		break;
	GOTO       L_DoCalibrationCanal68
;calibr.c,266 :: 		}
L_DoCalibrationCanal67:
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal69
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal70
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal71
L_DoCalibrationCanal68:
;calibr.c,267 :: 		CalculateFloat1ADC();
	CALL       _CalculateFloat1ADC+0
;calibr.c,268 :: 		DisplayFloat1(2, 7);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      7
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;calibr.c,269 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,270 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,271 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,273 :: 		short_1 = GetKeyNormal();
	CALL       _GetKeyNormal+0
	MOVF       R0+0, 0
	MOVWF      _short_1+0
;calibr.c,274 :: 		if (short_1 == key_up_long){
	MOVF       R0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationCanal72
;calibr.c,275 :: 		LCDWriteFromROM(2,1, s_NothingChanged);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_NothingChanged+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_NothingChanged+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,276 :: 		goto end_;
	GOTO       ___DoCalibrationCanal_end_
;calibr.c,277 :: 		}
L_DoCalibrationCanal72:
;calibr.c,278 :: 		else if (short_1 == key_down){
	MOVF       _short_1+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationCanal74
;calibr.c,279 :: 		LCDWriteFromROM(2,1, s_NothingChanged);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_NothingChanged+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_NothingChanged+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,280 :: 		goto end_;
	GOTO       ___DoCalibrationCanal_end_
;calibr.c,281 :: 		}
L_DoCalibrationCanal74:
;calibr.c,283 :: 		else if (short_1 == key_select_long){
	MOVF       _short_1+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationCanal76
;calibr.c,284 :: 		k_can = adc_float / 8.00;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       _adc_float+0, 0
	MOVWF      R0+0
	MOVF       _adc_float+1, 0
	MOVWF      R0+1
	MOVF       _adc_float+2, 0
	MOVWF      R0+2
	MOVF       _adc_float+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _k_can+0
	MOVF       R0+1, 0
	MOVWF      _k_can+1
	MOVF       R0+2, 0
	MOVWF      _k_can+2
	MOVF       R0+3, 0
	MOVWF      _k_can+3
;calibr.c,286 :: 		switch(can){
	GOTO       L_DoCalibrationCanal77
;calibr.c,287 :: 		case 1:
L_DoCalibrationCanal79:
;calibr.c,288 :: 		SaveToEEPROMKoef((char*)&k_can, 0x30);
	MOVLW      _k_can+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      48
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,289 :: 		break;
	GOTO       L_DoCalibrationCanal78
;calibr.c,290 :: 		case 2:
L_DoCalibrationCanal80:
;calibr.c,291 :: 		SaveToEEPROMKoef((char*)&k_can, 0x34);
	MOVLW      _k_can+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      52
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,292 :: 		break;
	GOTO       L_DoCalibrationCanal78
;calibr.c,293 :: 		case 3:
L_DoCalibrationCanal81:
;calibr.c,294 :: 		SaveToEEPROMKoef((char*)&k_can, 0x38);
	MOVLW      _k_can+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      56
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,295 :: 		break;
	GOTO       L_DoCalibrationCanal78
;calibr.c,296 :: 		}
L_DoCalibrationCanal77:
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal79
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal80
	MOVF       FARG_DoCalibrationCanal_can+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationCanal81
L_DoCalibrationCanal78:
;calibr.c,298 :: 		LCDWriteFromROM(2,1,s_EEPROMSaved);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_EEPROMSaved+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_EEPROMSaved+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,299 :: 		}
L_DoCalibrationCanal76:
;calibr.c,300 :: 		}while(1);
	GOTO       L_DoCalibrationCanal64
;calibr.c,301 :: 		end_:;
___DoCalibrationCanal_end_:
;calibr.c,302 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;calibr.c,303 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;calibr.c,304 :: 		}
L_end_DoCalibrationCanal:
	RETURN
; end of _DoCalibrationCanal

_DoCalibration5VSBandPG:

;calibr.c,306 :: 		void DoCalibration5VSBandPG(){
;calibr.c,307 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;calibr.c,308 :: 		LCDShowStringFromEEPROM(1, 10); //
	MOVLW      1
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVLW      10
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;calibr.c,309 :: 		LCDWriteFromROM(2, 1, s_VSB);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_VSB+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_VSB+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,310 :: 		LCDWriteFromROM(2, 10, s_PG);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      10
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_PG+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_PG+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,311 :: 		do{
L_DoCalibration5VSBandPG82:
;calibr.c,313 :: 		GetADCValue(7);
	MOVLW      7
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;calibr.c,314 :: 		float_1 = adc_float / k_5vsb;
	MOVF       _k_5vsb+0, 0
	MOVWF      R4+0
	MOVF       _k_5vsb+1, 0
	MOVWF      R4+1
	MOVF       _k_5vsb+2, 0
	MOVWF      R4+2
	MOVF       _k_5vsb+3, 0
	MOVWF      R4+3
	MOVF       _adc_float+0, 0
	MOVWF      R0+0
	MOVF       _adc_float+1, 0
	MOVWF      R0+1
	MOVF       _adc_float+2, 0
	MOVWF      R0+2
	MOVF       _adc_float+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _float_1+0
	MOVF       R0+1, 0
	MOVWF      _float_1+1
	MOVF       R0+2, 0
	MOVWF      _float_1+2
	MOVF       R0+3, 0
	MOVWF      _float_1+3
;calibr.c,315 :: 		int_1 = adc_int;
	MOVF       _adc_int+0, 0
	MOVWF      _int_1+0
	MOVF       _adc_int+1, 0
	MOVWF      _int_1+1
;calibr.c,316 :: 		DisplayFloat1(2, 5);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      5
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;calibr.c,317 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,320 :: 		GetADCValue(6);
	MOVLW      6
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;calibr.c,321 :: 		float_1 = adc_float / k_pg;
	MOVF       _k_pg+0, 0
	MOVWF      R4+0
	MOVF       _k_pg+1, 0
	MOVWF      R4+1
	MOVF       _k_pg+2, 0
	MOVWF      R4+2
	MOVF       _k_pg+3, 0
	MOVWF      R4+3
	MOVF       _adc_float+0, 0
	MOVWF      R0+0
	MOVF       _adc_float+1, 0
	MOVWF      R0+1
	MOVF       _adc_float+2, 0
	MOVWF      R0+2
	MOVF       _adc_float+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _float_1+0
	MOVF       R0+1, 0
	MOVWF      _float_1+1
	MOVF       R0+2, 0
	MOVWF      _float_1+2
	MOVF       R0+3, 0
	MOVWF      _float_1+3
;calibr.c,322 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;calibr.c,323 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,324 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,325 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,327 :: 		short_1 = GetKeyNormal();
	CALL       _GetKeyNormal+0
	MOVF       R0+0, 0
	MOVWF      _short_1+0
;calibr.c,329 :: 		if (short_1 == key_up_long){
	MOVF       R0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibration5VSBandPG85
;calibr.c,330 :: 		LCDWriteFromROM(2,1, s_NothingChanged);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_NothingChanged+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_NothingChanged+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,331 :: 		goto end_;
	GOTO       ___DoCalibration5VSBandPG_end_
;calibr.c,332 :: 		}
L_DoCalibration5VSBandPG85:
;calibr.c,334 :: 		else if (short_1 == key_select_long){
	MOVF       _short_1+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibration5VSBandPG87
;calibr.c,336 :: 		k_5vsb = int_1 * k_adc / 5.00;
	MOVF       _int_1+0, 0
	MOVWF      R0+0
	MOVF       _int_1+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVF       _k_adc+0, 0
	MOVWF      R4+0
	MOVF       _k_adc+1, 0
	MOVWF      R4+1
	MOVF       _k_adc+2, 0
	MOVWF      R4+2
	MOVF       _k_adc+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _k_5vsb+0
	MOVF       R0+1, 0
	MOVWF      _k_5vsb+1
	MOVF       R0+2, 0
	MOVWF      _k_5vsb+2
	MOVF       R0+3, 0
	MOVWF      _k_5vsb+3
;calibr.c,338 :: 		SaveToEEPROMKoef((char*)&k_5vsb, 0x04);
	MOVLW      _k_5vsb+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      4
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,340 :: 		k_pg = adc_float / 5.00;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	MOVF       _adc_float+0, 0
	MOVWF      R0+0
	MOVF       _adc_float+1, 0
	MOVWF      R0+1
	MOVF       _adc_float+2, 0
	MOVWF      R0+2
	MOVF       _adc_float+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _k_pg+0
	MOVF       R0+1, 0
	MOVWF      _k_pg+1
	MOVF       R0+2, 0
	MOVWF      _k_pg+2
	MOVF       R0+3, 0
	MOVWF      _k_pg+3
;calibr.c,342 :: 		SaveToEEPROMKoef((char*)&k_pg, 0x08);
	MOVLW      _k_pg+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	MOVLW      8
	MOVWF      FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,344 :: 		LCDWriteFromROM(2,1,s_EEPROMSaved);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_EEPROMSaved+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_EEPROMSaved+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,345 :: 		goto end_;
	GOTO       ___DoCalibration5VSBandPG_end_
;calibr.c,346 :: 		}
L_DoCalibration5VSBandPG87:
;calibr.c,347 :: 		}while(1);
	GOTO       L_DoCalibration5VSBandPG82
;calibr.c,348 :: 		end_:;
___DoCalibration5VSBandPG_end_:
;calibr.c,349 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;calibr.c,350 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;calibr.c,351 :: 		}
L_end_DoCalibration5VSBandPG:
	RETURN
; end of _DoCalibration5VSBandPG

_DoCalibrationADCVref:

;calibr.c,353 :: 		void DoCalibrationADCVref(){
;calibr.c,354 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;calibr.c,355 :: 		LCDShowStringFromEEPROM(1, 14); //
	MOVLW      1
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVLW      14
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;calibr.c,356 :: 		LCDWriteFromROM(2, 1, s_Vref);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_Vref+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_Vref+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,357 :: 		do{
L_DoCalibrationADCVref88:
;calibr.c,359 :: 		GetADCValue(6);
	MOVLW      6
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;calibr.c,360 :: 		float_1 = adc_float;
	MOVF       _adc_float+0, 0
	MOVWF      _float_1+0
	MOVF       _adc_float+1, 0
	MOVWF      _float_1+1
	MOVF       _adc_float+2, 0
	MOVWF      _float_1+2
	MOVF       _adc_float+3, 0
	MOVWF      _float_1+3
;calibr.c,361 :: 		DisplayFloat1(2, 6);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      6
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;calibr.c,362 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,363 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,364 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;calibr.c,366 :: 		short_1 = GetKeyNormal();
	CALL       _GetKeyNormal+0
	MOVF       R0+0, 0
	MOVWF      _short_1+0
;calibr.c,368 :: 		if (short_1 == key_up_long){
	MOVF       R0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationADCVref91
;calibr.c,369 :: 		LCDWriteFromROM(2,1, s_NothingChanged);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_NothingChanged+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_NothingChanged+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,370 :: 		goto end_;
	GOTO       ___DoCalibrationADCVref_end_
;calibr.c,371 :: 		}
L_DoCalibrationADCVref91:
;calibr.c,373 :: 		else if (short_1 == key_select_long){
	MOVF       _short_1+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationADCVref93
;calibr.c,374 :: 		k_adc = 4.0 / adc_int;
	MOVF       _adc_int+0, 0
	MOVWF      R0+0
	MOVF       _adc_int+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      129
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _k_adc+0
	MOVF       R0+1, 0
	MOVWF      _k_adc+1
	MOVF       R0+2, 0
	MOVWF      _k_adc+2
	MOVF       R0+3, 0
	MOVWF      _k_adc+3
;calibr.c,376 :: 		SaveToEEPROMKoef((char*)&k_adc, 0x00);
	MOVLW      _k_adc+0
	MOVWF      FARG_SaveToEEPROMKoef_p1+0
	CLRF       FARG_SaveToEEPROMKoef_b1+0
	CALL       _SaveToEEPROMKoef+0
;calibr.c,378 :: 		LCDWriteFromROM(2,1,s_EEPROMSaved);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_EEPROMSaved+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_EEPROMSaved+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,379 :: 		goto end_;
	GOTO       ___DoCalibrationADCVref_end_
;calibr.c,380 :: 		}
L_DoCalibrationADCVref93:
;calibr.c,381 :: 		}while(1);
	GOTO       L_DoCalibrationADCVref88
;calibr.c,382 :: 		end_:;
___DoCalibrationADCVref_end_:
;calibr.c,383 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;calibr.c,384 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;calibr.c,385 :: 		}
L_end_DoCalibrationADCVref:
	RETURN
; end of _DoCalibrationADCVref

_DoCalibrationMenu:

;calibr.c,387 :: 		void DoCalibrationMenu(){
;calibr.c,388 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;calibr.c,390 :: 		mode2 = 0;
	CLRF       _mode2+0
;calibr.c,391 :: 		start_soft:;
___DoCalibrationMenu_start_soft:
;calibr.c,392 :: 		LCDWriteFromROM(1,1, s_SelectCalibr);
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_SelectCalibr+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_SelectCalibr+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;calibr.c,393 :: 		LCDShowStringFromEEPROM(2, 10 + mode2); //
	MOVLW      2
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVF       _mode2+0, 0
	ADDLW      10
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;calibr.c,394 :: 		do{
L_DoCalibrationMenu94:
;calibr.c,395 :: 		short_1 = GetKeyNormal();
	CALL       _GetKeyNormal+0
	MOVF       R0+0, 0
	MOVWF      _short_1+0
;calibr.c,398 :: 		if (short_1 == key_up){
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationMenu97
;calibr.c,399 :: 		if (mode2 > 0){
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _mode2+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_DoCalibrationMenu98
;calibr.c,400 :: 		mode2 --;
	DECF       _mode2+0, 1
;calibr.c,401 :: 		LCDShowStringFromEEPROM(2, 10 + mode2); //
	MOVLW      2
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVF       _mode2+0, 0
	ADDLW      10
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;calibr.c,402 :: 		}
L_DoCalibrationMenu98:
;calibr.c,403 :: 		}
	GOTO       L_DoCalibrationMenu99
L_DoCalibrationMenu97:
;calibr.c,405 :: 		else if (short_1 == key_down){
	MOVF       _short_1+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationMenu100
;calibr.c,406 :: 		if (mode2 < 4){
	MOVLW      128
	XORWF      _mode2+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_DoCalibrationMenu101
;calibr.c,407 :: 		mode2 ++;
	INCF       _mode2+0, 1
;calibr.c,408 :: 		LCDShowStringFromEEPROM(2, 10 + mode2); //
	MOVLW      2
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVF       _mode2+0, 0
	ADDLW      10
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;calibr.c,409 :: 		}
L_DoCalibrationMenu101:
;calibr.c,410 :: 		}
	GOTO       L_DoCalibrationMenu102
L_DoCalibrationMenu100:
;calibr.c,412 :: 		else if (short_1 == key_select){
	MOVF       _short_1+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationMenu103
;calibr.c,413 :: 		switch(mode2){
	GOTO       L_DoCalibrationMenu104
;calibr.c,415 :: 		case 0:
L_DoCalibrationMenu106:
;calibr.c,416 :: 		DoCalibration5VSBandPG();
	CALL       _DoCalibration5VSBandPG+0
;calibr.c,418 :: 		LoadFromEEPROMBaseKoef();
	CALL       _LoadFromEEPROMBaseKoef+0
;calibr.c,419 :: 		goto start_soft;
	GOTO       ___DoCalibrationMenu_start_soft
;calibr.c,421 :: 		case 1:
L_DoCalibrationMenu107:
;calibr.c,422 :: 		DoCalibrationCanal(1);
	MOVLW      1
	MOVWF      FARG_DoCalibrationCanal_can+0
	CALL       _DoCalibrationCanal+0
;calibr.c,424 :: 		LoadFromEEPROMBaseKoef();
	CALL       _LoadFromEEPROMBaseKoef+0
;calibr.c,425 :: 		goto start_soft;
	GOTO       ___DoCalibrationMenu_start_soft
;calibr.c,428 :: 		case 2:
L_DoCalibrationMenu108:
;calibr.c,429 :: 		DoCalibrationCanal(2);
	MOVLW      2
	MOVWF      FARG_DoCalibrationCanal_can+0
	CALL       _DoCalibrationCanal+0
;calibr.c,431 :: 		LoadFromEEPROMBaseKoef();
	CALL       _LoadFromEEPROMBaseKoef+0
;calibr.c,432 :: 		goto start_soft;
	GOTO       ___DoCalibrationMenu_start_soft
;calibr.c,434 :: 		case 3:
L_DoCalibrationMenu109:
;calibr.c,435 :: 		DoCalibrationCanal(3);
	MOVLW      3
	MOVWF      FARG_DoCalibrationCanal_can+0
	CALL       _DoCalibrationCanal+0
;calibr.c,437 :: 		LoadFromEEPROMBaseKoef();
	CALL       _LoadFromEEPROMBaseKoef+0
;calibr.c,438 :: 		goto start_soft;
	GOTO       ___DoCalibrationMenu_start_soft
;calibr.c,441 :: 		case 4:
L_DoCalibrationMenu110:
;calibr.c,442 :: 		DoCalibrationADCVref();
	CALL       _DoCalibrationADCVref+0
;calibr.c,444 :: 		LoadFromEEPROMBaseKoef();
	CALL       _LoadFromEEPROMBaseKoef+0
;calibr.c,445 :: 		goto start_soft;
	GOTO       ___DoCalibrationMenu_start_soft
;calibr.c,447 :: 		}
L_DoCalibrationMenu104:
	MOVF       _mode2+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationMenu106
	MOVF       _mode2+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationMenu107
	MOVF       _mode2+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationMenu108
	MOVF       _mode2+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationMenu109
	MOVF       _mode2+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_DoCalibrationMenu110
;calibr.c,448 :: 		}
	GOTO       L_DoCalibrationMenu111
L_DoCalibrationMenu103:
;calibr.c,449 :: 		else if (short_1 == key_up_long){
	MOVF       _short_1+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_DoCalibrationMenu112
;calibr.c,450 :: 		return;
	GOTO       L_end_DoCalibrationMenu
;calibr.c,451 :: 		}
L_DoCalibrationMenu112:
L_DoCalibrationMenu111:
L_DoCalibrationMenu102:
L_DoCalibrationMenu99:
;calibr.c,452 :: 		}while(1);
	GOTO       L_DoCalibrationMenu94
;calibr.c,453 :: 		}
L_end_DoCalibrationMenu:
	RETURN
; end of _DoCalibrationMenu
