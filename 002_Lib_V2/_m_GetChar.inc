m_GetChar:
jmp m_GetChar.DataEnd
	m_GetChar.ptr db '8765$'
	m_GetChar.ecx db '0000$'
	m_GetChar.AL db '0$'
m_GetChar.DataEnd:
	xor ecx,ecx
	mov ecx, dword [m_GetChar.ecx]
	xor esi,esi
	;lea esi,[m_GetChar.ptr]
	mov  esi,dword [m_GetChar.ptr] 
	;;mov byte al,[esi];esi/edi;
	dec esi
m_GetChar.loop:
	inc esi
loop m_GetChar.loop	
	mov byte al,[esi]
	mov byte [m_GetChar.AL],al
	
	
	;mov byte [m_WriteChar.DL],al
	;call m_WriteChar
ret