;Пример программы с функциями работы с консолью
use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
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
;include 'inc\BitTest\m_BitTest_1.inc'


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
	ccall m_WriteLN,hello
	
	;ccall m_BitTest_Test
	;call m_BitTest_2_Test
	;ccall m_WriteLN,hello
	ccall m_BitWrite_Test
	
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ah,01h;/Ожидание нажатия клавиши
    int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ax,4C00h    ;\
    int 21h         ;/ Завершение программы
;-------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
proc m_BitWrite_Test
;ccall m_WriteChar, '#'	
;mov al,'#'
	;ccall m_WriteChar,ax
	mov dl,'#'	
	mov ah,2
	int 21h

	xor eax,eax
	mov eax,010101110b
	
	call m_BitWritEAX
	
	
	;call m_BitWrite
	;call m_BitWrite
	;call m_BitWrite
	;call m_BitWrite
	;call m_BitWrite
	;call m_BitWrite
	;call m_BitWrite
	;ccall m_WriteChar_N
	;ccall m_WriteLN,hello
ret
endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
m_BitWritEAX:
	xor ecx,ecx
	mov ecx, 32
	qwer_8934639875746:
		call m_BitWrite
	loop qwer_8934639875746
ret

m_BitWrite:
	push eax
	and eax, 10000000000000000000000000000000b
	cmp eax,0b
	
	jnz m_BitWrite.M1;cmp(11,10,jnz)= Переход есть
	;==0
	mov dl,'0'
	mov ah,2
	int 21h
	;;;
	jmp m_BitWrite.M2
		m_BitWrite.M1:   ;>0
			mov dl,'1'
			mov ah,2
			int 21h
		jmp m_BitWrite.M2
	m_BitWrite.M2:
	pop eax
	shl eax,1
ret


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; m_BitTest_2_Test:
	; mov byte[m_BitTest_2.TestS],000000011b
	; call m_BitTest_2
	; xor ax,ax
	; xor bx,bx
	; mov ax, word [m_BitTest_2.Resalt]
	; mov bl,ah
	; ccall m_WriteChar, bx
	; mov bl,al
	; ccall m_WriteChar, bx
	; ccall m_WriteChar_N
	; ccall m_WriteLN,hello
; ret
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; m_BitTest_2:
; jmp m_BitTest_2.DataSet
	; m_BitTest_2.TestS db '0$'
	; m_BitTest_2.Resalt db '00$'
; m_BitTest_2.DataSet:
	
	; xor ax,ax
	; mov al, byte [m_BitTest_2.TestS]
	; ;Тестируем младший разряд
	; mov byte[m_BitTest_1.TestS],al
	; call m_BitTest_1
	; xor bx,bx
	; mov bl, byte [m_BitTest_1.Char]
	
	; shl al,1 
	; ;Тестируем старший разряд разряд
	; mov byte[m_BitTest_1.TestS],al
	; call m_BitTest_1
	; xor bx,bx
	; mov bh, byte [m_BitTest_1.Char]
	
	; mov word [m_BitTest_2.Resalt],bx
; ret
