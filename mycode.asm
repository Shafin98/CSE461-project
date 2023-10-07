.MODEL SMALL 
 
.STACK 100H
  
.DATA
  a db "invalid $"
  b db "Enter a number between 5 and 9: $"
  c db "loop runs $"
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        
        ;input
        lea dx,b      
        mov ah,09h
        int 21h 
        
        
        MOV AH ,2 
        MOV DL,0DH 
        INT 21h 
        MOV DL,0AH 
        INT 21h
        
        mov ah,1
        int 21h 
        mov bl, al
        sub bl, 30h 
        
        cmp bl, 5       ;compair with 5
        jg j1
        jmp e1
        
        e1:             ;invalid number
        MOV AH ,2 
        MOV DL,0DH 
        INT 21h 
        MOV DL,0AH 
        INT 21h
        
        lea dx,a      
        mov ah,09h
        int 21h
        jmp exit
        
        j1:
        cmp bl, 9       ;compair with 9
        jl j2
        jmp e1 
        
        j2:             ;valid number
        MOV AH ,2 
        MOV DL,0DH 
        INT 21h 
        MOV DL,0AH 
        INT 21h
        
        mov cl, bl
        add bl, 30h
        mov dl,bl
        mov ah,2
        int 21h
        jmp exit
        exit:           ;end of task (a)
        
        
        MOV AH ,2 
        MOV DL,0DH 
        INT 21h 
        MOV DL,0AH 
        INT 21h
        add cl,30h
        mov bl,30h
        mov ah,2
        start:
        cmp bl, cl
        jge end              
        mov ah,1
        int 21h
        inc bl        
        jmp start       ;end of task (b)
        end:      
        
        
            
               
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN