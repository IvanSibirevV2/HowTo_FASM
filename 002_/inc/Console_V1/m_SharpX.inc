proc m_SharpX uses ecx,a:word
	mov cx,word [a]
	m_SharpX.loop:
		;ccall m_WriteChar,'#'
		mov dl,'#'
		mov ah,02h
		int 21h
	loop m_SharpX.loop
	call m_WriteChar_N
ret
endp