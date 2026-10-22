
_interrupt_vector:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;activeload.c,15 :: 		void interrupt_vector() iv 0x0004 ics ICS_AUTO {
;activeload.c,17 :: 		if (PIR1.TMR1IF == 1){
	BTFSS      PIR1+0, 0
	GOTO       L_interrupt_vector0
;activeload.c,18 :: 		T1CON.TMR1ON = 0;
	BCF        T1CON+0, 0
;activeload.c,19 :: 		PIR1.TMR1IF = 0;
	BCF        PIR1+0, 0
;activeload.c,20 :: 		dyn_mode_flag.B7 = 1;
	BSF        _dyn_mode_flag+0, 7
;activeload.c,21 :: 		}
L_interrupt_vector0:
;activeload.c,22 :: 		}
L_end_interrupt_vector:
L__interrupt_vector18:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt_vector

_main:

;activeload.c,24 :: 		void main() {
;activeload.c,25 :: 		InitPic();
	CALL       _InitPic+0
;activeload.c,27 :: 		LCDWriteFromROM(1,1, s_TesterName);
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_TesterName+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_TesterName+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;activeload.c,28 :: 		LCDWriteFromROM(2,1, s_TesterVersion);
	MOVLW      2
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_TesterVersion+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_TesterVersion+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;activeload.c,30 :: 		LoadFromEEPROMBaseKoef();
	CALL       _LoadFromEEPROMBaseKoef+0
;activeload.c,31 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;activeload.c,32 :: 		Delay_1sec();
	CALL       _Delay_1sec+0
;activeload.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;activeload.c,35 :: 		mode1 = 0;
	CLRF       _mode1+0
;activeload.c,36 :: 		start_soft:;
___main_start_soft:
;activeload.c,37 :: 		LCDWriteFromROM(1,1, s_SelectMode);
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_row+0
	MOVLW      1
	MOVWF      FARG_LCDWriteFromROM_col+0
	MOVLW      _s_SelectMode+0
	MOVWF      FARG_LCDWriteFromROM_text+0
	MOVLW      hi_addr(_s_SelectMode+0)
	MOVWF      FARG_LCDWriteFromROM_text+1
	CALL       _LCDWriteFromROM+0
;activeload.c,38 :: 		LCDShowStringFromEEPROM(2, 8 + mode1); //
	MOVLW      2
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVF       _mode1+0, 0
	ADDLW      8
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;activeload.c,39 :: 		do{
L_main1:
;activeload.c,40 :: 		short_1 = GetKeyNormal();
	CALL       _GetKeyNormal+0
	MOVF       R0+0, 0
	MOVWF      _short_1+0
;activeload.c,43 :: 		if (short_1 == key_up){
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;activeload.c,44 :: 		if (mode1 > 0){
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _mode1+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;activeload.c,45 :: 		mode1 --;
	DECF       _mode1+0, 1
;activeload.c,46 :: 		LCDShowStringFromEEPROM(2, 8 + mode1); //
	MOVLW      2
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVF       _mode1+0, 0
	ADDLW      8
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;activeload.c,47 :: 		}
L_main5:
;activeload.c,48 :: 		}
	GOTO       L_main6
L_main4:
;activeload.c,50 :: 		else if (short_1 == key_down){
	MOVF       _short_1+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;activeload.c,51 :: 		if (mode1 < 1){
	MOVLW      128
	XORWF      _mode1+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;activeload.c,52 :: 		mode1 ++;
	INCF       _mode1+0, 1
;activeload.c,53 :: 		LCDShowStringFromEEPROM(2, 8 + mode1); //
	MOVLW      2
	MOVWF      FARG_LCDShowStringFromEEPROM_lcd_row+0
	MOVF       _mode1+0, 0
	ADDLW      8
	MOVWF      FARG_LCDShowStringFromEEPROM_num+0
	CALL       _LCDShowStringFromEEPROM+0
;activeload.c,54 :: 		}
L_main8:
;activeload.c,55 :: 		}
	GOTO       L_main9
L_main7:
;activeload.c,57 :: 		else if (short_1 == key_select){
	MOVF       _short_1+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;activeload.c,58 :: 		switch(mode1){
	GOTO       L_main11
;activeload.c,60 :: 		case 0:
L_main13:
;activeload.c,61 :: 		DoATXTester();
	CALL       _DoATXTester+0
;activeload.c,62 :: 		goto start_soft;
	GOTO       ___main_start_soft
;activeload.c,65 :: 		case 1:
L_main14:
;activeload.c,66 :: 		DoAnyPowerTester();
	CALL       _DoAnyPowerTester+0
;activeload.c,67 :: 		goto start_soft;
	GOTO       ___main_start_soft
;activeload.c,69 :: 		}
L_main11:
	MOVF       _mode1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _mode1+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main14
;activeload.c,70 :: 		}
	GOTO       L_main15
L_main10:
;activeload.c,71 :: 		else if (short_1 == key_select_long){
	MOVF       _short_1+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;activeload.c,72 :: 		DoCalibrationMenu();
	CALL       _DoCalibrationMenu+0
;activeload.c,73 :: 		goto start_soft;
	GOTO       ___main_start_soft
;activeload.c,74 :: 		}
L_main16:
L_main15:
L_main9:
L_main6:
;activeload.c,75 :: 		}while(1);
	GOTO       L_main1
;activeload.c,76 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
