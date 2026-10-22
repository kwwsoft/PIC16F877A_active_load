
_ChangeValueShowToLcd:

;dynamics.c,16 :: 		void ChangeValueShowToLcd(){
;dynamics.c,18 :: 		if (dyn_mode_flag.B2 == 0){
	BTFSC      _dyn_mode_flag+0, 2
	GOTO       L_ChangeValueShowToLcd0
;dynamics.c,19 :: 		dyn_mode_flag.B2 = 1;
	BSF        _dyn_mode_flag+0, 2
;dynamics.c,20 :: 		dyn_mode_flag.B1 = 1;
	BSF        _dyn_mode_flag+0, 1
;dynamics.c,21 :: 		Lcd_Chr(1, 12, 'U');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      85
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,22 :: 		}
	GOTO       L_ChangeValueShowToLcd1
L_ChangeValueShowToLcd0:
;dynamics.c,24 :: 		if (dyn_mode_flag.B1 == 1){
	BTFSS      _dyn_mode_flag+0, 1
	GOTO       L_ChangeValueShowToLcd2
;dynamics.c,25 :: 		dyn_mode_flag.B1 = 0;
	BCF        _dyn_mode_flag+0, 1
;dynamics.c,26 :: 		Lcd_Chr(1, 12, 'I');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      73
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,27 :: 		}
	GOTO       L_ChangeValueShowToLcd3
L_ChangeValueShowToLcd2:
;dynamics.c,29 :: 		dyn_mode_flag.B2 = 0;
	BCF        _dyn_mode_flag+0, 2
;dynamics.c,30 :: 		Lcd_Chr(1, 12, ' ');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,31 :: 		}
L_ChangeValueShowToLcd3:
;dynamics.c,32 :: 		}
L_ChangeValueShowToLcd1:
;dynamics.c,33 :: 		}
L_end_ChangeValueShowToLcd:
	RETURN
; end of _ChangeValueShowToLcd

_DoDynamicsLoad:

