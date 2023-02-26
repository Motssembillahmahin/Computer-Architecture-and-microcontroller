
_MSDelay:

;dotmatrix.c,8 :: 		void MSDelay()//Delay function
;dotmatrix.c,11 :: 		for(y = 0;y<60;y++);//For loop for delay
	CLRF       R1+0
L_MSDelay0:
	MOVLW      60
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_MSDelay1
	INCF       R1+0, 1
	GOTO       L_MSDelay0
L_MSDelay1:
;dotmatrix.c,12 :: 		}
L_end_MSDelay:
	RETURN
; end of _MSDelay

_main:

;dotmatrix.c,13 :: 		void main() //main function
;dotmatrix.c,15 :: 		TRISC = 0x00; //Define PORTC as output
	CLRF       TRISC+0
;dotmatrix.c,16 :: 		TRISD = 0x00; //define portd as output
	CLRF       TRISD+0
;dotmatrix.c,17 :: 		RData = 0; //aasigned intial value as zero
	CLRF       _RData+0
;dotmatrix.c,18 :: 		CData = 0; //assigned intial value as zero
	CLRF       _CData+0
;dotmatrix.c,19 :: 		Nex = 0;//Assigned intial value 0
	CLRF       _Nex+0
;dotmatrix.c,20 :: 		while(1)
L_main3:
;dotmatrix.c,22 :: 		for(Del = 0; Del<5;Del++)  //delay for next character Data
	CLRF       _Del+0
L_main5:
	MOVLW      5
	SUBWF      _Del+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;dotmatrix.c,24 :: 		for(CData = 0;CData <8;CData++)//for loop for moving character
	CLRF       _CData+0
L_main8:
	MOVLW      8
	SUBWF      _CData+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;dotmatrix.c,26 :: 		COL = COL_Data[CData];//find code and send data to column
	MOVF       _CData+0, 0
	ADDLW      _COL_Data+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;dotmatrix.c,27 :: 		ROW = ROW_Data[RData]; //find code and send data to Row
	MOVF       _RData+0, 0
	ADDLW      _ROW_Data+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;dotmatrix.c,28 :: 		MSDelay();   //Delay
	CALL       _MSDelay+0
;dotmatrix.c,29 :: 		RData++;  //increament Rdata
	INCF       _RData+0, 1
;dotmatrix.c,30 :: 		if(RData == 10) RData = 0;
	MOVF       _RData+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main11
	CLRF       _RData+0
L_main11:
;dotmatrix.c,24 :: 		for(CData = 0;CData <8;CData++)//for loop for moving character
	INCF       _CData+0, 1
;dotmatrix.c,31 :: 		}
	GOTO       L_main8
L_main9:
;dotmatrix.c,32 :: 		RData = Nex;
	MOVF       _Nex+0, 0
	MOVWF      _RData+0
;dotmatrix.c,33 :: 		if(Nex == 10) Nex = 0;
	MOVF       _Nex+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main12
	CLRF       _Nex+0
L_main12:
;dotmatrix.c,22 :: 		for(Del = 0; Del<5;Del++)  //delay for next character Data
	INCF       _Del+0, 1
;dotmatrix.c,34 :: 		}
	GOTO       L_main5
L_main6:
;dotmatrix.c,35 :: 		Nex++;
	INCF       _Nex+0, 1
;dotmatrix.c,36 :: 		RData = Nex;
	MOVF       _Nex+0, 0
	MOVWF      _RData+0
;dotmatrix.c,37 :: 		}
	GOTO       L_main3
;dotmatrix.c,38 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
