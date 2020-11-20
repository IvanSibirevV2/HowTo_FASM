;Пример программы с функциями работы с консолью
use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp start
hello db 'Hello, world!$'
_char db 'H$'
_The_Fin db '_The_Fin$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:;Программа пример Выхода по Esc
	call m_App
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
m_Console_ReadChar:
	;;Запись одного символа в регистр AL
	mov ah,1
	int 21h
ret
m_Console_WriteChar:
	push ax
		;Вывод вывод одного символа из dl на экран
		mov ah,2
		int 21h
	pop ax
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
m_App:
	m_20201120_1818:
		;;;
		call m_proc
		;;;
	cmp al ,27
	je m_20201120_1815
	jmp m_20201120_1818
	m_20201120_1815:
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
m_Ver_int:;Процедура приведения AL к арабским цифрам
push bx
	mov bl,48
	cmp bl,al
	jbe m_20201120_1828
		mov al,48;Если число меньше нуля
	m_20201120_1828:
	mov bl,57
	cmp al,bl
	jbe m_20201120_1834
		mov al,57;Если число больше 9
	m_20201120_1834:
pop bx
ret

m_proc:
 push eax
	jmp m_20201120_1826
		sign db '+'
		_A db 0
		_B db 0
		_EXC db 0
	m_20201120_1826:
	xor eax,eax
	call m_Console_ReadChar
	mov [_EXC],al
	;call m_Ver_int
	;mov dl,al
	;m_Console_WriteChar
	;mov [_A],al
	
	;sub al,48
;cmp(10,10,jbe)= Переход есть
;cmp(10,11,jbe)= Переход есть
;cmp(11,10,jbe)= Переход нет
	
 pop eax
 mov al,[_EXC]
ret

