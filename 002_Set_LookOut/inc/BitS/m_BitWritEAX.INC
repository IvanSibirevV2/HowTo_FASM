;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
m_BitWritEAX:
push eax
push ecx
	;;;
	mov dl,'#'
	mov ah,2
	int 21h
	;;;
	xor ecx,ecx
	mov ecx, 32
	m_BitWritEAX.M3:
		;;;call m_BitWrite
		;{
			push eax
			push dx
				and eax,10000000000000000000000000000000b
				cmp eax,0b
				jnz m_BitWritEAX.M1;cmp(11,10,jnz)= Переход есть
				;;;;==0
				mov dl,'0'
				mov ah,2
				int 21h
				;;;
				jmp m_BitWritEAX.M2
					m_BitWritEAX.M1:
					;;;;>0
					mov dl,'1'
					mov ah,2
					int 21h
				;;;
				jmp m_BitWritEAX.M2
				m_BitWritEAX.M2:
			pop dx
			pop eax
			shl eax,1
		;}
		mov dl,'!'
mov ah,2
int 21h
	loop m_BitWritEAX.M3
	;;;
	mov dl,0ah
	mov ah,2
	int 21h
	;;;
pop ecx
push eax

mov dl,'!'
mov ah,2
int 21h
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
m_BitWrite:
push eax
push dx
	and eax,10000000000000000000000000000000b
	cmp eax,0b
	jnz m_BitTest.M1;cmp(11,10,jnz)= Переход есть
	;;;;==0
	mov dl,'0'
	mov ah,2
	int 21h
	;;;
	jmp m_BitTest.M2
		m_BitTest.M1:
			;;;;>0
			mov dl,'1'
			mov ah,2
			int 21h
			;;;
		jmp m_BitTest.M2
	m_BitTest.M2:
pop dx
pop eax
shl eax,1
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
proc m_BitWritEAX_Test
	mov dl,'#'	
	mov ah,2
	int 21h
	xor eax,eax
	mov eax,010101110b
	call m_BitWritEAX	
ret
endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;