
limpiarPantalla macro  
            
    mov ah,00h     
    mov al,03      
    int 10h 
     
endm
mensajem macro 
  
   lea dx, numero1
   mov ah, 09h
   int 21h
   mov ah,01h     ;Function(character read) Guarda en AL
   int 21h        
   sub al,30h     ;ajustamos valores
   mov chr1,al    

   mov ah,01h     
   int 21h        
   sub al,30h     ;Ajustamos valores
   mov chr2,al    

   lea dx, numero1
   mov ah, 09h
   int 21h 

   mov ah,01h     ;Function(Read character) Guarda en AL
   int 21h        
   sub al,30h    
   mov chr3,al    
  
   mov ah,01h     
   int 21h        
   sub al,30h     
   mov chr4,al    

   lea dx, resultado
   mov ah, 09h
   int 21h          
endm  

division macro
   limpiarPantalla 
   lea dx, mensaje5
   mov ah, 09h
   int 21h    
   
           


 
        
DIVISION1:MOV BL,00H
          MOV VAR,BL
DIVISION:
         
       lea dx, numero1
       mov ah, 09h
       int 21h
         
         MOV AH,01H
         INT 21H 
         
         SUB AL,30H
         MOV BH,AL  ; primer numero en hexa
         
         MOV AH,01H
         INT 21H 
         
         SUB AL,30H  ;
         MOV BL,AL
         
         PUSH BX
         MOV BX,00H
           lea dx, numero2
       mov ah, 09h
       int 21h
                                                          
         MOV AH,01H
         INT 21H
          
         SUB AL,30H
         MOV CH,AL  ; segundo numero en hexa 
           
         MOV AH,01H
         INT 21H 
         
         SUB AL,30H
         MOV CL,AL    
         
         POP BX
           
         CMP CX,BX
         JA DIVISION
         
         
         MOV AL,0AH ;MULTIPLICAR POR 10 AL SEGMENTO CH Y SE GUARDA EN EL SEGMENTO AL
         MUL BH 
         ADD BL,AL
         MOV NUM1,BL ; NUMERO EN DECIMAL    
         
         MOV AL,0AH ;MULTIPLICAR POR 10 AL SEGMENTO CH Y SE GUARDA EN EL SEGMENTO AL
         MUL CH 
         ADD CL,AL
         MOV NUM2,CL ; NUMERO EN DECIMAL
         
         MOV AL,VAR
         CMP AL,32H
         
         
         MOV AL,NUM1
         MOV CL,NUM2
         MOV DX,00H
         
         div CL
         mov residuo,AH
         MOV cocien,AL
         
         CMP AH,0AH
         JAE ACARREO
         MOV BX,00H  
         
        linea_nueva
        lea dx, textox
       mov ah, 09h
       int 21h
         MOV DL,residuo
         ADD DL,30H
         MOV AH,02h  ;muestras el numero guardado en memoria,"dl"
         INT 21h  
         
         MOV BX,00H 
                
COCIENTE: 
         linea_nueva
         lea dx, texto9
         mov ah, 09h
         int 21h
          
         MOV DL,cocien 
         ADD DL,30H
         MOV AH,02h  ;muestras el numero guardado en memoria,"dl"
         INT 21h 
    
       
         

ACARREO: MOV AL,AH
         MOV AH,00H
         AAM 
         
         ADD AH,30H
         ADD AL,30H 
         
         PUSH AX
         MOV BX,00H
         
         
        
         
         POP AX
         PUSH AX
         MOV DL,AH
       
         POP AX
         MOV DL,AL
        
        
         

      
    lea dx, mensaje7
    mov ah, 09h
    int 21h 
   
    mov ah,01h
    int 21h  
  
    
endm    


suma macro
    limpiarPantalla 
    lea dx, mensaje2
    mov ah, 09h
    int 21h    
    MOV AH,9
    LEA DX,numero1
    INT 21H 
    ;Menaje 1
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV m,AL
    INT 21H
    SUB AL,30H
    MOV AH,m
    AAD
    MOV m,AL
    MOV AH,9
    LEA DX,numero2
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV n,AL
    INT 21H
    SUB AL,30H
    MOV AH,n
    AAD
    MOV n,AL 
        
    MOV AH,9
    LEA DX,resultado
    INT 21H 
    
    MOV AL,m
    ADD AL,n
    XOR AH,AH
    DIV cien
    ADD AL,30H
    MOV DL,AL
    MOV AL,AH
    AAM
    ADD AX,3030H
    MOV BX,AX
    MOV AH,2
    INT 21H
    MOV DL,BH
    INT 21H
    MOV DL,BL
    INT 21H 

    lea dx, mensaje7
    mov ah, 09h
    int 21h 
   
    mov ah,01h
    int 21h  
  
endm

