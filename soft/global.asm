
_CalculateFloat1Float2Power:

;global.c,50 :: 		void CalculateFloat1Float2Power(){
;global.c,51 :: 		float_2 *= float_1;
	MOVF       _float_2+0, 0
	MOVWF      R0+0
	MOVF       _float_2+1, 0
	MOVWF      R0+1
	MOVF       _float_2+2, 0
	MOVWF      R0+2
	MOVF       _float_2+3, 0
	MOVWF      R0+3
	MOVF       _float_1+0, 0
	MOVWF      R4+0
	MOVF       _float_1+1, 0
	MOVWF      R4+1
	MOVF       _float_1+2, 0
	MOVWF      R4+2
	MOVF       _float_1+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _float_2+0
	MOVF       R0+1, 0
	MOVWF      _float_2+1
	MOVF       R0+2, 0
	MOVWF      _float_2+2
	MOVF       R0+3, 0
	MOVWF      _float_2+3
;global.c,52 :: 		int_1 = (int)float_2;
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _int_1+0
	MOVF       R0+1, 0
	MOVWF      _int_1+1
;global.c,53 :: 		}
L_end_CalculateFloat1Float2Power:
	RETURN
; end of _CalculateFloat1Float2Power

_CalculateFloat1ADC:

;global.c,55 :: 		void CalculateFloat1ADC(){
;global.c,56 :: 		float_1 = adc_float / k_can;
	MOVF       _k_can+0, 0
	MOVWF      R4+0
	MOVF       _k_can+1, 0
	MOVWF      R4+1
	MOVF       _k_can+2, 0
	MOVWF      R4+2
	MOVF       _k_can+3, 0
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
;global.c,57 :: 		}
L_end_CalculateFloat1ADC:
	RETURN
; end of _CalculateFloat1ADC

_MeasureVoltage1:

;global.c,59 :: 		void MeasureVoltage1(){
;global.c,60 :: 		PORTC.RC6 = 0;
	BCF        PORTC+0, 6
;global.c,61 :: 		PORTC.RC7 = 0;
	BCF        PORTC+0, 7
;global.c,62 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x0c);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      12
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,63 :: 		GetADCValue(1);
	MOVLW      1
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;global.c,64 :: 		if (adc_int > 950) {
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureVoltage195
	MOVF       _adc_int+0, 0
	SUBLW      182
L__MeasureVoltage195:
	BTFSC      STATUS+0, 0
	GOTO       L_MeasureVoltage10
;global.c,65 :: 		PORTC.RC6 = 0;
	BCF        PORTC+0, 6
;global.c,66 :: 		PORTC.RC7 = 1;
	BSF        PORTC+0, 7
;global.c,67 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x10);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      16
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,68 :: 		GetADCValue(1);
	MOVLW      1
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;global.c,69 :: 		if (adc_int > 950) {
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureVoltage196
	MOVF       _adc_int+0, 0
	SUBLW      182
L__MeasureVoltage196:
	BTFSC      STATUS+0, 0
	GOTO       L_MeasureVoltage11
;global.c,70 :: 		PORTC.RC6 = 1;
	BSF        PORTC+0, 6
;global.c,71 :: 		PORTC.RC7 = 0;
	BCF        PORTC+0, 7
;global.c,72 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x14);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      20
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,73 :: 		GetADCValue(1);
	MOVLW      1
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;global.c,74 :: 		}
L_MeasureVoltage11:
;global.c,75 :: 		}
L_MeasureVoltage10:
;global.c,76 :: 		CalculateFloat1ADC();
	CALL       _CalculateFloat1ADC+0
;global.c,77 :: 		}
L_end_MeasureVoltage1:
	RETURN
; end of _MeasureVoltage1

_MeasureCurrent1:

;global.c,79 :: 		void MeasureCurrent1(){
;global.c,80 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x30);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      48
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,81 :: 		GetADCValue(0);
	CLRF       FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;global.c,82 :: 		CalculateFloat1ADC();
	CALL       _CalculateFloat1ADC+0
;global.c,83 :: 		}
L_end_MeasureCurrent1:
	RETURN
; end of _MeasureCurrent1

_MeasureVoltage2:

;global.c,85 :: 		void MeasureVoltage2(){
;global.c,86 :: 		PORTC.RC4 = 0;
	BCF        PORTC+0, 4
;global.c,87 :: 		PORTC.RC5 = 0;
	BCF        PORTC+0, 5
;global.c,88 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x18);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      24
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,89 :: 		GetADCValue(2);
	MOVLW      2
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;global.c,90 :: 		if (adc_int > 950) {
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureVoltage299
	MOVF       _adc_int+0, 0
	SUBLW      182
L__MeasureVoltage299:
	BTFSC      STATUS+0, 0
	GOTO       L_MeasureVoltage22
;global.c,91 :: 		PORTC.RC4 = 0;
	BCF        PORTC+0, 4
;global.c,92 :: 		PORTC.RC5 = 1;
	BSF        PORTC+0, 5
;global.c,93 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x1c);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      28
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,94 :: 		GetADCValue(2);
	MOVLW      2
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;global.c,95 :: 		if (adc_int > 950) {
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureVoltage2100
	MOVF       _adc_int+0, 0
	SUBLW      182
L__MeasureVoltage2100:
	BTFSC      STATUS+0, 0
	GOTO       L_MeasureVoltage23
;global.c,96 :: 		PORTC.RC4 = 1;
	BSF        PORTC+0, 4
;global.c,97 :: 		PORTC.RC5 = 0;
	BCF        PORTC+0, 5
;global.c,98 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x20);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      32
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,99 :: 		GetADCValue(2);
	MOVLW      2
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;global.c,100 :: 		}
L_MeasureVoltage23:
;global.c,101 :: 		}
L_MeasureVoltage22:
;global.c,102 :: 		CalculateFloat1ADC();
	CALL       _CalculateFloat1ADC+0
;global.c,103 :: 		}
L_end_MeasureVoltage2:
	RETURN
; end of _MeasureVoltage2

_MeasureCurrent2:

