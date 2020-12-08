;Пример программы с функциями работы с консолью
use16               ;Генерировать 16-битный код
format MZ
org 100h            ;Программа начинается с адреса 100h
stack 10h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp start
	hello db 'Hello, world!$'
	_The_Fin db '_The_Fin$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include 'inc\PROC16\proc16.inc';Чтобы процедуры работали и не кусали комары...
;;;
include 'inc\Console_V1\m_WriteChar.inc'
include 'inc\Console_V1\m_WriteChar_N.inc'
include 'inc\Console_V1\m_Write.inc'
include 'inc\Console_V1\m_WriteLN.inc'
;;;
include 'inc\Console_V1\m_ReadKey.inc'
include 'inc\Console_V1\m_SharpX79.inc'
include 'inc\Console_V1\m_SharpX.inc'
;;;
;include 'inc\Set_LookOut\m_SharpX.inc'
;include 'inc\BitS\m_BitWrite.inc'
include 'inc\BitS\m_BitWritEAX.inc'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
	ccall m_WriteLN,hello
	
    call m_BitWritEAX
    ccall m_WriteChar,'!'
	;call m_BitReg
	ccall m_WriteLN,hello
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ah,01h;Ожидание нажатия клавиши
    int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ax,4C00h    ;
    int 21h         ;Завершение программы
;-------------------------------------------------------
m_BitReg:
 ccall m_WriteChar,'e'
 ccall m_WriteChar,'a'
 ccall m_WriteChar,'x'
 call m_BitWritEAX
 ccall m_WriteChar,'!'
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