multiplicacion macro 
   limpiarPantalla 
   lea dx, mensaje4
   mov ah, 09h
   int 21h    
   
   mensajem        

   

   ;Realizamos operacion   
  
   mov al,chr4  ; segundo numero
   mov bl,chr2  ; primer numero
   mul bl       ;multiplicar
   mov ah,0     
   aam          
   mov ac1,ah   
   mov r4,al    
            
   mov al,chr4  
   mov bl,chr1  
   mul bl       
   mov r3,al    
   mov bl,ac1   
   add r3,bl    
   mov ah,00h   
   mov al,r3    
   aam          
   mov r3,al    
   mov ac1,ah   

   mov al,chr3    
   mov bl,chr2    
   mul bl         
   mov Ah,0h      
   AAM            
   mov ac,AH      
   mov r2,AL      

   mov al,chr3    
   mov bl,chr1    
   mul bl         
   mov r1,al      
   mov bl,ac      
   add r1,bl      
   mov ah,00h     
   mov al,r1      
   AAM            
   mov r1,al      
   mov ac,ah      
  
  
   ;suma final
   
  
  
   mov ax,0000h   
  
   mov al,r3      
   mov bl,r2      
   add al,bl      ;sumamos
   mov ah,00h     
   aam            
   mov r3,al      
   mov r2,ah      
  
   mov ax,0000h   
  
   mov al,ac1     
   mov bl,r1      
   add al,r2      
   add al,bl      
   mov ah,00h     
   aam            
   mov r1,al      
   mov r2,ah      
  
   mov al,r2     
   mov bl,ac      
   add al,bl      
              
   mov ac,al      
  
 
  
   ;Mostramos resultado
   mov ah,02h 
   mov dl,ac
   add dl,30h
   int 21h        

   mov ah,02H
   mov dl,r1
   add dl,30h
   int 21h        

                 
  
   mov ah,02H
   mov dl,r3
   add dl,30h
   int 21h        
  
   mov ah,02H
   mov dl,r4
   add dl,30h
   int 21h 
   
   lea dx, mensaje7
   mov ah, 09h
   int 21h 
   
   mov ah,01h
   int 21h  

   
      
  
endm
linea_nueva macro
    mov dx,0ah
    mov ah,02h
    int 21h
    
    mov dl, 0dh
    mov ah, 02h
    int 21h
endm   
      

     
bucle macro 
   
    limpiarPantalla
    cmp al,5
    jmp start 
    
    
   
endm  
resta macro  
     limpiarPantalla 
    lea dx, mensaje3
    mov ah, 09h
    int 21h    
    MOV AH,9
    LEA DX,numero1
    INT 21H 
    ;Menaje 1
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV m,AL
    INT 21H
    SUB AL,30H
    MOV AH,m
    AAD
    MOV m,AL
    MOV AH,9
    LEA DX,numero2
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV n,AL
    INT 21H
    SUB AL,30H
    MOV AH,n
    AAD
    MOV n,AL 
    MOV AH,9     ;MENSAJE
    LEA DX,resultado   ;MENSAJE
    INT 21H      ;MENSAJE
    
    MOV AL,m
    SUB AL,n
    AAM
    ADD AX,3030H
    MOV BX,AX
    MOV AH,2
    MOV DL,BH
    INT 21H
    MOV DL,BL
    INT 21H
    MOV AH,9 
    
    lea dx, mensaje7
    mov ah, 09h
    int 21h 
   
    mov ah,01h
    int 21h  
endm

menu macro 
          lea dx, mensaje
          mov ah, 09h
          int 21h   
          lea dx, mensaje1
          mov ah, 09h
          int 21h      
          lea dx, mensaje2
          mov ah, 09h
          int 21h     
          lea dx, mensaje3
          mov ah, 09h
          int 21h
          lea dx, mensaje4
          mov ah, 09h
          int 21h     
          lea dx, mensaje5
          mov ah, 09h
          int 21h  
          lea dx, mensaje6
          mov ah, 09h
          int 21h  
          
          linea_nueva    
                 
          mov ah,01h
          int 21h  
                     
          xor ah,ah
          sub al,30h
          mov cx,2
          
            cmp al,1
            jz suma ;se dirige al metodo suma
           
            cmp al,2
            jz resta ;se dirige al metodo resta
                                               
            cmp al,3
            jz mult ;se dirige al metodo multiplik
           
            cmp al,4
            jz divi ;se dirige al metodo dividir
           
            cmp al,5 ;salir del programa
            jz finn 
            
            mov ax,0
            mov dx,0
    
    
    
endm
.model small                 
.stack  100
.data  
mensaje db "ITSVA 6 A$"
    mensaje1 db 10,13,"Elija una opcion$"
    mensaje2 db 10,13, "1.-Sumas $"
    mensaje3 db 10,13, "2.-Restas $"
    mensaje4 db 10,13, "3.-Multiplicaciones $"
    mensaje5 db 10,13, "4.-Divisiones $"   
    mensaje6 db 10,13, "5.-Salir $"
    mensaje7 db 10,13, "Presiona cualquier tecla para continuar... $" 
    TEXTO9 DB "El cociente es:$"
    TEXTOX DB "El residuo es :$"
    
    numero1 db 10,13, "Primer numero 2 cifras $"
    numero2 db 10,13, "Segundo numero 2 cifras $" 
    resultado db 10,13, "Resutado= $"    
    chr1  db ? ;primer digito
    chr2  db ? ;segundo digito
    chr3  db ? ;multiplo
    chr4  db ?
    r1    db ? ;resultado 1
    r2    db ? ;resultado 2
    r3    db ?
    r4    db ?
    ac    db 0 ;acarreo
    ac1   db 0 
    VAR  DB ? 
    NUM1 DB ?
    NUM2 DB ?  
    residuo dB ?
    cocien dB ?  
    m DB ?
    n DB ?
    s DB ?
    d DB ?
    cien DB 100
.code

     start:
         mov dx, @data
         mov ds ,dx   
          
         menu
          suma: 
              lea dx, mensaje2
              mov ah, 09h
              int 21h  
              suma
              
              bucle
          .exit 
          
          resta:
              resta
              
              
              bucle
              
          .exit
          mult:
           
              
              multiplicacion
              
                     
              bucle
              
              
          .exit
          divi: 
             division
              
             
              
              
              bucle
             
                
          .exit
          finn:
              lea dx, mensaje6
              mov ah, 09h
              int 21h 
              mov ax, 4c00h
              int 21h
          .exit 
            
            
            
          
    mov ax, 4c00h
    int 21h
end start