;global.c,105 :: 		void MeasureCurrent2(){
;global.c,106 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x34);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      52
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,107 :: 		GetADCValue(3);
	MOVLW      3
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;global.c,108 :: 		CalculateFloat1ADC();
	CALL       _CalculateFloat1ADC+0
;global.c,109 :: 		}
L_end_MeasureCurrent2:
	RETURN
; end of _MeasureCurrent2

_MeasureVoltage3:

;global.c,111 :: 		void MeasureVoltage3(){
;global.c,112 :: 		PORTD.RD2 = 0;
	BCF        PORTD+0, 2
;global.c,113 :: 		PORTD.RD3 = 0;
	BCF        PORTD+0, 3
;global.c,114 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x24);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      36
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,115 :: 		GetADCValue(4);
	MOVLW      4
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;global.c,116 :: 		if (adc_int > 950) {
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureVoltage3103
	MOVF       _adc_int+0, 0
	SUBLW      182
L__MeasureVoltage3103:
	BTFSC      STATUS+0, 0
	GOTO       L_MeasureVoltage34
;global.c,117 :: 		PORTD.RD2 = 0;
	BCF        PORTD+0, 2
;global.c,118 :: 		PORTD.RD3 = 1;
	BSF        PORTD+0, 3
;global.c,119 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x28);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      40
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,120 :: 		GetADCValue(4);
	MOVLW      4
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;global.c,121 :: 		if (adc_int > 950) {
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureVoltage3104
	MOVF       _adc_int+0, 0
	SUBLW      182
L__MeasureVoltage3104:
	BTFSC      STATUS+0, 0
	GOTO       L_MeasureVoltage35
;global.c,122 :: 		PORTD.RD2 = 1;
	BSF        PORTD+0, 2
;global.c,123 :: 		PORTD.RD3 = 0;
	BCF        PORTD+0, 3
;global.c,124 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x2c);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      44
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,125 :: 		GetADCValue(4);
	MOVLW      4
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;global.c,126 :: 		}
L_MeasureVoltage35:
;global.c,127 :: 		}
L_MeasureVoltage34:
;global.c,128 :: 		CalculateFloat1ADC();
	CALL       _CalculateFloat1ADC+0
;global.c,129 :: 		}
L_end_MeasureVoltage3:
	RETURN
; end of _MeasureVoltage3

_MeasureCurrent3:

;global.c,131 :: 		void MeasureCurrent3(){
;global.c,132 :: 		LoadFromEEPROMKoef((char*)&k_can, 0x38);
	MOVLW      _k_can+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      56
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,133 :: 		GetADCValue(5);
	MOVLW      5
	MOVWF      FARG_GetADCValue_canal+0
	CALL       _GetADCValue+0
;global.c,134 :: 		CalculateFloat1ADC();
	CALL       _CalculateFloat1ADC+0
;global.c,135 :: 		}
L_end_MeasureCurrent3:
	RETURN
; end of _MeasureCurrent3

_DisplayInt1ThreeDigit:

;global.c,137 :: 		void DisplayInt1ThreeDigit(short row, short col){
;global.c,138 :: 		WordToStr(int_1, txt_6);
	MOVF       _int_1+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _int_1+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _txt_6+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;global.c,139 :: 		txt_6[0] = txt_6[2];
	MOVF       _txt_6+2, 0
	MOVWF      _txt_6+0
;global.c,140 :: 		txt_6[1] = txt_6[3];
	MOVF       _txt_6+3, 0
	MOVWF      _txt_6+1
;global.c,141 :: 		txt_6[2] = txt_6[4];
	MOVF       _txt_6+4, 0
	MOVWF      _txt_6+2
;global.c,142 :: 		txt_6[3] = 0;
	CLRF       _txt_6+3
;global.c,143 :: 		Lcd_Out(row, col, txt_6);
	MOVF       FARG_DisplayInt1ThreeDigit_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_DisplayInt1ThreeDigit_col+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt_6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;global.c,144 :: 		}
L_end_DisplayInt1ThreeDigit:
	RETURN
; end of _DisplayInt1ThreeDigit

_DisplayFloat1:

