
_Show5VSBandPG:

;atxtester.c,35 :: 		void Show5VSBandPG(){
;atxtester.c,36 :: 		LCDWriteFromROM(1,1,s_VSB);
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_VSB+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_VSB+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;atxtester.c,37 :: 		GetADCValue(7);
	MOVLW      7
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;atxtester.c,38 :: 		float_1 = adc_float / k_5vsb;
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
;atxtester.c,39 :: 		DisplayFloat1(1, 5);
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      5
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;atxtester.c,40 :: 		LCDWriteFromROM(2,1,s_PG);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_PG+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_PG+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;atxtester.c,41 :: 		GetADCValue(6);
	MOVLW      6
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;atxtester.c,42 :: 		float_1 = adc_float / k_pg;
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
;atxtester.c,43 :: 		DisplayFloat1(2, 4);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      4
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;atxtester.c,44 :: 		}
L_end_Show5VSBandPG:
	RETURN
; end of _Show5VSBandPG

_ATXMeasureAndShowAllChanels:

;atxtester.c,46 :: 		void ATXMeasureAndShowAllChanels(){
;atxtester.c,48 :: 		if (dyn_mode_flag.B0 == 1){
	BTFSS      _dyn_mode_flag+0, 0
	GOTO       L_ATXMeasureAndShowAllChanels0
;atxtester.c,49 :: 		LCDClearString2();
	CALL       _LCDClearString2+0
;atxtester.c,50 :: 		}
L_ATXMeasureAndShowAllChanels0:
;atxtester.c,52 :: 		if (i_p == 1){
	MOVF       _i_p+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_ATXMeasureAndShowAllChanels1
;atxtester.c,53 :: 		Lcd_Chr(2, 6, 'I');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      73
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;atxtester.c,54 :: 		}
L_ATXMeasureAndShowAllChanels1:
;atxtester.c,55 :: 		power_all = 0;
	CLRF       _power_all+0
	CLRF       _power_all+1
;atxtester.c,57 :: 		MeasureVoltage1();
	CALL       _MeasureVoltage1+0
;atxtester.c,58 :: 		int_1 = (int)float_1;
	MOVF       _float_1+0, 0
	MOVWF      R0+0
	MOVF       _float_1+1, 0
	MOVWF      R0+1
	MOVF       _float_1+2, 0
	MOVWF      R0+2
	MOVF       _float_1+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _int_1+0
	MOVF       R0+1, 0
	MOVWF      _int_1+1
;atxtester.c,59 :: 		float_2 = float_1;
	MOVF       _float_1+0, 0
	MOVWF      _float_2+0
	MOVF       _float_1+1, 0
	MOVWF      _float_2+1
	MOVF       _float_1+2, 0
	MOVWF      _float_2+2
	MOVF       _float_1+3, 0
	MOVWF      _float_2+3
;atxtester.c,61 :: 		if ( (int_1 > 30) || (adc_int > 1000) ){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels76
	MOVF       R0+0, 0
	SUBLW      30
L__ATXMeasureAndShowAllChanels76:
	BTFSS      STATUS+0, 0
	GOTO       L__ATXMeasureAndShowAllChanels73
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels77
	MOVF       _adc_int+0, 0
	SUBLW      232
L__ATXMeasureAndShowAllChanels77:
	BTFSS      STATUS+0, 0
	GOTO       L__ATXMeasureAndShowAllChanels73
	GOTO       L_ATXMeasureAndShowAllChanels4
L__ATXMeasureAndShowAllChanels73:
;atxtester.c,62 :: 		LCDOverLoad_UIP(1,1, 'U');
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_UIP_row+0
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_UIP_col+0
	MOVLW      85
	MOVWF      FARG_LCDOverLoad_UIP_ch+0
	CALL       _LCDOverLoad_UIP+0
;atxtester.c,63 :: 		}
	GOTO       L_ATXMeasureAndShowAllChanels5
L_ATXMeasureAndShowAllChanels4:
;atxtester.c,65 :: 		DisplayFloat1(1, 1);
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;atxtester.c,66 :: 		}
L_ATXMeasureAndShowAllChanels5:
;atxtester.c,68 :: 		MeasureCurrent1();
	CALL       _MeasureCurrent1+0
