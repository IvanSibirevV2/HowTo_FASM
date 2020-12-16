;Пример программы с функциями работы с консолью
use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp start
	hello db 'Hello, world!$'
	_The_Fin db '_The_Fin$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include '..\incDos\Console_V1\proc16.inc';Чтобы процедуры работали и не кусали комары...

include '..\incDos\Console_V1\m_WriteChar.inc'
include '..\incDos\Console_V1\m_WriteChar_N.inc'
include '..\incDos\Console_V1\m_Write.inc'
include '..\incDos\Console_V1\m_WriteLN.inc'

include '..\incDos\Console_V1\m_ReadKey.inc'
include '..\incDos\Console_V1\m_SharpX79.inc'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
	ccall m_SharpX79
	ccall m_WriteChar,'!'
	ccall m_WriteChar_N
	ccall m_WriteChar,'!'
	ccall m_WriteChar_N
	ccall m_WriteLN,hello
	
	ccall m_ReadKey
	xor eax,eax
	mov al, byte[m_ReadKey.Result]
	ccall m_WriteChar,ax
	ccall m_WriteChar_N
	
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ah,01h;/Ожидание нажатия клавиши
    int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ax,4C00h    ;\
    int 21h         ;/ Завершение программы
;-------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