;global.c,146 :: 		void DisplayFloat1(short row, short col){
;global.c,148 :: 		Lcd_Chr(row, col, ' ');
	MOVF       FARG_DisplayFloat1_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_DisplayFloat1_col+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;global.c,149 :: 		for (counter = 0; counter < 4; counter++){
	CLRF       _counter+0
L_DisplayFloat16:
	MOVLW      128
	XORWF      _counter+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_DisplayFloat17
;global.c,150 :: 		Lcd_Chr_CP(' ');
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;global.c,149 :: 		for (counter = 0; counter < 4; counter++){
	INCF       _counter+0, 1
;global.c,151 :: 		}
	GOTO       L_DisplayFloat16
L_DisplayFloat17:
;global.c,152 :: 		FloatToStr(float_1, txt_6);
	MOVF       _float_1+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       _float_1+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       _float_1+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       _float_1+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _txt_6+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;global.c,154 :: 		if (float_1 < 0.01){
	MOVLW      10
	MOVWF      R4+0
	MOVLW      215
	MOVWF      R4+1
	MOVLW      35
	MOVWF      R4+2
	MOVLW      120
	MOVWF      R4+3
	MOVF       _float_1+0, 0
	MOVWF      R0+0
	MOVF       _float_1+1, 0
	MOVWF      R0+1
	MOVF       _float_1+2, 0
	MOVWF      R0+2
	MOVF       _float_1+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_DisplayFloat19
;global.c,155 :: 		txt_6[0] = '0';
	MOVLW      48
	MOVWF      _txt_6+0
;global.c,156 :: 		txt_6[1] = '.';
	MOVLW      46
	MOVWF      _txt_6+1
;global.c,157 :: 		txt_6[2] = '0';
	MOVLW      48
	MOVWF      _txt_6+2
;global.c,158 :: 		txt_6[3] = '0';
	MOVLW      48
	MOVWF      _txt_6+3
;global.c,159 :: 		}
	GOTO       L_DisplayFloat110
L_DisplayFloat19:
;global.c,161 :: 		else if (float_1 < 0.1){
	MOVLW      205
	MOVWF      R4+0
	MOVLW      204
	MOVWF      R4+1
	MOVLW      76
	MOVWF      R4+2
	MOVLW      123
	MOVWF      R4+3
	MOVF       _float_1+0, 0
	MOVWF      R0+0
	MOVF       _float_1+1, 0
	MOVWF      R0+1
	MOVF       _float_1+2, 0
	MOVWF      R0+2
	MOVF       _float_1+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_DisplayFloat111
;global.c,162 :: 		Lo(adc_in) = txt_6[0];
	MOVF       _txt_6+0, 0
	MOVWF      _adc_in+0
;global.c,163 :: 		txt_6[0] = '0';
	MOVLW      48
	MOVWF      _txt_6+0
;global.c,164 :: 		txt_6[1] = '.';
	MOVLW      46
	MOVWF      _txt_6+1
;global.c,165 :: 		txt_6[2] = '0';
	MOVLW      48
	MOVWF      _txt_6+2
;global.c,166 :: 		txt_6[3] = Lo(adc_in);
	MOVF       _adc_in+0, 0
	MOVWF      _txt_6+3
;global.c,167 :: 		}
	GOTO       L_DisplayFloat112
L_DisplayFloat111:
;global.c,169 :: 		else if (float_1 < 1.0){
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	MOVF       _float_1+0, 0
	MOVWF      R0+0
	MOVF       _float_1+1, 0
	MOVWF      R0+1
	MOVF       _float_1+2, 0
	MOVWF      R0+2
	MOVF       _float_1+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_DisplayFloat113
;global.c,170 :: 		Hi(adc_in) = txt_6[0];
	MOVF       _txt_6+0, 0
	MOVWF      _adc_in+1
;global.c,171 :: 		Lo(adc_in) = txt_6[2];
	MOVF       _txt_6+2, 0
	MOVWF      _adc_in+0
;global.c,172 :: 		txt_6[0] = '0';
	MOVLW      48
	MOVWF      _txt_6+0
;global.c,173 :: 		txt_6[1] = '.';
	MOVLW      46
	MOVWF      _txt_6+1
;global.c,174 :: 		txt_6[2] = Hi(adc_in);
	MOVF       _adc_in+1, 0
	MOVWF      _txt_6+2
;global.c,175 :: 		txt_6[3] = Lo(adc_in);
	MOVF       _adc_in+0, 0
	MOVWF      _txt_6+3
;global.c,176 :: 		}
	GOTO       L_DisplayFloat114
L_DisplayFloat113:
;global.c,179 :: 		}
L_DisplayFloat114:
L_DisplayFloat112:
L_DisplayFloat110:
;global.c,180 :: 		txt_6[4] = 0;
	CLRF       _txt_6+4
;global.c,181 :: 		Lcd_Out(row, col, txt_6);
	MOVF       FARG_DisplayFloat1_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_DisplayFloat1_col+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt_6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;global.c,182 :: 		}
L_end_DisplayFloat1:
	RETURN
; end of _DisplayFloat1

_SaveToEEPROMKoef:

