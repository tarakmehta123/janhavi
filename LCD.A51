; Experiment 3: Interfacing of 16x2 LCD in 8-bit mode with 8051 Microcontroller
; Name : Mrunali Bhagyawant
; Batch : C2
; Roll No : 213047
; PRN no : 22311520

; Peripheral assignments
lcd equ p0        ; Define the LCD data port (P0)
rs  equ p2.0      ; Define the RS (Register Select) control pin (P2.0)
en  equ p2.1      ; Define the EN (Enable) control pin (P2.1)
rw  equ p2.2      ; Define the RW (Read/Write) control pin (P2.2)

org 0000h

; LCD Initialization
Mov A, #38H       ; Function set: 8-bit mode, 2-line, 5x8 dot matrix
acall comm        ; Call the command function
Mov A, #0EH       ; Display ON, Cursor ON
acall comm        ; Call the command function
Mov A, #01H       ; Clear display
acall comm        ; Call the command function
Mov A, #06H       ; Entry mode set: Increment cursor, no display shift
acall comm        ; Call the command function
Mov A, #80H       ; Set DDRAM address to 0 (start of the first line)
acall comm        ; Call the command function

; Displaying the name "MRUNALI"
Mov A, #'M'       ; Load ASCII value of 'M' into A
acall display     ; Display 'M' on LCD
Mov A, #'R'       ; Load ASCII value of 'R' into A
acall display     ; Display 'R' on LCD
Mov A, #'U'       ; Load ASCII value of 'U' into A
acall display     ; Display 'U' on LCD
Mov A, #'N'       ; Load ASCII value of 'N' into A
acall display     ; Display 'N' on LCD
Mov A, #'A'       ; Load ASCII value of 'A' into A
acall display     ; Display 'A' on LCD
Mov A, #'L'       ; Load ASCII value of 'L' into A
acall display     ; Display 'L' on LCD
Mov A, #'I'       ; Load ASCII value of 'I' into A
acall display     ; Display 'I' on LCD

; Move cursor to the second line of the LCD
Mov A, #0C0H      ; Set DDRAM address to start of second line
acall comm        ; Call the command function

; Display the string "213047"
Mov A, #'2'
acall display
Mov A, #'1'
acall display
Mov A, #'3'
acall display
Mov A, #'0'
acall display
Mov A, #'4'
acall display
Mov A, #'7'
acall display

; Command function to send control instructions to LCD
comm:
    acall delay
    Mov lcd, A
    clr rs
    clr rw
    setb en
    nop
    nop
    clr en
    ret

; Display function to send data (characters) to LCD
display:
    acall delay
    Mov lcd, A
    setb rs
    clr rw
    setb en
    nop
    nop
    clr en
    ret

; Delay function to create a time delay for LCD operations
delay:
    mov R6, #20
d1: mov R7, #250
d2: djnz R7, d2
    djnz R6, d1
    ret

sjmp $            ; Infinite loop to end the program
end               ; End of program
