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
include 'inc\m_BitTestS.inc'


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
	ccall m_WriteLN,hello
	; xor eax,eax
	; xor ebx,ebx
	; mov eax,00000001b
	; and eax,00000010b
	; cmp eax,0b
	; jnz m_qwe_True;cmp(11,10,jnz)= Переход есть
	;==0
	; jmp m_qwe
		; m_qwe_True:
			;>0
			; ccall m_WriteLN,hello
		; jmp m_qwe
	; m_qwe:
	
	
	;ccall m_BitTest_0000_0001b,00000001b
	;ccall m_BitTest_0000_0001b,00000010b
	
	;ccall m_WriteLN,hello
	ccall m_BitTest_Test
	
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ah,01h;/Ожидание нажатия клавиши
    int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ax,4C00h    ;\
    int 21h         ;/ Завершение программы
;-------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp m_SetBitTest.DataSet
	m_SetBitTest.Resalt db '0000_0000$'
m_SetBitTest.DataSet:
proc m_BitTest_Test
	ccall m_BitTest_1000_0000b,00000000b
	;ccall m_BitTest_0100_0000b,01000000b
	;ccall m_BitTest_0010_0000b,00100000b
	;ccall m_BitTest_0001_0000b,00010000b
	;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;ccall m_BitTest_0000_1000b,00001000b
	;ccall m_BitTest_0000_0100b,00000100b
	;ccall m_BitTest_0000_0010b,00000010b
	;ccall m_BitTest_0000_0001b,00000001b
	;ccall m_BitTestOll,00000001b
	ccall m_WriteLN,m_SetBitTest.Resalt
ret
endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
proc m_BitTestOll uses ax,_TestS:byte
	xor ax,ax
	mov al,[_TestS]
	ccall m_BitTest_1000_0000b,ax
	;ccall m_BitTest_0100_0000b,eax
	;ccall m_BitTest_0010_0000b,eax
	;ccall m_BitTest_0001_0000b,eax
	;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;ccall m_BitTest_0000_1000b,eax
	;ccall m_BitTest_0000_0100b,eax
	;ccall m_BitTest_0000_0010b,eax
	;ccall m_BitTest_0000_0001b,eax
	;ccall m_WriteLN,m_SetBitTest.Resalt
ret
endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
proc m_BitTest_1000_0000b uses ax,_TestS:byte
	xor eax,eax
	mov al, byte [_TestS]
	and eax, 10000000b
	cmp eax,0b
	jnz m_BitTest_1000_0000b.1;cmp(11,10,jnz)= Переход есть
	;==0
	mov byte [m_SetBitTest.Resalt],'0'
	jmp m_BitTest_1000_0000b.2
		m_BitTest_1000_0000b.1:;>0
			mov byte [m_SetBitTest.Resalt],'1'
			; ccall m_WriteLN,hello
		jmp m_BitTest_1000_0000b.2
	m_BitTest_1000_0000b.2:
ret
endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;