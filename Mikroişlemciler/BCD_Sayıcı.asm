#INCLUDE <P16F877A.INC>
ORG 0X00
GOTO MAIN

MAIN
	bsf STATUS, RP0
	clrf TRISB
	movlw b'00000011'
	movwf TRISA
	movlw b'00000110'
	movwf ADCON1
	bcf STATUS, RP0
	clrf PORTA
	clrf PORTB
	goto DONGU
DONGU
	btfsc PORTA, 0
	goto ARTTIR
	btfsc PORTA, 1
	goto AZALT
	goto DONGU
ARTTIR
	movlw b'00000001'
	addwf PORTB
	btfsc PORTB, 3
	GOTO SIFIRLA
	goto BEKLETICI
AZALT
	movlw b'00000001'
	subwf PORTB
	btfsc PORTB, 4
	GOTO DOKUZYAP
	goto BEKLETICI
BEKLETICI
	btfsc PORTA, 1
	goto BEKLETICI
	btfsc PORTA, 0
	goto BEKLETICI
	goto DONGU
SIFIRLA
	btfsc PORTB, 1
	clrf PORTB
	goto BEKLETICI
DOKUZYAP
	movlw b'00001001'
	movwf PORTB
	goto BEKLETICI
END
