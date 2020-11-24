m_WriteChar:
jmp m_WriteChar.DataEnd
	m_WriteChar.DL db '0$'
m_WriteChar.DataEnd:
	push ax
	push dx
		mov dl, byte [m_WriteChar.DL]
		;mov dl,al;Вывод вывод одного символа из dl на экран
		mov ah,2
		int 21h
	pop dx
	pop ax
ret