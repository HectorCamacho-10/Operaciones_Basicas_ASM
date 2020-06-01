

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