;atxtester.c,69 :: 		int_2 = (int)float_1;
	MOVF       _float_1+0, 0
	MOVWF      R0+0
	MOVF       _float_1+1, 0
	MOVWF      R0+1
	MOVF       _float_1+2, 0
	MOVWF      R0+2
	MOVF       _float_1+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _int_2+0
	MOVF       R0+1, 0
	MOVWF      _int_2+1
;atxtester.c,70 :: 		if ( (int_2 > 25) || (adc_int > 1000) ){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels78
	MOVF       R0+0, 0
	SUBLW      25
L__ATXMeasureAndShowAllChanels78:
	BTFSS      STATUS+0, 0
	GOTO       L__ATXMeasureAndShowAllChanels72
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels79
	MOVF       _adc_int+0, 0
	SUBLW      232
L__ATXMeasureAndShowAllChanels79:
	BTFSS      STATUS+0, 0
	GOTO       L__ATXMeasureAndShowAllChanels72
	GOTO       L_ATXMeasureAndShowAllChanels8
L__ATXMeasureAndShowAllChanels72:
;atxtester.c,71 :: 		LCDOverLoad_UIP(1,1,'I');
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_UIP_row+0
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_UIP_col+0
	MOVLW      73
	MOVWF      FARG_LCDOverLoad_UIP_ch+0
	CALL       _LCDOverLoad_UIP+0
;atxtester.c,72 :: 		}
L_ATXMeasureAndShowAllChanels8:
;atxtester.c,73 :: 		CalculateFloat1Float2Power();
	CALL       _CalculateFloat1Float2Power+0
;atxtester.c,74 :: 		power_all += int_1;
	MOVF       _int_1+0, 0
	ADDWF      _power_all+0, 1
	MOVF       _int_1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _power_all+1, 1
;atxtester.c,76 :: 		if (i_p == 1){
	MOVF       _i_p+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_ATXMeasureAndShowAllChanels9
;atxtester.c,77 :: 		DisplayFloat1(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;atxtester.c,78 :: 		}
	GOTO       L_ATXMeasureAndShowAllChanels10
L_ATXMeasureAndShowAllChanels9:
;atxtester.c,81 :: 		DisplayInt1ThreeDigit(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayInt1ThreeDigit_row+0
	MOVLW      1
	MOVWF      FARG_DisplayInt1ThreeDigit_col+0
	CALL       _DisplayInt1ThreeDigit+0
;atxtester.c,82 :: 		}
L_ATXMeasureAndShowAllChanels10:
;atxtester.c,84 :: 		if ( int_1 > 290 ){
	MOVF       _int_1+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels80
	MOVF       _int_1+0, 0
	SUBLW      34
L__ATXMeasureAndShowAllChanels80:
	BTFSC      STATUS+0, 0
	GOTO       L_ATXMeasureAndShowAllChanels11
;atxtester.c,85 :: 		LCDOverLoad_UIP(1,1,'P');
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_UIP_row+0
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_UIP_col+0
	MOVLW      80
	MOVWF      FARG_LCDOverLoad_UIP_ch+0
	CALL       _LCDOverLoad_UIP+0
;atxtester.c,86 :: 		}
L_ATXMeasureAndShowAllChanels11:
;atxtester.c,88 :: 		MeasureVoltage2();
	CALL       _MeasureVoltage2+0
;atxtester.c,89 :: 		int_1 = (int)float_1;
	MOVF       _float_1+0, 0
	MOVWF      R0+0
	MOVF       _float_1+1, 0
	MOVWF      R0+1
	MOVF       _float_1+2, 0
	MOVWF      R0+2
	MOVF       _float_1+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _int_1+0
	MOVF       R0+1, 0
	MOVWF      _int_1+1
;atxtester.c,90 :: 		float_2 = float_1;
	MOVF       _float_1+0, 0
	MOVWF      _float_2+0
	MOVF       _float_1+1, 0
	MOVWF      _float_2+1
	MOVF       _float_1+2, 0
	MOVWF      _float_2+2
	MOVF       _float_1+3, 0
	MOVWF      _float_2+3
;atxtester.c,92 :: 		if ( (int_1 > 21) || (adc_int > 1000) ){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels81
	MOVF       R0+0, 0
	SUBLW      21
L__ATXMeasureAndShowAllChanels81:
	BTFSS      STATUS+0, 0
	GOTO       L__ATXMeasureAndShowAllChanels71
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels82
	MOVF       _adc_int+0, 0
	SUBLW      232
L__ATXMeasureAndShowAllChanels82:
	BTFSS      STATUS+0, 0
	GOTO       L__ATXMeasureAndShowAllChanels71
	GOTO       L_ATXMeasureAndShowAllChanels14
L__ATXMeasureAndShowAllChanels71:
;atxtester.c,93 :: 		LCDOverLoad_UIP(1,8, 'U');
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_UIP_row+0
	MOVLW      8
	MOVWF      FARG_LCDOverLoad_UIP_col+0
	MOVLW      85
	MOVWF      FARG_LCDOverLoad_UIP_ch+0
	CALL       _LCDOverLoad_UIP+0
;atxtester.c,94 :: 		}
	GOTO       L_ATXMeasureAndShowAllChanels15
L_ATXMeasureAndShowAllChanels14:
;atxtester.c,96 :: 		DisplayFloat1(1, 8);
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;atxtester.c,97 :: 		}
L_ATXMeasureAndShowAllChanels15:
;atxtester.c,99 :: 		MeasureCurrent2();
	CALL       _MeasureCurrent2+0
