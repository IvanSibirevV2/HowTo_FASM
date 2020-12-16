;Пример программы с функциями работы с консолью
use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp start
hello db 'Hello, world!$'
_char db 'H$'
_The_Fin db '_The_Fin$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;include 'inc\Console.inc'
include '..\incDos\Console_V0\m_WriteChar.inc'
include '..\incDos\Console_V0\m_WriteChar_N.inc'
include '..\incDos\Console_V0\m_Write.inc'
include '..\incDos\Console_V0\m_WriteLN.inc'
include '..\incDos\Console_V0\m_ReadKey.inc'
;include 'inc\Console_V0\m_GetPtr.inc'
;include 'inc\Console_V0\m_GetChar.inc'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include '..\macroDos\__Console_V0.inc'
	



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
;mov dx,
	;Программа на процедурах
	call m_WriteChar_N
	mov word [m_WriteLN.ptr],hello
	call m_WriteLN
	call m_WriteChar_N
	call m_ReadKey
	mov dl,byte [m_ReadKey.Key]
	mov byte [m_WriteChar.DL],dl
	call m_WriteChar
	call m_WriteChar_N
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Тажа программа на макросах
	;Применение макроса генерирует моноблок асемблерного кода
	;Без использования вызываемых процедур, что будет много быстрее в исполнении.
	;Но программный код будет занимать больше места, за счет отсутствия повторного использования кода 
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	__SharpX79
	__WriteChar_N
	__WriteLN hello
	__WriteChar_N
	__ReadKeyToAL
	__WriteChar al
	__WriteChar_N
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	call m_WriteChar_N
	mov dx,_The_Fin
    call m_WriteLN
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;/Ожидание нажатия клавиши
    mov ah,01h
    int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ax,4C00h    ;\
    int 21h         ;/ Завершение программы
;-------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;