include 'Console_V0\m_WriteChar.inc'
include 'Console_V0\m_WriteChar_N.inc'
include 'Console_V0\m_Write.inc'
include 'Console_V0\m_WriteLN.inc'
include 'Console_V0\m_ReadKey.inc'
;;include 'Console_V0\m_GetPtr.inc'
;;include 'Console_V0\m_GetChar.inc'


;m_Console_inc:
;jmp jsvdjhcvjhsvcjhvsjchvjsvcjhsvclkj
;_qwe db '!!!!!!!!$'
;jsvdjhcvjhsvcjhvsjchvjsvcjhsvclkj:
;		;dx - положите указатель на строку;Например вот так;mov dx,hello
;		mov dx,_qwe
;		mov ah,9
;		int 21h
;		;call m_Console_N
;		mov dl,0ah
;		mov ah,2
;		int 21h
		;
;ret


;m_Console.Test
;m_Console.Test:
;jmp m_Console.Test.DataEnd
;	m_Console.Test.InpMassage db "InpChar=$"
;	m_Console.Test.OutpMassage db "OutpChar=$"
;m_Console.Test.DataEnd:
;	call m_Write.Test
;	call m_WriteChar_N.Test
;	call m_WriteChar_N
;	call m_WriteLN.Test
;	call m_Write
;	call m_WriteChar_N
;	mov word [m_Write.ptr],m_Console.Test.InpMassage
;	call m_Write
;	call m_ReadKey
;	call m_WriteChar_N
;	mov word [m_Write.ptr],m_Console.Test.OutpMassage
;	call m_Write
;	mov dl, byte [m_ReadKey.Key]
;	mov byte [m_WriteChar.DL],dl
;	call m_WriteChar
;	call m_WriteChar_N
;ret

;m_WriteChar_FromPtr:
;jmp m_WriteChar_FromPtr.DataEnd
;	m_WriteChar_FromPtr.ptr db '00$'
;m_WriteChar_FromPtr.DataEnd:
;	push ax
;	push dx
;		mov dx, word [m_WriteChar_FromPtr.ptr]
;		mov al, byte [dx]
;		mov dl
;		mov ah,2
;		int 21h		
;	pop dx
;	pop ax
;ret