;atxtester.c,100 :: 		int_2 = (int)float_1;
	MOVF       _float_1+0, 0
	MOVWF      R0+0
	MOVF       _float_1+1, 0
	MOVWF      R0+1
	MOVF       _float_1+2, 0
	MOVWF      R0+2
	MOVF       _float_1+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _int_2+0
	MOVF       R0+1, 0
	MOVWF      _int_2+1
;atxtester.c,101 :: 		if ( (int_2 > 25) || (adc_int > 1000) ){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels83
	MOVF       R0+0, 0
	SUBLW      25
L__ATXMeasureAndShowAllChanels83:
	BTFSS      STATUS+0, 0
	GOTO       L__ATXMeasureAndShowAllChanels70
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels84
	MOVF       _adc_int+0, 0
	SUBLW      232
L__ATXMeasureAndShowAllChanels84:
	BTFSS      STATUS+0, 0
	GOTO       L__ATXMeasureAndShowAllChanels70
	GOTO       L_ATXMeasureAndShowAllChanels18
L__ATXMeasureAndShowAllChanels70:
;atxtester.c,102 :: 		LCDOverLoad_UIP(1,8,'I');
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_UIP_row+0
	MOVLW      8
	MOVWF      FARG_LCDOverLoad_UIP_col+0
	MOVLW      73
	MOVWF      FARG_LCDOverLoad_UIP_ch+0
	CALL       _LCDOverLoad_UIP+0
;atxtester.c,103 :: 		}
L_ATXMeasureAndShowAllChanels18:
;atxtester.c,104 :: 		CalculateFloat1Float2Power();
	CALL       _CalculateFloat1Float2Power+0
;atxtester.c,105 :: 		power_all += int_1;
	MOVF       _int_1+0, 0
	ADDWF      _power_all+0, 1
	MOVF       _int_1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _power_all+1, 1
