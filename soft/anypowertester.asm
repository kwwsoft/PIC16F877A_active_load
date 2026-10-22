
_DoAnyPowerTester:

;anypowertester.c,35 :: 		void DoAnyPowerTester(){
;anypowertester.c,36 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;anypowertester.c,37 :: 		PORTA.RA4 = 0;
	BCF        PORTA+0, 4
;anypowertester.c,38 :: 		PORTC.RC0 = 0;
	BCF        PORTC+0, 0
;anypowertester.c,39 :: 		PORTC.RC1 = 0;
	BCF        PORTC+0, 1
;anypowertester.c,40 :: 		PORTC.RC2 = 0;
	BCF        PORTC+0, 2
;anypowertester.c,41 :: 		i_p = 1;
	MOVLW      1
	MOVWF      _i_p+0
;anypowertester.c,45 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;anypowertester.c,46 :: 		do{
L_DoAnyPowerTester0:
;anypowertester.c,47 :: 		MeasureAndShowAllChanels();
	CALL       _MeasureAndShowAllChanels+0
;anypowertester.c,49 :: 		PlaySound_500_50();
	CALL       _PlaySound_500_50+0
;anypowertester.c,51 :: 		short_1 = GetKeyNormal();
	CALL       _GetKeyNormal+0
	MOVF       R0+0, 0
	MOVWF      _short_1+0
;anypowertester.c,53 :: 		if (short_1 == key_up){
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_DoAnyPowerTester3
;anypowertester.c,54 :: 		}
	GOTO       L_DoAnyPowerTester4
L_DoAnyPowerTester3:
;anypowertester.c,56 :: 		else if (short_1 == key_up_long){
	MOVF       _short_1+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_DoAnyPowerTester5
;anypowertester.c,57 :: 		goto end_;
	GOTO       ___DoAnyPowerTester_end_
;anypowertester.c,58 :: 		}
L_DoAnyPowerTester5:
;anypowertester.c,60 :: 		else if (short_1 == key_down){
	MOVF       _short_1+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_DoAnyPowerTester7
;anypowertester.c,61 :: 		if (i_p == 0){
	MOVF       _i_p+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DoAnyPowerTester8
;anypowertester.c,62 :: 		i_p = 1;
	MOVLW      1
	MOVWF      _i_p+0
;anypowertester.c,63 :: 		}
	GOTO       L_DoAnyPowerTester9
L_DoAnyPowerTester8:
;anypowertester.c,65 :: 		i_p = 0;
	CLRF       _i_p+0
;anypowertester.c,66 :: 		}
L_DoAnyPowerTester9:
;anypowertester.c,67 :: 		LCDClearString2();
	CALL       _LCDClearString2+0
;anypowertester.c,68 :: 		}
	GOTO       L_DoAnyPowerTester10
L_DoAnyPowerTester7:
;anypowertester.c,70 :: 		else if (short_1 == key_select_long){
	MOVF       _short_1+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_DoAnyPowerTester11
;anypowertester.c,72 :: 		goto end_;
	GOTO       ___DoAnyPowerTester_end_
;anypowertester.c,73 :: 		}
L_DoAnyPowerTester11:
;anypowertester.c,75 :: 		else if (short_1 == key_select){
	MOVF       _short_1+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_DoAnyPowerTester13
;anypowertester.c,77 :: 		}
L_DoAnyPowerTester13:
L_DoAnyPowerTester10:
L_DoAnyPowerTester4:
;anypowertester.c,78 :: 		}while(1);
	GOTO       L_DoAnyPowerTester0
;anypowertester.c,92 :: 		end_:;
___DoAnyPowerTester_end_:
;anypowertester.c,93 :: 		LCDWriteFromROM(1,1, s_SelectMode);
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_SelectMode+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_SelectMode+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;anypowertester.c,94 :: 		LCDShowStringFromEEPROM(2, 8 + mode1); //
	MOVLW      2
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVF       _mode1+0, 0
	ADDLW      8
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;anypowertester.c,95 :: 		}
L_end_DoAnyPowerTester:
	RETURN
; end of _DoAnyPowerTester
