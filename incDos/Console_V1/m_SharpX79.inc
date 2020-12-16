proc m_SharpX79 uses ecx
	mov ecx,79
	m_SharpX79.loop:
		;ccall m_WriteChar,'#'
		mov dl,'#'
		mov ah,02h
		int 21h
	loop m_SharpX79.loop
	call m_WriteChar_N
ret
endp