m_inc:
jmp jsvdjhcvjhsvcjhvsjchvjsvcjhsvclkj
_qwe db '!!!!!!!!$'
jsvdjhcvjhsvcjhvsjchvjsvcjhsvclkj:
		;dx - положите указатель на строку;Например вот так;mov dx,hello
		mov dx,_qwe
		mov ah,9
		int 21h
		;call m_Console_N
		mov dl,0ah
		mov ah,2
		int 21h
		;
ret
m_Console_N:
	push dx
	push ax
		;Вывод символа перехода на новую строку
		mov dl,0ah
		mov ah,2
		int 21h
	pop ax
	pop dx 
ret
m_Console_WriteChar:
	push ax
		;Вывод вывод одного символа из dl на экран
		mov ah,2
		int 21h
	pop ax
ret
m_Console_Write:
;;;hello db 'Hello, world!$'
	push ax
		;dx - положите указатель на строку;Например вот так;mov dx,hello
		mov ah,9
		int 21h
	pop ax 
ret
m_Console_WriteLN:
;;;hello db 'Hello, world!$'
	push ax
		;dx - положите указатель на строку;Например вот так;mov dx,hello
		mov ah,9
		int 21h
		call m_Console_N
		;mov dl,0ah
		;mov ah,2
		;int 21h
	pop ax 
ret
m_Console_ReadKey:
	;;Запись одного символа в регистр AL
	mov ah,1
	int 21h
ret
m_Console_SharpX79:
	push ecx
	push dx
	
	mov ecx,79
	m_20201120_2139:
		mov dl,35
		call m_Console_WriteChar
	loop m_20201120_2139
	call m_Console_N
	
	pop dx
	pop ecx
ret