;global.c,184 :: 		void SaveToEEPROMKoef(char *p1, short b1){
;global.c,186 :: 		for (short_1 = 0; short_1 < 4; short_1++){
	CLRF       _short_1+0
L_SaveToEEPROMKoef15:
	MOVLW      128
	XORWF      _short_1+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_SaveToEEPROMKoef16
;global.c,187 :: 		EEPROM_Write(b1 ++, *p1);
	MOVF       FARG_SaveToEEPROMKoef_b1+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       FARG_SaveToEEPROMKoef_p1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	INCF       FARG_SaveToEEPROMKoef_b1+0, 1
;global.c,188 :: 		Delay_10ms();
	CALL       _Delay_10ms+0
;global.c,189 :: 		Delay_10ms();
	CALL       _Delay_10ms+0
;global.c,190 :: 		p1++;
	INCF       FARG_SaveToEEPROMKoef_p1+0, 1
;global.c,186 :: 		for (short_1 = 0; short_1 < 4; short_1++){
	INCF       _short_1+0, 1
;global.c,191 :: 		}
	GOTO       L_SaveToEEPROMKoef15
L_SaveToEEPROMKoef16:
;global.c,192 :: 		}
L_end_SaveToEEPROMKoef:
	RETURN
; end of _SaveToEEPROMKoef

_LoadFromEEPROMKoef:

;global.c,194 :: 		void LoadFromEEPROMKoef(char *p1, short b1){
;global.c,196 :: 		for (short_1 = 0; short_1 < 4; short_1++){
	CLRF       _short_1+0
L_LoadFromEEPROMKoef18:
	MOVLW      128
	XORWF      _short_1+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_LoadFromEEPROMKoef19
;global.c,197 :: 		*p1 = EEPROM_Read(b1 ++);
	MOVF       FARG_LoadFromEEPROMKoef_b1+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       FARG_LoadFromEEPROMKoef_p1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FARG_LoadFromEEPROMKoef_b1+0, 1
;global.c,198 :: 		Delay_10ms();
	CALL       _Delay_10ms+0
;global.c,199 :: 		p1++;
	INCF       FARG_LoadFromEEPROMKoef_p1+0, 1
;global.c,196 :: 		for (short_1 = 0; short_1 < 4; short_1++){
	INCF       _short_1+0, 1
;global.c,200 :: 		}
	GOTO       L_LoadFromEEPROMKoef18
L_LoadFromEEPROMKoef19:
;global.c,201 :: 		}
L_end_LoadFromEEPROMKoef:
	RETURN
; end of _LoadFromEEPROMKoef

_LoadFromEEPROMBaseKoef:

;global.c,203 :: 		void LoadFromEEPROMBaseKoef(){
;global.c,204 :: 		LoadFromEEPROMKoef((char*)&k_adc, 0x00);
	MOVLW      _k_adc+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	CLRF       FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,205 :: 		LoadFromEEPROMKoef((char*)&k_5vsb, 0x04);
	MOVLW      _k_5vsb+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      4
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,206 :: 		LoadFromEEPROMKoef((char*)&k_pg, 0x08);
	MOVLW      _k_pg+0
	MOVWF      FARG_LoadFromEEPROMKoef_p1+0
	MOVLW      8
	MOVWF      FARG_LoadFromEEPROMKoef_b1+0
	CALL       _LoadFromEEPROMKoef+0
;global.c,207 :: 		}
L_end_LoadFromEEPROMBaseKoef:
	RETURN
; end of _LoadFromEEPROMBaseKoef

_GetADCValue:

;global.c,209 :: 		void GetADCValue(short canal){
;global.c,211 :: 		ADCON0.CHS2 = 0;  ADCON0.CHS1 = 0;  ADCON0.CHS0 = 0;
	BCF        ADCON0+0, 5
	BCF        ADCON0+0, 4
	BCF        ADCON0+0, 3
;global.c,212 :: 		switch(canal){
	GOTO       L_GetADCValue21
;global.c,213 :: 		case 0:
L_GetADCValue23:
;global.c,214 :: 		break;
	GOTO       L_GetADCValue22
;global.c,215 :: 		case 1:
L_GetADCValue24:
;global.c,216 :: 		ADCON0.CHS0 = 1;
	BSF        ADCON0+0, 3
;global.c,217 :: 		break;
	GOTO       L_GetADCValue22
;global.c,218 :: 		case 2:
L_GetADCValue25:
;global.c,219 :: 		ADCON0.CHS1 = 1;
	BSF        ADCON0+0, 4
;global.c,220 :: 		break;
	GOTO       L_GetADCValue22
;global.c,221 :: 		case 3:
L_GetADCValue26:
;global.c,222 :: 		ADCON0.CHS1 = 1;  ADCON0.CHS0 = 1;
	BSF        ADCON0+0, 4
	BSF        ADCON0+0, 3
;global.c,223 :: 		break;
	GOTO       L_GetADCValue22
;global.c,224 :: 		case 4:
L_GetADCValue27:
;global.c,225 :: 		ADCON0.CHS2 = 1;
	BSF        ADCON0+0, 5
;global.c,226 :: 		break;
	GOTO       L_GetADCValue22
;global.c,227 :: 		case 5:
L_GetADCValue28:
;global.c,228 :: 		ADCON0.CHS2 = 1;  ADCON0.CHS0 = 1;
	BSF        ADCON0+0, 5
	BSF        ADCON0+0, 3
;global.c,229 :: 		break;
	GOTO       L_GetADCValue22
;global.c,230 :: 		case 6:
L_GetADCValue29:
;global.c,231 :: 		ADCON0.CHS2 = 1;  ADCON0.CHS1 = 1;
	BSF        ADCON0+0, 5
	BSF        ADCON0+0, 4
;global.c,232 :: 		break;
	GOTO       L_GetADCValue22
;global.c,233 :: 		case 7:
L_GetADCValue30:
;global.c,234 :: 		ADCON0.CHS2 = 1;  ADCON0.CHS1 = 1;  ADCON0.CHS0 = 1;
	BSF        ADCON0+0, 5
	BSF        ADCON0+0, 4
	BSF        ADCON0+0, 3
;global.c,235 :: 		break;
	GOTO       L_GetADCValue22
;global.c,236 :: 		}
L_GetADCValue21:
	MOVF       FARG_GetADCValue_canal+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_GetADCValue23
	MOVF       FARG_GetADCValue_canal+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_GetADCValue24
	MOVF       FARG_GetADCValue_canal+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_GetADCValue25
	MOVF       FARG_GetADCValue_canal+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_GetADCValue26
	MOVF       FARG_GetADCValue_canal+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_GetADCValue27
	MOVF       FARG_GetADCValue_canal+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_GetADCValue28
	MOVF       FARG_GetADCValue_canal+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_GetADCValue29
	MOVF       FARG_GetADCValue_canal+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_GetADCValue30
L_GetADCValue22:
;global.c,237 :: 		adc_int = 0;
	CLRF       _adc_int+0
	CLRF       _adc_int+1
;global.c,238 :: 		short_1 = 32;
	MOVLW      32
	MOVWF      _short_1+0
;global.c,239 :: 		do{
L_GetADCValue31:
;global.c,240 :: 		Delay_22us();
	CALL       _Delay_22us+0
;global.c,241 :: 		ADCON0.GO = 1;
	BSF        ADCON0+0, 2
;global.c,242 :: 		do{
L_GetADCValue34:
;global.c,243 :: 		}while(ADCON0.GO == 1);
	BTFSC      ADCON0+0, 2
	GOTO       L_GetADCValue34
;global.c,245 :: 		Lo(adc_in) = ADRESL;
	MOVF       ADRESL+0, 0
	MOVWF      _adc_in+0
;global.c,246 :: 		Hi(adc_in) = ADRESH;
	MOVF       ADRESH+0, 0
	MOVWF      _adc_in+1
;global.c,247 :: 		adc_int += adc_in;
	MOVF       _adc_in+0, 0
	ADDWF      _adc_int+0, 1
	MOVF       _adc_in+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _adc_int+1, 1
;global.c,248 :: 		}while( --short_1 > 0);
	DECF       _short_1+0, 1
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _short_1+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_GetADCValue31
;global.c,251 :: 		adc_int /= 32;
	MOVLW      5
	MOVWF      R2+0
	MOVF       _adc_int+0, 0
	MOVWF      R0+0
	MOVF       _adc_int+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__GetADCValue112:
	BTFSC      STATUS+0, 2
	GOTO       L__GetADCValue113
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__GetADCValue112
L__GetADCValue113:
	MOVF       R0+0, 0
	MOVWF      _adc_int+0
	MOVF       R0+1, 0
	MOVWF      _adc_int+1
;global.c,253 :: 		adc_float = adc_int * k_adc;
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
	MOVF       R0+0, 0
	MOVWF      _adc_float+0
	MOVF       R0+1, 0
	MOVWF      _adc_float+1
	MOVF       R0+2, 0
	MOVWF      _adc_float+2
	MOVF       R0+3, 0
	MOVWF      _adc_float+3
;global.c,254 :: 		}
L_end_GetADCValue:
	RETURN
; end of _GetADCValue

_LCDShowStringFromEEPROM:

;global.c,256 :: 		void LCDShowStringFromEEPROM(char lcd_row, char num){
;global.c,258 :: 		num *= 16;
	RLF        FARG_LCDShowStringFromEEPROM_num+0, 1
	BCF        FARG_LCDShowStringFromEEPROM_num+0, 0
	RLF        FARG_LCDShowStringFromEEPROM_num+0, 1
	BCF        FARG_LCDShowStringFromEEPROM_num+0, 0
	RLF        FARG_LCDShowStringFromEEPROM_num+0, 1
	BCF        FARG_LCDShowStringFromEEPROM_num+0, 0
	RLF        FARG_LCDShowStringFromEEPROM_num+0, 1
	BCF        FARG_LCDShowStringFromEEPROM_num+0, 0
;global.c,259 :: 		for (short_1 = 0; short_1 < 16; short_1++){
	CLRF       _short_1+0
L_LCDShowStringFromEEPROM37:
	MOVLW      128
	XORWF      _short_1+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      16
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_LCDShowStringFromEEPROM38
;global.c,260 :: 		txt_19[short_1] = EEPROM_Read(num + short_1);
	MOVF       _short_1+0, 0
	ADDLW      _txt_19+0
	MOVWF      FLOC__LCDShowStringFromEEPROM+0
	MOVF       _short_1+0, 0
	ADDWF      FARG_LCDShowStringFromEEPROM_num+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       FLOC__LCDShowStringFromEEPROM+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;global.c,259 :: 		for (short_1 = 0; short_1 < 16; short_1++){
	INCF       _short_1+0, 1
;global.c,261 :: 		}
	GOTO       L_LCDShowStringFromEEPROM37
L_LCDShowStringFromEEPROM38:
;global.c,262 :: 		txt_19[16] = 0;
	CLRF       _txt_19+16
;global.c,263 :: 		Lcd_Out(lcd_row, 1, txt_19);
	MOVF       FARG_LCDShowStringFromEEPROM_lcd_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt_19+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;global.c,264 :: 		}
L_end_LCDShowStringFromEEPROM:
	RETURN
; end of _LCDShowStringFromEEPROM

_InitPic:

;global.c,266 :: 		void InitPic(){
;global.c,267 :: 		INTCON = 0;
	CLRF       INTCON+0
;global.c,276 :: 		OPTION_REG = 0b00001000;
	MOVLW      8
	MOVWF      OPTION_REG+0
;global.c,287 :: 		PIE1 = 0;
	CLRF       PIE1+0
;global.c,297 :: 		PIE2 = 0;
	CLRF       PIE2+0
;global.c,298 :: 		TRISA = 0b11101111;
	MOVLW      239
	MOVWF      TRISA+0
;global.c,300 :: 		PORTA.F4 = 1;
	BSF        PORTA+0, 4
;global.c,301 :: 		TRISB = 0b11111110;
	MOVLW      254
	MOVWF      TRISB+0
;global.c,302 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;global.c,303 :: 		TRISD = 0b00000000;
	CLRF       TRISD+0
;global.c,304 :: 		TRISE = 0b11101111;
	MOVLW      239
	MOVWF      TRISE+0
;global.c,306 :: 		T1CON.TMR1ON = 0;
	BCF        T1CON+0, 0
;global.c,307 :: 		T2CON.TMR2ON = 0;
	BCF        T2CON+0, 2
;global.c,308 :: 		ADCON0.ADON = 0;
	BCF        ADCON0+0, 0
;global.c,309 :: 		CVRCON = 0;
	CLRF       CVRCON+0
;global.c,314 :: 		ADCON0 = 0b01000000;
	MOVLW      64
	MOVWF      ADCON0+0
;global.c,320 :: 		ADCON1 = 0b10000000;
	MOVLW      128
	MOVWF      ADCON1+0
;global.c,321 :: 		ADCON0.ADON = 1;
	BSF        ADCON0+0, 0
;global.c,323 :: 		PORTC = 0b00000000;
	CLRF       PORTC+0
;global.c,324 :: 		PORTD = 0b00000000;
	CLRF       PORTD+0
;global.c,326 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;global.c,327 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;global.c,328 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);           // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;global.c,330 :: 		Delay_10ms();
	CALL       _Delay_10ms+0
;global.c,332 :: 		}
L_end_InitPic:
	RETURN
; end of _InitPic

_LCDClearString2:

;global.c,334 :: 		void LCDClearString2(){
;global.c,335 :: 		Lcd_Chr(2, 1, ' ');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;global.c,336 :: 		for (counter = 0; counter < 15; counter++){
	CLRF       _counter+0
L_LCDClearString240:
	MOVLW      128
	XORWF      _counter+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      15
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_LCDClearString241
;global.c,337 :: 		Lcd_Chr_CP(' ');
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;global.c,336 :: 		for (counter = 0; counter < 15; counter++){
	INCF       _counter+0, 1
;global.c,338 :: 		}
	GOTO       L_LCDClearString240
L_LCDClearString241:
;global.c,339 :: 		dyn_mode_flag.B0 = 0;
	BCF        _dyn_mode_flag+0, 0
;global.c,340 :: 		}
L_end_LCDClearString2:
	RETURN
; end of _LCDClearString2

_LCDOverLoad:

;global.c,342 :: 		void LCDOverLoad(short row, short col){
;global.c,343 :: 		Lcd_Chr(row, col, 'O'); Lcd_Chr_CP('V'); Lcd_Chr_CP('E');  Lcd_Chr_CP('R');
	MOVF       FARG_LCDOverLoad_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_LCDOverLoad_col+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      79
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      86
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      69
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      82
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;global.c,344 :: 		}
L_end_LCDOverLoad:
	RETURN
; end of _LCDOverLoad

_LCDOverLoad_UIP:

;global.c,346 :: 		void LCDOverLoad_UIP(short row, short col, char ch){
;global.c,347 :: 		Lcd_Chr(row, col, '-'); Lcd_Chr_CP('-'); Lcd_Chr_CP(ch);  Lcd_Chr_CP('-');
	MOVF       FARG_LCDOverLoad_UIP_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_LCDOverLoad_UIP_col+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      45
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      45
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVF       FARG_LCDOverLoad_UIP_ch+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      45
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;global.c,348 :: 		}
L_end_LCDOverLoad_UIP:
	RETURN
; end of _LCDOverLoad_UIP

_MeasureAndShowAllChanels:

;global.c,350 :: 		void MeasureAndShowAllChanels(){
;global.c,352 :: 		if (i_p == 1){
	MOVF       _i_p+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_MeasureAndShowAllChanels43
;global.c,353 :: 		Lcd_Chr(2, 6, 'I');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      73
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;global.c,354 :: 		}
	GOTO       L_MeasureAndShowAllChanels44
L_MeasureAndShowAllChanels43:
;global.c,356 :: 		Lcd_Chr(2, 6, 'P');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      80
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;global.c,357 :: 		}
L_MeasureAndShowAllChanels44:
;global.c,359 :: 		MeasureVoltage1();
	CALL       _MeasureVoltage1+0
;global.c,360 :: 		int_1 = (int)float_1;
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
;global.c,361 :: 		float_2 = float_1;
	MOVF       _float_1+0, 0
	MOVWF      _float_2+0
	MOVF       _float_1+1, 0
	MOVWF      _float_2+1
	MOVF       _float_1+2, 0
	MOVWF      _float_2+2
	MOVF       _float_1+3, 0
	MOVWF      _float_2+3
;global.c,363 :: 		if ( (int_1 > 30) || (adc_int > 1000) ){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels120
	MOVF       R0+0, 0
	SUBLW      30
L__MeasureAndShowAllChanels120:
	BTFSS      STATUS+0, 0
	GOTO       L__MeasureAndShowAllChanels91
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels121
	MOVF       _adc_int+0, 0
	SUBLW      232
L__MeasureAndShowAllChanels121:
	BTFSS      STATUS+0, 0
	GOTO       L__MeasureAndShowAllChanels91
	GOTO       L_MeasureAndShowAllChanels47
L__MeasureAndShowAllChanels91:
;global.c,364 :: 		LCDOverLoad(1,1);
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_row+0
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_col+0
	CALL       _LCDOverLoad+0
;global.c,365 :: 		}
	GOTO       L_MeasureAndShowAllChanels48
L_MeasureAndShowAllChanels47:
;global.c,367 :: 		DisplayFloat1(1, 1);
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;global.c,368 :: 		}
L_MeasureAndShowAllChanels48:
;global.c,369 :: 		MeasureCurrent1();
	CALL       _MeasureCurrent1+0
;global.c,370 :: 		int_2 = (int)float_1;
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
;global.c,371 :: 		if ( (int_2 > 25) || (adc_int > 1000) ){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels122
	MOVF       R0+0, 0
	SUBLW      25
L__MeasureAndShowAllChanels122:
	BTFSS      STATUS+0, 0
	GOTO       L__MeasureAndShowAllChanels90
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels123
	MOVF       _adc_int+0, 0
	SUBLW      232
L__MeasureAndShowAllChanels123:
	BTFSS      STATUS+0, 0
	GOTO       L__MeasureAndShowAllChanels90
	GOTO       L_MeasureAndShowAllChanels51
L__MeasureAndShowAllChanels90:
;global.c,372 :: 		LCDOverLoad(2, 1);
	MOVLW      2
	MOVWF      FARG_LCDOverLoad_row+0
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_col+0
	CALL       _LCDOverLoad+0
;global.c,373 :: 		}
	GOTO       L_MeasureAndShowAllChanels52
L_MeasureAndShowAllChanels51:
;global.c,375 :: 		CalculateFloat1Float2Power();
	CALL       _CalculateFloat1Float2Power+0
;global.c,377 :: 		if (i_p == 1){
	MOVF       _i_p+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_MeasureAndShowAllChanels53
;global.c,378 :: 		DisplayFloat1(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;global.c,379 :: 		}
	GOTO       L_MeasureAndShowAllChanels54
L_MeasureAndShowAllChanels53:
;global.c,382 :: 		DisplayInt1ThreeDigit(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayInt1ThreeDigit_row+0
	MOVLW      1
	MOVWF      FARG_DisplayInt1ThreeDigit_col+0
	CALL       _DisplayInt1ThreeDigit+0
;global.c,383 :: 		}
L_MeasureAndShowAllChanels54:
;global.c,384 :: 		}
L_MeasureAndShowAllChanels52:
;global.c,386 :: 		if ( int_1 > 290 ){
	MOVF       _int_1+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels124
	MOVF       _int_1+0, 0
	SUBLW      34
L__MeasureAndShowAllChanels124:
	BTFSC      STATUS+0, 0
	GOTO       L_MeasureAndShowAllChanels55
;global.c,387 :: 		LCDOverLoad(1,1);
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_row+0
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_col+0
	CALL       _LCDOverLoad+0
;global.c,388 :: 		LCDOverLoad(2,1);
	MOVLW      2
	MOVWF      FARG_LCDOverLoad_row+0
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_col+0
	CALL       _LCDOverLoad+0
;global.c,389 :: 		}
L_MeasureAndShowAllChanels55:
;global.c,391 :: 		MeasureVoltage2();
	CALL       _MeasureVoltage2+0
;global.c,392 :: 		int_1 = (int)float_1;
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
;global.c,393 :: 		float_2 = float_1;
	MOVF       _float_1+0, 0
	MOVWF      _float_2+0
	MOVF       _float_1+1, 0
	MOVWF      _float_2+1
	MOVF       _float_1+2, 0
	MOVWF      _float_2+2
	MOVF       _float_1+3, 0
	MOVWF      _float_2+3
;global.c,395 :: 		if ( (int_1 > 21) || (adc_int > 1000) ){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels125
	MOVF       R0+0, 0
	SUBLW      21
L__MeasureAndShowAllChanels125:
	BTFSS      STATUS+0, 0
	GOTO       L__MeasureAndShowAllChanels89
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels126
	MOVF       _adc_int+0, 0
	SUBLW      232
L__MeasureAndShowAllChanels126:
	BTFSS      STATUS+0, 0
	GOTO       L__MeasureAndShowAllChanels89
	GOTO       L_MeasureAndShowAllChanels58
L__MeasureAndShowAllChanels89:
;global.c,396 :: 		LCDOverLoad(1, 8);
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_row+0
	MOVLW      8
	MOVWF      FARG_LCDOverLoad_col+0
	CALL       _LCDOverLoad+0
;global.c,397 :: 		}
	GOTO       L_MeasureAndShowAllChanels59
L_MeasureAndShowAllChanels58:
;global.c,399 :: 		DisplayFloat1(1, 8);
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;global.c,400 :: 		}
L_MeasureAndShowAllChanels59:
;global.c,401 :: 		MeasureCurrent2();
	CALL       _MeasureCurrent2+0
;global.c,402 :: 		int_2 = (int)float_1;
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
;global.c,403 :: 		if ( (int_2 > 25) || (adc_int > 1000) ){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels127
	MOVF       R0+0, 0
	SUBLW      25
L__MeasureAndShowAllChanels127:
	BTFSS      STATUS+0, 0
	GOTO       L__MeasureAndShowAllChanels88
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels128
	MOVF       _adc_int+0, 0
	SUBLW      232
L__MeasureAndShowAllChanels128:
	BTFSS      STATUS+0, 0
	GOTO       L__MeasureAndShowAllChanels88
	GOTO       L_MeasureAndShowAllChanels62
L__MeasureAndShowAllChanels88:
;global.c,404 :: 		LCDOverLoad(2, 8);
	MOVLW      2
	MOVWF      FARG_LCDOverLoad_row+0
	MOVLW      8
	MOVWF      FARG_LCDOverLoad_col+0
	CALL       _LCDOverLoad+0
;global.c,405 :: 		}
	GOTO       L_MeasureAndShowAllChanels63
L_MeasureAndShowAllChanels62:
;global.c,407 :: 		CalculateFloat1Float2Power();
	CALL       _CalculateFloat1Float2Power+0
;global.c,409 :: 		if (i_p == 1){
	MOVF       _i_p+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_MeasureAndShowAllChanels64
;global.c,410 :: 		DisplayFloat1(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;global.c,411 :: 		}
	GOTO       L_MeasureAndShowAllChanels65
L_MeasureAndShowAllChanels64:
;global.c,414 :: 		DisplayInt1ThreeDigit(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayInt1ThreeDigit_row+0
	MOVLW      8
	MOVWF      FARG_DisplayInt1ThreeDigit_col+0
	CALL       _DisplayInt1ThreeDigit+0
;global.c,415 :: 		}
L_MeasureAndShowAllChanels65:
;global.c,416 :: 		}
L_MeasureAndShowAllChanels63:
;global.c,418 :: 		if ( int_1 > 125 ){
	MOVF       _int_1+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels129
	MOVF       _int_1+0, 0
	SUBLW      125
L__MeasureAndShowAllChanels129:
	BTFSC      STATUS+0, 0
	GOTO       L_MeasureAndShowAllChanels66
;global.c,419 :: 		LCDOverLoad(1, 8);
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_row+0
	MOVLW      8
	MOVWF      FARG_LCDOverLoad_col+0
	CALL       _LCDOverLoad+0
;global.c,420 :: 		LCDOverLoad(2, 8);
	MOVLW      2
	MOVWF      FARG_LCDOverLoad_row+0
	MOVLW      8
	MOVWF      FARG_LCDOverLoad_col+0
	CALL       _LCDOverLoad+0
;global.c,421 :: 		}
L_MeasureAndShowAllChanels66:
;global.c,423 :: 		MeasureVoltage3();
	CALL       _MeasureVoltage3+0
;global.c,424 :: 		int_1 = (int)float_1;
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
;global.c,425 :: 		float_2 = float_1;
	MOVF       _float_1+0, 0
	MOVWF      _float_2+0
	MOVF       _float_1+1, 0
	MOVWF      _float_2+1
	MOVF       _float_1+2, 0
	MOVWF      _float_2+2
	MOVF       _float_1+3, 0
	MOVWF      _float_2+3
;global.c,427 :: 		if ( (int_1 > 21) || (adc_int > 1000) ){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels130
	MOVF       R0+0, 0
	SUBLW      21
L__MeasureAndShowAllChanels130:
	BTFSS      STATUS+0, 0
	GOTO       L__MeasureAndShowAllChanels87
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels131
	MOVF       _adc_int+0, 0
	SUBLW      232
L__MeasureAndShowAllChanels131:
	BTFSS      STATUS+0, 0
	GOTO       L__MeasureAndShowAllChanels87
	GOTO       L_MeasureAndShowAllChanels69
L__MeasureAndShowAllChanels87:
;global.c,428 :: 		LCDOverLoad(1, 13);
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_row+0
	MOVLW      13
	MOVWF      FARG_LCDOverLoad_col+0
	CALL       _LCDOverLoad+0
;global.c,429 :: 		}
	GOTO       L_MeasureAndShowAllChanels70
L_MeasureAndShowAllChanels69:
;global.c,431 :: 		DisplayFloat1(1, 13);
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;global.c,432 :: 		}
L_MeasureAndShowAllChanels70:
;global.c,433 :: 		MeasureCurrent3();
	CALL       _MeasureCurrent3+0