;atxtester.c,107 :: 		if (i_p == 1){
	MOVF       _i_p+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_ATXMeasureAndShowAllChanels19
;atxtester.c,108 :: 		DisplayFloat1(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;atxtester.c,109 :: 		}
	GOTO       L_ATXMeasureAndShowAllChanels20
L_ATXMeasureAndShowAllChanels19:
;atxtester.c,112 :: 		DisplayInt1ThreeDigit(2, 5);
	MOVLW      2
	MOVWF      FARG_DisplayInt1ThreeDigit_row+0
	MOVLW      5
	MOVWF      FARG_DisplayInt1ThreeDigit_col+0
	CALL       _DisplayInt1ThreeDigit+0
;atxtester.c,113 :: 		}
L_ATXMeasureAndShowAllChanels20:
;atxtester.c,115 :: 		if ( int_1 > 125 ){
	MOVF       _int_1+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels85
	MOVF       _int_1+0, 0
	SUBLW      125
L__ATXMeasureAndShowAllChanels85:
	BTFSC      STATUS+0, 0
	GOTO       L_ATXMeasureAndShowAllChanels21
;atxtester.c,116 :: 		LCDOverLoad_UIP(1,8,'P');
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_UIP_row+0
	MOVLW      8
	MOVWF      FARG_LCDOverLoad_UIP_col+0
	MOVLW      80
	MOVWF      FARG_LCDOverLoad_UIP_ch+0
	CALL       _LCDOverLoad_UIP+0
;atxtester.c,117 :: 		}
L_ATXMeasureAndShowAllChanels21:
;atxtester.c,119 :: 		MeasureVoltage3();
	CALL       _MeasureVoltage3+0
;atxtester.c,120 :: 		int_1 = (int)float_1;
	MOVF       _float_1+0, 0
	MOVWF      R0+0
	MOVF       _float_1+1, 0
	MOVWF      R0+1
	MOVF       _float_1+2, 0
	MOVWF      R0+2
	MOVF       _float_1+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _int_1+0
	MOVF       R0+1, 0
	MOVWF      _int_1+1
;atxtester.c,121 :: 		float_2 = float_1;
	MOVF       _float_1+0, 0
	MOVWF      _float_2+0
	MOVF       _float_1+1, 0
	MOVWF      _float_2+1
	MOVF       _float_1+2, 0
	MOVWF      _float_2+2
	MOVF       _float_1+3, 0
	MOVWF      _float_2+3
;atxtester.c,123 :: 		if ( (int_1 > 21) || (adc_int > 1000) ){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels86
	MOVF       R0+0, 0
	SUBLW      21
L__ATXMeasureAndShowAllChanels86:
	BTFSS      STATUS+0, 0
	GOTO       L__ATXMeasureAndShowAllChanels69
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels87
	MOVF       _adc_int+0, 0
	SUBLW      232
L__ATXMeasureAndShowAllChanels87:
	BTFSS      STATUS+0, 0
	GOTO       L__ATXMeasureAndShowAllChanels69
	GOTO       L_ATXMeasureAndShowAllChanels24
L__ATXMeasureAndShowAllChanels69:
;atxtester.c,124 :: 		LCDOverLoad_UIP(1,13,'U');
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_UIP_row+0
	MOVLW      13
	MOVWF      FARG_LCDOverLoad_UIP_col+0
	MOVLW      85
	MOVWF      FARG_LCDOverLoad_UIP_ch+0
	CALL       _LCDOverLoad_UIP+0
;atxtester.c,125 :: 		}
	GOTO       L_ATXMeasureAndShowAllChanels25
L_ATXMeasureAndShowAllChanels24:
;atxtester.c,127 :: 		DisplayFloat1(1, 13);
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;atxtester.c,128 :: 		}
L_ATXMeasureAndShowAllChanels25:
;atxtester.c,130 :: 		MeasureCurrent3();
	CALL       _MeasureCurrent3+0
;atxtester.c,131 :: 		int_2 = (int)float_1;
	MOVF       _float_1+0, 0
	MOVWF      R0+0
	MOVF       _float_1+1, 0
	MOVWF      R0+1
	MOVF       _float_1+2, 0
	MOVWF      R0+2
	MOVF       _float_1+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _int_2+0
	MOVF       R0+1, 0
	MOVWF      _int_2+1
