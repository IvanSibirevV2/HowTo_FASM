;Пример программы с функциями работы с консолью
use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp start
hello db 'Hello, world!$'
_char db '1234$'
_The_Fin db '_The_Fin$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include '..\incDos\Console_V0\m_WriteChar.inc'
include '..\incDos\Console_V0\m_WriteChar_N.inc'
include '..\incDos\Console_V0\m_Write.inc'
include '..\incDos\Console_V0\m_WriteLN.inc'
include '..\incDos\Console_V0\m_ReadKey.inc'
include '..\incDos\Console_V0\m_SharpX79.inc'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
	mov word [m_WriteLN.ptr],hello
    call m_WriteLN
	
	;;;Пример пересылки части текста или переменной целиком регистр
	call m_SharpX79
	
		mov al,byte [_char]
		mov byte [m_WriteChar.DL],al
		call m_WriteChar
		call m_WriteChar_N
	
		mov ax,word [_char]
		mov byte [m_WriteChar.DL],al
		call m_WriteChar
		mov byte [m_WriteChar.DL],ah
		call m_WriteChar
		call m_WriteChar_N
	
		mov eax,dword  [_char]
		mov byte [m_WriteChar.DL],al
		call m_WriteChar
		mov byte [m_WriteChar.DL],ah
		call m_WriteChar
		shr eax, 16;циклический сдвиг в право на 8 BIT
		mov byte [m_WriteChar.DL],al
		call m_WriteChar
		mov byte [m_WriteChar.DL],ah
		call m_WriteChar
		call m_WriteChar_N
		
	;;;Пример пересылки целиком регистра
	;;;в часть текста или переменную целиком 
	call m_SharpX79
	
		mov al,'!';eax=='___!'
		mov ah,'!';eax=='__!!'
		shl eax, 16;eax=='!!__'
		mov al,'!';eax=='!!_!'
		mov ah,'!';eax=='!!!!'
		
		mov byte [_char],al
		mov word [m_WriteLN.ptr],_char
		call m_WriteLN
		
		mov word [_char],ax
		mov word [m_WriteLN.ptr],_char
		call m_WriteLN
		
		mov dword [_char],eax
		mov word [m_WriteLN.ptr],_char
		call m_WriteLN
	
	call m_SharpX79
	
	;mov dx,_The_Fin
	mov word [m_WriteLN.ptr],_The_Fin
    call m_WriteLN
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;/Ожидание нажатия клавиши
    mov ah,01h
    int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ax,4C00h    ;\
    int 21h         ;/ Завершение программы
;-------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;include 'Console.inc'