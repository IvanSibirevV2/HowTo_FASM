;Пример программы с функциями работы с консолью
use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp start
	hello db 'Hello, world!$'
	_char db '1234$'
	_txt db '0000000000000000000$'
	_The_Fin db '_The_Fin$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;include '_m_Write.inc'
;include '_m_WriteChar.inc'
;include '_m_WriteChar_N.inc'
;include '_m_WriteLN.inc'
;include '_m_ReadKey.inc'
;include '_m_GetPtr.inc'
include '_Console.inc'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
	mov word [m_WriteLN.ptr], hello
	call m_WriteLN
	xor edx,edx
	mov dx, hello
	mov dword [m_GetChar.ptr],edx
	;mov m_GetChar.ptr,hello
	mov dword [m_GetChar.ecx],10
	call m_GetChar
	mov al,byte [m_GetChar.AL]
	mov byte [m_WriteChar.DL],al
	call m_WriteChar
	
	
	;mov esi, hello
	
	;mov m_GetChar.ptr, esi
	
	;mov esi, m_GetChar.ptr
	
	;mov byte al,[esi]
	;mov byte [m_WriteChar.DL],al
	;call m_WriteChar
	
	
	mov word [m_WriteLN.ptr], _The_Fin
	call m_WriteLN
	
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ah,01h;/Ожидание нажатия клавиши
    int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ax,4C00h    ;\
    int 21h         ;/ Завершение программы
;-------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
m_WriteChar_FromPtr:
jmp m_WriteChar_FromPtr.DataEnd
	m_WriteChar_FromPtr.Ptr db '0000$'
m_WriteChar_FromPtr.DataEnd:
	push ax
	push edi
	push dx
		mov edi,dword [m_WriteChar_FromPtr.Ptr]
		mov dl, byte [edi]
		;mov dl,al;Вывод вывод одного символа из dl на экран
		mov ah,2
		int 21h
	pop dx
	pop edi
	pop ax
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