;atxtester.c,132 :: 		if ( (int_2 > 25) || (adc_int > 1000) ){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels88
	MOVF       R0+0, 0
	SUBLW      25
L__ATXMeasureAndShowAllChanels88:
	BTFSS      STATUS+0, 0
	GOTO       L__ATXMeasureAndShowAllChanels68
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels89
	MOVF       _adc_int+0, 0
	SUBLW      232
L__ATXMeasureAndShowAllChanels89:
	BTFSS      STATUS+0, 0
	GOTO       L__ATXMeasureAndShowAllChanels68
	GOTO       L_ATXMeasureAndShowAllChanels28
L__ATXMeasureAndShowAllChanels68:
;atxtester.c,133 :: 		LCDOverLoad_UIP(1,13,'I');
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_UIP_row+0
	MOVLW      13
	MOVWF      FARG_LCDOverLoad_UIP_col+0
	MOVLW      73
	MOVWF      FARG_LCDOverLoad_UIP_ch+0
	CALL       _LCDOverLoad_UIP+0
;atxtester.c,134 :: 		}
L_ATXMeasureAndShowAllChanels28:
;atxtester.c,135 :: 		CalculateFloat1Float2Power();
	CALL       _CalculateFloat1Float2Power+0
;atxtester.c,136 :: 		power_all += int_1;
	MOVF       _int_1+0, 0
	ADDWF      _power_all+0, 1
	MOVF       _int_1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _power_all+1, 1
;atxtester.c,138 :: 		if (i_p == 1){
	MOVF       _i_p+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_ATXMeasureAndShowAllChanels29
;atxtester.c,139 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;atxtester.c,140 :: 		}
	GOTO       L_ATXMeasureAndShowAllChanels30
L_ATXMeasureAndShowAllChanels29:
;atxtester.c,143 :: 		DisplayInt1ThreeDigit(2, 9);
	MOVLW      2
	MOVWF      FARG_DisplayInt1ThreeDigit_row+0
	MOVLW      9
	MOVWF      FARG_DisplayInt1ThreeDigit_col+0
	CALL       _DisplayInt1ThreeDigit+0
;atxtester.c,144 :: 		}
L_ATXMeasureAndShowAllChanels30:
;atxtester.c,146 :: 		if ( int_1 > 100 ){
	MOVF       _int_1+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__ATXMeasureAndShowAllChanels90
	MOVF       _int_1+0, 0
	SUBLW      100
L__ATXMeasureAndShowAllChanels90:
	BTFSC      STATUS+0, 0
	GOTO       L_ATXMeasureAndShowAllChanels31
;atxtester.c,147 :: 		LCDOverLoad_UIP(1,13,'P');
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_UIP_row+0
	MOVLW      13
	MOVWF      FARG_LCDOverLoad_UIP_col+0
	MOVLW      80
	MOVWF      FARG_LCDOverLoad_UIP_ch+0
	CALL       _LCDOverLoad_UIP+0
;atxtester.c,148 :: 		}
L_ATXMeasureAndShowAllChanels31:
;atxtester.c,150 :: 		if (i_p == 0){
	MOVF       _i_p+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_ATXMeasureAndShowAllChanels32
;atxtester.c,151 :: 		int_1 = power_all;
	MOVF       _power_all+0, 0
	MOVWF      _int_1+0
	MOVF       _power_all+1, 0
	MOVWF      _int_1+1
;atxtester.c,152 :: 		DisplayInt1ThreeDigit(2, 14);
	MOVLW      2
	MOVWF      FARG_DisplayInt1ThreeDigit_row+0
	MOVLW      14
	MOVWF      FARG_DisplayInt1ThreeDigit_col+0
	CALL       _DisplayInt1ThreeDigit+0
;atxtester.c,153 :: 		}
L_ATXMeasureAndShowAllChanels32:
;atxtester.c,154 :: 		}
L_end_ATXMeasureAndShowAllChanels:
	RETURN
; end of _ATXMeasureAndShowAllChanels

_DoATXTester:

