//EXPT-1D 
//Conversion of Fahrenheit to Celsius.
//NAME:- MRUNALI BALASAHEB BHAGYAWANT
//PRN NO.:- 22311520
//ROLL NO.:- 213047
//BATCH:- C2
//DATE:- 

ORG 0000h
MOV R0, #40h  ; Destination address 
MOV R1, #30h  ; Source address
MOV R2, #05h  ; Counter (number of values)

UP:
    MOV A, @R1    ; Load Fahrenheit value
    
    SUBB A, #32   ; A = F - 32
    
    MOV B, #05    ; Load 5 into B
    MUL AB        ; A = (F-32) * 5, result is in A (low), B (high)

    MOV B, #00    ; *Clear B to prevent incorrect division*
    MOV B, #09    ; Load 9 into B
    DIV AB        ; A = ((F-32) * 5) / 9

    MOV @R0, A    ; Store Celsius result

    INC R0        ; Move to next destination
    INC R1        ; Move to next source
    DJNZ R2, UP   ; Repeat for remaining values

END