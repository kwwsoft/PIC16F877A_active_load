
_GetKeyNormal:

;keyboard.c,8 :: 		char GetKeyNormal(){
;keyboard.c,10 :: 		key_press = 0;
	CLRF       _key_press+0
	CLRF       _key_press+1
	CLRF       _key_press+2
	CLRF       _key_press+3
;keyboard.c,11 :: 		short_1 = (PORTB & 0b00110000);
	MOVLW      48
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      _short_1+0
;keyboard.c,13 :: 		if (short_1 == 0b00110000)
	MOVF       R1+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_GetKeyNormal0
;keyboard.c,14 :: 		return key_nothing;
	CLRF       R0+0
	GOTO       L_end_GetKeyNormal
L_GetKeyNormal0:
;keyboard.c,16 :: 		do{
L_GetKeyNormal1:
;keyboard.c,17 :: 		key_press ++;
	MOVF       _key_press+0, 0
	MOVWF      R0+0
	MOVF       _key_press+1, 0
	MOVWF      R0+1
	MOVF       _key_press+2, 0
	MOVWF      R0+2
	MOVF       _key_press+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _key_press+0
	MOVF       R0+1, 0
	MOVWF      _key_press+1
	MOVF       R0+2, 0
	MOVWF      _key_press+2
	MOVF       R0+3, 0
	MOVWF      _key_press+3
;keyboard.c,19 :: 		if (key_press > 20000){
	MOVF       _key_press+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__GetKeyNormal22
	MOVF       _key_press+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__GetKeyNormal22
	MOVF       _key_press+1, 0
	SUBLW      78
	BTFSS      STATUS+0, 2
	GOTO       L__GetKeyNormal22
	MOVF       _key_press+0, 0
	SUBLW      32
L__GetKeyNormal22:
	BTFSC      STATUS+0, 0
	GOTO       L_GetKeyNormal4
;keyboard.c,21 :: 		if (key_press > 200000){
	MOVF       _key_press+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__GetKeyNormal23
	MOVF       _key_press+2, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__GetKeyNormal23
	MOVF       _key_press+1, 0
	SUBLW      13
	BTFSS      STATUS+0, 2
	GOTO       L__GetKeyNormal23
	MOVF       _key_press+0, 0
	SUBLW      64
L__GetKeyNormal23:
	BTFSC      STATUS+0, 0
	GOTO       L_GetKeyNormal5
;keyboard.c,22 :: 		return key_nothing;
	CLRF       R0+0
	GOTO       L_end_GetKeyNormal
;keyboard.c,23 :: 		}
L_GetKeyNormal5:
;keyboard.c,25 :: 		if (short_1 == 0b00000000){
	MOVF       _short_1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_GetKeyNormal6
;keyboard.c,26 :: 		short_1 = key_select_long;
	MOVLW      6
	MOVWF      _short_1+0
;keyboard.c,27 :: 		}
	GOTO       L_GetKeyNormal7
L_GetKeyNormal6:
;keyboard.c,29 :: 		else if (short_1 == 0b00010000){
	MOVF       _short_1+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L_GetKeyNormal8
;keyboard.c,30 :: 		short_1 = key_up_long;
	MOVLW      4
	MOVWF      _short_1+0
;keyboard.c,31 :: 		}
	GOTO       L_GetKeyNormal9
L_GetKeyNormal8:
;keyboard.c,34 :: 		short_1 = key_down_long;
	MOVLW      5
	MOVWF      _short_1+0
;keyboard.c,35 :: 		}
L_GetKeyNormal9:
L_GetKeyNormal7:
;keyboard.c,36 :: 		PlaySound_1000_50();
	CALL       _PlaySound_1000_50+0
;keyboard.c,37 :: 		PlaySound_500_50();
	CALL       _PlaySound_500_50+0
;keyboard.c,38 :: 		PlaySound_1000_50();
	CALL       _PlaySound_1000_50+0
;keyboard.c,39 :: 		PlaySound_500_50();
	CALL       _PlaySound_500_50+0
;keyboard.c,41 :: 		do{
L_GetKeyNormal10:
;keyboard.c,42 :: 		}while((PORTB & 0b00110000) != 0b00110000);
	MOVLW      48
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_GetKeyNormal10
;keyboard.c,44 :: 		return short_1;
	MOVF       _short_1+0, 0
	MOVWF      R0+0
	GOTO       L_end_GetKeyNormal
;keyboard.c,45 :: 		}
L_GetKeyNormal4:
;keyboard.c,46 :: 		}while( short_1 == (PORTB & 0b00110000) );
	MOVLW      48
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSC      _short_1+0, 7
	MOVLW      255
	MOVWF      R0+0
	MOVLW      0
	XORWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetKeyNormal24
	MOVF       R1+0, 0
	XORWF      _short_1+0, 0
L__GetKeyNormal24:
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyNormal1
;keyboard.c,48 :: 		if (key_press < 1500){
	MOVLW      0
	SUBWF      _key_press+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetKeyNormal25
	MOVLW      0
	SUBWF      _key_press+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetKeyNormal25
	MOVLW      5
	SUBWF      _key_press+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetKeyNormal25
	MOVLW      220
	SUBWF      _key_press+0, 0
L__GetKeyNormal25:
	BTFSC      STATUS+0, 0
	GOTO       L_GetKeyNormal13
;keyboard.c,49 :: 		return key_nothing;
	CLRF       R0+0
	GOTO       L_end_GetKeyNormal
;keyboard.c,50 :: 		}
L_GetKeyNormal13:
;keyboard.c,52 :: 		if (short_1 == 0b00000000){
	MOVF       _short_1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_GetKeyNormal14
;keyboard.c,53 :: 		short_1 = key_select;
	MOVLW      3
	MOVWF      _short_1+0
;keyboard.c,54 :: 		}
	GOTO       L_GetKeyNormal15
L_GetKeyNormal14:
;keyboard.c,56 :: 		else if (short_1 == 0b00010000){
	MOVF       _short_1+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L_GetKeyNormal16
;keyboard.c,57 :: 		short_1 = key_up;
	MOVLW      1
	MOVWF      _short_1+0
;keyboard.c,58 :: 		}
	GOTO       L_GetKeyNormal17
L_GetKeyNormal16:
;keyboard.c,61 :: 		short_1 = key_down;
	MOVLW      2
	MOVWF      _short_1+0
;keyboard.c,62 :: 		}
L_GetKeyNormal17:
L_GetKeyNormal15:
;keyboard.c,63 :: 		PlaySound_1000_50();
	CALL       _PlaySound_1000_50+0
;keyboard.c,64 :: 		PlaySound_500_50();
	CALL       _PlaySound_500_50+0
;keyboard.c,66 :: 		do{
L_GetKeyNormal18:
;keyboard.c,67 :: 		}while((PORTB & 0b00110000) != 0b00110000);
	MOVLW      48
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_GetKeyNormal18
;keyboard.c,69 :: 		return short_1;
	MOVF       _short_1+0, 0
	MOVWF      R0+0
;keyboard.c,70 :: 		}
L_end_GetKeyNormal:
	RETURN
; end of _GetKeyNormal
