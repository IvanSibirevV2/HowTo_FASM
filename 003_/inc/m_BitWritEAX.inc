m_BitWritEAX:
	push eax
	push ecx
	xor ecx,ecx
	mov ecx,2
	m_0:
		call m_BitWrite
	;dec ecx 
	;cmp ecx,0
	;jnz m_0
	loop m_0
	

	pop ecx
	pop eax
ret