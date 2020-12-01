m_SharpX79:
	push ecx
	push dx
	
	mov ecx,79
	m_20201120_2139:
		mov word [m_WriteChar.DL],35
		call m_WriteChar
	loop m_20201120_2139
	call m_WriteChar_N
	
	pop dx
	pop ecx
ret