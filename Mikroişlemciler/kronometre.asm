#include <P16F877A.INC>
__config H'3F31'

SAYAC EQU 0x21
SAYAC2 EQU 0x22
SAYICI_BIRLER EQU 0x23
SAYICI_ONLAR EQU 0x24

org 0x00
goto MAIN
org 0x04
goto KESME


KESME
	bcf INTCON, 7
	btfss INTCON, 2
	return
	clrf TMR0
	bcf INTCON, 2
	movlw b'00000001'
	addwf SAYAC
	btfsc STATUS, 0
	call X
	bsf INTCON, 7
	retfie

X
	movlw b'00000001'
	addwf SAYICI_BIRLER
	movlw 0x0C					; B olarak dene bir de
	movwf SAYAC
	return

MAIN
	bsf STATUS, RP0			
	movlw b'00000011'
	movwf OPTION_REG	
	clrf TRISB
	clrf TRISC
	bcf STATUS, RP0
	bsf INTCON, 7
	bsf INTCON, 5
	bcf INTCON, 2
	movlw 0x00
	movwf TMR0
 	clrf PORTB
	movlw 0x06
	movwf SAYAC
DONGU
	movlw b'00000010'
	movwf PORTC
	movf SAYICI_BIRLER, W
	call LOOK_UP	
	movwf PORTB
	call BEKLE

	movlw b'00000001'
	movwf PORTC

	movf SAYICI_ONLAR, W
	call LOOK_UP	
	movwf PORTB

	call BEKLE
	btfsc SAYICI_BIRLER, 3
	goto DOKUZ_MU
	goto DONGU

DOKUZ_MU
	btfsc SAYICI_BIRLER, 1
	goto DOKUZMUS
	goto DONGU
	
DOKUZMUS
	clrf SAYICI_BIRLER
	incf SAYICI_ONLAR
	btfsc SAYICI_ONLAR, 2
	goto ALTI_MI
	goto DONGU
ALTI_MI
	btfsc SAYICI_ONLAR, 1
	clrf SAYICI_ONLAR
	goto DONGU
	
BEKLE
	movlw 0x90
	movwf SAYAC2
BEKLE_DONGU
	decfsz SAYAC2, F
	goto BEKLE_DONGU
	return

LOOK_UP
	addwf PCL,1
	retlw b'11000000'        
	retlw b'11111001'
	retlw b'10100100'
	retlw b'10110000'
	retlw b'10011001'
	retlw b'10010010'
	retlw b'10000010'
	retlw b'11111000'
	retlw b'10000000'
	retlw b'10011000'
	
END