;global.c,434 :: 		int_2 = (int)float_1;
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
;global.c,435 :: 		if ( (int_2 > 25) || (adc_int > 1000) ){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels132
	MOVF       R0+0, 0
	SUBLW      25
L__MeasureAndShowAllChanels132:
	BTFSS      STATUS+0, 0
	GOTO       L__MeasureAndShowAllChanels86
	MOVF       _adc_int+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels133
	MOVF       _adc_int+0, 0
	SUBLW      232
L__MeasureAndShowAllChanels133:
	BTFSS      STATUS+0, 0
	GOTO       L__MeasureAndShowAllChanels86
	GOTO       L_MeasureAndShowAllChanels73
L__MeasureAndShowAllChanels86:
;global.c,436 :: 		LCDOverLoad(2, 13);
	MOVLW      2
	MOVWF      FARG_LCDOverLoad_row+0
	MOVLW      13
	MOVWF      FARG_LCDOverLoad_col+0
	CALL       _LCDOverLoad+0
;global.c,437 :: 		}
	GOTO       L_MeasureAndShowAllChanels74
L_MeasureAndShowAllChanels73:
;global.c,439 :: 		CalculateFloat1Float2Power();
	CALL       _CalculateFloat1Float2Power+0
;global.c,441 :: 		if (i_p == 1){
	MOVF       _i_p+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_MeasureAndShowAllChanels75
;global.c,442 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;global.c,443 :: 		}
	GOTO       L_MeasureAndShowAllChanels76
