m_Write:
jmp m_Write.DataEnd
	m_Write.ptr db '00$'
m_Write.DataEnd:
	push ax
	push dx
		mov dx, word [m_Write.ptr]
		;dx - положите указатель на строку;Например вот так;mov dx,hello
		mov ah,9
		int 21h
	pop dx
	pop ax
ret
m_Write.Test:
jmp m_Write.Test.DataEnd
	m_Write.Test.Data db "m_Write.Test - OK!!!$"
m_Write.Test.DataEnd:
	;;;;;;;;;;;;;;;;;
	mov word [m_Write.ptr], m_Write.Test.Data
    call m_Write
	;;;;;;;;;;;;;;;;;
ret