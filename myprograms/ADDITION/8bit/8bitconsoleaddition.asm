DATA  SEGMENT 
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
    
    MOV AL,A          ; GET THE VALUE OF A INTO AL REGISTER
    ADD AL,B          ; ADD VALUE OF B AND AL AND STORE IT IN AL
    JNC SKIP          ; JUMP TO LABEL SKIP IF THER IS NO CARRY
    INC CARRY;        ; IF THER IS A CARRY INCREMENT CARRY
  SKIP: MOV SUM,AL    ; MOVE ADDITION RESULT INTO SUM VARIABLE   
  MOV AH,4CH          ;
  INT 21H             ;  HALT THE PROGRAM AND GO TO DOS
CODE ENDS
END START 


----------------------------

''''''''8 BIT ADDTION '''''' 
AUTHOR : DEEPAK M S

------------------------------
