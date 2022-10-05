DATA  SEGMENT   
    MSG1 DB 0DH,0AH,"-------------------- $"
    MSG2 DB 0DH,0AH," 8 BIT ADDITION $"
    MSG3 DB 0DH,0AH," AUTHOR : DEEPAK M S $"
    MSG4 DB 0DH,0AH,"--------------------- $"
    MSG5 DB 0DH,0AH," VALUE OF 1 ST VARIABLE : $"
    MSG6 DB 0DH,0AH," VALUE OF 2 ND VARIABLE : $"
    MSG7 DB 0DH,0AH," SUM = $"
    MSG8 DB 0DH,0AH," CARRY = $"
    A DB 54H;
    B DB 55H;
    SUM DB ? ; INITIALIZE SUM WITH GARBAGE VALUE
    CARRY DB 00H;
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA;   
START: 
    MOV AX,DATA       ;
    MOV DS,AX         ; INITIALIZE DATA SEGMENT 
    
    MOV AH,09H        ;  PRINT THE MESSAGE
    LEA DX,MSG1       ;
    INT 21H           ;  
    
    MOV AH,09H        ;
    LEA DX,MSG2       ;
    INT 21H           ;
    MOV AH,09H        ;
    LEA DX,MSG3       ;
    INT 21H           ;
    MOV AH,09H        ;
    LEA DX,MSG4       ;
    INT 21H           ;
    
    MOV AH,09H        ;
    LEA DX,MSG5       ;
    INT 21H           ;  
    LEA SI,A          ;
    CALL OUTPUTCON        ;
    
    MOV AH,09H        ;
    LEA DX,MSG6       ;
    INT 21H           ; 
    LEA SI,B          ;
    CALL OUTPUTCON    ;
     
    
    MOV AL,A          ; GET THE VALUE OF A INTO AL REGISTER
    ADD AL,B          ; ADD VALUE OF B AND AL AND STORE IT IN AL
    JNC SKIP          ; JUMP TO LABEL SKIP IF THER IS NO CARRY
    INC CARRY;        ; IF THER IS A CARRY INCREMENT CARRY
  SKIP: MOV SUM,AL    ; MOVE ADDITION RESULT INTO SUM VARIABLE   
  
    MOV AH,09H        ;
    LEA DX,MSG7       ;
    INT 21H           ;  
    LEA SI,SUM          ;
    CALL OUTPUTCON    ;
    
    MOV AH,09H        ;
    LEA DX,MSG8       ;
    INT 21H           ; 
    LEA SI,CARRY          ;
    CALL OUTPUTCON    ;
    
    MOV AH,4CH          ;
    INT 21H             ;  HALT THE PROGRAM AND GO TO DOS

PROC OUTPUTCON
PUSH CX

MOV AL,[SI]
AND AL,0F0H
MOV CL,04H
ROL AL,CL
ADD AL,30H
CMP AL, 39H
JLE P1
ADD AL,07H
P1: MOV AH,02H
MOV DL,AL
INT 21H

MOV AL,[SI]
AND AL,0FH
ADD AL,30H
CMP AL, 39H
JLE P2
ADD AL,07H
P2: MOV AH,02H
MOV DL,AL
INT 21H

POP CX

RET
ENDP OUTPUTCON
  
CODE ENDS
END START 


----------------------------

''''''''8 BIT ADDTION '''''' 
AUTHOR : DEEPAK M S

------------------------------
