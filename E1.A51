//Practical - 1B
//To add Block of data assuming the sum to be 16 bit. 
//NAME:- MRUNALI BALASAHEB BHAGYAWANT
//PRN NO.:- 22311520
//ROLL NO.:- 213047
//BATCH:- C2
//DATE:- 

ORG 0000H
SETB PSW.3       //SET REGISTER BANK 1
MOV R0,#30H      //SOURCE DESTINATION
MOV R1,#0AH      //COUNTER TO 10
MOV A,@R0        // MOV NUMBER FROM R0 TO ACCUM.
UP: INC R0       // INC R0
ADD A, @R0       //A= A+@R0
MOV R2,A         // R2=A
JC DOWN          // JUMP TO DOWN WHEN CARRY=1
SJMP L1          // SHORT JUMP TO L1
DOWN: INC R3     // INCREMENT R3 FOR CARRY
L1:DJNZ R1, UP   // DEC R1 AND JUMP TO UP WHEN R1!=0 
END 
