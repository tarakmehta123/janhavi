; Problem Statement C: Interface stepper motor with 89S52 and rotate in half drive stepping clockwise and anticlockwise direction for 360 degrees continuously.
; Name : Mrunali Bhagyawant
; Batch : C2
; PRN no : 22311520


ORG 0000H
start3: MOV R3,#12 ; Counter for 360 degrees rotation

START1:
MOV P2,#00000001B
ACALL DELAY
MOV P2,#00000011B
ACALL DELAY
MOV P2,#00000010B
ACALL DELAY
MOV P2,#00000110B
ACALL DELAY
MOV P2,#00000100B
ACALL DELAY
MOV P2,#00001100B
ACALL DELAY
MOV P2,#00001000B
ACALL DELAY
MOV P2,#00001001B
ACALL DELAY
DJNZ R3, START1 ; For infinite loop
MOV R3,#12

START2:
MOV P2,#00001001B
ACALL DELAY
MOV P2,#00001000B
ACALL DELAY
MOV P2,#00001100B
ACALL DELAY
MOV P2,#00000100B
ACALL DELAY
MOV P2,#00000110B
ACALL DELAY
MOV P2,#00000010B
ACALL DELAY
MOV P2,#00000011B
ACALL DELAY
MOV P2,#00000001B
ACALL DELAY
DJNZ R3, START2
SJMP START3 ; After anticlockwise rotation, return to clockwise rotation

DELAY:
MOV R2,#01
L4: MOV R1, #255 ; Outer loop counter
L3: MOV R0, #255 ; Inner loop counter
L2: DJNZ R0, L2 ; Decrement R6 until it reaches 0
DJNZ R1, L3 ; Decrement R7 until it reaches 0
DJNZ R2, L4
RET ; Return to main program
END
