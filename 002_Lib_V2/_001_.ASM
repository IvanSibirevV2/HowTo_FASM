;Пример программы с функциями работы с консолью
use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp start
hello db 'Hello, world!$'
_char db 'H$'
_The_Fin db '_The_Fin$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
    mov dx,hello
    call m_Console_WriteLN
	call m_Console_N
	
	call m_Console_ReadKey
	mov dl,al
	call m_Console_N
	call m_Console_WriteChar
	
	call m_Console_N
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
m_Console_N:
	push dx
	push ax
		;Вывод символа перехода на новую строку
		mov dl,0ah
		mov ah,2
		int 21h
	pop ax
	pop dx 
ret
m_Console_WriteChar:
	push ax
		;Вывод вывод одного символа из dl на экран
		mov ah,2
		int 21h
	pop ax
ret
m_Console_Write:
;;;hello db 'Hello, world!$'
	push ax
		;dx - положите указатель на строку;Например вот так;mov dx,hello
		mov ah,9
		int 21h
	pop ax 
ret
m_Console_WriteLN:
;;;hello db 'Hello, world!$'
	push ax
		;dx - положите указатель на строку;Например вот так;mov dx,hello
		mov ah,9
		int 21h
		call m_Console_N
	pop ax 
ret
m_Console_ReadKey:
	;;Запись одного символа в регистр AL
	mov ah,1
	int 21h
ret