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