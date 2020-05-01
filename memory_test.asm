;*************Function Description**************

;This program used an algotithm which is similar to MSCAN algorithm to implement a simple memory tester.
;Switch K1 is connected to P2.7, K2 is connected to P2.6
;LED light L1 is connected to P2.3, L2 is connected to P2.2

;******************************************

ORG 0
JMP MAIN
ORG 50H
MAIN:  	
k1: JNB P2.7,k2_1
	JB P2.7,k2_2
k2_1: JNB P2.6, ENDING
	JB P2.6, INTERNAL
k2_2: JB P2.6,ENDING
	JNB P2.6,EXTERNAL

ENDING:
	SETB P2.2
	SETB P2.3
	SJMP $
		
INTERNAL:
	testR0: MOV R0,#00H
	MOV A,R0
	JZ testR1

testR1: MOV R1,#0FFH
	MOV A,R1
	MOV R2,A
	CJNE R2,#0FFH,WRONG
testR2:	MOV R2,#0FFH
	MOV A,R1
	MOV R2,A
	CJNE R1,#0FFH,WRONG
	
	MOV R1,#02H
	MOV R0,#253
LOOP:	
	INC R1
	MOV @R1,#00H
	MOV A,@R1
	MOV R2,A
	CJNE R2,#00H,WRONG
	MOV @R1,#0FFH
	MOV A,@R1
	MOV R2,A
	CJNE R2,#0FFH,WRONG
	DJNZ R0,LOOP
	MOV R0,#89H
	JMP CORRECT

WRONG:
	MOV @R0,#55H
LOOP2: CLR P2.3
	CALL DELAY
	SETB P2.3
	JMP LOOP2

CORRECT:
	MOV @R0,#0AAH
	CLR P2.3
	SJMP $
		
EXTERNAL:
	MOV DPTR,#00H
	MOV R0,#0FFFFFFH
LOOP1:	
	MOV A,#00H
	MOVX @DPTR,A
	MOVX A,@DPTR
	JNZ WRONG2
	MOV A,#0FFH
	MOVX @DPTR,A
	MOVX A,@DPTR
	CJNE A,#0FFH,WRONG2
	INC DPTR
	DJNZ R0,LOOP1
	MOV DPTR,#800H
	JMP CORRECT2
	
CORRECT2:
	MOV A,#0AAH
	MOVX @DPTR,A
	CLR P2.2
	SJMP $
	
WRONG2:
	MOV A,#55H
	MOVX @DPTR,A
LOOP3: CLR P2.2
	CALL DELAY
	SETB P2.2
	JMP LOOP3

;******************************************
DELAY:                  ;ÑÓÊ±×Ó³ÌÐò(500ms)
    MOV R3,#50
D1: MOV R4,#20
D2: MOV R5,#248
    DJNZ R5,$
    DJNZ R4,D2
    DJNZ R3,D1
    RET           ;·µ»Ø×Ó³ÌÐò
	
END	
