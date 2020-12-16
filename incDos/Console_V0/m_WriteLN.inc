;;include 'm_WriteChar_N';Повторно не вызывается
m_WriteLN:
jmp m_WriteLN.DataEnd
	m_WriteLN.ptr db '00$'
m_WriteLN.DataEnd:
;;;hello db 'Hello, world!$'
	push ax
	push dx
		mov dx, word [m_WriteLN.ptr]
		;dx - положите указатель на строку;Например вот так;mov dx,hello
		mov ah,9
		int 21h
		call m_WriteChar_N
	pop dx
	pop ax
ret

m_WriteLN.Test:
jmp m_WriteLN.Test.DataEnd
	m_WriteLN.Test.Data db "m_WriteLN.Test - OK!!!$"
m_WriteLN.Test.DataEnd:
	;;;;;;;;;;;;;;;;;
	mov word [m_WriteLN.ptr], m_WriteLN.Test.Data
    call m_WriteLN
	;;;;;;;;;;;;;;;;;
ret