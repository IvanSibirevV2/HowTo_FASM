;Пример программы с функциями работы с консолью
use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp start
hello db 'Hello, world!$'
_char db '1234$'
_The_Fin db '_The_Fin$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
    mov dx,hello
    call m_Console_WriteLN
	
	;;;Пример пересылки части текста или переменной целиком регистр
	call m_Console_SharpX79
	
		mov al,byte [_char]
		mov dl,al
		call m_Console_WriteChar
		call m_Console_N
	
		mov ax,word [_char]
		mov dl,al
		call m_Console_WriteChar
		mov dl,ah
		call m_Console_WriteChar
		call m_Console_N
	
		mov eax,dword  [_char]
		mov dl,al
		call m_Console_WriteChar
		mov dl,ah
		call m_Console_WriteChar
		shr eax, 16;циклический сдвиг в право на 8 BIT
		mov dl,al
		call m_Console_WriteChar
		mov dl,ah
		call m_Console_WriteChar
		call m_Console_N
		
	;;;Пример пересылки целиком регистра
	;;;в часть текста или переменную целиком 
	call m_Console_SharpX79
	
		mov al,'!';eax=='___!'
		mov ah,'!';eax=='__!!'
		shl eax, 16;eax=='!!__'
		mov al,'!';eax=='!!_!'
		mov ah,'!';eax=='!!!!'
		
		mov byte [_char],al
		mov dx,_char
		call m_Console_WriteLN
		
		mov word [_char],ax
		mov dx,_char
		call m_Console_WriteLN
		
		mov dword [_char],eax
		mov dx,_char
		call m_Console_WriteLN
	
	call m_Console_SharpX79
	
	mov dx,_The_Fin
    call m_Console_WriteLN
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;/Ожидание нажатия клавиши
    mov ah,01h
    int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ax,4C00h    ;\
    int 21h         ;/ Завершение программы
;-------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include 'Console.inc'