;dynamics.c,35 :: 		void DoDynamicsLoad(){
;dynamics.c,36 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;dynamics.c,37 :: 		LCDShowStringFromEEPROM(1, 6);    //
	MOVLW      1
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVLW      6
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;dynamics.c,38 :: 		PORTC &= 0b11111000;
	MOVLW      248
	ANDWF      PORTC+0, 1
;dynamics.c,39 :: 		T1CON = 0b00110100;
	MOVLW      52
	MOVWF      T1CON+0
;dynamics.c,40 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;dynamics.c,41 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;dynamics.c,42 :: 		PIE1.TMR1IE = 1;
	BSF        PIE1+0, 0
;dynamics.c,43 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;dynamics.c,44 :: 		dyn_mode_flag = 0;
	CLRF       _dyn_mode_flag+0
;dynamics.c,46 :: 		dyn_mode_flag.B6 = 1;
	BSF        _dyn_mode_flag+0, 6
;dynamics.c,48 :: 		dyn_mode = 0;
	CLRF       _dyn_mode+0
;dynamics.c,49 :: 		do{
L_DoDynamicsLoad4:
;dynamics.c,51 :: 		if (dyn_mode_flag.B7 == 1){
	BTFSS      _dyn_mode_flag+0, 7
	GOTO       L_DoDynamicsLoad7
;dynamics.c,52 :: 		dyn_mode_flag.B7 = 0;
	BCF        _dyn_mode_flag+0, 7
;dynamics.c,53 :: 		T1CON.TMR1ON = 0;
	BCF        T1CON+0, 0
;dynamics.c,54 :: 		switch(dyn_mode){
	GOTO       L_DoDynamicsLoad8
;dynamics.c,56 :: 		case 0:
L_DoDynamicsLoad10:
;dynamics.c,57 :: 		if (dyn_mode_flag.B2 == 1){
	BTFSS      _dyn_mode_flag+0, 2
	GOTO       L_DoDynamicsLoad11
;dynamics.c,59 :: 		if (dyn_mode_flag.B1 == 1){
	BTFSS      _dyn_mode_flag+0, 1
	GOTO       L_DoDynamicsLoad12
;dynamics.c,60 :: 		Lcd_Chr(1, 12, 'U');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      85
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,61 :: 		MeasureVoltage1();
	CALL       _MeasureVoltage1+0
;dynamics.c,62 :: 		DisplayFloat1(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,63 :: 		MeasureVoltage2();
	CALL       _MeasureVoltage2+0
;dynamics.c,64 :: 		DisplayFloat1(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,65 :: 		MeasureVoltage3();
	CALL       _MeasureVoltage3+0
;dynamics.c,66 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,67 :: 		}
	GOTO       L_DoDynamicsLoad13
L_DoDynamicsLoad12:
;dynamics.c,70 :: 		Lcd_Chr(1, 12, 'I');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      73
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,71 :: 		MeasureCurrent1();
	CALL       _MeasureCurrent1+0
;dynamics.c,72 :: 		DisplayFloat1(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,73 :: 		MeasureCurrent2();
	CALL       _MeasureCurrent2+0
;dynamics.c,74 :: 		DisplayFloat1(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,75 :: 		MeasureCurrent3();
	CALL       _MeasureCurrent3+0
;dynamics.c,76 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,77 :: 		}
L_DoDynamicsLoad13:
;dynamics.c,78 :: 		}
	GOTO       L_DoDynamicsLoad14
L_DoDynamicsLoad11:
;dynamics.c,81 :: 		Lcd_Chr(1, 12, ' ');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,82 :: 		LCDClearString2();
	CALL       _LCDClearString2+0
;dynamics.c,83 :: 		}//измерим что-то end
L_DoDynamicsLoad14:
;dynamics.c,85 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,86 :: 		TMR1H = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;dynamics.c,87 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;dynamics.c,88 :: 		PORTC |= 0b00001111;
	MOVLW      15
	IORWF      PORTC+0, 1
;dynamics.c,89 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;dynamics.c,90 :: 		break;
	GOTO       L_DoDynamicsLoad9
;dynamics.c,93 :: 		case 1:  //первый тип нагрузки - тип1 -------------
L_DoDynamicsLoad15:
;dynamics.c,95 :: 		if (dyn_mode_flag.B5 == 0){
	BTFSC      _dyn_mode_flag+0, 5
	GOTO       L_DoDynamicsLoad16
;dynamics.c,97 :: 		if (dyn_mode_flag.B2 == 1){
	BTFSS      _dyn_mode_flag+0, 2
	GOTO       L_DoDynamicsLoad17
;dynamics.c,99 :: 		if (dyn_mode_flag.B1 == 1){
	BTFSS      _dyn_mode_flag+0, 1
	GOTO       L_DoDynamicsLoad18
;dynamics.c,100 :: 		Lcd_Chr(1, 12, 'U');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      85
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,101 :: 		MeasureVoltage1();
	CALL       _MeasureVoltage1+0
;dynamics.c,102 :: 		DisplayFloat1(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,103 :: 		MeasureVoltage2();
	CALL       _MeasureVoltage2+0
;dynamics.c,104 :: 		DisplayFloat1(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,105 :: 		MeasureVoltage3();
	CALL       _MeasureVoltage3+0
;dynamics.c,106 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,107 :: 		}
	GOTO       L_DoDynamicsLoad19
L_DoDynamicsLoad18:
;dynamics.c,110 :: 		Lcd_Chr(1, 12, 'I');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      73
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,111 :: 		MeasureCurrent1();
	CALL       _MeasureCurrent1+0
;dynamics.c,112 :: 		DisplayFloat1(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,113 :: 		MeasureCurrent2();
	CALL       _MeasureCurrent2+0
;dynamics.c,114 :: 		DisplayFloat1(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,115 :: 		MeasureCurrent3();
	CALL       _MeasureCurrent3+0
;dynamics.c,116 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,117 :: 		}
L_DoDynamicsLoad19:
;dynamics.c,118 :: 		}
	GOTO       L_DoDynamicsLoad20
L_DoDynamicsLoad17:
;dynamics.c,121 :: 		Lcd_Chr(1, 12, ' ');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,122 :: 		LCDClearString2();
	CALL       _LCDClearString2+0
;dynamics.c,123 :: 		}//измерим что-то в конце нагрузки end
L_DoDynamicsLoad20:
;dynamics.c,125 :: 		PORTC &= 0b11110000;
	MOVLW      240
	ANDWF      PORTC+0, 1
;dynamics.c,126 :: 		dyn_mode_flag.B5 = 1;
	BSF        _dyn_mode_flag+0, 5
;dynamics.c,128 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,129 :: 		TMR1H = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;dynamics.c,130 :: 		}
	GOTO       L_DoDynamicsLoad21
L_DoDynamicsLoad16:
;dynamics.c,133 :: 		PORTC |= 0b00001111;
	MOVLW      15
	IORWF      PORTC+0, 1
;dynamics.c,134 :: 		dyn_mode_flag.B5 = 0;
	BCF        _dyn_mode_flag+0, 5
;dynamics.c,136 :: 		if (dyn_mode_flag.B2 == 0){
	BTFSC      _dyn_mode_flag+0, 2
	GOTO       L_DoDynamicsLoad22
;dynamics.c,138 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,139 :: 		TMR1H = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;dynamics.c,140 :: 		}
	GOTO       L_DoDynamicsLoad23
L_DoDynamicsLoad22:
;dynamics.c,144 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,145 :: 		TMR1H = 0x5B;
	MOVLW      91
	MOVWF      TMR1H+0
;dynamics.c,146 :: 		}
L_DoDynamicsLoad23:
;dynamics.c,147 :: 		}//был первый полупериод - отключим нагрузку end
L_DoDynamicsLoad21:
;dynamics.c,148 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;dynamics.c,149 :: 		break;   //первый тип нагрузкм - тип1 -------------   end
	GOTO       L_DoDynamicsLoad9
;dynamics.c,152 :: 		case 2:  //второй тип нагрузкм - тип2 -------------
L_DoDynamicsLoad24:
;dynamics.c,154 :: 		if (dyn_mode_flag.B5 == 0){
	BTFSC      _dyn_mode_flag+0, 5
	GOTO       L_DoDynamicsLoad25
;dynamics.c,156 :: 		PORTC &= 0b11110000;
	MOVLW      240
	ANDWF      PORTC+0, 1
;dynamics.c,157 :: 		dyn_mode_flag.B5 = 1;
	BSF        _dyn_mode_flag+0, 5
;dynamics.c,159 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,160 :: 		TMR1H = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;dynamics.c,161 :: 		}
	GOTO       L_DoDynamicsLoad26
L_DoDynamicsLoad25:
;dynamics.c,164 :: 		PORTC |= 0b0001111;
	MOVLW      15
	IORWF      PORTC+0, 1
;dynamics.c,165 :: 		dyn_mode_flag.B5 = 0;
	BCF        _dyn_mode_flag+0, 5
;dynamics.c,167 :: 		TMR1L = 0x82;
	MOVLW      130
	MOVWF      TMR1L+0
;dynamics.c,168 :: 		TMR1H = 0xFF;
	MOVLW      255
	MOVWF      TMR1H+0
;dynamics.c,169 :: 		}//был первый полупериод - отключим нагрузку end
L_DoDynamicsLoad26:
;dynamics.c,170 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;dynamics.c,171 :: 		break;   //второй тип нагрузки - тип2 -------------   end
	GOTO       L_DoDynamicsLoad9
;dynamics.c,175 :: 		case 3:  //третий тип нагрузки - тип3 -------------
L_DoDynamicsLoad27:
;dynamics.c,177 :: 		if (dyn_mode_flag.B5 == 0){
	BTFSC      _dyn_mode_flag+0, 5
	GOTO       L_DoDynamicsLoad28
;dynamics.c,179 :: 		if (dyn_mode_flag.B2 == 1){
	BTFSS      _dyn_mode_flag+0, 2
	GOTO       L_DoDynamicsLoad29
;dynamics.c,181 :: 		if (dyn_mode_flag.B1 == 1){
	BTFSS      _dyn_mode_flag+0, 1
	GOTO       L_DoDynamicsLoad30
;dynamics.c,182 :: 		Lcd_Chr(1, 12, 'U');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      85
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,183 :: 		MeasureVoltage1();
	CALL       _MeasureVoltage1+0
;dynamics.c,184 :: 		DisplayFloat1(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,185 :: 		MeasureVoltage2();
	CALL       _MeasureVoltage2+0
;dynamics.c,186 :: 		DisplayFloat1(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,187 :: 		MeasureVoltage3();
	CALL       _MeasureVoltage3+0
;dynamics.c,188 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,189 :: 		}
	GOTO       L_DoDynamicsLoad31
L_DoDynamicsLoad30:
;dynamics.c,192 :: 		Lcd_Chr(1, 12, 'I');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      73
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,193 :: 		MeasureCurrent1();
	CALL       _MeasureCurrent1+0
;dynamics.c,194 :: 		DisplayFloat1(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,195 :: 		MeasureCurrent2();
	CALL       _MeasureCurrent2+0
;dynamics.c,196 :: 		DisplayFloat1(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,197 :: 		MeasureCurrent3();
	CALL       _MeasureCurrent3+0
;dynamics.c,198 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,199 :: 		}
L_DoDynamicsLoad31:
;dynamics.c,200 :: 		}
	GOTO       L_DoDynamicsLoad32
L_DoDynamicsLoad29:
;dynamics.c,203 :: 		Lcd_Chr(1, 12, ' ');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,204 :: 		LCDClearString2();
	CALL       _LCDClearString2+0
;dynamics.c,205 :: 		}//измерим что-то в конце нагрузки end
L_DoDynamicsLoad32:
;dynamics.c,207 :: 		PORTC &= 0b11110000;
	MOVLW      240
	ANDWF      PORTC+0, 1
;dynamics.c,208 :: 		dyn_mode_flag.B5 = 1;
	BSF        _dyn_mode_flag+0, 5
;dynamics.c,210 :: 		TMR1L = 0x82;
	MOVLW      130
	MOVWF      TMR1L+0
;dynamics.c,211 :: 		TMR1H = 0xFF;
	MOVLW      255
	MOVWF      TMR1H+0
;dynamics.c,212 :: 		}
	GOTO       L_DoDynamicsLoad33
L_DoDynamicsLoad28:
;dynamics.c,215 :: 		PORTC |= 0b00001111;
	MOVLW      15
	IORWF      PORTC+0, 1
;dynamics.c,216 :: 		dyn_mode_flag.B5 = 0;
	BCF        _dyn_mode_flag+0, 5
;dynamics.c,218 :: 		if (dyn_mode_flag.B2 == 0){
	BTFSC      _dyn_mode_flag+0, 2
	GOTO       L_DoDynamicsLoad34
;dynamics.c,220 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,221 :: 		TMR1H = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;dynamics.c,222 :: 		}
	GOTO       L_DoDynamicsLoad35
L_DoDynamicsLoad34:
;dynamics.c,226 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,227 :: 		TMR1H = 0x5B;
	MOVLW      91
	MOVWF      TMR1H+0
;dynamics.c,228 :: 		}
L_DoDynamicsLoad35:
;dynamics.c,229 :: 		}//был первый полупериод - отключим нагрузку end
L_DoDynamicsLoad33:
;dynamics.c,230 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;dynamics.c,231 :: 		break;   //третий тип нагрузкм - тип3 -------------   end
	GOTO       L_DoDynamicsLoad9
;dynamics.c,235 :: 		case 4:  //четвертый тип нагрузки - тип4 -------------
L_DoDynamicsLoad36:
;dynamics.c,237 :: 		if (dyn_mode_flag.B5 == 0){
	BTFSC      _dyn_mode_flag+0, 5
	GOTO       L_DoDynamicsLoad37
;dynamics.c,239 :: 		if (dyn_mode_flag.B2 == 1){
	BTFSS      _dyn_mode_flag+0, 2
	GOTO       L_DoDynamicsLoad38
;dynamics.c,241 :: 		if (dyn_mode_flag.B1 == 1){
	BTFSS      _dyn_mode_flag+0, 1
	GOTO       L_DoDynamicsLoad39
;dynamics.c,242 :: 		Lcd_Chr(1, 12, 'U');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      85
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,243 :: 		MeasureVoltage1();
	CALL       _MeasureVoltage1+0
;dynamics.c,244 :: 		DisplayFloat1(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,245 :: 		MeasureVoltage2();
	CALL       _MeasureVoltage2+0
;dynamics.c,246 :: 		DisplayFloat1(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,247 :: 		MeasureVoltage3();
	CALL       _MeasureVoltage3+0
;dynamics.c,248 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,249 :: 		}
	GOTO       L_DoDynamicsLoad40
L_DoDynamicsLoad39:
;dynamics.c,252 :: 		Lcd_Chr(1, 12, 'I');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      73
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,253 :: 		MeasureCurrent1();
	CALL       _MeasureCurrent1+0
;dynamics.c,254 :: 		DisplayFloat1(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,255 :: 		MeasureCurrent2();
	CALL       _MeasureCurrent2+0
;dynamics.c,256 :: 		DisplayFloat1(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,257 :: 		MeasureCurrent3();
	CALL       _MeasureCurrent3+0
;dynamics.c,258 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,259 :: 		}
L_DoDynamicsLoad40:
;dynamics.c,260 :: 		}
	GOTO       L_DoDynamicsLoad41
L_DoDynamicsLoad38:
;dynamics.c,263 :: 		Lcd_Chr(1, 12, ' ');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,264 :: 		LCDClearString2();
	CALL       _LCDClearString2+0
;dynamics.c,265 :: 		}//измерим что-то в конце нагрузки end
L_DoDynamicsLoad41:
;dynamics.c,267 :: 		PORTC &= 0b11110000;
	MOVLW      240
	ANDWF      PORTC+0, 1
;dynamics.c,268 :: 		dyn_mode_flag.B5 = 1;
	BSF        _dyn_mode_flag+0, 5
;dynamics.c,270 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,271 :: 		TMR1H = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;dynamics.c,272 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;dynamics.c,273 :: 		}
	GOTO       L_DoDynamicsLoad42
L_DoDynamicsLoad37:
;dynamics.c,276 :: 		PORTC |= 0b00001001;
	MOVLW      9
	IORWF      PORTC+0, 1
;dynamics.c,277 :: 		dyn_mode_flag.B5 = 0;
	BCF        _dyn_mode_flag+0, 5
;dynamics.c,279 :: 		if (dyn_mode_flag.B2 == 0){
	BTFSC      _dyn_mode_flag+0, 2
	GOTO       L_DoDynamicsLoad43
;dynamics.c,281 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,282 :: 		TMR1H = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;dynamics.c,283 :: 		}
	GOTO       L_DoDynamicsLoad44
L_DoDynamicsLoad43:
;dynamics.c,287 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,288 :: 		TMR1H = 0x5B;
	MOVLW      91
	MOVWF      TMR1H+0
;dynamics.c,289 :: 		}
L_DoDynamicsLoad44:
;dynamics.c,290 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;dynamics.c,291 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;dynamics.c,292 :: 		PORTC |= 0b00001011;
	MOVLW      11
	IORWF      PORTC+0, 1
;dynamics.c,293 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;dynamics.c,294 :: 		PORTC |= 0b00001111;
	MOVLW      15
	IORWF      PORTC+0, 1
;dynamics.c,295 :: 		}//был первый полупериод - отключим нагрузку end
L_DoDynamicsLoad42:
;dynamics.c,296 :: 		break;   //четвертый тип нагрузкм - тип4 -------------   end
	GOTO       L_DoDynamicsLoad9
;dynamics.c,300 :: 		default:
L_DoDynamicsLoad45:
;dynamics.c,301 :: 		break;
	GOTO       L_DoDynamicsLoad9
;dynamics.c,302 :: 		}
L_DoDynamicsLoad8:
	MOVF       _dyn_mode+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad10
	MOVF       _dyn_mode+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad15
	MOVF       _dyn_mode+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad24
	MOVF       _dyn_mode+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad27
	MOVF       _dyn_mode+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad36
	GOTO       L_DoDynamicsLoad45
L_DoDynamicsLoad9:
;dynamics.c,303 :: 		}//есть прерывание от таймера end
L_DoDynamicsLoad7:
;dynamics.c,306 :: 		short_1 = GetKeyNormal();
	CALL       _GetKeyNormal+0
	MOVF       R0+0, 0
	MOVWF      _short_1+0
;dynamics.c,308 :: 		if (short_1 == key_up){
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_DoDynamicsLoad46
;dynamics.c,309 :: 		if (dyn_mode > 0){
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _dyn_mode+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_DoDynamicsLoad47
;dynamics.c,310 :: 		dyn_mode --;
	DECF       _dyn_mode+0, 1
;dynamics.c,311 :: 		dyn_mode_flag.B6 = 1;
	BSF        _dyn_mode_flag+0, 6
;dynamics.c,312 :: 		}
L_DoDynamicsLoad47:
;dynamics.c,313 :: 		}
	GOTO       L_DoDynamicsLoad48
L_DoDynamicsLoad46:
;dynamics.c,315 :: 		else if (short_1 == key_down){
	MOVF       _short_1+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_DoDynamicsLoad49
;dynamics.c,316 :: 		if (dyn_mode < dyn_mode_max){
	MOVLW      128
	XORWF      _dyn_mode+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_DoDynamicsLoad50
;dynamics.c,317 :: 		dyn_mode ++;
	INCF       _dyn_mode+0, 1
;dynamics.c,318 :: 		dyn_mode_flag.B6 = 1;
	BSF        _dyn_mode_flag+0, 6
;dynamics.c,319 :: 		}
L_DoDynamicsLoad50:
;dynamics.c,320 :: 		}
	GOTO       L_DoDynamicsLoad51
L_DoDynamicsLoad49:
;dynamics.c,322 :: 		else if (short_1 == key_select_long){
	MOVF       _short_1+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_DoDynamicsLoad52
;dynamics.c,323 :: 		goto end_;
	GOTO       ___DoDynamicsLoad_end_
;dynamics.c,324 :: 		}
L_DoDynamicsLoad52:
;dynamics.c,326 :: 		else if (short_1 == key_select){
	MOVF       _short_1+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_DoDynamicsLoad54
;dynamics.c,328 :: 		switch(dyn_mode){
	GOTO       L_DoDynamicsLoad55
;dynamics.c,329 :: 		case 0:
L_DoDynamicsLoad57:
;dynamics.c,330 :: 		case 1:
L_DoDynamicsLoad58:
;dynamics.c,331 :: 		case 3:
L_DoDynamicsLoad59:
;dynamics.c,332 :: 		case 4:
L_DoDynamicsLoad60:
;dynamics.c,333 :: 		ChangeValueShowToLcd();
	CALL       _ChangeValueShowToLcd+0
;dynamics.c,334 :: 		if (dyn_mode_flag.B2 == 1){
	BTFSS      _dyn_mode_flag+0, 2
	GOTO       L_DoDynamicsLoad61
;dynamics.c,336 :: 		if (dyn_mode_flag.B1 == 1){
	BTFSS      _dyn_mode_flag+0, 1
	GOTO       L_DoDynamicsLoad62
;dynamics.c,337 :: 		Lcd_Chr(1, 12, 'U');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      85
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,338 :: 		MeasureVoltage1();
	CALL       _MeasureVoltage1+0
;dynamics.c,339 :: 		DisplayFloat1(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,340 :: 		MeasureVoltage2();
	CALL       _MeasureVoltage2+0
;dynamics.c,341 :: 		DisplayFloat1(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,342 :: 		MeasureVoltage3();
	CALL       _MeasureVoltage3+0
;dynamics.c,343 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,344 :: 		}
	GOTO       L_DoDynamicsLoad63
L_DoDynamicsLoad62:
;dynamics.c,347 :: 		Lcd_Chr(1, 12, 'I');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      73
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,348 :: 		MeasureCurrent1();
	CALL       _MeasureCurrent1+0
;dynamics.c,349 :: 		DisplayFloat1(2, 1);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      1
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,350 :: 		MeasureCurrent2();
	CALL       _MeasureCurrent2+0
;dynamics.c,351 :: 		DisplayFloat1(2, 8);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      8
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,352 :: 		MeasureCurrent3();
	CALL       _MeasureCurrent3+0
;dynamics.c,353 :: 		DisplayFloat1(2, 13);
	MOVLW      2
	MOVWF      FARG_DisplayFloat1_row+0
	MOVLW      13
	MOVWF      FARG_DisplayFloat1_col+0
	CALL       _DisplayFloat1+0
;dynamics.c,354 :: 		}
L_DoDynamicsLoad63:
;dynamics.c,355 :: 		}
	GOTO       L_DoDynamicsLoad64
L_DoDynamicsLoad61:
;dynamics.c,358 :: 		Lcd_Chr(1, 12, ' ');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,359 :: 		LCDClearString2();
	CALL       _LCDClearString2+0
;dynamics.c,360 :: 		}//измерим что-то в конце нагрузки end
L_DoDynamicsLoad64:
;dynamics.c,361 :: 		break;
	GOTO       L_DoDynamicsLoad56
;dynamics.c,363 :: 		default:
L_DoDynamicsLoad65:
;dynamics.c,364 :: 		dyn_mode_flag.B2 = 0;
	BCF        _dyn_mode_flag+0, 2
;dynamics.c,365 :: 		break;
	GOTO       L_DoDynamicsLoad56
;dynamics.c,366 :: 		}//мерять можно только в этих режимах end
L_DoDynamicsLoad55:
	MOVF       _dyn_mode+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad57
	MOVF       _dyn_mode+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad58
	MOVF       _dyn_mode+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad59
	MOVF       _dyn_mode+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad60
	GOTO       L_DoDynamicsLoad65
L_DoDynamicsLoad56:
;dynamics.c,367 :: 		}//key select смена индикации ток/напряжение end
L_DoDynamicsLoad54:
L_DoDynamicsLoad51:
L_DoDynamicsLoad48:
;dynamics.c,369 :: 		if (dyn_mode_flag.B6 == 1){
	BTFSS      _dyn_mode_flag+0, 6
	GOTO       L_DoDynamicsLoad66
;dynamics.c,370 :: 		INTCON.GIE = 0;
	BCF        INTCON+0, 7
;dynamics.c,371 :: 		T1CON.TMR1ON = 0;
	BCF        T1CON+0, 0
;dynamics.c,372 :: 		PORTC &= 0b11110000;
	MOVLW      240
	ANDWF      PORTC+0, 1
;dynamics.c,373 :: 		dyn_mode_flag.B6 = 0;
	BCF        _dyn_mode_flag+0, 6
;dynamics.c,374 :: 		dyn_mode_flag.B5 = 0;
	BCF        _dyn_mode_flag+0, 5
;dynamics.c,375 :: 		PIR1.TMR1IF = 0;
	BCF        PIR1+0, 0
;dynamics.c,376 :: 		switch(dyn_mode){
	GOTO       L_DoDynamicsLoad67
;dynamics.c,378 :: 		case 0:
L_DoDynamicsLoad69:
;dynamics.c,379 :: 		Lcd_Chr(1, 10, '0');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,381 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,382 :: 		TMR1H = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;dynamics.c,383 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;dynamics.c,384 :: 		PORTC |= 0b00001111;
	MOVLW      15
	IORWF      PORTC+0, 1
;dynamics.c,385 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;dynamics.c,414 :: 		break;
	GOTO       L_DoDynamicsLoad68
;dynamics.c,416 :: 		case 1:
L_DoDynamicsLoad70:
;dynamics.c,417 :: 		Lcd_Chr(1, 10, '1');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      49
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,419 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,420 :: 		TMR1H = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;dynamics.c,421 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;dynamics.c,422 :: 		PORTC |= 0b00001111;
	MOVLW      15
	IORWF      PORTC+0, 1
;dynamics.c,423 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;dynamics.c,424 :: 		break;
	GOTO       L_DoDynamicsLoad68
;dynamics.c,426 :: 		case 2:
L_DoDynamicsLoad71:
;dynamics.c,427 :: 		Lcd_Chr(1, 10, '2');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      50
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,429 :: 		TMR1L = 0x82;
	MOVLW      130
	MOVWF      TMR1L+0
;dynamics.c,430 :: 		TMR1H = 0xFF;
	MOVLW      255
	MOVWF      TMR1H+0
;dynamics.c,431 :: 		PIR1.TMR1IF = 0;
	BCF        PIR1+0, 0
;dynamics.c,432 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;dynamics.c,433 :: 		PORTC |= 0b00001111;
	MOVLW      15
	IORWF      PORTC+0, 1
;dynamics.c,434 :: 		Lcd_Chr(1, 12, ' ');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,435 :: 		LCDClearString2();
	CALL       _LCDClearString2+0
;dynamics.c,436 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;dynamics.c,437 :: 		break;
	GOTO       L_DoDynamicsLoad68
;dynamics.c,439 :: 		case 3:
L_DoDynamicsLoad72:
;dynamics.c,440 :: 		INTCON.GIE = 0;
	BCF        INTCON+0, 7
;dynamics.c,441 :: 		T1CON.TMR1ON = 0;
	BCF        T1CON+0, 0
;dynamics.c,442 :: 		PORTC &= 0b11110000;
	MOVLW      240
	ANDWF      PORTC+0, 1
;dynamics.c,443 :: 		Lcd_Chr(1, 10, '3');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      51
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,445 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,446 :: 		TMR1H = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;dynamics.c,447 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;dynamics.c,448 :: 		PORTC |= 0b00001111;
	MOVLW      15
	IORWF      PORTC+0, 1
;dynamics.c,449 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;dynamics.c,450 :: 		break;
	GOTO       L_DoDynamicsLoad68
;dynamics.c,452 :: 		case 4:
L_DoDynamicsLoad73:
;dynamics.c,453 :: 		INTCON.GIE = 0;
	BCF        INTCON+0, 7
;dynamics.c,454 :: 		T1CON.TMR1ON = 0;
	BCF        T1CON+0, 0
;dynamics.c,455 :: 		PORTC &= 0b11110000;
	MOVLW      240
	ANDWF      PORTC+0, 1
;dynamics.c,456 :: 		Lcd_Chr(1, 10, '4');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      52
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dynamics.c,458 :: 		TMR1L = 0xDB;
	MOVLW      219
	MOVWF      TMR1L+0
;dynamics.c,459 :: 		TMR1H = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;dynamics.c,460 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;dynamics.c,461 :: 		PORTC |= 0b00001111;
	MOVLW      15
	IORWF      PORTC+0, 1
;dynamics.c,462 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;dynamics.c,463 :: 		break;
	GOTO       L_DoDynamicsLoad68
;dynamics.c,465 :: 		default:
L_DoDynamicsLoad74:
;dynamics.c,466 :: 		break;
	GOTO       L_DoDynamicsLoad68
;dynamics.c,467 :: 		}
L_DoDynamicsLoad67:
	MOVF       _dyn_mode+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad69
	MOVF       _dyn_mode+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad70
	MOVF       _dyn_mode+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad71
	MOVF       _dyn_mode+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad72
	MOVF       _dyn_mode+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_DoDynamicsLoad73
	GOTO       L_DoDynamicsLoad74
L_DoDynamicsLoad68:
;dynamics.c,469 :: 		}//изменился режим работы end
L_DoDynamicsLoad66:
;dynamics.c,474 :: 		}while(1);
	GOTO       L_DoDynamicsLoad4
;dynamics.c,481 :: 		end_:;
___DoDynamicsLoad_end_:
;dynamics.c,482 :: 		LCDWriteFromROM(1,1, s_SelectMode);
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_SelectMode+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_SelectMode+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;dynamics.c,483 :: 		LCDShowStringFromEEPROM(2, 8 + mode1); //
	MOVLW      2
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVF       _mode1+0, 0
	ADDLW      8
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;dynamics.c,484 :: 		}
L_end_DoDynamicsLoad:
	RETURN
; end of _DoDynamicsLoad