L_MeasureAndShowAllChanels75:
;global.c,446 :: 		DisplayInt1ThreeDigit(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayInt1ThreeDigit_row+0
	MOVLW      13
	MOVWF      FARG_DisplayInt1ThreeDigit_col+0
	CALL       _DisplayInt1ThreeDigit+0
;global.c,447 :: 		}
L_MeasureAndShowAllChanels76:
;global.c,448 :: 		}
L_MeasureAndShowAllChanels74:
;global.c,450 :: 		if ( int_1 > 100 ){
	MOVF       _int_1+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__MeasureAndShowAllChanels134
	MOVF       _int_1+0, 0
	SUBLW      100
L__MeasureAndShowAllChanels134:
	BTFSC      STATUS+0, 0
	GOTO       L_MeasureAndShowAllChanels77
;global.c,451 :: 		LCDOverLoad(1, 13);
	MOVLW      1
	MOVWF      FARG_LCDOverLoad_row+0
	MOVLW      13
	MOVWF      FARG_LCDOverLoad_col+0
	CALL       _LCDOverLoad+0
;global.c,452 :: 		LCDOverLoad(2, 13);
	MOVLW      2
	MOVWF      FARG_LCDOverLoad_row+0
	MOVLW      13
	MOVWF      FARG_LCDOverLoad_col+0
	CALL       _LCDOverLoad+0
;global.c,453 :: 		}
L_MeasureAndShowAllChanels77:
;global.c,454 :: 		}
L_end_MeasureAndShowAllChanels:
	RETURN
