;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
m_BitTest_1_Test:
	mov byte[m_BitTest_1.TestS],000000001b
	call m_BitTest_1
	;xor ax,ax
	mov al, byte [m_BitTest_1.Char]
	ccall m_WriteChar, ax
	ccall m_WriteChar_N
	ccall m_WriteLN,hello
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
m_BitTest_1:
jmp m_BitTest_1.DataSet
	m_BitTest_1.TestS db '0$'
	m_BitTest_1.Char db '0$'
m_BitTest_1.DataSet:
	xor eax,eax
	mov al, byte [m_BitTest_1.TestS]
	and eax, 1b
	cmp eax,0b
	jnz m_BitTest_1.M1;cmp(11,10,jnz)= Переход есть
	;==0
	mov byte [m_BitTest_1.Char],'0'
	jmp m_BitTest_1.M2
		m_BitTest_1.M1:   ;>0
			mov byte [m_BitTest_1.Char],'1'
			; ccall m_WriteLN,hello
		jmp m_BitTest_1.M2
	m_BitTest_1.M2:
ret