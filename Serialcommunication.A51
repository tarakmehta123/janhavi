//Experiment 4A Assembly language programming to interface Serial communication using UART of 8051 with PC using various baudrate
//NAME:- MRUNALI BALASAHEB BHAGYAWANT
//PRN NO.:- 22311520
//ROLL NO.:- 213048
//BATCH:- C2
//DATE:- 

ORG 0000h
   MOV TMOD, #20h
   MOV TH1, #-3
   MOV SCON, #50H
   SETB TR1
   
 AGAIN: MOV A, #"W"
        ACALL TRANS
        MOV A, #"E"
        ACALL TRANS
        MOV A, #"L"
		ACALL TRANS
		MOV A, #"C"
        ACALL TRANS
        MOV A, #"O"
        ACALL TRANS
        MOV A, #"M"
		ACALL TRANS
		MOV A, #"E"
        ACALL TRANS
        MOV A, #"T"
        ACALL TRANS
        MOV A, #"O"
		ACALL TRANS
		MOV A, #" "
        ACALL TRANS
        MOV A, #"V"
        ACALL TRANS
        MOV A, #"I"
		ACALL TRANS
		MOV A, #"I"
        ACALL TRANS
        MOV A, #"T"
        ACALL TRANS
        MOV A, #" "
		ACALL TRANS
		MOV A, #"M"
        ACALL TRANS
        MOV A, #"R"
        ACALL TRANS
        MOV A, #"U"
		ACALL TRANS
		MOV A, #"N"
        ACALL TRANS
        MOV A, #"A"
        ACALL TRANS
        MOV A, #"L"
		ACALL TRANS
		SJMP AGAIN
		
 TRANS: MOV SBUF, A
 
 HERE: JNB TI, HERE
       CLR TI
       RET
	   
 END