; end of _MeasureAndShowAllChanels

_PlaySound_1000_50:

;global.c,456 :: 		void PlaySound_1000_50(){
;global.c,457 :: 		PORTB.B0 = 0;
	BCF        PORTB+0, 0
;global.c,458 :: 		for (counter = 0; counter < 15; counter++){
	CLRF       _counter+0
L_PlaySound_1000_5078:
	MOVLW      128
	XORWF      _counter+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      15
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_PlaySound_1000_5079
;global.c,459 :: 		PORTB.B0 = 1;
	BSF        PORTB+0, 0
;global.c,460 :: 		Delay_500us();
	CALL       _Delay_500us+0
;global.c,461 :: 		PORTB.B0 = 0;
	BCF        PORTB+0, 0
;global.c,462 :: 		Delay_500us();
	CALL       _Delay_500us+0
;global.c,458 :: 		for (counter = 0; counter < 15; counter++){
	INCF       _counter+0, 1
;global.c,463 :: 		}
	GOTO       L_PlaySound_1000_5078
L_PlaySound_1000_5079:
;global.c,464 :: 		}
L_end_PlaySound_1000_50:
	RETURN
; end of _PlaySound_1000_50

_PlaySound_500_50:

;global.c,466 :: 		void PlaySound_500_50(){
;global.c,467 :: 		PORTB.B0 = 0;
	BCF        PORTB+0, 0
;global.c,468 :: 		for (counter = 0; counter < 10; counter++){
	CLRF       _counter+0
L_PlaySound_500_5081:
	MOVLW      128
	XORWF      _counter+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      10
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_PlaySound_500_5082
;global.c,469 :: 		PORTB.B0 = 1;
	BSF        PORTB+0, 0
;global.c,470 :: 		Delay_1ms();
	CALL       _Delay_1ms+0
;global.c,471 :: 		PORTB.B0 = 0;
	BCF        PORTB+0, 0
;global.c,472 :: 		Delay_1ms();
	CALL       _Delay_1ms+0
;global.c,468 :: 		for (counter = 0; counter < 10; counter++){
	INCF       _counter+0, 1
;global.c,473 :: 		}
	GOTO       L_PlaySound_500_5081
L_PlaySound_500_5082:
;global.c,474 :: 		}
L_end_PlaySound_500_50:
	RETURN
; end of _PlaySound_500_50

_LCDWriteFromROM:

;global.c,476 :: 		void LCDWriteFromROM( char row, char col, const char *text ){
;global.c,477 :: 		Lcd_Out( row, col, "" );
	MOVF       FARG_LCDWriteFromROM_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_LCDWriteFromROM_col+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_global+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;global.c,478 :: 		while( *text )
L_LCDWriteFromROM84:
	MOVF       FARG_LCDWriteFromROM_text+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_LCDWriteFromROM_text+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_LCDWriteFromROM85
;global.c,479 :: 		Lcd_Chr_CP( *text++ );
	MOVF       FARG_LCDWriteFromROM_text+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_LCDWriteFromROM_text+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       FARG_LCDWriteFromROM_text+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_LCDWriteFromROM_text+1, 1
	GOTO       L_LCDWriteFromROM84
L_LCDWriteFromROM85:
;global.c,480 :: 		}
L_end_LCDWriteFromROM:
	RETURN
; end of _LCDWriteFromROM
