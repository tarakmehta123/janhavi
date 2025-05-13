; Experiment 4C: Serial Communication using UART of 8051 Microcontroller
; Name : Mrunali Bhagyawant
; Batch : C2
; Roll No : 213047
; PRN no : 22311520


ORG 0000H
MOV SCON, #50H ;Initializing serial communication in mode 1
MOV TMOD, #20H ;Initializing timer 1 in mode 3(auto reload mode)
MOV TH1, #-3 ;Setting baudrate as 9600,4800 and 2400
SETB TR1

MAIN_LOOP:
JNB RI, MAIN_LOOP ; Receiving Data
MOV A, SBUF
MOV P1, A
CLR RI
MOV DPTR, #MESS

SEND_MSG:
CLR A
MOVC A, @A+DPTR ; Transferring message using MOVC instruction
JZ MAIN_LOOP
MOV SBUF, A
JNB TI, $
CLR TI
INC DPTR
SJMP SEND_MSG

MESS:
DB 'WELCOME TO VIIT', 0x0D, 0x0A
DB 'WELCOME TO ENTC Department', 0x0D, 0x0A
DB 'Mrunali Bhagyawant',0x0D,0x0A
DB 'PRN NO:22311520', 0x0D, 0x0A
DB 'Roll No.:213047', 0x0D, 0x0A
DB 'Batch:C2', 0x0D, 0x0A
DB 0 ; Null-terminated string

END
