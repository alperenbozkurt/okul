#include <P16F877A.INC>
__config H'3F31'
SAYICI EQU 0x20
SAYAC EQU 0X22
org 0x00
goto SETTINGS

SETTINGS
	bsf STATUS, RP0
	clrf TRISC
	clrf TRISB
	bcf STATUS, RP0
	movlw b'00000001'
	movwf PORTC
	clrf PORTB
	clrf SAYICI
	goto MAIN

MAIN
	btfsc SAYICI,2
	call SIFIRLA
	movf SAYICI,0
	call LOOK_AT
	movwf PORTB
	movlw b'00000001'
	addwf SAYICI
	call BEKLE
	rlf PORTC
	goto MAIN

BEKLE
	movlw b'11111111'
	movwf SAYAC
DONGU
	decfsz SAYAC,F
	goto DONGU
	return

LOOK_AT
	addwf PCL
	retlw b'00000000'
	retlw b'01110110'
	retlw b'01110110'
	retlw b'01110110'
	retlw b'00000000'
	return

SIFIRLA
	btfsc SAYICI, 0
	goto SIFIRLA_IKI
	return
SIFIRLA_IKI
	clrf SAYICI
	movlw b'00000001'
	movwf PORTC
END











