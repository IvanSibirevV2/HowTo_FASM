m_BitWrite:
jmp m_BitWrite.Data
	m_BitWrite.False db '1',0
	m_BitWrite.True db '0',0
m_BitWrite.Data:
push eax
push edx
	and eax,10000000000000000000000000000000b
	cmp eax,0b
	jnz m_BitTest.M1;cmp(11,10,jnz)= Переход есть
	;;;;==0
	;mov dl,'0'
	;mov ah,2
	;int 21h
	cinvoke printf,m_BitWrite.True
	;;;
	jmp m_BitTest.M2
		m_BitTest.M1:
			;;;;>0
			cinvoke printf,m_BitWrite.False
			;mov dl,'1'
			;mov ah,2
			;int 21h
			;;;
		jmp m_BitTest.M2
	m_BitTest.M2:
pop edx
pop eax
shl eax,1
ret