;atxtester.c,156 :: 		void DoATXTester(){
;atxtester.c,157 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;atxtester.c,158 :: 		on_off = 0;
	CLRF       _on_off+0
;atxtester.c,159 :: 		i_p = 1;
	MOVLW      1
	MOVWF      _i_p+0
;atxtester.c,160 :: 		PORTA.B4 = 1;
	BSF        PORTA+0, 4
;atxtester.c,161 :: 		PORTC.RC0 = 0;
	BCF        PORTC+0, 0
;atxtester.c,162 :: 		PORTC.RC1 = 0;
	BCF        PORTC+0, 1
;atxtester.c,163 :: 		PORTC.RC2 = 0;
	BCF        PORTC+0, 2
;atxtester.c,165 :: 		start_:;
___DoATXTester_start_:
;atxtester.c,166 :: 		do{
L_DoATXTester33:
;atxtester.c,167 :: 		Show5VSBandPG();
	CALL       _Show5VSBandPG+0
;atxtester.c,168 :: 		if (on_off == 1){
	MOVF       _on_off+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester36
;atxtester.c,169 :: 		LCDWriteFromROM(2,14,s_ON);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      14
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_ON+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_ON+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;atxtester.c,170 :: 		}
	GOTO       L_DoATXTester37
L_DoATXTester36:
;atxtester.c,172 :: 		LCDWriteFromROM(2,14,s_OFF);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      14
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_OFF+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_OFF+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;atxtester.c,173 :: 		}
L_DoATXTester37:
;atxtester.c,174 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;atxtester.c,176 :: 		short_1 = GetKeyNormal();
	CALL       _GetKeyNormal+0
	MOVF       R0+0, 0
	MOVWF      _short_1+0
;atxtester.c,180 :: 		if (short_1 == key_up){
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester38
;atxtester.c,181 :: 		}
L_DoATXTester38:
;atxtester.c,183 :: 		if (short_1 == key_up_long){
	MOVF       _short_1+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester39
;atxtester.c,184 :: 		goto end_;
	GOTO       ___DoATXTester_end_
;atxtester.c,185 :: 		}
L_DoATXTester39:
;atxtester.c,187 :: 		else if (short_1 == key_down){
	MOVF       _short_1+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester41
;atxtester.c,188 :: 		goto next1;
	GOTO       ___DoATXTester_next1
;atxtester.c,189 :: 		}
L_DoATXTester41:
;atxtester.c,191 :: 		else if (short_1 == key_select){
	MOVF       _short_1+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester43
;atxtester.c,192 :: 		if (on_off == 0){
	MOVF       _on_off+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester44
;atxtester.c,193 :: 		on_off = 1;
	MOVLW      1
	MOVWF      _on_off+0
;atxtester.c,194 :: 		PORTA.B4 = 0;
	BCF        PORTA+0, 4
;atxtester.c,195 :: 		}
	GOTO       L_DoATXTester45
L_DoATXTester44:
;atxtester.c,197 :: 		on_off = 0;
	CLRF       _on_off+0
;atxtester.c,198 :: 		PORTA.B4 = 1;
	BSF        PORTA+0, 4
;atxtester.c,199 :: 		}
L_DoATXTester45:
;atxtester.c,200 :: 		}
	GOTO       L_DoATXTester46
L_DoATXTester43:
;atxtester.c,202 :: 		else if (short_1 == key_select_long){
	MOVF       _short_1+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester47
;atxtester.c,203 :: 		}
L_DoATXTester47:
L_DoATXTester46:
;atxtester.c,204 :: 		}while(1);
	GOTO       L_DoATXTester33
;atxtester.c,206 :: 		next1:;
___DoATXTester_next1:
;atxtester.c,207 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;atxtester.c,208 :: 		do{
L_DoATXTester48:
;atxtester.c,209 :: 		ATXMeasureAndShowAllChanels();
	CALL       _ATXMeasureAndShowAllChanels+0
;atxtester.c,212 :: 		if (on_off == 1){
	MOVF       _on_off+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester51
;atxtester.c,213 :: 		Lcd_Chr(1, 6, '^');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      94
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;atxtester.c,214 :: 		}
	GOTO       L_DoATXTester52
L_DoATXTester51:
;atxtester.c,217 :: 		Lcd_Chr(1, 6, '_');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      95
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;atxtester.c,218 :: 		}
L_DoATXTester52:
;atxtester.c,220 :: 		PlaySound_500_50();
	CALL       _PlaySound_500_50+0
