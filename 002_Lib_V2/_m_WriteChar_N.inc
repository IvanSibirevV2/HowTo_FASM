m_WriteChar_N:
	push dx
	push ax
		;Вывод символа перехода на новую строку
		mov dl,0ah
		mov ah,2
		int 21h
	pop ax
	pop dx 
ret
m_WriteChar_N.Test:
	;;;;;;;;;;;;;;;;;
    call m_WriteChar_N
	;;;;;;;;;;;;;;;;;
ret