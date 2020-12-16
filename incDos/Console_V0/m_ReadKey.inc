m_ReadKey:
jmp m_ReadKey.DataEnd
	m_ReadKey.Key db '0$'
m_ReadKey.DataEnd:
	push ax
	;;Запись одного символа в регистр AL
	mov ah,1
	int 21h
	mov byte [m_ReadKey.Key],AL
	
	pop ax
ret