;atxtester.c,221 :: 		Delay_10ms();
	CALL       _Delay_10ms+0
;atxtester.c,223 :: 		short_1 = GetKeyNormal();
	CALL       _GetKeyNormal+0
	MOVF       R0+0, 0
	MOVWF      _short_1+0
;atxtester.c,226 :: 		if (short_1 == key_up){
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester53
;atxtester.c,227 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;atxtester.c,228 :: 		goto start_;
	GOTO       ___DoATXTester_start_
;atxtester.c,229 :: 		}
L_DoATXTester53:
;atxtester.c,231 :: 		else if (short_1 == key_up_long){
	MOVF       _short_1+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester55
;atxtester.c,232 :: 		goto end_;
	GOTO       ___DoATXTester_end_
;atxtester.c,233 :: 		}
L_DoATXTester55:
;atxtester.c,235 :: 		else if (short_1 == key_down){
	MOVF       _short_1+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester57
;atxtester.c,236 :: 		if (i_p == 0){
	MOVF       _i_p+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester58
;atxtester.c,237 :: 		i_p = 1;
	MOVLW      1
	MOVWF      _i_p+0
;atxtester.c,238 :: 		}
	GOTO       L_DoATXTester59
L_DoATXTester58:
;atxtester.c,240 :: 		i_p = 0;
	CLRF       _i_p+0
;atxtester.c,241 :: 		}
L_DoATXTester59:
;atxtester.c,242 :: 		dyn_mode_flag.B0 = 1;
	BSF        _dyn_mode_flag+0, 0
;atxtester.c,243 :: 		}
	GOTO       L_DoATXTester60
L_DoATXTester57:
;atxtester.c,245 :: 		else if (short_1 == key_down_long){
	MOVF       _short_1+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester61
;atxtester.c,246 :: 		}
	GOTO       L_DoATXTester62
L_DoATXTester61:
;atxtester.c,248 :: 		else if (short_1 == key_select_long){
	MOVF       _short_1+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester63
;atxtester.c,249 :: 		}
	GOTO       L_DoATXTester64
L_DoATXTester63:
;atxtester.c,251 :: 		else if (short_1 == key_select){
	MOVF       _short_1+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester65
;atxtester.c,252 :: 		if (on_off == 0){
	MOVF       _on_off+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DoATXTester66
;atxtester.c,253 :: 		on_off = 1;
	MOVLW      1
	MOVWF      _on_off+0
;atxtester.c,254 :: 		PORTA.B4 = 0;
	BCF        PORTA+0, 4
;atxtester.c,255 :: 		}
	GOTO       L_DoATXTester67
L_DoATXTester66:
;atxtester.c,257 :: 		on_off = 0;
	CLRF       _on_off+0
;atxtester.c,258 :: 		PORTA.B4 = 1;
	BSF        PORTA+0, 4
;atxtester.c,259 :: 		}
L_DoATXTester67:
;atxtester.c,260 :: 		}
L_DoATXTester65:
L_DoATXTester64:
L_DoATXTester62:
L_DoATXTester60:
;atxtester.c,261 :: 		}while(1);
	GOTO       L_DoATXTester48
;atxtester.c,263 :: 		end_:;
___DoATXTester_end_:
;atxtester.c,264 :: 		LCDWriteFromROM(1,1, s_SelectMode);
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_SelectMode+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_SelectMode+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;atxtester.c,265 :: 		LCDShowStringFromEEPROM(2, 8 + mode1); //
	MOVLW      2
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVF       _mode1+0, 0
	ADDLW      8
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;atxtester.c,266 :: 		}
L_end_DoATXTester:
	RETURN
; end of _DoATXTester
